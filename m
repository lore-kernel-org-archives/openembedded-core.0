Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5BF601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 07:34:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J7XpIL025598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Apr 2016 00:33:52 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 00:33:51 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5715DF5B.5030406@windriver.com>
Date: Tue, 19 Apr 2016 15:33:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 07:34:12 -0000
Content-Type: multipart/alternative;
	boundary="------------060807080309070403000007"

--------------060807080309070403000007
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

With some investigation, there is an example to explain how to do remote 
debug.

Also file [YOCTO #9481] for document.

Hi Andreas,

Would you please have a look the example, to see if it could fit your case.

Example:

1. Build a image with gdbserver and gzip installed. The gzip
    is the debug binary. Append the following to local.conf
...
IMAGE_INSTALL_append = " gdbserver gzip"
...

$ bitbake core-image-sato

2. Build gdb-cross for remote debug on host

$ bitbake gdb-cross-i586

3. start qemu

$ runqemu qemux86 core-image-sato

4. On host side, create symlink /usr/src/debug to
    ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS} which the
    location of sources is /usr/src/debug.

$ ln -snf /TOPDIR/tmp/work/i586-poky-linux /usr/src/debug

5. On target side, ipaddr is 128.224.163.187,
    run gdbserver to debug "gzip -h"

root@qemux86-64:~# gdbserver localhost:1024 gzip -h
Process gzip created; pid = 530
Listening on port 1024

6. On host side, enter gzip's devshell
$ bitbake -cdevshell gzip

7. On host side, run gdb-cross to remote debug gzip

gzip-1.6# i586-poky-linux-gdb ../build/gzip

8. Use path ${STAGING_DIR_HOST} as the system root for
    the program being debugged. Any absolute shared
    library paths will be prefixed with path;

(gdb) set sysroot /TOPDIR/tmp/sysroots/qemux86


9. Start remote target, set break point at help()

(gdb) target remote 128.224.163.187:1024
(gdb) break gzip.c:325
(gdb) info break
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000000401ec1 in main at 
/usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:325
(gdb) c
Continuing.

Breakpoint 1, main (argc=2, argv=0x7fffffffeca8) at 
/usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:465
465                 help(); do_exit(OK); break;
(gdb) list
460             case 'd':
461                 decompress = 1; break;
462             case 'f':
463                 force++; break;
464             case 'h': case 'H':
465                 help(); do_exit(OK); break;
466             case 'k':
467                 keep = 1; break;
468             case 'l':
469                 list = decompress = to_stdout = 1; break;
(gdb) c
Continuing.
[Inferior 1 (process 1246) exited normally]


10. On target side, get output of "gzip -h"
[snip]
Remote debugging from host 128.224.153.74
Usage: gzip [OPTION]... [FILE]...
Compress or uncompress FILEs (by default, compress FILES in-place).

