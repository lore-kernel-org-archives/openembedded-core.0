Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B794EF4EB4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:55:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49822.1775458550021748659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DdBSf+YG;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8296dabef74so3507312b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775458549; x=1776063349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o21qhL1F0H2AJq7R0qeDo+4W5IQPazxyHEY+O+IjP1c=;
        b=DdBSf+YGFsbXxeAu9zBVSa+Q7oGPgLZ1HbWrukDbHYv1+L0u6v7B+A1K1IT0cvPhE8
         CibatLKmuQr4/swCKtdo5/HgvywMjOe/0bFLFnYhSxVE7l2npehH9QK9oFHApn5npZeM
         BajWMClJaHS0KOwatX+9tpy9OzIAqZ5Mx3MUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775458549; x=1776063349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o21qhL1F0H2AJq7R0qeDo+4W5IQPazxyHEY+O+IjP1c=;
        b=oS17FId1Kisvi1GbcRfBuf3h6eV0Q7H5MvOl8tLsd9KM1hYffYaUc2DfEu4UqUcy1U
         bH6os3IdaMJpum76LPlGAHkH7+2nJOmzzjK+qp/7glm61vSzoViba35CmGd8wQQTR+it
         gPpYrEy+OelRFC76RLCwJM8x56lOteB0Lu++Km21FRNc9LoYvVYyxtJ+sL6uTWmw2xFX
         ra+fUPLLrqWXO7qx0zKAwbQlrEww48t47N/5+1K7ny47SU6+UborUBtEDhJUVXqTeQ/q
         mghU+2aKCAR/y4uufeneW48VwyOcZM6S2gKCDW8u6UbB5Xl1zOASgmR0yQOGl/mIafJ4
         8ynQ==
X-Gm-Message-State: AOJu0YzKdPVKAlvJos+3ih2ZRHJ0GiQ0DkUL4iKNST+AW4whbGKNCXHm
	jCIQBwbQ6Tp6SR/7Se6Av9OUKT1vJZA4VxoqBkijSG0UIx8gAPoa1uVclYxQVL49yg2kNt9uTi8
	2gmJgtWs=
X-Gm-Gg: AeBDiesgVLpui0xBwwUD6MuSTsmMfIK6Yl9kq/8+j/rWDBV1BPZTMt6saSJ16iIR2Kv
	HLKnSXL1hoga6Z2VHU0AAdZVusZe6ezGMrZzLi2z3zxKDR9x61B4JaCwhput989JKf2hGMuJR9b
	f/mn/7Hz7tesUZnyhUI1vnbYj8CkNP4dhIOXWEeb7k+gET55iQgnYGqLAcWrn7aM+Zd4ZBvbVSS
	/DC7Xu2Wfas4R1uAXdY9UfbWFbhvtjubkb0GDGlLGbSzEZwGsAF/LQ8n8WSsXHhg+cJK4+fXTVd
	5IsE9rmEIaz+VVTYCMLrPs66FLL7KqBJBDJIvLPdNSXgRNhIG51NKEjCrqoPY9NNJbxpW8zD1fo
	qmbyJYZocT9otUku6NcMCYtt1K1eEASYpNnip+uGfBqO4gkqUCiuY7uD8B8eYo5kivY/CYaTMAN
	b/GFM9Kl1rx+PDqMzMeg1cVmFLdP82kOtdawoZ/RY=
X-Received: by 2002:a05:6a00:1da8:b0:82c:9126:3200 with SMTP id d2e1a72fcca58-82d0da27766mr10851904b3a.12.1775458549009;
        Sun, 05 Apr 2026 23:55:49 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:2171:fb10:85f3:b262:eebf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm13989650b3a.11.2026.04.05.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:55:48 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] libarchive: upgrade 3.8.5 -> 3.8.6
Date: Mon,  6 Apr 2026 12:25:32 +0530
Message-ID: <20260406065532.1259890-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234666

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:
* libarchive: fix incompatibility with Nettle 4.x (#2858)
* libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
* bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
* 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
* 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
* RAR5 reader: fix infinite loop in rar5 decompression (#2877)
* RAR5 reader: fix potential memory leak (#2892)
* RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
* CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
* mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e5d18040b0999dbfaea09b8a8a9f8a4bcac6349)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index fcfaf5d231..c984eb7840 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
+SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


