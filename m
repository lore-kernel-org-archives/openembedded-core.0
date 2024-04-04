Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E88CD1299
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 13:29:34 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.38099.1712237369894762266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 06:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uEHdPS+e;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d717603aa5so12708231fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712237368; x=1712842168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfrDYMAILq/pB2lp1+U6FJZjpa67MskOwZxYz/+GesM=;
        b=uEHdPS+e8Nj4OA7n4lpRIHDtbq65JEdxcX4+WHtDqdwi6Su4JLzFk9TnfdF/Y8/yOA
         HGpU8sxBFNFu8O07LurWgPfunrocem7+CcsgiG4V4Q0FhcyB1dMta7AuWNNGhJ6gdcVB
         glQ7eES1p6FRKeyP8rQVv4CeqiGJ29sLeC9MYHxkFChRo2OFrfBHiWjkuUGE7+u33LG2
         ip729budbSmv2CJKbgZMuLw416GdGfF0tyhxr/eQxs7b1O/haCgpopZbicr2LyJIAxfN
         KKaF0Jfr6drIwFYMTOPJcPafZc895y1BQ0RRjOByOY5bPVcA9+/L7wkDme8ezK03dJF0
         NAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237368; x=1712842168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfrDYMAILq/pB2lp1+U6FJZjpa67MskOwZxYz/+GesM=;
        b=aSbV9IaLLTSKCKeFlH877djxFbeeHtvcudcixL2ma65wjg4z56W6r+btPBwMXU1E6X
         piPJyzH5+jR5wV0xsJndkFLoU68N722ttHyW48KBF1W4QUMJv51/BRDioo4oJnNrcGi0
         0L3uILZIPHGXYXH+pb5YucCa0JrhxmYJgFfafq29ZuinYyMGQL1fNDc+N+xThD8ciKtc
         XLUVX0KjiFLTJFhwmSj/Cn+Znee2If6STRN9m1Pr/L2JrUMrpzvvhOg849nHFyzELr15
         Db5aIQZ6FgyxdZs4IBoImBrCRA4WpCcpCnMe4dwQVsR5FUbQfl1xpCfptCzRZWYjGziR
         7uaw==
X-Gm-Message-State: AOJu0Yxxs/c/o250xuseYLnpZlMm+C2/snuI96xyetbuSNThlEbPlOQ/
	mQUMtJCoAhLHYFheafT9G4QBlYAtVO7Kd51oeyHKqfrsYEm9fEP8iWIeH9QACMu4vSajyoMNM4W
	4MP0=
X-Google-Smtp-Source: AGHT+IFEApEMcSbZwMLZtyHOGmAqiAEWaHzMIoFmaMKVXU3eQ9eWSLwOwmGtQgt6tKRceSW3nGy93A==
X-Received: by 2002:a2e:9058:0:b0:2d4:9201:d4ff with SMTP id n24-20020a2e9058000000b002d49201d4ffmr1875790ljg.5.1712237367990;
        Thu, 04 Apr 2024 06:29:27 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yywjht56pm8q3st-3.rev.dnainternet.fi. [2001:14ba:7430:3d00:1239:a19d:315c:6ddf])
        by smtp.gmail.com with ESMTPSA id c2-20020a2ea1c2000000b002d70a5defa5sm2095299ljm.7.2024.04.04.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:29:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 2/2] curl: disable ca-certificates.crt path setting for native build
Date: Thu,  4 Apr 2024 16:29:02 +0300
Message-Id: <20240404132902.68631-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404132902.68631-1-mikko.rapeli@linaro.org>
References: <20240404132902.68631-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 13:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197964

If linux-yocto-dev is compiled without specific SRCREV, it uses
AUTOREV which tries to update to latest available commit. This is
currently failing with these steps:

