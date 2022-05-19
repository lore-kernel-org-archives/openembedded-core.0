Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C122C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:43:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.6970.1652964199495855074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BnOkaCgh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u3so7019595wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=NmH2UeO5W8X1B5WJrvDvedo6DtsKKolZUbLJEaR17LM=;
        b=BnOkaCghb5ecJE/TGP3je7PfXykVh4CO1BVE3W0C58UK9Or4AsV/bzutythSYxnGmC
         w3o42jYBg6eqRa7rJ6lb0LapEQ0odYVTqlWfQEdFOpdeHfBLG+BCRmMcfuZefnBbd5oe
         qwQ24FY1rFkZp3KaKcxiuMY70f5nmgnKfH/zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=NmH2UeO5W8X1B5WJrvDvedo6DtsKKolZUbLJEaR17LM=;
        b=KAghTwNt03ikyj75x6HkqZiQ/2Wx/wAPI0HMwQ7aX6Wva+mX1OvDDinyNO/+9QytFT
         QmyZY+YYav/x8NHmfPrMx5eRwoMOa1Q2ljXZnnnfQckJ6xVSsTjprfA1I1aHoTSqizRZ
         KTJsT+fRypPi1dz+OmCCaGsNqWfcm2cK/B2Uqd0llERPA2Zm1hHK65ewhMnO4CGK+YtE
         Or0HVwj43LIE+lol7i6Ukug3WQFAN5zJp71Ie7jAd+z5v1q9N0NnJSgF89YPol7oayL9
         1Q7MOPIjU1hEqB3oO3dXpwTb0/VW9PRmskKGD0vcLRq0E9v1+Jxx+4FNBKVV55WDc9iH
         WzTw==
X-Gm-Message-State: AOAM531WgrIduuVqixlQjpWEtRy/4YIujn8i6AwBiGX8LEgQpPzP55SI
	4oGt+DFHnxZhEKCCUHxovLqRKg==
X-Google-Smtp-Source: 
 ABdhPJz+0zh5rc2UyCwpdRoCNbmg03gqq88PV6wSJnPiSvr7SXfRxVSJW9k6DI6vMvrXfLmQyKxwiA==
X-Received: by 2002:adf:fe42:0:b0:20d:297:f86e with SMTP id
 m2-20020adffe42000000b0020d0297f86emr3947458wrs.382.1652964197695;
        Thu, 19 May 2022 05:43:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d366:a594:9f79:7910?
 ([2001:8b0:aba:5f3c:d366:a594:9f79:7910])
        by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f30sm8061665wmj.9.2022.05.19.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 05:43:16 -0700 (PDT)
Message-ID: 
 <c0af13a185147f7296122e016a349d3089bcc71b.camel@linuxfoundation.org>
Subject: Investigating a hung job on the autobuilder - a HOWTO
From: richard.purdie@linuxfoundation.org
To: swat <swat@lists.yoctoproject.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Ross Burton <ross.burton@arm.com>
Date: Thu, 19 May 2022 13:43:14 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 12:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165885

Investigating a hung job on the autobuilder

We've yet another hung job on the autobuilder. I thought I'd write down
what I did to investigate it so others can learn how to do it and so I
can remember next time I need to do it too.

The problem was this job:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4563

qemuarm64-armhost running on an aarch64 worker, hung in do_testsdkext
for core-image-minimal. To get further you need ssh access. We do give
out ssh access to people who need it.

ssh to ubuntu1804-arm-1.yocto.io and then "sudo -iu pokybuild" lets us
have a look at what is going on. Easy first step is:

$ ps ax | grep armhost
28429 ?        S      0:00 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/yocto-autobuilder-helper/scripts/run-config qemuarm64-armhost /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/build lucaceresoli/master-ne=
xt ssh://git@push.yoctoproject.org/poky-contrib --sstateprefix  --buildapps=
rcrev  --publish-dir  --build-type full --workername ubuntu1804-arm-1 --bui=
ld-url https://autobuilder.yoctoproject.org/typhoon/#builders/97/builds/456=
3 --results-dir /srv/autobuilder/autobuilder.yocto.io/pub/non-release/20220=
517-8/testresults --quietlogging --stepname test-targets --phase 2
28430 ?        S      0:00 /bin/sh -c . ./oe-init-build-env; /home/pokybuil=
d/yocto-worker/qemuarm64-armhost/yocto-autobuilder-helper/scripts/checkvnc;=
 DISPLAY=3D:1 bitbake core-image-minimal:do_testimage core-image-sato:do_te=
