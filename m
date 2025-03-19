Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61505C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2931.1742372201638915240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXrfhqR7;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22438c356c8so113245745ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372201; x=1742977001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=cXrfhqR76ra6RZA2RRLc7pNolrDJmhDBievsMOWyaL3b1lON5QgSPDYq2YG5IitOxQ
         EtpyCStvM8pz83iKCBU+/l57+l+j/vEM0pvEd289vnhdScT2UVi8imItHcwBmynSVnDO
         3k/n3+5/eHkZgK3/sVqZNNXFpbN2Gr5w0kOS7cZ+l65x+Ly+BA9YZXI7y7t6pK0/Z22O
         wbBStTtbXHP3WqeOYKXkb8eq4kqWuM1XMeIeuR21s421DLLLjZlM9DFbREUIqjlifS2C
         a4IrRP6b+RWVZtLhUkUbFqHO/d/XWlebX3YpWF/EhiWqYV8VFzLs2Yw6aVJZsq01RS8u
         4Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372201; x=1742977001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=mOLffzCExguCcQCBA7H4Fo0YT8LHbdd82GmyIFFShTklZdyvnaPz10jc1b2IEBqdki
         h1TxhCW5aaWaWGPrhlHfIiPjvOFOhG8Fu6sh241kKybsE/ovh20mtPHGBL1cPMjm6x5R
         /B6TS4CV11i3hX7cXKrGXBRlv4enNSY/rcTwz2YsKF9SywbBXcF3XA71Vh1Hv7k+tRYT
         L+wQA7+e9fII4EaJQc8hhnCZczY1jR596eWU8LRd9oA8RmiOLUG0Le+iY0wwTgo4atAJ
         KxZPrRJjRRB6c8HoaWEmOyNrgP8HC6oZqAQpJZE5TWQk0Q/SlcOJvLeekBBg1CDOiRWR
         YNIw==
X-Gm-Message-State: AOJu0YyEmE+Eecm+oyvQQEMHXN3in9F693GYzUhYYMgOmrQVGWDJKSJF
	aIGnogTR7cCg9I5wUNfm/smfpizb/mOy4PSmmqfEGL7Y0svUEHKbaDCgJVGd
X-Gm-Gg: ASbGnctStvx8d3RDyKeu7IMsW1ZbK9GpRO9qbY0IWsolu+5pd5rCjLnaLCgJ+BuUCqR
	C2QO33ZTIOv8MuYwGOo/osL2DxxIEzCVY1+z5lbE2YKEQIlqtw+ewliivTuxLtdrM1BvuCKJ6i1
	lcZ7FqI3VRIWQ9RaZrMmN2A9qp4+ZRpQnduDEczXbD0xKTd9Os4W8PtwMOa8kGuuSw1zVmmbwll
	VRxouh2wX9/DS3Ri/cnBDb/JEWn0DeFHDb6AuDtoFX0ADZ35JVZF7GHweY+HJ6eWX76QvpiWF/9
	DvZyJo4oMRK7BgOFoMD2N3T/rbawwNT+QWE3
X-Google-Smtp-Source: AGHT+IFXG2+WjqD2gfmx9CkN833JLxc0a9jhQ0D3eGn3Kl7hTNBrq3dt5l8jUChJJPTWH19cJ9LLAA==
X-Received: by 2002:a05:6a00:8d2:b0:736:4a5b:7f08 with SMTP id d2e1a72fcca58-7376d70ecfbmr3069419b3a.22.1742372200839;
        Wed, 19 Mar 2025 01:16:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 22/25] psplash: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:16:01 -0700
Message-ID: <20250319081610.3536475-33-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213299

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-bool-if-using-C-standard-older-t.patch | 32 +++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
new file mode 100644
index 00000000000..cc5f2e02e65
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
@@ -0,0 +1,32 @@
+From eab6948cd8eba493f2af7533a931df5ef1d30715 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 20:31:19 -0700
+Subject: [PATCH] psplash: Only define bool if using C standard older than C23
+
+gcc-15 switched to -std=c23 by default:
+
+https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+only typedef int bool for __STDC_VERSION__ <= 201710L (C17)
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/message/1213]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ psplash.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/psplash.h b/psplash.h
+index 1c42ec7..138e49d 100644
+--- a/psplash.h
++++ b/psplash.h
+@@ -37,7 +37,10 @@
+ 
+ typedef uint8_t  uint8;
+ typedef uint16_t uint16;
++
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int            bool;
++#endif
+ 
+ #ifndef FALSE
+ #define FALSE 0
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 233c07a380c..e47c9b408dc 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,6 +10,7 @@ SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
+           file://0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch \
            file://psplash-init \
            file://psplash-start@.service \
            file://psplash-systemd.service \

