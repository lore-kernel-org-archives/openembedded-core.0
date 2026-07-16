Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1E7C44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 16:35:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17412.1784219749215022905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 09:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WZzEDcCW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso48774725e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784219747; x=1784824547; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RO5+SmwwBFAmxuXjBK/QBa9qOzF6XtzT7YOGFgV45UM=;
        b=WZzEDcCWT5W3PTzustN1xF53GVzx49jMvxEXLf2v0gvtTSysrJ12z5Vc+zj0w8cssG
         aeY0N32caFfzwFDctpsrB0IeL6jOiXkjnlNxaG/fTVvrKvwS5if+cuRkgXWHv56j0EYK
         5gnij2MMi0Dz85OcuymXNfuS4zxyOpInBDImY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219747; x=1784824547;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RO5+SmwwBFAmxuXjBK/QBa9qOzF6XtzT7YOGFgV45UM=;
        b=HqpYC909Yvp+fpWgf7Mj2f+WT0dqOUjiheSe8/KRGhVuI5duwCL7Rm+MnN8P5NGXiy
         cuGMjjdYDK4z5QQgKA5HVb3eV6DIunIuaoM025JDTljnp+ZQVeSRI7A8Gv0oPjK3gMqF
         xvWFCeKomKxFdJUUDlFwwtQBu80dRHsG3uTZoYifOpdV6SpRXE8o4UhpuAB/yvavsYcQ
         Jw61cxs4LgIPUGZYL2mfTCiczw8z3CD1uQOEVRdTyE+mtgji9ivFYruT8dwcq8NVljlb
         TrORj9tvUzktbAZnc2xxqETvD9To5v9kkd458BZMQwLK9ods/ouZ4SbwB8sAON0HW62a
         qd9w==
X-Gm-Message-State: AOJu0Yz/sC4QNsdZUB/fbcDCvg5403JdW3NmUSrtpc5VF59xokkb1Wrw
	OWHwa+XunJFAhxjVlyAV4pTGcBcYFhTbWMvcaqInOawv06vKXInU8/Nl0XwumrHhv6/96zrDNVb
	LiWrTHys=
X-Gm-Gg: AfdE7ck0ZWuWvLm7LifirD/ZLnOQoqNEtRYYfJP1lQhU8rZQck7qOibV34LRvILfgrn
	pAKQAa4HswaADfRAAy0psTnBMygLQvBFGj39+PLtVOLLTSFM6rSXuPH9Rbpl8z4y3muO8HqrLa+
	bzLpGK8tvalmypxNhAPYQGRZCihO4yP5lqBnK3rQH6M3oY6vzugTsI+4zNdXaVCvkp+BPMYZlov
	xEPitKOKB8HhH6TJQVlJugx92GqSDZBKh4nNtyfmC7XnEcPaKNzZazLeVJ8JclJGW+N/7ZFtB99
	ECTA7VPqA7OFNXmey+f04uVuLMALm6qxq89ns4nyf+3CxnQiCgEBdqTl+y67R/4EsDRAvNsGLWW
	Y11JDpRowQZheWcbAqWUhXU9r2JDALr886Ikvk6qAd1TE+agETivZnP/rzovYFYcEaAE5DgukOr
	7SHS9diYP4s/aPUwRKheGcJAHUrojLe9aMNywshbeRCc9kWrXik7DmbTdQ/ihR/eM+jLc=
X-Received: by 2002:a05:600d:6443:10b0:493:f762:45d4 with SMTP id 5b1f17b1804b1-495158c693bmr126889725e9.2.1784219747279;
        Thu, 16 Jul 2026 09:35:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03c:6417:d88d:c21a? ([2001:8b0:aba:5f3c:a03c:6417:d88d:c21a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm65773305e9.3.2026.07.16.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:35:46 -0700 (PDT)
Message-ID: <69fa5e90b4238c1c2cc38c82323c009ef0a3eed3.camel@linuxfoundation.org>
Subject: Running large numbers of testimage tasks in parallel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Date: Thu, 16 Jul 2026 17:35:44 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 16:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241098

In order to try and attempt to reproduce the autobuilder qemuarm*
hangs, I wanted to share a quick guide on how to hack things to make
running multiple testimage tasks in parallel easy.

Firstly, I added:

BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+str(x) for x in range(0,100)])}=
"

to core-image-sato.bb

