Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD58F60722;
	Mon, 30 Nov 2015 15:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAUFgiEB002033; Mon, 30 Nov 2015 15:42:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id B-v3J63EHtcs; Mon, 30 Nov 2015 15:42:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAUFgVIP002026
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Nov 2015 15:42:42 GMT
Message-ID: <1448898151.14864.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org
Date: Mon, 30 Nov 2015 15:42:31 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: A performance analysis chronicle
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Nov 2015 15:42:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One thing that bothers me at the moment is how long we spend in
do_configure. I have some new build hardware but sadly whilst having
quite a large parallel capacity, it spends a lot of time at idle and
builds don't seem to do so well on it.

In particular, gettext has caught my attention. Specifically, gettext on
an idle system takes 128s to run do_configure, it takes more like 285s
when run as part of the main build? Why? I've been trying to figure out
what contributes to this. Why is it important? If we could understand
this, we might be able to make "critical path" tasks faster and if we
can do that, overall build times will come down.

My first attempt to look at this was from a scheduling priority level:

BB_TASK_NICE_LEVEL = "5"
BB_TASK_NICE_LEVEL_pn-gettext = "0"
BB_TASK_IONICE_LEVEL = "2.7"
BB_TASK_IONICE_LEVEL_pn-gettext = "2.0"

This did offer some reduction to say 275s but certainly doesn't seem to
be the main issue.

Next, I tried:

WORKDIR_pn-gettext = "/media/build1/poky/build/tmpram/work/i586-poky-linux/gettext/0.19.4-r0"

with a tmpfs at tmpram. Sadly again, whilst this changed things like
do_unpack from 15s to 3s, it made no real difference to the overall
configure time. Since I don't believe the system to be IO bound (the
first 1700 tasks of a 6000 task core-image-sato build execute within 2
minutes) this perhaps isn't surprising.

I also wondered about contention over shared paths like the metadata and
sysroot being mixed in with WORKDIR. I tried a build with tmp/work and
tmp/work-shared on a different physical drive, again with no real
difference in performance.

I decided to get some information from perf, hacking buildstats.bbclass
to do:

        pn = d.getVar("PN", True)
        if pn == "gettext" and e.task == "do_configure":
            parentpid = os.getpid()
            pid = os.fork() 
            if pid == 0:
                os.setsid()
                pid2 = os.fork()
                if pid2 > 0:
                    os._exit(os.EX_OK)
                output = subprocess.check_output("perf record -g -t %s --inherit -o /tmp/configureperf.%s" % (parentpid, parentpid), shell=True)
                os._exit(os.EX_OK)

and with this obtained perf records for the build under load and at
idle. I've appended various output from perf report at the end of the
mail. Other than seeing that fork overhead is a significant problem, its
hard to see where the extra time is being spent from that profile data.
If anyone knows perf well and get better information I'm open to ideas.

I also started looking at what the gettext configure test is doing under
strace using simplistic measurements like:

strace -f -s 2048 bitbake gettext-native -c configure 2> gtn.strace

This generates a file around 1GB in size, there are some useful
statistics you can pull from it though:

cat gtn.strace  | cut -d ' ' -f 3 | grep '^[a-z]*(' | cut -d '(' -f 1  | sort | uniq -c > gtn.funcs
cat gtn.strace | grep execve | cut -d ' ' -f 3 | grep '^[a-z]*(' | sort | uniq -c > gtn.strace.execs

which show an approximate list of syscalls the task is making along with
counts of the number of calls made. It also shows the commands that are
being execve()'d.

One thing which puzzled me was large numbers of call to
"/usr/bin/print", "/usr/bin/which" and "/usr/bin/file", the latter with
some very odd looking arguments. The former is a perl script, part of
mailcap.

This turns out to be some rouge autoconf macro code which tries to see
if "print X" works in the shell if you're not using bash (my /bin/sh was
dash). It does this at the start of every configure script and the
configure script attempts to reexec itself a few times. This in turn
loads the perl interpreter and the script then calls "which file",
ignores anything other than the return value, it then searches PATH for
file. This is just a complete and utter waste of time, there is a patch
below which simply removes the macro and assumes the shell's "printf" is
sane.

With the above analysis approach, you can show that this worth a couple
of thousand execve() calls (22,000 -> 20,000) and 15,000 stat calls
(333,000 -> 320,000) and knocks around 10-15s off the loaded system
do_configure time, the unloaded system time was worth more like around
3s.

Of the 20,000 execs, 2,300 are "cat", "7100" are "sed", 1,000 are "expr"
and the others look more problematic as being the linker/compiler.

I did try experimenting to see if the cat calls could be replaces with
something else. In autoconf, they are mostly from heredoc usage, e.g.:

