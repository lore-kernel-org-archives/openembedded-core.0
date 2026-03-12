Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311DE106ACFE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:47:08 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4550.1773359223513023273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M3L81riM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a133b686f7so1613909e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773359220; cv=none;
        d=google.com; s=arc-20240605;
        b=DbOTlw9Q0oIpBq7wKEnMU4OF1xoUIcNXXCoK2nsOnSiOezoumZtcShs7cCvot1Yh3n
         rZXYwtjmDEEnmpx1JZxRJu/Rvv+BemWXLAlLSElXI+1rzEordqg/o9SdznbgSrt75bJY
         s40MtHJREuqucCfSjH3YdGDcWRYTt5SDB59LjNFCOHDB1qtsxHmxOjoDi765JxMJroxz
         XfyzpQD9TDbg5CuoeoOyiF/YfQfk2hlSX9/hdFOt71Ek+UguJFZsnpdIqSQoa4sD8WwA
         jZx1aSYzzPM9GzzgoV+5Yk2Tsxts8CA1aXaAXPReJXxLsrk/Axrg8iSDegVMpsyURwaH
         IxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qGWcDZo2nIhjVODbOlX0erXmuVweiqPlLoCDzjsTKJM=;
        fh=eJtCL7qHhmp2gDa52xTzgFNW6HZsnFXw+nqDXvINy+o=;
        b=Aaj+Ec20JfFaMpD9EMrtnggt6TMQGY90HtNzokdq0s3ybBLHBdXpwiz3PngQfgv4/O
         BxldCxZ/QH/5caM7PN6COfDd5Xb2NoPhEYtrt0m/i2Tx+1VcbRnO9aAE3VbmS5wySnLl
         wzaL0Ti2Dyno5IMpTysML7G3UQ6ev1v4dR7S1KZRWvkEPggl7zMubHQvx9rZs1aqV4ps
         Qi50xKq5Q22rWU5TcywahoYORNu6Xt5URp37V3bCIzViwAhAYuehM2RDNeEFhNqfJlN5
         HOoqMrr+NIIz8ioy9vJ16sbh+ndXvzvXV4knBVfhD+JzApaV7GVUztsakKpPIwTju/N8
         AATg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773359220; x=1773964020; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qGWcDZo2nIhjVODbOlX0erXmuVweiqPlLoCDzjsTKJM=;
        b=M3L81riMD5cb67YSxup8hVKhCWLvuhNq2Y6seiV6KsvjjcQWlIPmJmotP9ntTp6qHn
         Hr/pEMJBUFAJ/8sNV5Q3WXDkkiVweJDbim/rrqpEscEG/Er2ZHdknRkYVgL2emwd1Ss8
         /HQ8w8W6yslpx2HhDYKiDpcXXlar518+LiTCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773359220; x=1773964020;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGWcDZo2nIhjVODbOlX0erXmuVweiqPlLoCDzjsTKJM=;
        b=hr5yUu2IX07pFbmAgIzwxy0cTVmveeJVRR/XbALxktR5iZlLiYVib9oli8bkgc7joC
         YIhW4p69a89gdmUhMOjwJaOLzgy8zyIj3PpkLqjW9rcbmA1qWj76pxw8UiQcCf8wLoWI
         ETCMVo/iqpTnrDDDgXrbO+qiZ2Xg1vQkiHuA2PbMJeJKKiKPnbpySMnPOslitw3RNNVc
         M/tSt+GfWOO+kAS7aO/1MSj544I8K2ed1ZwI3xLtJSgzorUw53Z1Shb27GQEhq3k3Utd
         H9OfnBzS9plh2xaItQNWsUSNbTAw/32LQHaqmFDNZWdhfk9ln3lqVAEO6E4o2oVcHIQa
         4NGA==
X-Gm-Message-State: AOJu0Yzts8py0I/94LvRsLaaQoEPpmR9tvn43Zd2xK1hn+XKFHEl8zBV
	SbFnKi+3i18QlgtUHpi3UD9/yz+y2lf6+i1r/tj+kRVM8r+ZivW4ciwacuR/2mNQbd7wVtcqPtK
	hTgD1npMRr7nexR0KebmZQ5ge7CMvu+nfWfCl+h+fV/3r8kKG2uS/CL36hw==
X-Gm-Gg: ATEYQzxZWZ0AoMnW2gSGjkaQ1y8ZV7otZC89TS0DpejaYtrQEkYyzirRVbB2941t2Af
	iDXRxPxL9/x4YTVO43CsS2zyiiAR9CJRlHKRXv+71TmbQ5B2gVUqyyfFAPx4pFXa3YeDMlQ/5rO
	FUbIbz4WKeK0FHmSMB9KsBe8FY3clJBoCEtLPeoprv5H/fcwT4vtmXuwOTvaNYY2JFvd3aL5wvv
	TVJ16AbsldAHM8+htKkkzywZRPTth2YamXfxl/ICaicOrdjPCSvCvXZU26bvHN8eA+nmzGIWyYR
	Ds4QsA==
X-Received: by 2002:a05:6512:3ba4:b0:5a1:59b7:8a50 with SMTP id
 2adb3069b0e04-5a162b0e862mr372546e87.36.1773359220386; Thu, 12 Mar 2026
 16:47:00 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 12 Mar 2026 16:46:48 -0700
X-Gm-Features: AaiRm51D_voaJ1wVoFtot9MWHkoo7RktIO_wf4lHVxeAZG9KoJVsr4rhfWHlXrI
Message-ID: <CADfgfoZzWdveZE7D7OnGztj8gyH-bQ=2F__jSdf_sSM_j2nrQw@mail.gmail.com>
Subject: [PATCH] yocto-uninative: Update to 5.1 for glibc 2.43
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233013

yocto-uninative: Update to 5.1 for glibc 2.43

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc
b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..d97c96f631 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #

-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"

 UNINATIVE_URL ?=
"http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?=
"a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?=
"959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?=
"96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?=
"4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?=
"761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?=
"2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"
-- 
2.53.0


-- 
Michael Halstead
Linux Foundation / Yocto Project
Staff IT Engineer