stimage core-image-sato-sdk:do_testimage core-image-sato:do_testsdk  core-i=
mage-minimal:do_testsdkext core-image-sato:do_testsdkext -k
28460 ?        Sl     0:32 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake core-image-minimal:do_testimage core-image=
-sato:do_testimage core-image-sato-sdk:do_testimage core-image-sato:do_test=
sdk core-image-minimal:do_testsdkext core-image-sato:do_testsdkext -k
28462 ?        Sl     6:43 bitbake-server /home/pokybuild/yocto-worker/qemu=
arm64-armhost/build/bitbake/bin/bitbake-server decafbad 3 5 /home/pokybuild=
/yocto-worker/qemuarm64-armhost/build/build/bitbake-cookerdaemon.log /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/build/bitbake.lock /home/pok=
ybuild/yocto-worker/qemuarm64-armhost/build/build/bitbake.sock 0 None 0
28504 ?        Sl     0:17 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake-worker decafbad
28515 ?        SNs    0:00 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake-worker decafbad
29659 pts/1    S+     0:00 grep armhost
38713 ?        SN     0:00 /bin/sh -c . /home/pokybuild/yocto-worker/qemuar=
m64-armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.=
0-r0/testsdkext/environment-setup-cortexa57-poky-linux > /dev/null; devtool=
 sdk-install meta-extsdk-toolchain
38719 ?        SN     0:01 /home/pokybuild/yocto-worker/qemuarm64-armhost/b=
uild/build/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdke=
xt/buildtools/sysroots/aarch64-pokysdk-linux/usr/bin/python3 /home/pokybuil=
d/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-linux/=
core-image-minimal/1.0-r0/testsdkext/sysroots/aarch64-pokysdk-linux/usr/bin=
/devtool sdk-install meta-extsdk-toolchain

i.e. looking for processes that are running in that build directory.

The relevant part of the process tree from "ps axjf":

 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    1  3501  3500  3500 ?           -1 Sl    6000   2:29 /usr/bin/python3 /=
usr/local/bin/buildbot-worker start /home/pokybuild/yocto-worker/
 3501 28429 28429  3500 ?           -1 S     6000   0:00  \_ python3 /home/=
pokybuild/yocto-worker/qemuarm64-armhost/yocto-autobuilder-helper/scripts/
28429 28430 28429  3500 ?           -1 S     6000   0:00      \_ /bin/sh -c=
 . ./oe-init-build-env; /home/pokybuild/yocto-worker/qemuarm64-armhost/yoc
28430 28460 28429  3500 ?           -1 Sl    6000   0:32          \_ python=
3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake
    1 28462 28461 28461 ?           -1 Sl    6000   6:43 bitbake-server /ho=
me/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-serv
28462 28504 28461 28461 ?           -1 Sl    6000   0:17  \_ python3 /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-worker=
=20
28504 28515 28515 28515 ?           -1 SNs   6000   0:00      \_ python3 /h=
ome/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-wor
28515 38713 28515 28515 ?           -1 SN    6000   0:00          \_ /bin/s=
h -c . /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work
38713 38719 28515 28515 ?           -1 SN    6000   0:01              \_ /h=
ome/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm6

so the hung process is 38719.

I did have a look at the log files in the build directory but in this
case I didn't find anything. The bitbake-cookerdaemon.log in particular
can sometimes help. I had a look at the open files for the process:

$ ls /proc/38719/fd -la
total 0
dr-x------ 2 pokybuild pokybuild  0 May 19 12:08 .
dr-xr-xr-x 9 pokybuild pokybuild  0 May 19 11:59 ..
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 0 -> /dev/null
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 1 -> 'pipe:[122175861]'
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 2 -> 'pipe:[122175861]'
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 4 -> 'pipe:[122140435]'

but nothing interesting there.

I couldn't use strace as the permissions weren't setup for that without
root. We don't normally give out that access but to debug this I went
ahead and looked with strace:

