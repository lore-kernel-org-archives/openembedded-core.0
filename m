Return-Path: <primoz.fiser@norik.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A11C41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 05:56:02 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by mx.groups.io with SMTP id smtpd.web11.13300.1719813356104795598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 22:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norik.com header.s=default header.b=F9hOK0pU;
 spf=pass (domain: norik.com, ip: 46.19.9.99, mailfrom: primoz.fiser@norik.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=23cl79DiRCMXHxxjhdLRtXxT+kWdB5GQz1yI7byQw9A=; b=F9hOK0pUsi+RkQtl0K0yAYNM6j
	5teZPYwhTIFbvXkDzzcFacZUKOAQtDvEr+mEGP3pj4Cr0FbASBvq+aK0ILdy0XNdZk/Y1wr5si6DI
	ZyEAL65CTX7gJTFqvoSaDBOhROs5ikQfNU4shDFYOgSTaPTog1eTenUZGWjdSwym5Or+M1qFsJyDs
	QFC8/28CXpcR3Wf/uikylrZ0u8W5l9iC2dPliAafgWZWfdW/V8KvryZ/GJEC1QvvQMxwmoHPMq8Br
	N0OJeaN/AMOTnXeEo+BXXvYo0zkzIveGFrDyrbqKvhJD3dx8mn13F4Dz98hSE8l/jQ2VLf6jmz3sZ
	1bT7juYA==;
Received: from [89.212.21.243] (port=37874 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sOA14-00Ddjc-2g;
	Mon, 01 Jul 2024 07:55:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-core@lists.openembedded.org
Cc: upstream@lists.phytec.de
Subject: [PATCH 2/2] pulseaudio: Remove from time64.inc exception list
Date: Mon,  1 Jul 2024 07:55:53 +0200
Message-Id: <20240701055553.2851418-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701055553.2851418-1-primoz.fiser@norik.com>
References: <20240701055553.2851418-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 05:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201274

Pulseaudio OSS (Open Sound System) support was causing build issues when
used with GLIBC_64BIT_TIME_FLAGS. However, optional OSS support was
disabled by default with addition of PACKAGECONFIG[oss-output]. Thus
remove pulseaudio from the exception list in time64.inc and allow it to
be Y2038 compatible.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 meta/conf/distro/include/time64.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 2e85753e55a4..6ee7b4915267 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -25,10 +25,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
 # Needs further investigation
 GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
-# Pulseaudio override certain LFS64 functions e.g. open64 and intentionally
-# undefines _FILE_OFFSET_BITS, which wont work when _TIME_BITS=64 is set
-# See https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3770
-GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 # Undefines _FILE_OFFSET_BITS on purpose in
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
@@ -37,7 +33,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
 INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
-INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
 # /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
-- 
2.25.1


