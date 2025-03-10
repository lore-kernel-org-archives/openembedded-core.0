Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12153C35FF3
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.33759.1741599422595402946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCg2YDYa;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so22747605e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599421; x=1742204221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I4KIMMiKKqldH8nrGzmHRpYjOhYLNHgXI02WSZw5Dg=;
        b=aCg2YDYa033dCWgAbjCaHqWJdGjL3wQtu9gYem7im6QHCwhhfjwEroW7yRAg+K+H0+
         DPlx/6VRqzAifbKcnFqKbiCqnqpvxmryHREHskrnxrQ04Fk1J8BaYnSFihq3iReubOCh
         rbklfdPxKrt7J/YQCmwhpbxeOC+vWiD2Yya5m8NiPB6a+ZCh7Nyv6v51fjRng41pMBHB
         fpHCD8tQa1yBKY6fQYAH5y7EMyRzMbwI60YOkAD4e92DmqgJJqhZNp2ZRKbqbpGjXApW
         vAe8hkMSkoc+7z4O8nfmtKYCpoO1RF+RC/vFGL3NAY9tCILRcaZ4vBltJdcedrx3Ltej
         H1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599421; x=1742204221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I4KIMMiKKqldH8nrGzmHRpYjOhYLNHgXI02WSZw5Dg=;
        b=vNkqlN9P4IEyHXQdTgV1Yn/soB82IKZmBPT9QP/+RAga0QFUlEJlaoQYIl1WxRmzbC
         IOWCl3coIfVE0xRHK7f3EAlGo0U7pzmoaQh7F1aLH/ji0fuQyCJHvH5/0ZC65DIdpTl7
         H5CsmJFP6zso0NECvAJbYlKTgF0fW70HKyDQ2x8LLE2N/5K1CWHC4ErGI9I5ZOqiQ1cS
         YeauSmdA2QsZ5Gc64e+7Z+PhlMzDc/jsrLN9ZclyXTw6YYVD9h3qNXG1fkrLwd0l78Wu
         Tsy8EU9lyr0vZ0S4OVDEWsr6wcDljklPWvab7qq7UUiU3MHIDqEu2tm2Dwk5+VPmVp3p
         Xb9w==
X-Gm-Message-State: AOJu0Ywgz5lTRyvwDhTCbiP4r+8RdRaNKa45+xflFyfySBOiw2fsy50o
	KfyZFe7quWn0d0WCG6OWl/g1KBRZtD4k7WqTG1Tm1tmaxFyjJCCO7K6a3A==
X-Gm-Gg: ASbGncvZ+GSdmNdNaxabpbI9tjK0ernsJNjrWYMham2VHbcI9QLgdXGmp0/Qf1o9iw+
	GtkSiOVLagTWwe68KWAwo2OkpR1QFjov6VpECUF1dTegikcoCpqa3MR/0EkqZm9IANrXXKdNvh3
	Jie4eaypcunajYTc7s4mnVONsmyPozXUc38e5r5RbA5VxWeMUy+10x2MKpHrJL5P5NjAy5K9CsC
	8FvMt9hGkf+ZILH8Eh22SmXFQsAW3WMtSFSnSwjEu5niUGiYUaDjibG9pUTQmnr1LucM/pqQ08g
	LFlau/Rq3teZSeV0+nSq+DhsRxkuFHrPDu7j3dsJWviqRTQvq00Vzq1KTRLIdBQ19ks=
X-Google-Smtp-Source: AGHT+IEOvnAlkzoJqpf88F9IDSIS5u0QGdagMO9lGQFjCc+rkBZTK5ZVQZNwdqCOvQj7jilchV2kNA==
X-Received: by 2002:a05:6000:402a:b0:391:2c0c:126b with SMTP id ffacd0b85a97d-39132d531c3mr8654624f8f.23.1741599420693;
        Mon, 10 Mar 2025 02:37:00 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:37:00 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/7] linux-fitimage: sign setup sections
Date: Mon, 10 Mar 2025 10:35:44 +0100
Message-ID: <20250310093641.1983560-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212498

If FIT_SIGN_INDIVIDUAL is set to “1”, a signature section is added
to all screen sections, but not to the setup section. To match the setup
section with all other sections, the signature is also added. This also
helps to implement the associated tests generically.

This change is intended to make the code more consistent. However, it is
not intended to make the FIT_SIGN_INDIVIDUAL function more popular.
Technically, it would be better to remove the signature from all other
image sections and discard the FIT_SIGN_INDIVIDUAL function, the use of
which is no longer recommended anyway.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index f41509d308a..07786647e19 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -243,6 +243,8 @@ EOF
 fitimage_emit_section_setup() {
 
 	setup_csum="${FIT_HASH_ALG}"
+	setup_sign_algo="${FIT_SIGN_ALG}"
+	setup_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 
 	cat << EOF >> $1
                 setup-$2 {
@@ -259,6 +261,17 @@ fitimage_emit_section_setup() {
                         };
                 };
 EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$setup_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo = "$setup_csum,$setup_sign_algo";
+                                key-name-hint = "$setup_sign_keyname";
+                        };
+                };
+EOF
+	fi
 }
 
 #
-- 
2.47.1


