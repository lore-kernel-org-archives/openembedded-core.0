Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF1FC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 16:44:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.107003.1680626643492705183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 09:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZV+MhYJT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q19so30421699wrc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680626642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQAP04u74iarCwZ/lUwp/ob+UbcU8dAapjggu6tEUfo=;
        b=ZV+MhYJTeqghnEql3ylBWknx1LrBv+uSChWeI9YkZaD2dxfQRh3N8tu7AzwvxhSw22
         yvrtx+S7oaCua3t4hnxgQaKUwP/G1v+0iLidmp/zzfyNeKcbI+4dG8712ImanEz32716
         xJa7+OuFSS4EVLeoUXz0N98gozd+sDAZ2daFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQAP04u74iarCwZ/lUwp/ob+UbcU8dAapjggu6tEUfo=;
        b=nDhQ+4DTn0KabhslSL39b1qT6FHMIHJi/OxJY2ExRi+ch026gZtn6v0nAAcuoibWUS
         kpr40FusXX34UjDJIK9LiKazKRTmJgwVRi/5bXmyTijeClFuDXwRp6NNpyw8VkGQfWNv
         DGp1gehuxBL09DTg+D7zGC0oUAv9UkE69q9jMqf98OIhbWlVCbeXwENiYCT17xlJKYRE
         SVkB+9X72ePJ51bwG7OWs0ya7JnFLZZaEfbZXxkZW0lMR1T2UGV9CJ4y9UiehgkgeH9+
         e35Ecqny6eRrcpZKTh69ZU0KY2qcjFdfXU7FYHJ6CQUdlQBWhHJA+8slKGsdHiyEFVw1
         iCSQ==
X-Gm-Message-State: AAQBX9dLvuAlNvuLpKXtAZc968yGFxZf3LaOZu8z0LOcIogURDa4dRDj
	JULHY8doU2VhuIiD5FALlzEKOhqnfpIioGLXrIs=
X-Google-Smtp-Source: AKy350YC+tWBMQvxErd92+NqP5tE3YEm8zqHAhElQSgwlS1/YSeuAH4Y0v4KqKZme8JUTsonxPY0Zw==
X-Received: by 2002:a5d:6a03:0:b0:2dd:af9:e1d2 with SMTP id m3-20020a5d6a03000000b002dd0af9e1d2mr2340317wru.5.1680626641528;
        Tue, 04 Apr 2023 09:44:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d451:665a:3597:602a])
        by smtp.gmail.com with ESMTPSA id o5-20020adfcf05000000b002c592535839sm12689651wrj.17.2023.04.04.09.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:44:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions.inc: Exclude some issues not present in linux-yocto
Date: Tue,  4 Apr 2023 17:44:00 +0100
Message-Id: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 16:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179703

Exclude some CVEs where the patches were backported to the stable series
kernels we have.

https://www.linuxkernelcves.com/cves/CVE-XXXX-XXXX is useful to help
with this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/cve-extra-exclusions.inc   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index a281a8ac65c..680f613c9f9 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -381,6 +381,46 @@ CVE_CHECK_IGNORE += "CVE-2023-0266"
 # Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
 CVE_CHECK_IGNORE += "CVE-2023-0394"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-0461
+# Introduced in version 4.13 734942cc4ea6478eed125af258da1bdbb4afe578
+# Patched in kernel v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
+# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
+# Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d6
+CVE_CHECK_IGNORE += "CVE-2023-0461"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-0386
+# Introduced in 5.11 459c7c565ac36ba09ffbf24231147f408fde4203
+# Patched in kernel v6.2 4f11ada10d0ad3fd53e2bd67806351de63a4f9c3
+# Backported in version 6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
+# Backported in version 5.15.91 e91308e63710574c4b6a0cadda3e042a3699666e
+CVE_CHECK_IGNORE += "CVE-2023-0386"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1073
+# Introduced in 1b15d2e5b8077670b1e6a33250a0d9577efff4a5
+# Patched in kernel v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
+# Backported in version 5.10.166
+# Backported in version 5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d64
+# Backported in version 6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
+CVE_CHECK_IGNORE += "CVE-2023-1073"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1074
+# Patched in kernel v6.2 458e279f861d3f61796894cd158b780765a1569f
+# Backported in version 5.15.91 3391bd42351be0beb14f438c7556912b9f96cb32
+# Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
+CVE_CHECK_IGNORE += "CVE-2023-1074"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1077
+# Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
+# Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
+# Backported in version 6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
+CVE_CHECK_IGNORE += "CVE-2023-1077"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1078
+# Patched in kernel 6.2 f753a68980cf4b59a80fe677619da2b1804f526d
+# Backported in version 5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4ba
+# Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
+CVE_CHECK_IGNORE += "CVE-2023-1078"
+
 # Wrong CPE in NVD database
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3563
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3637
-- 
2.39.2


