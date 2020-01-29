Return-Path: <sergio.paracuellos@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id 13E15605B6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:22:04 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 66so3040950otd.9
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=h3FPk49Ytp3LQJdjqAgJyW4+SCSrY0bFrk5sziibGr8=;
	b=Qg24obkqTu3dAYLSyOemqzCTWj4dk1IdEWQwfZvIH/sgm8cyBuuE7FXwdBv3CK6eAw
	BrVoONULILvP2qGr0VrIZYEE+tsqg0azJnxSviLfbOOIVyz0ed88e0tKgjYF9albhdXD
	4N3fPX4aym6MXgja5ye+6oeEdTGnX392JVHf5K8DxlTOqmmaO9WFk6OjOlKXBecKdzHP
	Fn7FNqIZRNER5Qwut9JQjr9BLkO1ub0T93olPZx2bYqp4I4ZMChAQw4d3kE4kbv7MioT
	PxESIdQIBxluW/O4t4zK+JWXZBq8br1k254/uZnDENePqEATd2ZC4QIcOi+qEzIYbpdP
	y2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=h3FPk49Ytp3LQJdjqAgJyW4+SCSrY0bFrk5sziibGr8=;
	b=SCHvEV5Dao1lfGa2Uqz/03qzUHoOZu7A6MB7nRN0luasEcqPtOlxFzhH3Ip8ue6Ieb
	dQkHqXtf1gqhe+zg3RMHxTrq6g0SHElTsToOoJoFEhBsc8Dg+UYgFwyki5ljiHB4UJDE
	eP5bB/2HkK00rvKF4amjf5HbUr3CoC8j0gYCheuDB2eLpYhqL7YHRSdRXweqc2HnGtRN
	sbqtiHQFrqNT85pX6fB39WJI3BKP92ERdUz89VK5ik1Gajmb0HmzhooKp25kokVWNI5M
	yR04NuSFaMZSc+m/Gpm9OwSf07CFOm+cyT4cRPNFmJ8456uIcIVnBHVtfWew3Kn63Oyg
	3Axg==
X-Gm-Message-State: APjAAAXdxYR6S8PbC4F02AgDbNrQ2dEy2n/DMcr+1auu0usO+E0DtVsn
	zG7tUiBQ0O8EoLDujU9Adw5Lq7n5arzIcTSIUGFf4YN4
X-Google-Smtp-Source: APXvYqyjKBrpQ+G6HMd8bK/gKCQCC3ZycIEGokw5w5uRTKH/EmrT6BBBoSc8Ek0/QoMMSz7/z589LDxqISOv034IQRQ=
X-Received: by 2002:a9d:5918:: with SMTP id t24mr20595536oth.310.1580282303312;
	Tue, 28 Jan 2020 23:18:23 -0800 (PST)
MIME-Version: 1.0
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 29 Jan 2020 08:18:12 +0100
Message-ID: <CAMhs-H8tLn5TpxCdLygxz-J-s_xKRq3DqxiYvk_6-UnpgTHN2Q@mail.gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: [warrior] Issue when system memory is cached but available and signals in aarch64
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am using warrior with the followings:

$ cat /etc/build
-----------------------
Build Configuration:  |
-----------------------
DISTRO = poky
DISTRO_VERSION = 2.7.2
-----------------------
Layer Revisions:      |
-----------------------
meta              = warrior:47b2063dd37e99e7a70cd1ba8c9e23da27342521
meta-poky         = warrior:47b2063dd37e99e7a70cd1ba8c9e23da27342521
meta-yocto-bsp    = warrior:47b2063dd37e99e7a70cd1ba8c9e23da27342521
meta-oe           = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-python       = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-networking   = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-filesystems  = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-webserver    = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-perl         = warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8
meta-tpm          = warrior:4f7be0d252f68d8e8d442a7ed8c6e8a852872d28

I log in to the system and run the following script directly in the prompt:

while [ 1 ]; do uptime && free && sleep 1; done

When the machine has all of the memory free this script does not cause
any problem. The problem seems to appear when
the memory is cached and the memory free is about 80 MB (but still
practically all the memory available because it is just cached):

State of system without processes writting to disk (when system is ok):

            total        used        free         shared   buff/cache  available
Mem:        4053004      164284     3808712       10164       80008     3776824
Swap:             0           0           0

State of system with processes writting to disk and kernel properly
caching memory (system becomes unstable?):

            total        used        free       shared   buff/cache  available
Mem:        4053004      273072     85472       10164     3694460     3701456
Swap:             0           0           0

(NOTE: both of the free output measures are in KB).

When the system gets in this state random signals seems to be
triggered in the system. The normal signals which I can see are
SIGSEGV
but sometimes I saw SIGABRT and more rarely SIGBUS to any other
periodic process (like watchdog scripts for example).

