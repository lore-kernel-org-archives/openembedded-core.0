Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R23XO-0007f0-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 18:02:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p89FvbVk016529
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Sep 2011 08:57:37 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 9 Sep 2011 08:57:36 -0700
Message-ID: <4E6A3770.4060307@windriver.com>
Date: Fri, 9 Sep 2011 10:57:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
Subject: Re: Problem with new image-prelink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2011 16:02:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Which architecture?

I know of a few issues on MIPS, but they should simply prevent prelinking
instead of causing problems.

Also, can you check your log.do_rootfs for the failed image.  Look for any
prelinker warnings or errors.  (Easiest way is to search for "prelink".  There
should be two hits, one that says "Size before prelinking: ..." and one that
says "Size after prelinking: ..."  between that would be any prelinker messages.)

--Mark

On 9/8/11 10:34 PM, James Limbouris wrote:
> Hi,
> 
> After the new version of prelink was committed, I started experiencing
> segmentation faults in a large Qt app on my prelinked image.
> They go away when image-prelink is disabled, or the single binary is
> reinstalled with opkg. I am using eglibc 2.12 and gcc 4.5. Is anyone
> else having trouble?
> 
> Strace shows the binary gets through a lot of library loads. Here is the tail
> end before the crash:
> 
> open("/usr/lib/libQtDBusE.so.4", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\274n\1D4\0\0\0"..., 512) = 512
> fstat64(3, {st_mode=S_IFREG|0755, st_size=499692, ...}) = 0
> mmap2(0x44000000, 497232, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x44000000
> mmap2(0x44078000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x78) = 0x44078000
> close(3)                                = 0
> open("/usr/lib/libpng12.so.0", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\370\266\215A4\0\0\0"..., 512) = 512
> fstat64(3, {st_mode=S_IFREG|0755, st_size=130844, ...}) = 0
> mmap2(0x418d8000, 160984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x418d8000
> mprotect(0x418f8000, 28672, PROT_NONE)  = 0
> mmap2(0x418ff000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f) = 0x418ff000
> close(3)                                = 0
> open("/usr/lib/libfreetype.so.6", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\310\366\5B4\0\0\0"..., 512) = 512
> fstat64(3, {st_mode=S_IFREG|0755, st_size=458292, ...}) = 0
> mmap2(0x42058000, 488488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x42058000
> mprotect(0x420c5000, 28672, PROT_NONE)  = 0
> mmap2(0x420cc000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6c) = 0x420cc000
> close(3)                                = 0
> open("/usr/lib/libQtXmlE.so.4", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\364,\20B4\0\0\0"..., 512) = 512
> fstat64(3, {st_mode=S_IFREG|0755, st_size=268336, ...}) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
> mmap2(0x420f0000, 297992, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x420f0000
> mprotect(0x42130000, 28672, PROT_NONE)  = 0
> mmap2(0x42137000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3f) = 0x42137000
> close(3)                                = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40008000
> set_tls(0x40008860, 0x40008f48, 0x415a4048, 0x40008860, 0x415a4048) = 0
> mprotect(0x416f3000, 4096, PROT_READ)   = 0
> mprotect(0x41c29000, 12288, PROT_READ)  = 0
> mprotect(0x416cd000, 8192, PROT_READ)   = 0
> mprotect(0x417d1000, 4096, PROT_READ)   = 0
> mprotect(0x417e5000, 4096, PROT_READ)   = 0
> mprotect(0x4179d000, 4096, PROT_READ)   = 0
> mprotect(0x415a3000, 4096, PROT_READ)   = 0
> munmap(0x40001000, 5103)                = 0
> set_tid_address(0x40008408)             = 1235
> set_robust_list(0x40008410, 0xc)        = 0
> rt_sigaction(SIGRTMIN, {0x416dc084, [], SA_SIGINFO|0x4000000}, NULL, 8) = 0
> rt_sigaction(SIGRT_1, {0x416dbf28, [], SA_RESTART|SA_SIGINFO|0x4000000}, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
> getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
> brk(0)                                  = 0x1c5000
> brk(0x1e6000)                           = 0x1e6000
> open("/proc/self/auxv", O_RDONLY)       = 3
> read(3, "\20\0\0\0\227\1\0\0", 8)       = 8
> close(3)                                = 0
> sched_getparam(1235, { 0 })             = 0
> sched_getscheduler(1235)                = 0 (SCHED_OTHER)
> clock_getres(CLOCK_MONOTONIC, {0, 1})   = 0
> sched_get_priority_min(SCHED_OTHER)     = 0
> sched_get_priority_max(SCHED_OTHER)     = 0
> sched_get_priority_max(SCHED_OTHER)     = 0
> gettimeofday({1315537291, 101290}, NULL) = 0
> --- SIGSEGV (Segmentation fault) @ 0 (0) ---
> +++ killed by SIGSEGV +++
> Segmentation fault
> 
> 
> It should have continued with:
> 
> 
> open("/usr/lib/charset.alias", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
> open("/usr/share/locale/locale.alias", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
> clock_gettime(CLOCK_MONOTONIC, {645, 655570927}) = 0
> futex(0x417d20a4, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> uname({sys="Linux", node="192.168.1.14", ...}) = 0
> socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
> connect(3, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
> close(3)                                = 0
> socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
> connect(3, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
> close(3)                                = 0
> open("/etc/nsswitch.conf", O_RDONLY)    = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=465, ...}) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40001000
> read(3, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) = 465
> read(3, "", 4096)                       = 0
> close(3)                                = 0
> munmap(0x40001000, 4096)                = 0
> open("/etc/ld.so.cache", O_RDONLY)      = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=5103, ...}) = 0
> mmap2(NULL, 5103, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40001000
> close(3)                                = 0
> open("/lib/libnss_compat.so.2", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0T\r\0\0004\0\0\0"..., 512) = 512
> fstat64(3, {st_mode=S_IFREG|0755, st_size=26368, ...}) = 0
> mmap2(NULL, 57952, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40009000
> mprotect(0x4000f000, 28672, PROT_NONE)  = 0
> mmap2(0x40016000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5) = 0x40016000
> close(3)
> .....
> 
> I think the gettimeofday() before the crash is the end of the loading process.
> None of the other binaries on the system are doing this - even demos from
> qt4-embedded-demos. The only salient feature of this particular binary is
> its large resource section, weighing it in at 1.4 MB.
> 
> I'm rebuilding now with eglibc 2.13 and gcc 4.6. Will report the results.  
> 
> Regards, 
> James Limbouris
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



