Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5092E9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21469.1771943109130321897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x6+5aqUQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so49184435e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943107; x=1772547907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bncme+xMiQsTjI7rDVrV9onaw8UEEZ2iIF+6QWC2HMs=;
        b=x6+5aqUQrnjPza2WCkbLuxe2shrV0j/69BBc8cG4N0zhApZCWHAZ1X3iY05/JqHMM9
         D+fG8YveIYb3k+/lirtThhDsiozcyF7g3lfJlWACasiy9tQ30f1L715cdcC8fxlKhgpM
         iEj9bYDAvTS3L+JbySEqP+8L14XwMCuJqEOPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943107; x=1772547907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bncme+xMiQsTjI7rDVrV9onaw8UEEZ2iIF+6QWC2HMs=;
        b=mWXXwGJXazzPShFNWpDOqu3Iu/G3JWsPnJZgglSQTQiYgODIfvP5Di87jKM2W2rt02
         RBlOVbryTIHqFCJg2RWyrMsTAQYop5Fr+Re8F2JOfT/0bLhMGnLPVYVTVsuAvZn++5KJ
         TTlZTvblQkSDp9SxU6PsHrydG7TrXJZsPp8Gf6y3ShAkk80qqIlCNffBH4ctpDav2piS
         cjiBbNZCtu/eN211/fX50Pd2Y17sb+YsjDqsb1iNG3Cx9HtKze6Kj/akOGeOTrUu0IOD
         +DOEQEtShPoIyh0nMXmrY4NAzml0sdYNOoY4dsQ3VPleFlbX8s15LkHIT8sF54qlXiH+
         KSLw==
X-Gm-Message-State: AOJu0Ywnl8gxT7F/EUqVxIHBRGR96+PjfRaz3ibg3M+ONZOOg4iyDeE4
	6o/Mc3Bdw5mf+rsBq1kteY81DX7t4wWSt7NDrF6r3HbTuOkGQZoBWB1P4b8j9CS8CimN0eXbP+T
	+U4Wf
X-Gm-Gg: AZuq6aJy6qefeIgsTOWPULLE7S27VEryTRQsUqkyDyrhuGpKyHLW3qwlCubAcbn6+Vn
	pT2CuebegeUqExIBoqAlF3IGIg/yTz0HNapz5N4krp49Xg+ggt+ADguDcfH6Fv0eT5pM5jNYQJZ
	udED/5ct0YEZ+0W2MRxLPF7WTtc11QYgcKPABTVTEWpljgdF457rQIo+Cx03ATxFESC2O1gyUim
	kpJdk5FtsdHCrOWs9hn+lE4BXnLngIQS11iqGJfCJsMFYqwWQd8dBzNxdXsCDRUQxNstp/wy3Uq
	qq39GIVqq9MkDFiSt5hCO7IICMjGSjz7+VxSUlSnCcZVDn4CJPo/9g6fzDQj9dcR38n90VVwFUR
	wH9cwDvbJy5tjOG9zEnmzRwBnyPRVImEMoYfxY9Kj/ZxP03niRa/Y2RqCMoLezHS5L4jrmYeOjm
	Ev3EGuRaus/GcYIqN+PkTwFClqE0zYziA32k6qeLO1BFF+2uKK+4+FJlhIQGxZbRnFTt3IJp32P
	w+APvgkxv1lyHn/kIT7L5PPd1u9u95zlQ==
X-Received: by 2002:a05:600c:34d4:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-483bd76baccmr1997715e9.14.1771943107242;
        Tue, 24 Feb 2026 06:25:07 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/38] bind: Upgrade 9.18.41 -> 9.18.44
Date: Tue, 24 Feb 2026 15:24:09 +0100
Message-ID: <37381c8b8138a76d9c71296c38a67597ad5dfc76.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231783

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade fixes CVE-2025-13878

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.41.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.41.bb
rename to meta/recipes-connectivity/bind/bind_9.18.44.bb
index 0e557163d5f..64dbdf890a2 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.41.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
+SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