strace -p 38719
strace: Process 38719 attached
futex(0xffff9c2da2bc, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 0, NU=
LL, 0xffffffff

so it is stuck in a futex. I then went ahead and tried gdb:

gdb -p 38719

BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/usr/bin/python3.10.real: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/lib/libc.so.6: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
Reading symbols from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/b=
uild/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/bui=
ldtools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6...(no debugging symbol=
s found)...done.

(gdb) bt
Python Exception <class 'gdb.error'> Call Frame Instruction op 45 in vendor=
 extension space is not handled on this architecture.:=20
#0  0x0000ffff9bd1e16c in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
Call Frame Instruction op 45 in vendor extension space is not handled on th=
is architecture.

I've abbreviated the initial output. We can see that it is using python
3.10 from within builtdools tarball within an eSDK and we have no debug
symbols. The lack of a backtrace was worrying, after consulting some
ARM experts it was concluded the version of gdb was too old for the
newer glibc in buildtools.

After much thinking, I decided to enable and build a gdb-native. I did
something horrible and moved the lock and sock files out the way and
then a "bitbake gdb-native" in the same build directory. We don't have
a gdb-native recipe however adding a BBCLASSEXTEND =3D "native", a
PACKAGECONFIG to enable python in the native case and disable LLTNGUST
for native. A "bitbake gdb-native -c addto_recipe_sysroot" made it
available in the gdb-native WORKDIR where I could then run it from:

/home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/aarch64=
-linux/gdb-native/12.1-r0/recipe-sysroot-native/usr/bin/gdb -p 3871

I did try using gdb-cross-aarch64 but that wouldn't attach to local
processes.

Sadly there were no symbols so the backtrace output was still not
useful other than seeing we were in some libpthread function
(unsurprisingly). I realised I could go into the python3-nativesdk
workdir, find the nativesdk-python3-dbg package (I used the deb) and
then copy the .debug files from that into the
testsdkext/buildtools/sysroots/aarch64-pokysdk-linux/usr/lib/ directory
for the python libs.

With that, I got some more interesting output:

(gdb) bt
#0  0x0000ffff9bd1e16c in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#1  0x0000ffff9bd20d88 in pthread_cond_wait ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#2  0x0000ffff9c0db3a8 in drop_gil (ceval=3Dceval@entry=3D0xffff9c2da208 <_=
PyRuntime+344>, ceval2=3Dceval2@entry=3D0xaaab09af3f20,=20
    tstate=3Dtstate@entry=3D0xaaab09ab9ba0) at ../Python-3.10.4/Python/ceva=
l_gil.h:182
#3  0x0000ffff9bfc8708 in eval_frame_handle_pending (tstate=3D0xaaab09ab9ba=
0) at ../Python-3.10.4/Python/ceval.c:1185
#4  _PyEval_EvalFrameDefault (tstate=3D0xaaab09ab9ba0, f=3D0xffff9445edd0, =
throwflag=3D<optimized out>) at ../Python-3.10.4/Python/ceval.c:1775
#5  0x0000ffff9c0de0a8 in _PyEval_EvalFrame (throwflag=3D0, f=3D0xffff9445e=
dd0, tstate=3D0xaaab09ab9ba0)
    at ../Python-3.10.4/Include/internal/pycore_ceval.h:46
#6  _PyEval_Vector (tstate=3D0xaaab09ab9ba0, con=3D0xffff95a20050, locals=
=3D<optimized out>, args=3D<optimized out>, argcount=3D<optimized out>,=20
    kwnames=3D<optimized out>) at ../Python-3.10.4/Python/ceval.c:5065
#7  0x0000ffff9c13a35c in _PyObject_VectorcallTstate (nargsf=3D922337203685=
4775809, kwnames=3D0x0, args=3D0xffffd3ebd780, callable=3D0xffff95a20040,=
=20
    tstate=3D0xaaab09ab9ba0) at ../Python-3.10.4/Include/cpython/abstract.h=
:114
#8  PyObject_CallOneArg (arg=3D0xffff95ac8130, func=3D0xffff95a20040) at ..=
/Python-3.10.4/Include/cpython/abstract.h:184
#9  handle_weakrefs (old=3D0xaaab09af4190, unreachable=3D0xffffd3ebd748) at=
 ../Python-3.10.4/Modules/gcmodule.c:887
