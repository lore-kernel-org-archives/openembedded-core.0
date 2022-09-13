Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C75C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 11:13:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.3467.1663067635556713261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EPwhBn2P;
 spf=pass (domain: linaro.org, ip: 209.85.216.41,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f41.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso9029433pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=f3QiWCwprtubS+k25+lB+fpWwPauNWYDaQgcd3s1IEs=;
        b=EPwhBn2PFn6D8esnqDsf/u7sYP+Jlcxit/mcuAW9jQO61qa7vOBrExMs9p4rFI0rbE
         HQ1PdRFoxXIUT4xFvDc080MeraiFD7DQFL11BsdY91C9zK6ppGNS14RSZT8/OHlO+mvT
         kAOhyv3JhcIUXMAvmNrVKkNzzEmOyhbi2MAkejYSWShzq7X1A/CDY+UcXkyLirRX3TQ+
         DfJBUjTdLjjLdphmZfjTFgCYL6tErpExWmaP6aVnlK2cwbMp5FTbngCU0u6alNoxgsWp
         0xG2UcwE3rNvda53vq8vNg6wzLTKiVCmhyPtn4NqZl26JnbHsQtKZZuFLYHWdZdTtkFL
         Z/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=f3QiWCwprtubS+k25+lB+fpWwPauNWYDaQgcd3s1IEs=;
        b=UqBOKtNUvqheTZK86wnwB8L8ayp1/LvHTlWr5felG1eC6Q23RIBSo1Sv6Y1QKlWyzZ
         4GcDG/X1H6N+NXTRUOV2cpgy+cboAwrKEvmSjK9Kfxdi2ICPbI9Knyfcz3LN1PqaX2L1
         1rvTpN+T6furhcJ/9iU1BlqB4y8WBG/c2shTqTbNa3oDlnXYW2O/lvCfvgBdGNH85ebN
         ZVCEPLx0zSbINEaXh24Q2hlHvTVwuSDmFSrlo0dV63hiMel/K/LFaEezLxrbCv5RLdRh
         QVx7TwuqFc+HXBxZQau61s6brQk77MApYRBt4lMy4oe+nZq1pd5DgkmIXMeNMj1xFQCg
         yZGg==
X-Gm-Message-State: ACgBeo2GdlPRjCUpKZGM8uh750DI2MQZcV1eBWqL8VybBgMuMlsfR1OJ
	nzV94fam46EcbVu6d7gb2wy5vnagcViAWPm9SL+nDA==
X-Google-Smtp-Source: 
 AA6agR4bImI0we5XT9mL4ZSlzz1Q+HsFWJzo9w1NJ5cDmgd5CcjGZCLaORM63Nwp8o1RtadzKfl+hLEqtMPkVnuuF4A=
X-Received: by 2002:a17:902:f641:b0:172:9642:1bf1 with SMTP id
 m1-20020a170902f64100b0017296421bf1mr31912935plg.36.1663067634780; Tue, 13
 Sep 2022 04:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
In-Reply-To: 
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 13 Sep 2022 14:13:56 +0300
Message-ID: 
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 11:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170569

On Tue, 13 Sept 2022 at 13:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Are you using uninative? I'd have expected glibc and pthreads to come
> from there rather than the host.

Yes, using uninative, not host libc, sorry. Added full list of
openat()'d files to the end of this email, from master branch with
this patch applied.
Delta to without this patch is just a few python modules. I can't see
anything wrong in that list.

> > And then in bitbake -c devshell busybox:
> >
> > # python3 -c  "from OpenSSL import crypto"
> >
> > I guess there is no way to add a test like that for python3-cryptography-native?
>
> You could probably put that in do_configure to test it?

Yes, on my layer and recipes I can do this. But I'd rather upstream
the test to python3-cryprography-native or somewhere else but I guess
native recipes don't have selftests or similar.

-Mikko

list of files opened by python3 when using python3-cryptography,
failed attempts filtered as so many paths get tried:
# strace -f -f -v -v -v -s 99999 python3 -c "from OpenSSL import
crypto" 2>&1 | grep ^openat|grep -v -- "-1 ENOENT"
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpython3.10.so.1.0",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libdl.so.2",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libpthread.so.0",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libutil.so.1",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libm.so.6",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-components/x86_64/pseudo-native/usr",
O_RDONLY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/pseudo/",
O_RDONLY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/usr/lib/locale/locale-archive",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/usr/lib/gconv/gconv-modules",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/usr/lib/gconv/gconv-modules.d",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/usr/lib/gconv/gconv-modules.d/gconv-modules-extra.conf",
O_RDONLY|O_CLOEXEC) = 4
openat(AT_FDCWD, ".", O_RDONLY)         = 3
openat(AT_FDCWD, "/home/builder/poky/bitbake/lib",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busybox-1.35.0",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/encodings/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/codecs.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/encodings",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/encodings/__pycache__/aliases.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/encodings/__pycache__/utf_8.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/io.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/abc.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/site.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/os.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/stat.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/_collections_abc.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/posixpath.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/genericpath.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/_sitebuiltins.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/distutils-precedence.pth",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/_distutils_hack/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 4
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__pycache__/crypto.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/crypto.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/calendar.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/datetime.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/math.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/operator.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_datetime.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/locale.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/re.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/enum.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/types.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/sre_compile.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/sre_parse.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/sre_constants.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/functools.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/collections/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/keyword.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/reprlib.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/copyreg.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/base64.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/struct.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_struct.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/binascii.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/../../libz.so.1",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/warnings.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__pycache__/__about__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__about__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__pycache__/utils.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/utils.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/inspect.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/ast.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/contextlib.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/dis.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/opcode.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_opcode.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/collections",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/collections/__pycache__/abc.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/importlib/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/importlib",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/importlib/__pycache__/machinery.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/linecache.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/tokenize.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/token.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/typing.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/certificate_transparency.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/certificate_transparency.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/_rust.abi3.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/libgcc_s.so.1",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/sysroots-uninative/x86_64-linux/lib/librt.so.1",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/base.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/base.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/hashes.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/hashes.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/__pycache__/exceptions.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/exceptions.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/_serialization.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/_serialization.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/__pycache__/base.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/base.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/dh.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/dh.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/types.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/types.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/dsa.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/dsa.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/utils.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/utils.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/ec.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/ec.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/__pycache__/_oid.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/_oid.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/ed25519.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/ed25519.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/ed448.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/ed448.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/rsa.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/rsa.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/_asymmetric.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/_asymmetric.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/x25519.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/x25519.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/__pycache__/x448.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/asymmetric/x448.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/__pycache__/ssh.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/serialization/ssh.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/_cipheralgorithm.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/_cipheralgorithm.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/__pycache__/base.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/base.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/__pycache__/modes.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/modes.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/__pycache__/algorithms.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/ciphers/algorithms.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/extensions.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/extensions.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/hashlib.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_hashlib.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/../../libcrypto.so.3",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_blake2.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/ipaddress.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/__pycache__/constant_time.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/primitives/constant_time.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/hmac.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/general_name.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/general_name.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/utils.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/random.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/bisect.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_bisect.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_random.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_sha512.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/socket.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/_socket.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/selectors.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/select.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/lib-dynload/array.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/urllib/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/urllib",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/urllib/__pycache__/parse.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/_parseaddr.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/charset.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/base64mime.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/quoprimime.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/string.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/errors.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/email/__pycache__/encoders.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/quopri.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/name.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/name.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/__pycache__/oid.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/x509/oid.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__pycache__/_util.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/_util.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/__pycache__/__init__.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/__init__.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/__pycache__/binding.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/threading.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/_weakrefset.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/_openssl.abi3.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/../../../../../libssl.so.3",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/_cffi_backend.cpython-310-x86_64-linux-gnu.so",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/../../libffi.so.8",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/__pycache__/_conditional.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/_conditional.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__pycache__/SSL.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/SSL.py",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/__pycache__/weakref.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__pycache__/version.cpython-310.pyc",
O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD,
"/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/version.py",
O_RDONLY|O_CLOEXEC) = 3