$ rm -rf tmp*/work/*/linux-yocto-dev && \
bitbake -c do_configure mc:machine:linux-yocto-dev ; \
bitbake -c do_clean mc:machine:linux-yocto-dev
...
Parsing recipes...WARNING: /home/builder/src/base/build/../poky/meta/recipe=
s-kernel/linux/linux-yocto-dev.bb: Exception during build_dependencies for =
fetcher_hashes_dummyfunc
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/lin=
ux-yocto-dev.bb: Error during finalise of /home/builder/src/base/build/../p=
oky/meta/recipes-kernel/linux/linux-yocto-dev.bb
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/lin=
ux-yocto-dev.bb: Exception during build_dependencies for fetcher_hashes_dum=
myfunc
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/lin=
ux-yocto-dev.bb: Error during finalise of mc:poky:/home/builder/src/base/bu=
ild/../poky/meta/recipes-kernel/linux/linux-yocto-dev.bb
ERROR: ExpansionError during parsing /home/builder/src/base/build/../poky/m=
eta/recipes-kernel/linux/linux-yocto-dev.bb
Traceback (most recent call last):
  File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py", lin=
e 1245, in srcrev_internal_helper(ud=3D<bb.fetch2.FetchData object at 0x7f3=
4e5f61330>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, name=3D=
'machine'):
             d.setVar("__BBAUTOREV_ACTED_UPON", True)
    >        srcrev =3D ud.method.latest_revision(ud, d, name)

  File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py", lin=
e 1667, in Git.latest_revision(ud=3D<bb.fetch2.FetchData object at 0x7f34e5=
f61330>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, name=3D'ma=
chine'):
             except KeyError:
    >            revs[key] =3D rev =3D self._latest_revision(ud, d, name)
                 return rev
  File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py", line 850=
, in Git._latest_revision(ud=3D<bb.fetch2.FetchData object at 0x7f34e5f6133=
0>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, name=3D'machine=
'):

    >        output =3D self._lsremote(ud, d, "")
             # Tags of the form ^{} may not work, need to fallback to other=
 form
  File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py", line 833=
, in Git._lsremote(ud=3D<bb.fetch2.FetchData object at 0x7f34e5f61330>, d=
=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, search=3D''):
                     bb.fetch2.check_network_access(d, cmd, repourl)
    >            output =3D runfetchcmd(cmd, d, True)
                 if not output:
  File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py", lin=
e 957, in runfetchcmd(cmd=3D'export PSEUDO_DISABLED=3D1; export DBUS_SESSIO=
N_BUS_ADDRESS=3D"unix:path=3D/run/user/15818/bus"; export PATH=3D"/home/bui=
lder/src/base/build/tmp_poky/sysroots-uninative/x86_64-linux/usr/bin:/home/=
builder/src/base/poky/scripts:/home/builder/src/base/build/tmp_poky/work/po=
ky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/usr/bin/aarch64=
-poky-linux:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linu=
x-yocto-dev/6.8+git/recipe-sysroot/usr/bin/crossscripts:/home/builder/src/b=
ase/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysr=
oot-native/usr/sbin:/home/builder/src/base/build/tmp_poky/work/poky-poky-li=
nux/linux-yocto-dev/6.8+git/recipe-sysroot-native/usr/bin:/home/builder/src=
/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sy=
sroot-native/sbin:/home/builder/src/base/build/tmp_poky/work/poky-poky-linu=
x/linux-yocto-dev/6.8+git/recipe-sysroot-native/bin:/home/builder/src/base/=
poky/bitbake/bin:/home/builder/src/base/build/tmp_poky/hosttools"; export H=
OME=3D"/home/builder"; git -c gc.autoDetach=3Dfalse -c core.pager=3Dcat -c =
safe.bareRepository=3Dall ls-remote https://git.yoctoproject.org/linux-yoct=
o-dev.git ', d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, quiet=
=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):

    >        raise FetchError(error_message)

bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dum=
myfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which tri=
ggered exception FetchError: Fetcher failure: Fetch command export PSEUDO_D=
ISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/15818=
/bus"; export PATH=3D"/home/builder/src/base/build/tmp_poky/sysroots-uninat=
ive/x86_64-linux/usr/bin:/home/builder/src/base/poky/scripts:/home/builder/=
src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe=
-sysroot-native/usr/bin/aarch64-poky-linux:/home/builder/src/base/build/tmp=
_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot/usr/bin/c=
rossscripts:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linu=
x-yocto-dev/6.8+git/recipe-sysroot-native/usr/sbin:/home/builder/src/base/b=
uild/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-n=
ative/usr/bin:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/li=
nux-yocto-dev/6.8+git/recipe-sysroot-native/sbin:/home/builder/src/base/bui=
ld/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-nat=
ive/bin:/home/builder/src/base/poky/bitbake/bin:/home/builder/src/base/buil=
d/tmp_poky/hosttools"; export HOME=3D"/home/builder"; git -c gc.autoDetach=
=3Dfalse -c core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https:/=
/git.yoctoproject.org/linux-yocto-dev.git  failed with exit code 128, outpu=
t:
fatal: unable to access 'https://git.yoctoproject.org/linux-yocto-dev.git/'=
: error setting certificate file: /home/builder/src/base/build/tmp_poky/wor=
k/x86_64-linux/curl-native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-cer=
tificates.crt

The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[=
vardepvalue]

ERROR: Parsing halted due to errors, see error messages above

Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

This state is not recoverable with bitbake calls. All of them fail from now=
 on.
"rm -rf tmp/work/*/linux-yocto-dev" recovers the situation
and bitbake commands work again.

Root cause is curl-native, dependency of git-native, which
has --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt
which for native build target is wrong and points to curl-native build
directory path
/home/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0/r=
ecipe-sysroot-native/etc/ssl/certs/ca-certificates.crt

Since git is a build time host package dependency listed in
https://docs.yoctoproject.org/dev/singleindex.html#build-host-packages
then its dependencies like curl and ca-certificates are too, it should
be safe for curl-native to use the default host ca-certificates path
instead of the one in recipe specific sysroots which would need to be set w=
ith complicated
environment variables. Set non-default ca-certificates path only for
target and nativesdk builds.

Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-support/curl/curl_8.6.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-support=
/curl/curl_8.6.0.bb
index 49ba0cb4a7..da5571ca14 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -73,11 +73,16 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d"
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
-    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtl=
s openssl', d) =3D=3D '') else ''} \
 "
+EXTRA_OECONF:class-target =3D " \
+    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
+"
+EXTRA_OECONF:class-nativesdk =3D " \
+    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
+"
=20
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
--=20
2.34.1