Mandatory arguments to long options are mandatory for short options too.

   -c, --stdout      write on standard output, keep original files unchanged
   -d, --decompress  decompress
   -f, --force       force overwrite of output file and compress links
   -h, --help        give this help
   -k, --keep        keep (don't delete) input files
   -l, --list        list compressed file contents
   -L, --license     display software license
   -n, --no-name     do not save or restore the original name and time stamp
   -N, --name        save or restore the original name and time stamp
   -q, --quiet       suppress all warnings
   -r, --recursive   operate recursively on directories
   -S, --suffix=SUF  use suffix SUF on compressed files
   -t, --test        test compressed file integrity
   -v, --verbose     verbose mode
   -V, --version     display version number
   -1, --fast        compress faster
   -9, --best        compress better

With no FILE, or when FILE is -, read standard input.

Report bugs to <bug-gzip@gnu.org>.

Child exited with status 0
GDBserver exiting
[snip]

//Hongxu


--------------060807080309070403000007
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi all,<br>
    <br>
    With some investigation, there is an example to explain how to do
    remote debug.<br>
    <br>
    Also file [YOCTO #9481] for document.<br>
    <br>
    Hi Andreas,<br>
    <br>
    Would you please have a look the example, to see if it could fit
    your case.<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    Example:<br>
    <br>
    1. Build a image with gdbserver and gzip installed. The gzip<br>
       is the debug binary. Append the following to local.conf<br>
    ...<br>
    IMAGE_INSTALL_append = " gdbserver gzip"<br>
    ...<br>
    <br>
    $ bitbake core-image-sato<br>
    <br>
    2. Build gdb-cross for remote debug on host<br>
    <br>
    $ bitbake gdb-cross-i586<br>
    <br>
    3. start qemu<br>
    <br>
    $ runqemu qemux86 core-image-sato<br>
    <br>
    4. On host side, create symlink /usr/src/debug to<br>
       ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS} which the<br>
       location of sources is /usr/src/debug.<br>
    <br>
    $ ln -snf /TOPDIR/tmp/work/i586-poky-linux /usr/src/debug<br>
    <br>
    5. On target side, ipaddr is 128.224.163.187,<br>
       run gdbserver to debug "gzip -h"<br>
    <br>
    root@qemux86-64:~# gdbserver localhost:1024 gzip -h<br>
    Process gzip created; pid = 530<br>
    Listening on port 1024<br>
    <br>
    6. On host side, enter gzip's devshell<br>
    $ bitbake -cdevshell gzip<br>
    <br>
    7. On host side, run gdb-cross to remote debug gzip<br>
    <br>
    gzip-1.6# i586-poky-linux-gdb ../build/gzip<br>
    <br>
    8. Use path ${STAGING_DIR_HOST} as the system root for<br>
       the program being debugged. Any absolute shared<br>
       library paths will be prefixed with path;<br>
    <br>
    (gdb) set sysroot /TOPDIR/tmp/sysroots/qemux86<br>
    <br>
    <br>
    9. Start remote target, set break point at help()<br>
    <br>
    (gdb) target remote 128.224.163.187:1024<br>
    (gdb) break gzip.c:325<br>
    (gdb) info break<br>
    Num     Type           Disp Enb Address            What<br>
    1       breakpoint     keep y   0x0000000000401ec1 in main at
    /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:325<br>
    (gdb) c<br>
    Continuing.<br>
    <br>
    Breakpoint 1, main (argc=2, argv=0x7fffffffeca8) at
    /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:465<br>
    465                 help(); do_exit(OK); break;<br>
    (gdb) list<br>
    460             case 'd':<br>
    461                 decompress = 1; break;<br>
    462             case 'f':<br>
    463                 force++; break;<br>
    464             case 'h': case 'H':<br>
    465                 help(); do_exit(OK); break;<br>
    466             case 'k':<br>
    467                 keep = 1; break;<br>
    468             case 'l':<br>
    469                 list = decompress = to_stdout = 1; break;<br>
    (gdb) c<br>
    Continuing.<br>
    [Inferior 1 (process 1246) exited normally]<br>
    <br>
    <br>
    10. On target side, get output of "gzip -h"<br>
    [snip]<br>
    Remote debugging from host 128.224.153.74<br>
    Usage: gzip [OPTION]... [FILE]...<br>
    Compress or uncompress FILEs (by default, compress FILES in-place).<br>
    <br>
    Mandatory arguments to long options are mandatory for short options
    too.<br>
    <br>
      -c, --stdout      write on standard output, keep original files
    unchanged<br>
      -d, --decompress  decompress<br>
      -f, --force       force overwrite of output file and compress
    links<br>
      -h, --help        give this help<br>
      -k, --keep        keep (don't delete) input files<br>
      -l, --list        list compressed file contents<br>
      -L, --license     display software license<br>
      -n, --no-name     do not save or restore the original name and
    time stamp<br>
      -N, --name        save or restore the original name and time stamp<br>
      -q, --quiet       suppress all warnings<br>
      -r, --recursive   operate recursively on directories<br>
      -S, --suffix=SUF  use suffix SUF on compressed files<br>
      -t, --test        test compressed file integrity<br>
      -v, --verbose     verbose mode<br>
      -V, --version     display version number<br>
      -1, --fast        compress faster<br>
      -9, --best        compress better<br>
    <br>
    With no FILE, or when FILE is -, read standard input.<br>
    <br>
    Report bugs to <a class="moz-txt-link-rfc2396E" href="mailto:bug-gzip@gnu.org">&lt;bug-gzip@gnu.org&gt;</a>.<br>
    <br>
    Child exited with status 0<br>
    GDBserver exiting<br>
    [snip]<br>
    <br>
    //Hongxu<br>
    <br>
  </body>
</html>

--------------060807080309070403000007--
