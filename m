Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA95C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 07:08:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5456.1692860904461784366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 00:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dEHlaDFB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fea0640d7aso62665785e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692860903; x=1693465703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCqDwGKIOaDWYIRmBAC5gHJxnkc2zU29t1ZeEuY16pM=;
        b=dEHlaDFBCh8FJFyaaaY13M7rECecd9AqujIJcp7ndMhTCwM9LnAWh5Vb00gCH8BYWh
         kMXviz7HdTfX39dIknnfCN3nF5iyNOIQU7+JdBqef+XKVhNCLo8562JhlKJWXD23rmdO
         6fJCCORQFGUMcdfqY4ksue3VqmtbBXHUzaWI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860903; x=1693465703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCqDwGKIOaDWYIRmBAC5gHJxnkc2zU29t1ZeEuY16pM=;
        b=FuZ3/RHRiZMt3q1Vz7dKfaWzkl4b+K1y/McFtYmBxJpHV2Qx+qAdDDxYqWISZuF0Zt
         4EAWY/l2HQVbI/8cRh50RxPlkpoaQoAUkqYyP0BmyX9Z7dZoeH9tprs9X57S9ohyJ/4P
         3ohpNFXrW5iCCT3JpxRpa8Fc4P0RnQIun1Boq59V6lmP6GNPe4xNwI+C9KeBCOnbdNwt
         BC81EYVhlHjBtsATSdmq5xHVaT3s909G16jJwtcqIgn66dXY//yvRsZUNTROBOAeBCDn
         S4Jts/8on/G8f3qS22O3y2/8tp5HF43U3mIca4r/xWAA3/rB/9ekJp3BxxtIqfaZvJ39
         y03A==
X-Gm-Message-State: AOJu0Yx0Ko6jGdFHzJJ1H0deNtkyIXBKahmSxKSdtMo0F9pP80vXpUBX
	9Nh/xsbTxwy64hCcd1rcGB4w0xv8ISfkUWkODLM=
X-Google-Smtp-Source: AGHT+IEt/0a7ZYdnuLpOSgxQbU5Fk/7HO4cU7NIt7yzEFtTA3GdXx40BDpVYupKJUrh/V+TGC1S4lg==
X-Received: by 2002:a7b:c3c2:0:b0:3fc:4:a5b5 with SMTP id t2-20020a7bc3c2000000b003fc0004a5b5mr11080244wmj.29.1692860902344;
        Thu, 24 Aug 2023 00:08:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5461:c902:2158:9a5d? ([2001:8b0:aba:5f3c:5461:c902:2158:9a5d])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c379500b003ff3b964a9asm1668255wmr.39.2023.08.24.00.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 00:08:21 -0700 (PDT)
Message-ID: <38b47e0e41d508adc514058475474befbbf53445.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs
 and xattr
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2023 08:08:21 +0100
In-Reply-To: <20230804084315.55768-4-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
	 <20230804084315.55768-4-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186641

On Fri, 2023-08-04 at 10:43 +0200, Piotr =C5=81obacz wrote:
Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 95373fd60a..ac890fc98e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -848,7 +848,7 @@ sstate_create_package () {
 	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
-	OPT=3D"-cS"
+	OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-=
-acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)} --numeric-owner -cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
 	if [ -x "$(command -v pzstd)" ]; then
