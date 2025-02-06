Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244D0C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 22:57:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.56263.1738882637877900264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 14:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVq9jFbQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so9625855e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882636; x=1739487436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64Z6q2cKPGaNbZmPQNjbqmPD1L2TZj6R8px/bcYV8dM=;
        b=mVq9jFbQ45RixTymmQNDofLN+YOIwnEzvIfz634zOXR9DZJlKiVhnuTb/RnwzUeG2t
         vsERgZqhFALF0W5zpITFEyrPu8LPrR8drlR4Qn+ANBAZEJpghcfqYzFdUHg/KAnOKpoU
         CBZdQnKuIU3/WiNu8Opt5QYSsDwlVvqjsNyyeLP+DDARvhviu2xu+kmF4OAwPxDfSXj7
         i8ecPjAPMqPLHwbk3LINI7B3bi6eyF91JMD5aT9vEPl8o4PCsSggZsv0ZXyHOAXlWV2u
         4Cv+4+jT7+6sCdK55aUAFD6BVdNOIgudHHfrbpGPRyydbl2sowoXLDtlfzXHxoQavyGO
         UB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882636; x=1739487436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64Z6q2cKPGaNbZmPQNjbqmPD1L2TZj6R8px/bcYV8dM=;
        b=wql9rTqc4/f7fN0yQDNwqcSm6p/RZ2R06CHqRpemekLFutQQc9ev0TSthC6sXNpwfY
         nRjIt3DaL7X5ngvadtQU7smIlDTMDu8xT+kLiiu8qDgfn8xJ9fhv8ir0OAmXpIOXjNR0
         VtGTnJzfwnmPQm6et3V26goFG+/FCc6qLG11TDiFJq7Vp80h9CXpGm9GcMyDJEGaG1jF
         zMh7eQSI9s4P+RPAuW3kSKsKpd4xq0CYUswMBMV+sajqH6IGV4bUfa7jcIQKgkAeQbaD
         kCVLqbUqdK/SHDuWQSw2tzhiIZIyp/mEABiybPhbokqyXQ1CMRDU5K6EarkEdo2q3blQ
         namA==
X-Gm-Message-State: AOJu0YyhRKhuuNMly6JPRAYd1euDMcjAokYQSoodQkkDEvFAlEL5BRYS
	x3DUvN878MM7Qy9gq9rt6nFDIutCJGQ4nZO8KZvETOgGkf5AowcWWya3BQ==
X-Gm-Gg: ASbGncvoJL6bDHOm4BR1c+Un5W6Rt/joz+IgD0lB4rzDoGHr8V+pen3mxZ49h8KaP2R
	9/YDT1wFEHqcDWPLoR23pKvddfdC682BsSq2kPCFVIh4CMtS9AcTHhBEEL8JoFvKbhyWSfLD1Up
	2X0BJvJmVb7INcoRycjxMPOhv1XFLBABBRF0ecJM7H8ZFYK6QwD95G5/Vx5F+38l1Rl8SqFzuFD
	OFtbG0MRYn0vTsHzPuIl/p2wvBPZOWV7tlmtjweuvWwzViIeRrYKlo9MYJq763VYYnZgKQHE3H7
	1t49HkVQk+Iu7QUYoS8gQ12hRmZPQyEkJM3WJg==
X-Google-Smtp-Source: AGHT+IHfqv6A3pCwTJrfNYM8xyxVFJwHUBCy/10ZEpZmB0ff3Dfp8OpjBeElCXAlv4SA3/PaAHVluw==
X-Received: by 2002:a05:600c:1549:b0:434:f0df:a14 with SMTP id 5b1f17b1804b1-4392496ec4amr9455555e9.2.1738882635710;
        Thu, 06 Feb 2025 14:57:15 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm68737535e9.0.2025.02.06.14.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:14 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] kernel-fitimage.bbclass: introduce FIT_UBOOT_ENV
Date: Thu,  6 Feb 2025 23:56:04 +0100
Message-ID: <20250206225654.1660760-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
References: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 22:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210963

Introduce a new variable FIT_UBOOT_ENV, which allows to add a u-boot
script as a text file to the fitImage. Such a script can be sourced
from the u-boot shell, as documented here:
https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image

The kernel-fitimage.bbclass also evaluates the existing UBOOT_ENV
variable and adds the corresponding script to the fitImage. However, the
UBOOT_ENV variable is also used to install the script as an old u-boot
image, usually named boot.scr into the /boot directory of the target
device. These are different use cases which should be handled
independently.

Appending the script to the u-boot recipe and then hand it over to the
kernel recipe via the staged /boot directory leads to complicated task
dependencies. Decoupling the two use cases will also allow to simplify
the implementation by dropping the evaluation of the UBOOT_ENV variable
in the kernel-fitimage.bbclass. But this commit is supposed to be
backward compatible.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++++
 meta/conf/image-fitimage.conf               | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index fe076badfa5..bd2e371b63a 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -616,6 +616,11 @@ fitimage_assemble() {
 			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
 		fi
 	fi
+	if [ -n "${FIT_UBOOT_ENV}" ]; then
+		cp ${UNPACKDIR}/${FIT_UBOOT_ENV} ${B}
+		bootscr_id="${FIT_UBOOT_ENV}"
+		fitimage_emit_section_boot_script $1 "$bootscr_id" ${FIT_UBOOT_ENV}
+	fi
 
 	#
 	# Step 4: Prepare a setup section. (For x86)
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index be9ae301346..9be7e452384 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -51,3 +51,10 @@ FIT_ADDRESS_CELLS ?= "1"
 # Then the images signature checking will not be mandatory and no error will be
 # raised in case of failure.
 # UBOOT_SIGN_IMG_KEYNAME = "dev2" # keys name in keydir (eg. "dev2.crt", "dev2.key")
+
+# Additional environment variables or a script which can be sourced by u-boot
+# can be packaged into the fitImage. An example is documented here:
+# https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image
+# Machine configurations needing such a script file should include it in the
+# SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
+FIT_UBOOT_ENV ?= ""
-- 
2.47.1


