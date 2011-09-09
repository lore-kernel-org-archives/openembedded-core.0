Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1R1rwj-0005xf-Uc
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 05:40:06 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Thu, 8 Sep 2011
	23:34:00 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Problem with new image-prelink
Thread-Index: Acxumoq/2ilmZmWnTuuyv8ZWELunbg==
Date: Fri, 9 Sep 2011 03:34:00 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Problem with new image-prelink
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
X-List-Received-Date: Fri, 09 Sep 2011 03:40:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

After the new version of prelink was committed, I started experiencing
segmentation faults in a large Qt app on my prelinked image.
They go away when image-prelink is disabled, or the single binary is
reinstalled with opkg. I am using eglibc 2.12 and gcc 4.5. Is anyone
else having trouble?

Strace shows the binary gets through a lot of library loads. Here is the ta=
il
end before the crash:

open("/usr/lib/libQtDBusE.so.4", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\274n\1D4\0\0\0"...,=
 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D499692, ...}) =3D 0
mmap2(0x44000000, 497232, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3=
, 0) =3D 0x44000000
mmap2(0x44078000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x78) =3D 0x44078000
close(3)                                =3D 0
open("/usr/lib/libpng12.so.0", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\370\266\215A4\0\0\0=
"..., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D130844, ...}) =3D 0
mmap2(0x418d8000, 160984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3=
, 0) =3D 0x418d8000
mprotect(0x418f8000, 28672, PROT_NONE)  =3D 0
mmap2(0x418ff000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x1f) =3D 0x418ff000
close(3)                                =3D 0
open("/usr/lib/libfreetype.so.6", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\310\366\5B4\0\0\0".=
.., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D458292, ...}) =3D 0
mmap2(0x42058000, 488488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3=
, 0) =3D 0x42058000
mprotect(0x420c5000, 28672, PROT_NONE)  =3D 0
mmap2(0x420cc000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0x6c) =3D 0x420cc000
close(3)                                =3D 0
open("/usr/lib/libQtXmlE.so.4", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\364,\20B4\0\0\0"...=
, 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D268336, ...}) =3D 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40007000
mmap2(0x420f0000, 297992, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3=
, 0) =3D 0x420f0000
mprotect(0x42130000, 28672, PROT_NONE)  =3D 0
mmap2(0x42137000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x3f) =3D 0x42137000
close(3)                                =3D 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40008000
set_tls(0x40008860, 0x40008f48, 0x415a4048, 0x40008860, 0x415a4048) =3D 0
mprotect(0x416f3000, 4096, PROT_READ)   =3D 0
mprotect(0x41c29000, 12288, PROT_READ)  =3D 0
mprotect(0x416cd000, 8192, PROT_READ)   =3D 0
mprotect(0x417d1000, 4096, PROT_READ)   =3D 0
mprotect(0x417e5000, 4096, PROT_READ)   =3D 0
mprotect(0x4179d000, 4096, PROT_READ)   =3D 0
mprotect(0x415a3000, 4096, PROT_READ)   =3D 0
munmap(0x40001000, 5103)                =3D 0
set_tid_address(0x40008408)             =3D 1235
set_robust_list(0x40008410, 0xc)        =3D 0
rt_sigaction(SIGRTMIN, {0x416dc084, [], SA_SIGINFO|0x4000000}, NULL, 8) =3D=
 0
rt_sigaction(SIGRT_1, {0x416dbf28, [], SA_RESTART|SA_SIGINFO|0x4000000}, NU=
LL, 8) =3D 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) =3D 0
getrlimit(RLIMIT_STACK, {rlim_cur=3D8192*1024, rlim_max=3DRLIM_INFINITY}) =
=3D 0
brk(0)                                  =3D 0x1c5000
brk(0x1e6000)                           =3D 0x1e6000
open("/proc/self/auxv", O_RDONLY)       =3D 3
read(3, "\20\0\0\0\227\1\0\0", 8)       =3D 8
close(3)                                =3D 0
sched_getparam(1235, { 0 })             =3D 0
sched_getscheduler(1235)                =3D 0 (SCHED_OTHER)
clock_getres(CLOCK_MONOTONIC, {0, 1})   =3D 0
sched_get_priority_min(SCHED_OTHER)     =3D 0
sched_get_priority_max(SCHED_OTHER)     =3D 0
sched_get_priority_max(SCHED_OTHER)     =3D 0
gettimeofday({1315537291, 101290}, NULL) =3D 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Segmentation fault


It should have continued with:


open("/usr/lib/charset.alias", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No such=
 file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT =
(No such file or directory)
clock_gettime(CLOCK_MONOTONIC, {645, 655570927}) =3D 0
futex(0x417d20a4, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
uname({sys=3D"Linux", node=3D"192.168.1.14", ...}) =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 3
connect(3, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D -=
1 ENOENT (No such file or directory)
close(3)                                =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 3
connect(3, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D -=
1 ENOENT (No such file or directory)
close(3)                                =3D 0
open("/etc/nsswitch.conf", O_RDONLY)    =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D465, ...}) =3D 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40001000
read(3, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) =3D 465
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
munmap(0x40001000, 4096)                =3D 0
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D5103, ...}) =3D 0
mmap2(NULL, 5103, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40001000
close(3)                                =3D 0
open("/lib/libnss_compat.so.2", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0T\r\0\0004\0\0\0"...=
, 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D26368, ...}) =3D 0
mmap2(NULL, 57952, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x40009000
mprotect(0x4000f000, 28672, PROT_NONE)  =3D 0
mmap2(0x40016000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x5) =3D 0x40016000
close(3)
.....

I think the gettimeofday() before the crash is the end of the loading proce=
ss.
None of the other binaries on the system are doing this - even demos from
qt4-embedded-demos. The only salient feature of this particular binary is
its large resource section, weighing it in at 1.4 MB.

I'm rebuilding now with eglibc 2.13 and gcc 4.6. Will report the results.=
=A0=A0

Regards,=A0
James Limbouris