m4_define([_AC_DEFINE_UNQUOTED],
[m4_if(m4_bregexp([$1], [\\\|`\|\$(\|\${\|@]), [-1],
       [AS_ECHO(["AS_ESCAPE([$1], [""])"]) >>confdefs.h],
       [cat >>confdefs.h <<_ACEOF
[$1]
_ACEOF])])

which I found you could replace with:

m4_define([_AC_DEFINE_UNQUOTED],
[m4_if(m4_bregexp([$1], [\\\|`\|\$(\|\${\|@]), [-1],
       [AS_ECHO(["AS_ESCAPE([$1], [""])"]) >>confdefs.h],
       [while IFS= read -r line || [[ -n "$line" ]]; do
    printf '%s\n' "$line"
done >>confdefs.h <<_ACEOF
[$1]
_ACEOF])])

which has the advantage of using shell builtins. I did try other
constructs but couldn't find anything simpler and even in this case, it
was complicated, for example needing the || [ -n $line ] to ensure that
trailing data would be handled correctly and [[ to be quoted correctly,
its not a bashism.

Unfortunately, this is line buffered IO so whilst I could cut 2,000
execve() calls, I added around 300,000 read calls instead. I did try
using -d '' to avoid the EOL delimited, however that internally turns
into single byte reads and 900,000 read calls!

So basically, this optimisation didn't really work. If we could make cat
a shell builtin, it would help but I haven't looked at what that would
entail.

The other thing which did jump out at me from the strace was the number
of PATH searches going on for common utilities. I did wonder about
whether our diverse PATH spanning metadata (the scripts dir), our
sysroot and the main system was somehow causing IO bottlebeck issues. I
tested that above with the separate build drive for workdir however I
also tried a different trick, adding symlinks in the scripts directory
for the most common utils as, cat, chmod, cp, gcc, grep, rm and sed to
the host utils in /bin or /usr/bin (the scripts directory is the first
one listed in PATH). I did also briefly experiment with changing "cat"
to "/bin/cat" but preferred the symlink approach.

The profile shows this saves around 1,200 execve() calls and around
80,000 stat calls (320,000 -> 240,000) and took the do_configure time
under load to 240s so there was a measurable effect, sadly the overall
build time didn't seem much changed however. The non-load case is still
around the 125s mark so this perhaps does give a strong hint that cross
directory IO is contributing to the inflation of the build time under
load.

There are obviously further things which can be looked into from here,
however I thought people may find this story so far interesting and it
might inspire others to start looking more closely at this too!

Cheers,

Richard

Output from "perf report A"

  Children      Self  Command          Shared Object            Symbol                    
-    5.41%     0.00%  aclocal          [unknown]                [.] 0x43d6258d4c544155  
     0x43d6258d4c544155                                                              
-    5.08%     0.01%  bash             [kernel.kallsyms]        [k] entry_SYSCALL_64_fastpath 
   - entry_SYSCALL_64_fastpath                                                           
      + 84.05% __libc_fork                                                               
      + 3.77% __waitpid                                                                  
      + 3.05% __GI___libc_write                                                          
      + 1.93% __GI___libc_read                                                           
      + 1.45% __xstat64                                                                  
      + 0.91% __open_nocancel                                                            
      + 0.68% __brk                                                                      
      + 0.66% __sigprocmask                                                              
      + 0.53% __pipe                                                                     
+    3.79%     0.02%  bash             bash                     [.] make_child           
+    3.61%     0.01%  bash             libc-2.21.so             [.] __libc_fork          
+    3.49%     3.49%  aclocal          perl                     [.] Perl_pp_match        
+    3.49%     0.00%  bash             [kernel.kallsyms]        [k] sys_clone            
+    3.49%     0.00%  bash             [kernel.kallsyms]        [k] _do_fork             
+    3.30%     0.08%  bash             [kernel.kallsyms]        [k] copy_process.part.29 
+    2.85%     0.52%  bash             [kernel.kallsyms]        [k] page_fault           
+    2.80%     0.00%  cc1              [unknown]                [.] 0000000000000000     
+    2.41%     2.41%  aclocal          perl                     [.] Perl_fbm_instr       
+    2.39%     2.38%  aclocal          perl                     [.] Perl_re_intuit_start 
+    2.33%     0.01%  bash             [kernel.kallsyms]        [k] do_page_fault        
+    2.31%     0.04%  bash             [kernel.kallsyms]        [k] __do_page_fault      
+    2.23%     0.00%  autom4te         [unknown]                [.] 0000000000000000     
+    2.15%     0.10%  bash             [kernel.kallsyms]        [k] handle_mm_fault      
+    2.06%     0.01%  bash             [kernel.kallsyms]        [k] perf_event_init_task 
+    2.04%     0.01%  bash             [kernel.kallsyms]        [k] inherit_task_group.isra.95.part.96
+    1.94%     0.01%  cc1              [kernel.kallsyms]        [k] entry_SYSCALL_64_fastpath
+    1.93%     0.14%  bash             [kernel.kallsyms]        [k] inherit_event.isra.93   
+    1.71%     0.35%  cc1              [kernel.kallsyms]        [k] page_fault                 

Output from "perf diff A B -c ratio"

# Baseline           Ratio  Shared Object            Symbol                                                                             
# ........  ..............  .......................  ...................................................................................
#
    16.62%        1.275408  m4                       [.] 0x0000000000002090                                                             
     3.58%        0.934606  perl                     [.] Perl_pp_match                                                                  
     3.46%        1.039378  perl                     [.] 0x000000000001ac0e                                                             
     3.12%        0.740720  cc1                      [.] 0x000000000016d946                                                             
     2.77%        0.949347  perl                     [.] Perl_fbm_instr                                                                 
     2.74%        0.908970  bash                     [.] 0x000000000001ed44                                                             
     2.53%        0.889904  perl                     [.] Perl_re_intuit_start                                                           
     1.91%        0.706060  i586-poky-linux-ld       [.] 0x0000000000002430                                                             
     1.89%        0.868389  perl                     [.] Perl_pp_nextstate                                                              
     1.82%        1.053153  libc-2.21.so             [.] _int_malloc 

To see the list sorted by ratio:

"perf diff A B -c ratio -t : | sort -t: -k2,2 -nr | cut -c -100"

# Baseline           Ratio  Shared Object            Symbol                                                                             
# ........  ..............  .......................  ...................................................................................
#
0.00:    107.335521:libpcre.so.3.13.1      :[.] 0x00000000000017e0                                  
0.00:     58.518921:sed                    :[.] open@plt                                            
0.00:     39.706804:[kernel.kallsyms]      :[k] set_next_buddy                                      
0.00:     32.437345:[kernel.kallsyms]      :[k] find_busiest_group                                  
0.00:     26.460722:[kernel.kallsyms]      :[k] task_numa_fault                                     
0.00:     25.791301:file                   :[.] 0x0000000000001ed0                                  
0.00:     22.245486:libselinux.so.1        :[.] __fsetlocking@plt                                   
0.00:     20.580930:cc1                    :[.] _Z15make_pass_loop2PN3gcc7contextE                  
0.00:     17.729036:[kernel.kallsyms]      :[k] update_sd_lb_stats                                  
0.00:     16.301473:[kernel.kallsyms]      :[k] rwsem_down_write_failed                             
0.00:     16.067699:[kernel.kallsyms]      :[k] kernfs_refresh_inode                                
0.00:     15.090138:[kernel.kallsyms]      :[k] seq_printf                                          
0.00:     12.787537:ls                     :[.] 0x00000000000081d8                                  
0.00:     11.657115:[kernel.kallsyms]      :[k] ext4_da_invalidatepage                              
0.00:     11.656298:bash                   :[.] unary_test                                          
0.00:     10.775472:[kernel.kallsyms]      :[k] security_bprm_secureexec                            
0.00:     10.573946:[kernel.kallsyms]      :[k] __queue_work                                        
0.00:      9.638718:ld-2.21.so             :[.] _xstat                                              
0.00:      9.178533:cc1                    :[.] _Z10add_paramsPK10param_infom                       
0.00:      8.937500:[kernel.kallsyms]      :[k] cdev_get                                            
0.00:      8.628314:sed                    :[.] getenv@plt                                          
0.00:      8.618151:perl                   :[.] Perl_do_trans                                       
0.00:      8.535535:[kernel.kallsyms]      :[k] mangle_path                                         
0.00:      8.356976:[kernel.kallsyms]      :[k] __delete_from_page_cache                            
0.00:      8.124628:ld-2.21.so             :[.] malloc@plt                                          
0.00:      8.117871:[kernel.kallsyms]      :[k] osq_lock                                            
0.00:      7.991028:cc1                    :[.] _Z20output_quoted_stringP8_IO_FILEPKc               
0.00:      7.814020:[kernel.kallsyms]      :[k] ext4_ext_remove_space                               
0.00:      7.549076:[kernel.kallsyms]      :[k] load_balance                                        
0.00:      7.441893:sed                    :[.] _init      

or to see the biggest differences in period:

"perf diff A B -p -c wdiff:1,1 -t : | sort -t: -k3,3 -nr | cut -c -100"

# Baseline     Base period   Weighted diff          Period  Shared Object            Symbol                                             
# ........  ..............  ..............  ..............  .......................  ...................................................
16.62:30953898486:    8524961890:39478860376:m4                     :[.] 0x0000000000002090         
1.73:3220644640:     538932468:3759577108:libc-2.21.so           :[.] __strcmp_sse2_unaligned       
1.49:2768327998:     436920702:3205248700:libc-2.21.so           :[.] __memcpy_avx_unaligned        
0.80:1499099032:     408223464:1907322496:[kernel.kallsyms]      :[k] clear_page_c_e                
0.97:1803966092:     323339402:2127305494:libc-2.21.so           :[.] strlen                        
0.54:1006908653:     288332008:1295240661:libc-2.21.so           :[.] __strchr_sse2                 
0.66:1228217319:     266221456:1494438775:[kernel.kallsyms]      :[k] copy_page                     
3.46:6446114974:     253835378:6699950352:perl                   :[.] 0x000000000001ac0e            
1.82:3388135954:     180089205:3568225159:libc-2.21.so           :[.] _int_malloc                   
0.17:325395321:     166763174:492158495:libc-2.21.so           :[.] __ctype_b_loc                   
0.57:1066020098:     162627432:1228647530:[kernel.kallsyms]      :[k] filemap_map_pages             
0.06:120013915:     140088632:260102547:[kernel.kallsyms]      :[k] vma_interval_tree_insert        
0.39:730051202:     132370215:862421417:[kernel.kallsyms]      :[k] perf_event_alloc                
0.55:1015490988:     131035917:1146526905:[kernel.kallsyms]      :[k] perf_event_aux_ctx            
0.43:793617868:     125666408:919284276:[kernel.kallsyms]      :[k] memset_erms                     
0.74:1383682896:     122935416:1506618312:perl                   :[.] Perl_regexec_flags            
0.83:1546248993:     120309599:1666558592:libc-2.21.so           :[.] _IO_getc                      
0.25:469980070:     118797566:588777636:libc-2.21.so           :[.] _dl_addr                        
0.26:490314628:     110317867:600632495:ld-2.21.so             :[.] do_lookup_x                     
0.45:836227328:     106471933:942699261:perl                   :[.] Perl_yylex                      
0.85:1580066629:     103820430:1683887059:libc-2.21.so           :[.] _int_free                     
0.62:1160141971:     101707344:1261849315:[kernel.kallsyms]      :[k] unmap_page_range              
0.01:19809999:      89831404:109641403:[kernel.kallsyms]      :[k] native_queued_spin_lock_slowpath 
0.60:1113390363:      86975498:1200365861:perl                   :[.] Perl_yyparse      


Path for autoconf to avoid /usr/bin/print



The check for solaris 'print' causes significant problems on a linux machine
with dash as /bin/sh since it triggers the execution of "print" which on some 
linux systems is a perl script which is part of mailcap. Worse, this perl 
script calls "which file" and if successful ignores the path file was found 
in and just runs "file" without a path. Each exection causes PATH to be searched.

Simply assuming the shell's printf function works cuts out all the fork overhead
and when parallel tasks are running, this overhead appears to be significant.

RP
2015/11/28

Index: autoconf-2.69/lib/m4sugar/m4sh.m4
===================================================================
--- autoconf-2.69.orig/lib/m4sugar/m4sh.m4
+++ autoconf-2.69/lib/m4sugar/m4sh.m4
@@ -1045,40 +1045,8 @@ m4_defun([_AS_ECHO_PREPARE],
 [[as_nl='
 '
 export as_nl
-# Printing a long string crashes Solaris 7 /usr/bin/printf.
-as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
-# Prefer a ksh shell builtin over an external printf program on Solaris,
-# but without wasting forks for bash or zsh.
-if test -z "$BASH_VERSION$ZSH_VERSION" \
-    && (test "X`print -r -- $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='print -r --'
-  as_echo_n='print -rn --'
-elif (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
-  as_echo='printf %s\n'
-  as_echo_n='printf %s'
-else
-  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
-    as_echo_body='eval /usr/ucb/echo -n "$][1$as_nl"'
-    as_echo_n='/usr/ucb/echo -n'
-  else
-    as_echo_body='eval expr "X$][1" : "X\\(.*\\)"'
-    as_echo_n_body='eval
-      arg=$][1;
-      case $arg in @%:@(
-      *"$as_nl"*)
-	expr "X$arg" : "X\\(.*\\)$as_nl";
-	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
-      esac;
-      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
-    '
-    export as_echo_n_body
-    as_echo_n='sh -c $as_echo_n_body as_echo'
-  fi
-  export as_echo_body
-  as_echo='sh -c $as_echo_body as_echo'
-fi
+as_echo='printf %s\n'
+as_echo_n='printf %s'
 ]])# _AS_ECHO_PREPARE
 







