Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FF1C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 11:54:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.26177.1654862078355085845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZSDCEQpW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q15so28167692wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=Jls44uD5lBgekPwdkArd/Xokx5TLyulgMUit2djXdMo=;
        b=ZSDCEQpWUSlP4Yc2Z1FrCp+BdAwiMFz19dZQGGk2YS2Gvt8vhWrVOgQ/JDW4gB5CA0
         I1WGh/O3dSykfiwxdJA0WqvHBgHUyKB/rFxPgVyRlyMYa/4dxDGeDtN4t5WTTE7KuvvQ
         v7KoMbmf2b7rRUFZ8yGMKf63P1AGnMvNDIsYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=Jls44uD5lBgekPwdkArd/Xokx5TLyulgMUit2djXdMo=;
        b=Qcnd46SM35wWyzvda2pEEGOnQYTD70i76cVoa+2UkIGEafyPpi8E8u2/LZKxnG7gDO
         cHBRiyki0e2bjZyNmNJBmnHZcdKdiV8U2xMoAmLpcFc0rycLpQHQK5j31IUa+Tevivd1
         1rWatoaJP/LNNjwGbVN5K5eHfXLqXd1fsdsOgYGOFmdiENtvOuN6IKB9R4HhYpJfBOQw
         N5x/8GuARBXPxep3SAsqSwJJAnI99fOQjVkhSqlotlho8R3/IAU0qSOrzPLEaysrWs5u
         bTemGG6FxfHfNOkBWAKRmOPt81AusWG9U4rrI5ZTuyx5i6OqlK7cHP+eqOw2c1GFIWw5
         V7Og==
X-Gm-Message-State: AOAM531LOPRcLUzKSa54uY/i/UkfGPX0TaJpxuG46dGxTUB+qn66Z2Mx
	ppl9cdUTzXGUyvLYM/4EttgY0Ixw4AhadQ==
X-Google-Smtp-Source: 
 ABdhPJxRHf7Adl5aSOG+5Mj9ODLwWwe/yP7YVyP2B8fXFloNN56ljETDpEjXFdWWPBG8oArhiUQksQ==
X-Received: by 2002:a05:6000:156c:b0:218:5691:e72b with SMTP id
 12-20020a056000156c00b002185691e72bmr16991320wrz.95.1654862076270;
        Fri, 10 Jun 2022 04:54:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9?
 ([2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9])
        by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b0039c54f34948sm3266700wmq.5.2022.06.10.04.54.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 04:54:35 -0700 (PDT)
Message-ID: 
 <7085c6af942dfe73ec52cd05a6bc2dcfead9eade.camel@linuxfoundation.org>
Subject: nettle reproducibility failure - sparse empty file created
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jun 2022 12:54:35 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 11:54:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166799

I wanted to write down my findings on a recent nettle reproducibility
failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/985

on debian9-ty-2 which resulted in this difference:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220609-5bq03hz=
e/packages/diff-html/

In poking around the build directory which I saved, somehow
/usr/lib/nettle/ptest/testsuite/ecc-sqrt-test ends up as a sparse file
filled with zeros, which then results in the .debug version not being
created.

pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0/packages-split/nettle-ptest=
/usr/lib/nettle/ptest/testsuite$ file ecc-sqrt-test=20
ecc-sqrt-test: data
pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0/packages-split/nettle-ptest=
/usr/lib/nettle/ptest/testsuite$ file ecc-add-test=20
ecc-add-test: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynam=
ically linked, interpreter /lib/ld-linux-x86-64.so.2, BuildID[sha1]=3D2f7e2=
d2fc004a51e52f70ba68dcd5a805d590b3e, for GNU/Linux 3.2.0, not stripped

pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ file package/usr/lib/nettl=
e/ptest/testsuite/ecc-sqrt-test=20
package/usr/lib/nettle/ptest/testsuite/ecc-sqrt-test: data
pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ file image/usr/lib/nettle/=
ptest/testsuite/ecc-sqrt-test=20
image/usr/lib/nettle/ptest/testsuite/ecc-sqrt-test: ELF 64-bit LSB shared o=
bject, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-li=
nux-x86-64.so.2, BuildID[sha1]=3Df5dff0233b77a0bfc20554295d1e1fac6a273b9d, =
for GNU/Linux 3.2.0, not stripped

pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ ls -la image/usr/lib/nettl=
e/ptest/testsuite/ecc-sqrt-test=20
-rwxr-xr-x 1 pokybuild pokybuild 321216 Jun  9 02:00 image/usr/lib/nettle/p=
test/testsuite/ecc-sqrt-test
pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ ls -la package/usr/lib/net=
tle/ptest/testsuite/ecc-sqrt-test=20
-rwxr-xr-x 2 pokybuild pokybuild 321216 Jun  2 17:57 package/usr/lib/nettle=
/ptest/testsuite/ecc-sqrt-test

pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ du -h image/usr/lib/nettle=
/ptest/testsuite/ecc-sqrt-test=20
316K	image/usr/lib/nettle/ptest/testsuite/ecc-sqrt-test
pokybuild@debian9-ty-2:~/yocto-worker/reproducible/build/build-st/reproduci=
bleB/tmp/work/core2-64-poky-linux/nettle/3.8-r0$ du -h package/usr/lib/nett=
le/ptest/testsuite/ecc-sqrt-test
0	package/usr/lib/nettle/ptest/testsuite/ecc-sqrt-test

so somewhere between the file being created in image/ (in do_install)
and the file in package/ in do_package, it is corrupted but has the
right size and is sparse.

This suggests our packaging code has broken somewhere along the way.

Nothing in the pseudo log or in the do_package log. I have the saved
build directory but not sure there is anything else to learn from it
:/.

Cheers,

Richard







