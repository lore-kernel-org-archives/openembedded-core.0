Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359EFCDD0DC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 19:46:12 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.3226.1729626365954480943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 12:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=09OX/rX7;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b14df8f821so507165985a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729626364; x=1730231164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ww1AHVLFDpDsgGpKTLKEswMg3Zz67sAMQFIV4c5j7ew=;
        b=09OX/rX7RCOw/i69LuNe4gGYC5ejKNEQHdnAOBMNv+ZeC9eeeLM72dS2AaI5oqjRnX
         6dYxv+8Mb/TlR8Y1MeP+qHGu10YSIa8+5K1Ie0NeRWLpvqg/pEt2E/jd6l2Wn2PpZX8t
         sD/vRq2R1fF7CT24+vkxR6kH8k9sQT6fPofWznhTn/WL12eYv6SXI0Okt1mrMGm/epkP
         4YE0bTzsGFRT8lTFN+nMC6Dj2Yu5ZXywfRaL25J+rI+4UKkH9mrKWkB6yb0iTIPW2oNN
         2YBN5HyJvF3vnHsGzl8KSuI6kmwjGbK3RDgX8R5b/1uxSZHqdCk19BRvDYCyXyM2YeAo
         YD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626364; x=1730231164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww1AHVLFDpDsgGpKTLKEswMg3Zz67sAMQFIV4c5j7ew=;
        b=YArs0/mOy//i1iUcJjb8VE7yXNgui0xOJkKDXuzMRkqj9r6u8UvTGmTFadcp7y/3Jf
         db139QMhh+sEOwU6Eo21ZkAlLMV/Qj9zoy8rqLnp1fiRLvGIbgZUAuEexDoLst/M8i64
         CWeKnue3FLuF4YujMRK1rGAJbeLDn9sjsGCKmrqpqiolld2uU4sh4JGV+3dBQIcSDE1u
         7Qq1Wy+gS9wVMyBbEZV1dF6dM4BnwRCstiuLso8asEDHkqclIVTH0NFoZl0ocJWGXgzm
         4SF2D7u2IAAqcv3Xp4F5lV+wE1zRKFnztpwcfdsYYbHQKCerextLADwn2Dnflzsbhhbl
         1ZVQ==
X-Gm-Message-State: AOJu0YwQCoBVhSG6JwaIPSywXb690q543EicXMu0bGl9XPiL7GVuPW+9
	d13YpzO2aXqwzJTfaRgRK1R8TsFugrdKOf55qDdkYXHDjmjzTrLXGr7XidTjad0kRyVNT1CvK0i
	c
X-Google-Smtp-Source: AGHT+IFq7C7OWAzvZPTCF/EHm/DSKcT1a8Ocil0pqg9OOKOXPAajP0BT+AnBqAx50JUu+EtEZJIgqQ==
X-Received: by 2002:a05:620a:448a:b0:7b1:53c5:8f42 with SMTP id af79cd13be357-7b17e5608e4mr18779585a.15.1729626364443;
        Tue, 22 Oct 2024 12:46:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a01a51sm311175485a.51.2024.10.22.12.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:46:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-mako: upgrade 1.3.5 -> 1.3.6
Date: Tue, 22 Oct 2024 15:46:03 -0400
Message-Id: <20241022194603.757525-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 19:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206173

Update PYPI_PACKAGE to lowercase since that's what the upstream tarball
now uses.

ptest results:

|============================================================================
|Testsuite summary
|# TOTAL: 500
|# PASS: 447
|# SKIP: 53
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 2
|END: /usr/lib/python3-mako/ptest
|2024-10-22T17:30
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Changelog (https://docs.makotemplates.org/en/latest/changelog.html):

-   Fixed long standing bug where the sequence <& would be
    misinterpreted by the lexer. It’s not clear why the ampersand
    character was part of the characters being consumed here and it may
    have been an inadvertent bit of code from one of Mako’s predecessor
    languages.

    References: #412

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-mako_1.3.5.bb => python3-mako_1.3.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.5.bb => python3-mako_1.3.6.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.5.bb b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.5.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.6.bb
index d8a05efe5b2..27e2082dc01 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.5.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
-PYPI_PACKAGE = "Mako"
+PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -12,7 +12,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc"
+SRC_URI[sha256sum] = "9ec3a1583713479fae654f83ed9fa8c9a4c16b7bb0daba0e6bbebff50c0d983d"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.39.5


