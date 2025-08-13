Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A097CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.7046.1755118168315450473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSFDpAUh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70a9f5509f5so3223096d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118167; x=1755722967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppkbLyvCEnBmLPMqoe6pFe7TbAcMGkDcpReG7o2AOSY=;
        b=WSFDpAUhEtn4I14hSji2/mfEGd/+7tfQTt+8Cw56iHWlEypErDxsqRtcLaDI0ZVt8G
         WbSX4puxHdb8E0wKcTEBWomWNz/wqmzZpOIU1ZAXXwzpmgP5Hd22weQX5AzzH0N3TggB
         dCj7eaWE0VOOJxOY8rx7JjU0Cg61mjB4bdDagWzwxfrHtJK/kI6B0KrXxMUDh2WB3i/v
         GINcvuAcgsI6GepXifaPDHnIEZuTZXN9nIrf6MZfayIx+7I1qaH8czhjqu3jHOnCBrhL
         H0xJeSIFztIMe/UkGa17Pes8hwmJM7hgVYKhoXxJLNnC10iZX8Y0EQ1hZaIjNtGAD/dG
         N+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118167; x=1755722967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppkbLyvCEnBmLPMqoe6pFe7TbAcMGkDcpReG7o2AOSY=;
        b=dri9X4/i1zaGWBdqoUg9rydYO3LdYmfbqMotAX6jtEI7jkrMKtgiLIqhHi4+g9GvvK
         SW/f1nKCW9ugMAipkwcRV3b9+EVm3WpVmm4NxOLiOEHg7vcY8+3bBUGU8R2gfG74VFzC
         qRBZiI037rT+y7TdFKt37pfFrrl/eEqETvIP3Kwa3z0vhrQrS7il8Zc+3IQ62Hb49eWM
         QJmmhd8lIuUVaJ/bNtNMSdeURlZY4GT27ZRdoJRDDs2WIWQP5o3DeY7vvLOVniTXJFff
         hZ6+VjHfALTFCiCE9rZzEbp4FH9d1BrZ0yBqre44cQDkYqEPzHPiomOOFLvU/HXRwWHa
         uMmg==
X-Gm-Message-State: AOJu0YwL4lbc8YMSQINZgpXvqX69fIjoRGnJgu3ZlenAj8UUX1qOKa34
	f31BBN8302vz22kfKlUhnuUCS2gBxN0oL7sNVTdbnwZ5VxwF6A9fYXnVTNdzneVY
X-Gm-Gg: ASbGncvlPIWT7T6FAbvp8DEOYNRZzNjjvZB8GLtmBWRzUXaxMjOJj/+FSWizSclEp3M
	TLql1VOkWjKMAKkk1rBm0plVIJYE8q4+0yYsLOV5FQGg54Av4oBZ1DM9zk/ABZDzb43YnyjYsYS
	gIvQJXHcy+SMYGykFYz1f3VzKu6B9TWX686Cxck2XfRWGUUxvbDxlcoiTqx7oZErGQnP2StsODn
	I2W7SZeXd0sJ12EIQ/q+07iQrLQv15b2HC6gc3ysO3PXs1DJho2fbMlKayu2RGwq6g5nnutBHqc
	4gM4pA/6rm9EuY2+yBFWvUacNDrDPFm8hbSRSVl82XVOJ2YIY8vLdFOlHHCDEjo0v4/1F5GikKl
	2PKklvP9O7BNAO2cO5LkRQeCkeHJHMSeCLekJ7WDyLL1+Be/5F7udEQlzBTQUSlNT4wu3gitG3r
	hAzoZunbqOJUtwfH0/dYMSIsk=
X-Google-Smtp-Source: AGHT+IG7CP5BpTKa/LpnOOTyka2rzsLk4S0yk8VHIHiVcpUeY8pElfgAhBk2Mx3qXiCfSl+/pUYcZw==
X-Received: by 2002:a05:6214:e42:b0:709:f5a9:d053 with SMTP id 6a1803df08f44-70af5bcf668mr14158526d6.18.1755118167306;
        Wed, 13 Aug 2025 13:49:27 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/6.12: update CVE exclusions (6.12.39)
Date: Wed, 13 Aug 2025 16:49:16 -0400
Message-Id: <2ef13aba8836643763de25e0d3e32510658156e3.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221822

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (1 new | 3 updated): - 1 new CVEs: CVE-2025-46002 - 3 updated CVEs: CVE-2025-5752, CVE-2025-6717, CVE-2025-7397
        Date: Fri, 18 Jul 2025 14:11:28 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 02931bbf79..e428258bb1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-07-15 14:54:42.649263+00:00 for kernel version 6.12.38
-# From linux_kernel_cves cve_2025-07-15_1400Z-4-gc77733e1fe6
+# Generated at 2025-07-18 14:17:49.367230+00:00 for kernel version 6.12.39
+# From linux_kernel_cves cve_2025-07-18_1400Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.38"
+    this_version = "6.12.39"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4132,7 +4132,7 @@ CVE_STATUS[CVE-2022-49962] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-49963] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49964] = "fixed-version: Fixed from version 6.0"
+CVE_STATUS[CVE-2022-49964] = "fixed-version: Fixed from version 5.19.7"
 
 CVE_STATUS[CVE-2022-49965] = "fixed-version: Fixed from version 6.0"
 
@@ -5582,8 +5582,6 @@ CVE_STATUS[CVE-2023-52999] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53000] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53001] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2023-53002] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53003] = "fixed-version: Fixed from version 6.2"
@@ -13672,7 +13670,7 @@ CVE_STATUS[CVE-2025-38065] = "cpe-stable-backport: Backported in 6.12.31"
 
 CVE_STATUS[CVE-2025-38066] = "cpe-stable-backport: Backported in 6.12.31"
 
-# CVE-2025-38067 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38067] = "cpe-stable-backport: Backported in 6.12.39"
 
 CVE_STATUS[CVE-2025-38068] = "cpe-stable-backport: Backported in 6.12.31"
 
@@ -13746,7 +13744,7 @@ CVE_STATUS[CVE-2025-38102] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38103] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38104 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-38104] = "cpe-stable-backport: Backported in 6.12.39"
 
 # CVE-2025-38105 needs backporting (fixed from 6.16rc1)
 
@@ -14236,6 +14234,8 @@ CVE_STATUS[CVE-2025-38347] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38348] = "cpe-stable-backport: Backported in 6.12.35"
 
+CVE_STATUS[CVE-2025-38349] = "cpe-stable-backport: Backported in 6.12.39"
+
 CVE_STATUS[CVE-2025-38479] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-38575] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


