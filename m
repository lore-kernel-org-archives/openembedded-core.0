Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7E7CA0FF6
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.64609.1756215702413212152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zj6EwQcq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326e20aadso6524460a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215702; x=1756820502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsJU1duKP3pFXtbs32K+zcWEL8T1/ccyAphMtH3J0zU=;
        b=Zj6EwQcqfTFTD5emM2AtOJbz/aynHC7tuY+5ArDVTGPWdYnIGIR2DSZOssr231Hyoc
         ygr3xot0NLJx+P/NlRpv1nBzTXLkUIdP7tMBQBdb+/5mBOLrvGOT20FC+ign4VrPVyMN
         DjHK1UsiZBD4TD6JEHfRv/WmkOQzlA45NX7ZLxKTmeWkS0etNfMrAXBzsSJrSs4PFaBt
         KvsvrorWkQkg3vdsoID3gu9k0LPbGd7DM674pIIK1/kR3/ldJB7CDKFE29HS5uwlevbL
         Tw15tGb+AovCcqb5R5ZGKa8xhdjCR15GDweSHF5cteOGFeDsIj3jvtGt9sY0XZNKGHJ/
         WGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215702; x=1756820502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsJU1duKP3pFXtbs32K+zcWEL8T1/ccyAphMtH3J0zU=;
        b=EWpRf+RHfskIvy5mfK+uCoTQPVicdMuvWWMBRlNOj4cZWRnm8ieSk9k2dLhL0ax4DB
         lu3osIWHS5Ev+ygtSp4eSEMKWzkuFA0+ICGgWXc4deFnQGQsljtwmTuOGnnAYe3Cro3L
         bmnVcxRgSPDOuWpWN5SYCMSDf/jciRU63xj0adttWnTUEdajdC4KhAPEvvEuROKpl0Jw
         /x7BjAwrNaL081My4/VZFxCEmukOw97S2J2pyJ9ORPuNx730LcR1FC4+JT28octH491f
         KqCIuJx2/WLCIbb8DsIqTs+CbYxqqGSNZaUAq+uUc4TeuZtkL8PsHcm++SRKWRhVHTM1
         wbpQ==
X-Gm-Message-State: AOJu0YyVGr9/59s9tLxr2887i05mtlSjFgJLeuZaO5YUuHyVlrG63t06
	jbzSc0mxUgrZI8l3SN2ZHtE2GhARxbmfH0Vi693nOdhHJ7KYz2jQYuoPX4JoGVQzAr19KePgiUz
	Ju4yz
X-Gm-Gg: ASbGnct5sf7qocdZXaua4MvyZs+vQ1LGdh+U4kGDSMBbwlZNPAdTv1QMtHSU19xfVGa
	sMYd7bE2D87y8a1YFUUcgLU/Yx3rSesuqqn+oh/TYR7lp7a3zNX5BdU0mrteyYnK9zgaIsbHYvj
	/qFev9U6c4d2YW1IcT2pHXfOchoyKVcKIT3JQ09SvSTMRQYgvmH6SYBDtMz6ju0YOgxuzm+ESfn
	RHytO+GxE1RhHsfOMGK/dyZsv1o9SJHk+RjBbwMFXhtMSQ0I7MJ2U7nQq5Gnq2JBiytM35ffClW
	jXDVZK1LBY9kfX4U2y1crLNlk9cN+K46moheCzuse0rU9eNoExpDCfkiyk1yWW+Li31VKuokBdx
	w5/xPf75XQ2atLa3KcBro2uP8
X-Google-Smtp-Source: AGHT+IFbrp/D2h94JZpzGxCgfX73IxMPNpBk+3vo8c6Z0t8V32EqOOhSlrdNy5m1KbwYkG1cz/SzSg==
X-Received: by 2002:a17:90b:258c:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-32515ef1bb1mr20581364a91.33.1756215701406;
        Tue, 26 Aug 2025 06:41:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 19/19] yocto-uninative: Update to 4.9 for glibc 2.42
Date: Tue, 26 Aug 2025 06:40:53 -0700
Message-ID: <adbb7737cbfbe241df514704b9bb237e41505310.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222459

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dabd604e8e..3ced03d477 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.8"
+UNINATIVE_MAXGLIBCVERSION = "2.42"
+UNINATIVE_VERSION = "4.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
-UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
-UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
+UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
-- 
2.43.0