@@ -914,7 +914,7 @@ sstate_unpack_package () {
 		ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
 	fi
=20
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-=
-xattrs', '', d)} -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch=
 -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file

I've been putting this through a bit more testing and sadly we're still not=
 quite there. In testing last night we saw a lot of failures like this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/7488

i.e.:

WARNING: cdrtools-native-3.01-r0 do_populate_sysroot_setscene: ExecutionErr=
or('/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrt=
ools-native/3.01/temp/run.sstate_unpack_package.1434763', 2, None, None)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/w=
ic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/log.do_popul=
ate_sysroot_setscene.1434763
WARNING: Setscene task (/home/pokybuild/yocto-worker/wic/build/meta/recipes=
-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot_setscene) fa=
iled with exit code '1' - real task will be run instead

The sstate in question is this file:

http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x=
86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d=
94039f4e21820ee6aec_populate_sysroot.tar.zst

and the failing task log:

pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linu=
x/cdrtools-native/3.01/temp$ cat log.do_populate_sysroot_setscene
DEBUG: Executing python function do_populate_sysroot_setscene
DEBUG: Executing shell function sstate_unpack_package
recipe-sysroot-native/
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/sysroot-providers/cdrtools-native
recipe-sysroot-native/usr/
recipe-sysroot-native/usr/bin/
recipe-sysroot-native/usr/bin/cdda2ogg
recipe-sysroot-native/usr/bin/cdda2wav
recipe-sysroot-native/usr/bin/mkhybrid
recipe-sysroot-native/usr/bin/devdump
recipe-sysroot-native/usr/bin/isodebug
recipe-sysroot-native/usr/bin/scgskeleton
recipe-sysroot-native/usr/bin/btcflash
recipe-sysroot-native/usr/bin/cdrecord
recipe-sysroot-native/usr/bin/readcd
recipe-sysroot-native/usr/bin/isoinfo
recipe-sysroot-native/usr/bin/isodump
recipe-sysroot-native/usr/bin/cdda2mp3
recipe-sysroot-native/usr/bin/scgcheck
recipe-sysroot-native/usr/bin/mkisofs
recipe-sysroot-native/usr/bin/isovfy
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/sbin/rscsi
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/lib/libfind.a
recipe-sysroot-native/usr/lib/libschily.a
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
recipe-sysroot-native/usr/lib/libhfs.a
recipe-sysroot-native/usr/lib/libcdrdeflt.a
recipe-sysroot-native/usr/lib/libscg.a
recipe-sysroot-native/usr/lib/libfile.a
recipe-sysroot-native/usr/lib/siconv/
recipe-sysroot-native/usr/lib/siconv/cp10006
recipe-sysroot-native/usr/lib/siconv/iso8859-16
recipe-sysroot-native/usr/lib/siconv/iso8859-9
recipe-sysroot-native/usr/lib/siconv/cp10007
recipe-sysroot-native/usr/lib/siconv/cp10029
recipe-sysroot-native/usr/lib/siconv/iso8859-6
recipe-sysroot-native/usr/lib/siconv/iso8859-4
recipe-sysroot-native/usr/lib/siconv/cp1257
recipe-sysroot-native/usr/lib/siconv/iso8859-13
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-2
recipe-sysroot-native/usr/lib/siconv/cp437
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp775
recipe-sysroot-native/usr/lib/siconv/iso8859-15
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp857
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1258
recipe-sysroot-native/usr/lib/siconv/cp855
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp864
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-5
recipe-sysroot-native/usr/lib/siconv/cp1254
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-1
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp861
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/koi8-u
recipe-sysroot-native/usr/lib/siconv/cp10081
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot openrecipe-sysroo=
t-native/usr/lib/siconv/iso8859-14
: Permission denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp852
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1250
recipe-sysroot-native/usr/lib/siconv/cp10000
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp737
recipe-sysroot-native/usr/lib/siconv/iso8859-11
recipe-sysroot-native/usr/lib/siconv/cp866
recipe-sysroot-native/usr/lib/siconv/cp860
recipe-sysroot-native/usr/lib/siconv/iso8859-7
recipe-sysroot-native/usr/lib/siconv/iso8859-8
recipe-sysroot-native/usr/lib/siconv/cp869
recipe-sysroot-native/usr/lib/siconv/iso8859-10
recipe-sysroot-native/usr/lib/siconv/cp1252
recipe-sysroot-native/usr/lib/siconv/cp850
recipe-sysroot-native/usr/lib/siconv/cp863
recipe-sysroot-native/usr/lib/siconv/cp865
recipe-sysroot-native/usr/lib/siconv/cp1255
recipe-sysroot-native/usr/lib/siconv/cp1256
recipe-sysroot-native/usr/lib/siconv/koi8-r
recipe-sysroot-native/usr/lib/siconv/cp1253
recipe-sysroot-native/usr/lib/siconv/cp862
recipe-sysroot-native/usr/lib/siconv/cp10079
recipe-sysroot-native/usr/lib/siconv/cp874
recipe-sysroot-native/usr/lib/siconv/cp1251
recipe-sysroot-native/usr/lib/siconv/iso8859-3
recipe-sysroot-native/usr/lib/libparanoia.a
recipe-sysroot-native/usr/lib/libdeflt.a
recipe-sysroot-native/usr/lib/profiled/
recipe-sysroot-native/usr/lib/profiled/libfind.a
recipe-sysroot-native/usr/lib/profiled/libschily.a
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
recipe-sysroot-native/usr/lib/profiled/libhfs.a
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
recipe-sysroot-native/usr/lib/profiled/libscg.a
recipe-sysroot-native/usr/lib/profiled/libfile.a
recipe-sysroot-native/usr/lib/profiled/libparanoia.a
recipe-sysroot-native/usr/lib/profiled/libdeflt.a
recipe-sysroot-native/usr/lib/profiled/libmdigest.a
recipe-sysroot-native/usr/lib/profiled/librscg.a
recipe-sysroot-native/usr/lib/profiled/libsiconv.a
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
recipe-sysroot-native/usr/lib/libmdigest.a
recipe-sysroot-native/usr/lib/librscg.a
recipe-sysroot-native/usr/lib/libsiconv.a
recipe-sysroot-native/usr/lib/libedc_ecc.a
recipe-sysroot-native/usr/lib/libscgcmd.a
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/include/scg/
recipe-sysroot-native/usr/include/scg/scgio.h
recipe-sysroot-native/usr/include/scg/scsidefs.h
recipe-sysroot-native/usr/include/scg/scsicdb.h
recipe-sysroot-native/usr/include/scg/scgcmd.h
recipe-sysroot-native/usr/include/scg/scsireg.h
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/scsitransp.h
recipe-sysroot-native/usr/include/scg/srb_os2.h
recipe-sysroot-native/usr/include/scg/scgops.h
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/aspi-win32.h
recipe-sysroot-native/usr/include/scg/spti-wnt.h
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/aspi-dos.h
recipe-sysroot-native/usr/include/scg/scsisense.h
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/
recipe-sysroot-native/usr/include/schily/checkerr.h
recipe-sysroot-native/usr/include/schily/locale.h
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/timeb.h
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/time.h
recipe-sysroot-native/usr/include/schily/stdint.h
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/inttypes.h
recipe-sysroot-native/usr/include/schily/io.h
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/stdio.h
recipe-sysroot-native/usr/include/schily/siconv.h
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/deflts.h
recipe-sysroot-native/usr/include/schily/math.h
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot openrecipe-sys=
root-native/usr/include/schily/schilyp.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/systeminfo.h
recipe-sysroot-native/usr/include/schily/device.h
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot openrecipe-s=
ysroot-native/usr/include/schily/limits.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/alloca.h
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ioctl.h
recipe-sysroot-native/usr/include/schily/maxpath.h
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/fnmatch.h
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/times.h
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sem.h
recipe-sysroot-native/usr/include/schily/err_arch.h
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/signal.h
recipe-sysroot-native/usr/include/schily/standard.h
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wchar.h
recipe-sysroot-native/usr/include/schily/in.h
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/libport.h
recipe-sysroot-native/usr/include/schily/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/termcap.h
recipe-sysroot-native/usr/include/schily/rmtio.h
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/assert.h
recipe-sysroot-native/usr/include/schily/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/sigblk.h
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stat.h
recipe-sysroot-native/usr/include/schily/intcvt.h
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stkframe.h
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/mman.h
recipe-sysroot-native/usr/include/schily/wctype.h
recipe-sysroot-native/usr/include/schily/dlfcn.h
recipe-sysroot-native/usr/include/schily/hostname.h
recipe-sysroot-native/usr/include/schily/wait.h
recipe-sysroot-native/usr/include/schily/rmd160.h
recipe-sysroot-native/usr/include/schily/walk.h
recipe-sysroot-native/usr/include/schily/varargs.h
recipe-sysroot-native/usr/include/schily/md5.h
recipe-sysroot-native/usr/include/schily/nlsdefs.h
recipe-sysroot-native/usr/include/schily/archdefs.h
recipe-sysroot-native/usr/include/schily/ctype.h
recipe-sysroot-native/usr/include/schily/pwd.h
recipe-sysroot-native/usr/include/schily/err_type.h
recipe-sysroot-native/usr/include/schily/inet.h
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/schily.h
recipe-sysroot-native/usr/include/schily/float.h
recipe-sysroot-native/usr/include/schily/patmatch.h
recipe-sysroot-native/usr/include/schily/netdb.h
recipe-sysroot-native/usr/include/schily/setjmp.h
recipe-sysroot-native/usr/include/schily/ipc.h
recipe-sysroot-native/usr/include/schily/libgen.h
recipe-sysroot-native/usr/include/schily/shadow.h
recipe-sysroot-native/usr/include/schily/types.h
recipe-sysroot-native/usr/include/schily/sysexits.h
recipe-sysroot-native/usr/include/schily/grp.h
recipe-sysroot-native/usr/include/schily/fstream.h
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/shm.h
recipe-sysroot-native/usr/include/schily/sunos4_proto.h
recipe-sysroot-native/usr/include/schily/err_char.h
recipe-sysroot-native/usr/include/schily/mtio.h
recipe-sysroot-native/usr/include/schily/librmt.h
recipe-sysroot-native/usr/include/schily/idcache.h
recipe-sysroot-native/usr/include/schily/_regex.h
recipe-sysroot-native/usr/include/schily/utime.h
recipe-sysroot-native/usr/include/schily/shedit.h
recipe-sysroot-native/usr/include/schily/string.h
recipe-sysroot-native/usr/include/schily/btorder.h
recipe-sysroot-native/usr/include/schily/md4.h
recipe-sysroot-native/usr/include/schily/prototyp.h
recipe-sysroot-native/usr/include/schily/mconfig.h
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/find.h
recipe-sysroot-native/usr/include/schily/fetchdir.h
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/err_bit.h
recipe-sysroot-native/usr/include/schily/regex.h
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/ccomdefs.h
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/resource.h
recipe-sysroot-native/usr/include/schily/sha2.h
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/param.h
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot openrecipe-sy=
sroot-native/usr/include/schily/fcntl.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sha1.h
recipe-sysroot-native/usr/include/schily/stdarg.h
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/sigset.h
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/termios.h
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/align.h
recipe-sysroot-native/usr/include/schily/errno.h
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/socket.h
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied
recipe-sysroot-native/usr/include/schily/unistd.h
recipe-sysroot-native/usr/include/schily/dirent.h
recipe-sysroot-native/usr/include/schily/select.h
recipe-sysroot-native/usr/include/schily/poll.h
recipe-sysroot-native/usr/include/schily/procfs.h
recipe-sysroot-native/usr/include/schily/stdlib.h
recipe-sysroot-native/usr/include/schily/getargs.h
recipe-sysroot-native/usr/include/schily/jmpdefs.h
recipe-sysroot-native/usr/include/schily/vfork.h
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/windows.h
recipe-sysroot-native/usr/include/schily/shcall.h
recipe-sysroot-native/usr/include/schily/utypes.h
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xmconfig.h
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/utsname.h
recipe-sysroot-native/usr/include/schily/getcwd.h
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/syslog.h
recipe-sysroot-native/usr/include/schily/priv.h
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/iconv.h
recipe-sysroot-native/usr/include/schily/dbgmalloc.h
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied
tar: Exiting with failure status due to previous errors
WARNING: exit code 2 from a shell command.
DEBUG: Python function do_populate_sysroot_setscene finishe

Sure enough, if I manually try an extraction, I see the same issue:

tar -I zstd --format=3Dposix --acls --xattrs -xvpf ../sstate\:cdrtools-nati=
ve\:x86_64-linux\:3.01\:r0\:x86_64\:11\:aa6350f6565599ed04df25250bb5415c0e2=
427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst
recipe-sysroot-native/
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/sysroot-providers/cdrtools-native
recipe-sysroot-native/usr/
recipe-sysroot-native/usr/bin/
recipe-sysroot-native/usr/bin/cdda2ogg
recipe-sysroot-native/usr/bin/cdda2wav
recipe-sysroot-native/usr/bin/mkhybrid
recipe-sysroot-native/usr/bin/devdump
recipe-sysroot-native/usr/bin/isodebug
recipe-sysroot-native/usr/bin/scgskeleton
recipe-sysroot-native/usr/bin/btcflash
recipe-sysroot-native/usr/bin/cdrecord
recipe-sysroot-native/usr/bin/readcd
recipe-sysroot-native/usr/bin/isoinfo
recipe-sysroot-native/usr/bin/isodump
recipe-sysroot-native/usr/bin/cdda2mp3
recipe-sysroot-native/usr/bin/scgcheck
recipe-sysroot-native/usr/bin/mkisofs
recipe-sysroot-native/usr/bin/isovfy
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/sbin/rscsi
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/lib/libfind.a
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/libschily.a
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/libhfs.a
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied
recipe-sysroot-native/usr/lib/libcdrdeflt.a
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/libscg.a
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied
recipe-sysroot-native/usr/lib/libfile.a
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/siconv/
recipe-sysroot-native/usr/lib/siconv/cp10006
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-16
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-9
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp10007
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp10029
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-6
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/iso8859-4
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp1257
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-13
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-2
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp437
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp775
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-15
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp857
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1258
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp855
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp864
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-5
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp1254
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-1
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp861
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/koi8-u
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp10081
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-14
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp852
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1250
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp10000
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp737
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-11
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp866
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp860
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-7
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/iso8859-8
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp869
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-10
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp1252
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp850
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp863
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp865
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1255
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp1256
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/koi8-r
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp1253
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp862
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp10079
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp874
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1251
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-3
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/libparanoia.a
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/libdeflt.a
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed
recipe-sysroot-native/usr/lib/profiled/
recipe-sysroot-native/usr/lib/profiled/libfind.a
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libschily.a
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied
recipe-sysroot-native/usr/lib/profiled/libhfs.a
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied
recipe-sysroot-native/usr/lib/profiled/libscg.a
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/profiled/libfile.a
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libparanoia.a
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied
recipe-sysroot-native/usr/lib/profiled/libdeflt.a
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/lib/profiled/libmdigest.a
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/lib/profiled/librscg.a
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libsiconv.a
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/libmdigest.a
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/librscg.a
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/libsiconv.a
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/lib/libedc_ecc.a
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/libscgcmd.a
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/include/scg/
recipe-sysroot-native/usr/include/scg/scgio.h
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/scg/scsidefs.h
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/scsicdb.h
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scgcmd.h
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/scsireg.h
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scsitransp.h
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/srb_os2.h
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scgops.h
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/aspi-win32.h
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/spti-wnt.h
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/aspi-dos.h
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/scsisense.h
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/
recipe-sysroot-native/usr/include/schily/checkerr.h
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/locale.h
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/timeb.h
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/time.h
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stdint.h
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/inttypes.h
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/io.h
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/stdio.h
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/siconv.h
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/deflts.h
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/math.h
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/schilyp.h
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/systeminfo.h
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied
recipe-sysroot-native/usr/include/schily/device.h
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/limits.h
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/alloca.h
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ioctl.h
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/maxpath.h
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/fnmatch.h
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/times.h
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sem.h
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/err_arch.h
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/signal.h
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/standard.h
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wchar.h
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/in.h
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/libport.h
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/termcap.h
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/rmtio.h
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/assert.h
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/sigblk.h
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stat.h
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/intcvt.h
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stkframe.h
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mman.h
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/wctype.h
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/dlfcn.h
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/hostname.h
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wait.h
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/rmd160.h
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/walk.h
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/varargs.h
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/md5.h
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/nlsdefs.h
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/archdefs.h
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/ctype.h
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/pwd.h
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/err_type.h
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/inet.h
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/schily.h
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/float.h
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/patmatch.h
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/netdb.h
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/setjmp.h
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ipc.h
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/libgen.h
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/shadow.h
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/types.h
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sysexits.h
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/grp.h
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/fstream.h
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/shm.h
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/sunos4_proto.h
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied
recipe-sysroot-native/usr/include/schily/err_char.h
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mtio.h
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/librmt.h
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/idcache.h
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/_regex.h
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/utime.h
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/shedit.h
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/string.h
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/btorder.h
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/md4.h
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/prototyp.h
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mconfig.h
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/find.h
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/fetchdir.h
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/err_bit.h
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/regex.h
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/ccomdefs.h
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/resource.h
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/sha2.h
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/param.h
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/fcntl.h
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sha1.h
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stdarg.h
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/sigset.h
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/termios.h
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/align.h
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/errno.h
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/socket.h
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied
recipe-sysroot-native/usr/include/schily/unistd.h
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/dirent.h
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/select.h
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/poll.h
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/procfs.h
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stdlib.h
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/getargs.h
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/jmpdefs.h
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/vfork.h
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/windows.h
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/shcall.h
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/utypes.h
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xmconfig.h
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/utsname.h
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/getcwd.h
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/syslog.h
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/priv.h
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/iconv.h
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/dbgmalloc.h
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied
tar: Exiting with failure status due to previous errors

The files in question are readonly so it looks like it creates the file
readonly and then can't write the xattr data to it. If I drop the --
xattrs parameter to tar, it works.

The version of tar in question is:

pokybuild@debian11-ty-1:~/yocto-worker/wic/build/1$ tar --version
tar (GNU tar) 1.34
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.ht=
ml>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by John Gilmore and Jay Fenlason.


Cheers,

Richard