#10 gc_collect_main (tstate=3Dtstate@entry=3D0xaaab09ab9ba0, generation=3Dg=
eneration@entry=3D2, n_collected=3Dn_collected@entry=3D0xffffd3ebd800,=20
    n_uncollectable=3Dn_uncollectable@entry=3D0xffffd3ebd808, nofail=3Dnofa=
il@entry=3D0) at ../Python-3.10.4/Modules/gcmodule.c:1281
#11 0x0000ffff9c13abfc in gc_collect_with_callback (tstate=3Dtstate@entry=
=3D0xaaab09ab9ba0, generation=3Dgeneration@entry=3D2)
    at ../Python-3.10.4/Modules/gcmodule.c:1413
#12 0x0000ffff9c13b1e4 in PyGC_Collect () at ../Python-3.10.4/Modules/gcmod=
ule.c:2099
#13 0x0000ffff9c117538 in Py_FinalizeEx () at ../Python-3.10.4/Python/pylif=
ecycle.c:1781
#14 Py_FinalizeEx () at ../Python-3.10.4/Python/pylifecycle.c:1703
#15 0x0000ffff9c1181e8 in Py_Exit (sts=3D0) at ../Python-3.10.4/Python/pyli=
fecycle.c:2858
#16 0x0000ffff9c11cbc0 in handle_system_exit () at ../Python-3.10.4/Python/=
pythonrun.c:775
#17 _PyErr_PrintEx (tstate=3D0xaaab09ab9ba0, set_sys_last_vars=3Dset_sys_la=
st_vars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:785
#18 0x0000ffff9c11cbfc in PyErr_PrintEx (set_sys_last_vars=3Dset_sys_last_v=
ars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:880
#19 0x0000ffff9c11cc0c in PyErr_Print () at ../Python-3.10.4/Python/pythonr=
un.c:886
#20 0x0000ffff9c11d280 in _PyRun_SimpleFileObject (fp=3Dfp@entry=3D0xaaab09=
ab2540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=
=3D1,=20
    flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.4/Python/python=
run.c:462
#21 0x0000ffff9c11d50c in _PyRun_AnyFileObject (fp=3Dfp@entry=3D0xaaab09ab2=
540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=3D=
1,=20
    flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.4/Python/python=
run.c:90
#22 0x0000ffff9c1389c0 in pymain_run_file_obj (skip_source_first_line=3D0, =
filename=3D0xffff95cbe6b0, program_name=3D0xffff95dce3d0)
    at ../Python-3.10.4/Modules/main.c:353
#23 pymain_run_file (config=3D0xaaab09af4290) at ../Python-3.10.4/Modules/m=
ain.c:372
#24 pymain_run_python (exitcode=3D0xffffd3ebda44) at ../Python-3.10.4/Modul=
es/main.c:587
#25 Py_RunMain () at ../Python-3.10.4/Modules/main.c:666
#26 0x0000ffff9c138e6c in pymain_main (args=3D0xffffd3ebdb20) at ../Python-=
3.10.4/Modules/main.c:696
#27 Py_BytesMain (argc=3D<optimized out>, argv=3D<optimized out>) at ../Pyt=
hon-3.10.4/Modules/main.c:720
#28 0x0000ffff9bccb234 in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#29 0x0000ffff9bccb30c in __libc_start_main ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#30 0x0000aaaaca8cd9b0 in _start ()

I did try "py-bt" but that wasn't present. This can be fixed by
ensuring the source for python3-native is present ("bitbake python3-
native -c patch"), then

source build/tmp/work/aarch64-linux/python3-native/3.10.4-r0/Python-3.10.4/=
Tools/gdb/libpython.py

within gdb will add the python extensions. We can then get:

(gdb) py-bt
Traceback (most recent call first):
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/usr/lib/python3.10/_weakrefset.py", line 39, in _=
remove
    def _remove(item, selfref=3Dref(self)):
  Garbage-collecting

i.e. it is in python garbage collection. This probably means a
multiprocessing.Lock() or threading.Lock() was left in the locked state
by some other process/thread which exited and this has hung the build.

I still haven't worked out how to know *which* lock this is or how to
debug any further but I was quite pleased to even be able to debug this
to this point.

If anyone does have any further tips on this it is currently still
running in case we can figure out which lock it is/was.

Cheers,

Richard


