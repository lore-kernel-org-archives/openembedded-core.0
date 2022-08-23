Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705E1C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.4436.1661294201338961752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mzq+avVw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f17so8633934pfk.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=HoDLAeo3H3wUZlHga6ezCjEND719ro/wlSOt0lMma6E=;
        b=mzq+avVwPvNw0nzQy+2aNIoENXMw/QDcK9pgi5PVBSrbBBmme86nExy5EhaanlWj/D
         4vQ1SLiAjrTW57UFva79w1x517sZMNVtO2DT1IwIZYWEtGpKzdTX7l93JxJ/S6PscRzb
         wBM/F6UQO7oxfdF/tb6gTKn3NP1pcL8Hf+gLsLQp85+MvfzR1Ku2XSvcRcEl2Rx+Thrq
         Cr0xjX4JCHuWT1Bd2fKBa68XYQ2rG6z5TbkPNzcNBMiIJv2lOcVqY7ExhNVNDkje2Lku
         iLvypQabFZRa3f5cK/qEbY06t8sQilpn01htC8/LkueCM+WcOR/9Z/Ani00Ml6XChO9f
         8kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=HoDLAeo3H3wUZlHga6ezCjEND719ro/wlSOt0lMma6E=;
        b=uVYRJc5y2o/8u3qc8iW9NowS0qmRqj465wsv93eAokm/cnyuiMfUwDv03E6CqeXdLn
         pWEfYBnimPbObG+bot+3lARQ0ajIiBPspXBsGCJxITwjTAOiCTXHcF66PRdhXUYifSaa
         3Yym7epq+bM+LxenHTj4YmsKuZiyy1zfZeiTtYZSHcWafKJQ2Ian0mpD0cD2rkT1yQT8
         2RMPzdkZ6v83k1mlO56wpVfb2E7BFgwB8LRniRVnjL5LU/CcvAzs8C3opydlXPHLpqq3
         2PRRnd+7LmfdDT1JQH/zxy7C9s1T5bnv3oVb9VPiKLgx5/gUofW+ubDmqf+af5RW6uk0
         OkSQ==
X-Gm-Message-State: ACgBeo0KxIqLShOmD4qfoUN7zdmUmlKH9VwJ54fNZxvPww8vdfpVnxnf
	EEln2fCOXm1rQo8YLSctiGF5Hu2cwCFxHScK
X-Google-Smtp-Source: 
 AA6agR4+9Yj3uSpC8QmVbaFilrfEwfzeG8H0YdN0sgz/XFRz78c+3FpF93bZsOss5wYQtbI+3mE9Kg==
X-Received: by 2002:a05:6a00:850:b0:52e:d1c1:df48 with SMTP id
 q16-20020a056a00085000b0052ed1c1df48mr26786473pfk.75.1661294200362;
        Tue, 23 Aug 2022 15:36:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/28] apt: fix nativesdk-apt build failure
 during the second time build
Date: Tue, 23 Aug 2022 12:35:37 -1000
Message-Id: 
 <00337a5426aaece57ecbdc2f601b0c8272e2c5b9.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169757

From: Changqing Li <changqing.li@windriver.com>

Run following commands:
bitbake nativesdk-apt
bitbake nativesdk-apt -c install -f

The second command's do_install will fail with following error:
| /build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4=
.5-r0/recipe-sysroot-native/usr/bin/x86_64-wrlinuxsdk-linux/x86_64-wrlinuxs=
dk-linux-g++ -D_WITH_GETLINE=3D1 -Dapt_pkg_EXPORTS -I/build/tmp-glibc/work/=
x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-r0/build/include -I/b=
uild/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-r=
0/build/include/apt-pkg --sysroot=3D/build/tmp-glibc/work/x86_64-nativesdk-=
wrlinuxsdk-linux/nativesdk-apt/2.4.5-r0/recipe-sysroot  -O2 -pipe -fmacro-p=
refix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/natives=
dk-apt/2.4.5-r0=3D/usr/src/debug/nativesdk-apt/2.4.5-r0                    =
  -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-li=
nux/nativesdk-apt/2.4.5-r0=3D/usr/src/debug/nativesdk-apt/2.4.5-r0         =
             -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wr=
linuxsdk-linux/nativesdk-apt/2.4.5-r0/recipe-sysroot=3D                    =
  -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-li=
nux/nativesdk-apt/2.4.5-r0/recipe-sysroot-native=3D  -fPIC -fvisibility=3Dh=
idden -fvisibility-inlines-hidden -Wall -Wextra -Wcast-align -Wlogical-op -=
Wredundant-decls -Wmissing-declarations -Wunsafe-loop-optimizations -Wctor-=
dtor-privacy -Wdisabled-optimization -Winit-self -Wmissing-include-dirs -Wn=
oexcept -Wsign-promo -Wundef -Wdouble-promotion -Wsuggest-override -Werror=
=3Dsuggest-override -Werror=3Dreturn-type -std=3Dgnu++17 -MD -MT apt-pkg/CM=
akeFiles/apt-pkg.dir/tagfile-keys.cc.o -MF apt-pkg/CMakeFiles/apt-pkg.dir/t=
agfile-keys.cc.o.d -o apt-pkg/CMakeFiles/apt-pkg.dir/tagfile-keys.cc.o -c /=
build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-=
r0/build/apt-pkg/tagfile-keys.cc
| /build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4=
.5-r0/build/apt-pkg/tagfile-keys.cc:1:10: fatal error: /include/apt-pkg/tag=
file-keys.h: No such file or directory
|     1 | #include "/include/apt-pkg/tagfile-keys.h"
0/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.=
5-r0/build/apt-pkg/tagfile-keys.cc

During the first command, do_install task changed tagfile-keys.cc, this
will make tagfile-keys.cc is newer than the built tagfile-keys.cc.o. So the=
 second
do_install will rebuild tagfile-keys.cc.o. But the header path is
replaced wrongly, so fix the header path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3e18bd4dbddacfd878317ebcf0a039b46d6d6342)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools=
/apt/apt_2.4.5.bb
index 95c25e3036..b5ada2ef55 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -132,5 +132,5 @@ do_install:append:class-target() {
=20
 do_install:append() {
 	# Avoid non-reproducible -src package
-	sed -i -e "s,${B},,g" ${B}/apt-pkg/tagfile-keys.cc
+	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
--=20
2.25.1