I then deleted the test case files listed at the end of the email to
make the tests run faster. The hangs are generally in the boot process
before login so if we reach that point, it isn't a hang scenario. I
could have probably set TEST_SUITES instead.

I then ran "bitbake core-image-sato" to get a base image to run the
tests with. After that, I used the following script fragment:

cd tmp/deploy/images/qemuarm64
for i in `seq 1 100`
do
    ln -s core-image-sato{,-$i}-qemuarm64.rootfs.manifest
    ln -s core-image-sato{,-$i}-qemuarm64.rootfs.ext4.zst
    ln -s core-image-sato{,-$i}-qemuarm64.rootfs.testdata.json=20
done

I could the run 100 testimages in parallel with:

bitbake `for ((i=3D1; i<=3D80; i++)); do echo -n "core-image-sato-$i "; don=
e` -c testimage

(which will run BB_NUMBER_THREADS in parallel)

I'm sure there are neater ways to do it but this basically works.

I haven't had any luck reproducing hangs with qemuarm64 with this yet.
I did have to switch from using a DISPLAY over ssh to unsetting DISPLAY
and using qemu's local vnc as otherwise the display traffic over ssh
was limiting the CPU load I could trigger on my server.

Hope someone finds this useful!

Cheers,

Richard


	deleted:    meta-
selftest/lib/oeqa/runtime/cases/dnf_runtime.py
	deleted:    meta/lib/oeqa/runtime/cases/_qemutiny.py
	deleted:    meta/lib/oeqa/runtime/cases/apt.py
	deleted:    meta/lib/oeqa/runtime/cases/buildcpio.py
	deleted:    meta/lib/oeqa/runtime/cases/buildgalculator.py
	deleted:    meta/lib/oeqa/runtime/cases/buildlzip.py
	deleted:    meta/lib/oeqa/runtime/cases/connman.py
	deleted:    meta/lib/oeqa/runtime/cases/dnf.py
	deleted:    meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
	deleted:    meta/lib/oeqa/runtime/cases/gcc.py
	deleted:    meta/lib/oeqa/runtime/cases/gi.py
	deleted:    meta/lib/oeqa/runtime/cases/go.py
	deleted:    meta/lib/oeqa/runtime/cases/gstreamer.py
	deleted:    meta/lib/oeqa/runtime/cases/kernelmodule.py
	deleted:    meta/lib/oeqa/runtime/cases/ksample.py
	deleted:    meta/lib/oeqa/runtime/cases/ldd.py
	deleted:    meta/lib/oeqa/runtime/cases/logrotate.py
	deleted:    meta/lib/oeqa/runtime/cases/ltp.py
	deleted:    meta/lib/oeqa/runtime/cases/ltp_compliance.py
	deleted:    meta/lib/oeqa/runtime/cases/ltp_stress.py
	deleted:    meta/lib/oeqa/runtime/cases/maturin.py
	deleted:    meta/lib/oeqa/runtime/cases/multilib.py
	deleted:    meta/lib/oeqa/runtime/cases/oe_syslog.py
	deleted:    meta/lib/oeqa/runtime/cases/opkg.py
	deleted:    meta/lib/oeqa/runtime/cases/pam.py
	deleted:    meta/lib/oeqa/runtime/cases/ptest.py
	deleted:    meta/lib/oeqa/runtime/cases/python.py
	deleted:    meta/lib/oeqa/runtime/cases/rpm.py
	deleted:    meta/lib/oeqa/runtime/cases/rt.py
	deleted:    meta/lib/oeqa/runtime/cases/rtc.py
	deleted:    meta/lib/oeqa/runtime/cases/rust.py
	deleted:    meta/lib/oeqa/runtime/cases/scons.py
	deleted:    meta/lib/oeqa/runtime/cases/stap.py
	deleted:    meta/lib/oeqa/runtime/cases/storage.py
	deleted:    meta/lib/oeqa/runtime/cases/suspend.py
	deleted:    meta/lib/oeqa/runtime/cases/systemd.py
	deleted:    meta/lib/oeqa/runtime/cases/terminal.py
	deleted:    meta/lib/oeqa/runtime/cases/uki.py
	deleted:    meta/lib/oeqa/runtime/cases/usb_hid.py
	deleted:    meta/lib/oeqa/runtime/cases/weston.py
	deleted:    meta/lib/oeqa/runtime/cases/x32lib.py