In this state I can reproduce this issue ALWAYS just executing the
above script and just waiting (time to reproduce it is kind of
random).

When the bug appears I can see this kind of messages from audit daemon:

[49595.751038] audit: type=1701 audit(1580196182.291:4):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=9931 comm="sleep"
exe="/bin/busybox.nosuid" sig=11
[49605.793534] audit: type=1701 audit(1580196192.331:5):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=2747 comm="sh"
exe="/bin/bash.bash" sig=11

I don't really expect bash to get SIGSEGV signals and this is kind of weird...

I got two core files of this script receiving SIGSEGV signals (first
sleep 1 command and the the shell itself dies):

$ file core.23217
core.23217: ELF 64-bit LSB core file ARM aarch64, version 1 (SYSV),
SVR4-style, from 'sleep 1'

$ file core.2739
core.2739: ELF 64-bit LSB core file ARM aarch64, version 1 (SYSV),
SVR4-style, from '-sh'

This file in my rootfs are links to the following files:

/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-linux/oberonx-image/1.0-r0/rootfs/bin/sh
-> /bin/bash.bash

/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-linux/oberonx-image/1.0-r0/rootfs/bin/sleep
-> /bin/busybox.nosuid

So I tried to get a backtrace of those two using the cores and this
two binaries:

$ /opt/poky/2.7.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gdb
/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-linux/oberonx-image/1.0-r0/rootfs/bin/busybox.nosuid
core.23217
GNU gdb (GDB) 8.2.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=x86_64-pokysdk-linux
--target=aarch64-poky-linux".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    /home/sergio/.gdbinit:1: Error in sourced command file:
    Undefined command: "layout".  Try "help".
    Reading symbols from
/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-linux/oberonx-image/1.0-r0/rootfs/bin/busybox.nosuid...(no
debugging symbols found)...done.

    warning: core file may not match specified executable file.
    [New LWP 23217]

    warning: Could not load shared library symbols for 3 libraries,
e.g. /lib/libm.so.6.
    Use the "info sharedlibrary" command to see the complete listing.
    Do you need "set solib-search-path" or "set sysroot"?
    Core was generated by `sleep 1'.
    Program terminated with signal SIGSEGV, Segmentation fault.
#0  0xfffffcd7fffffc60 in ?? ()
    (gdb) bt
#0  0xfffffcd7fffffc60 in ?? ()
#1  0x000000555668af74 in ?? ()
    Backtrace stopped: previous frame identical to this frame (corrupt stack?)
    (gdb)

$ /opt/poky/2.7.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gdb
/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-lin
ux/oberonx-image/1.0-r0/rootfs/bin/bash.bash core.2739
GNU gdb (GDB) 8.2.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=x86_64-pokysdk-linux
--target=aarch64-poky-linux".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    /home/sergio/.gdbinit:1: Error in sourced command file:
    Undefined command: "layout".  Try "help".
    Reading symbols from
/home/sergio/YOCTO/tools/yocto/workspace/build/tmp/work/oberonx-poky-linux/oberonx-image/1.0-r0/rootfs/bin/bash.bash...(no
debugging symbols found)...done.

    warning: core file may not match specified executable file.
    [New LWP 2739]

    warning: Could not load shared library symbols for 5 libraries,
e.g. /lib/libtinfo.so.5.
    Use the "info sharedlibrary" command to see the complete listing.
    Do you need "set solib-search-path" or "set sysroot"?
    Core was generated by `-sh'.
    Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x000000555a7f1d30 in hash_search ()
    (gdb) bt
#0  0x000000555a7f1d30 in hash_search ()
#1  0x000000555a7d2720 in ?? ()
#2  0x000000555a7c6fd0 in ?? ()
#3  0x000000555a7c9d30 in ?? ()
#4  0x000000555a7cb474 in execute_command_internal ()
#5  0x000000555a7ccbe0 in execute_command ()
#6  0x000000555a7ccdb0 in ?? ()
#7  0x000000555a7cb344 in execute_command_internal ()
#8  0x000000555a7ccbe0 in execute_command ()
#9  0x000000555a7b4f90 in reader_loop ()
#10 0x000000555a7b3570 in main ()
    (gdb)


The limits in my machine are as follows (I set core file size to
unlimited to get the cores, but in
normal use is zero):

$ ulimit -a
core file size          (blocks, -c) unlimited
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 15744
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 15744
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited

There are no oops and anything but the audit trace in the kernel size,
so it could be something related with C library and how binaries are
being compiled? I am not using any customization for this just the
warrior defauls (gcc 8.3.0).

I don't really know where and what to search for. I don't know if
someone has similar problems. Any help would be much appreciated.

Thanks in advance,

Sergio Paracuellos

