Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204F6C369D7
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:21:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.8583.1745414462642259813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zWyCvCRi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5981757b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414462; x=1746019262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIppv16m+L3aEcW2mqJyM23Ac7vhAbb80HVHp80vzdM=;
        b=zWyCvCRiaPl98jqqisn5gvRX7Qc6kStzHOVZfvcRUURCLWrlW9WBounKMYMz7eUo/E
         qxNEoi7jHOqiU+DzUfhAKwR+v7H9IYqNWMl+7YLLuQHURQfgMNl6JqzxBlN/FoPbTVY6
         LrtgqjEJaEeFkA78RMFZeT6pjFU+RhxvkFVd7fSQBe0Pnvd9nQQBGrZHfqc1Q2GnLdBA
         hqVCDcJ4nti8ZKlDuDEljSsuct7SKYm+EfC6RoIbleOPdK7M+qtpu3h/1IYP204+foly
         CvOJBKR8eTnOJCxn5y65UKJyrx8FVNbqdZGoCpvgWn+pAo9XBeGE7OkBgNG+rq4UV0/0
         djcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414462; x=1746019262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIppv16m+L3aEcW2mqJyM23Ac7vhAbb80HVHp80vzdM=;
        b=Mv2NSveQUb6QDbUsZCsR8E8+lAZkAry7QcJY7ywrmuHzqGyd6KcbyDrdVExcF98ERO
         dK6t2uCapE3MJo+lJt2lzG33gKo4mcrc0aJZnrqKFmtefIcsCicAVf+QuT16FKKeX+3i
         R2U1CRjgpQN0b50umnTYligb0lszgVzuiiLPMvNK0pMAX7V0iEiD0MJNOYjdAtaITW0g
         oWDtRgAsfZKXqLWA14x2ex8Bt4mXVP85JHSXDk4En1iAIAGPv/8p4il6btCORg6F8qJM
         HwgZglB6QKywYLFfdlvEtRgpRq+WKkFkVWDXRZ/977RJtpKlG/+wgT1XrzGOoZfhbPvk
         X07g==
X-Gm-Message-State: AOJu0Yyd5lgSA0gODpW8KhdzxXnO8iMWyawbGNCERPR2Gq7g3HWX0DBA
	Wj39/TDrkARxqWKLAEL/XfUWuukCjM/+9DTRUXw3KmPGEjwUZo/2nycuzOMGK4XVYRn+j8oECUg
	L
X-Gm-Gg: ASbGncvacRb6jFnjQRj51/zKOrslAxgqPLSi7Vcr3R7toZEx6/59is71WfdgFIrr0t4
	Fk7KEcCWSBG8rOVAObabXN6yOBH7pthf8k7Ba10e4zlw0iyxaCeaWkIjcGMNo+VaVAzwdAylYWX
	l56xnACP8C2AsONAUdqTGtlw1BNsz8V1JsFi7wYYCclqYFhXKOV+PSKf3ofDwcTbNSN4+d02sUt
	jjgM+EaAVpyaFsrX4L7FYIVDj8hkvSqXfKIE4xi0wa35X7AW/z8M80+/Kk+pYL/sPSGzaLMpe1Y
	OaU+KkQc462briKaQulNVOoc43CoXUI=
X-Google-Smtp-Source: AGHT+IHkP6m+rYWQmVsQRhuUqN5LKH3pd2YPy78UHniygGz6Yb5kRycqyUi38gZkRiGodEYbVsztUQ==
X-Received: by 2002:a05:6a00:1d81:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73dc14a934cmr27693293b3a.8.1745414461909;
        Wed, 23 Apr 2025 06:21:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:21:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/14] bluez5: add missing tools to noinst-tools package
Date: Wed, 23 Apr 2025 06:20:25 -0700
Message-ID: <87cadf62ba0d6b0fc3dc0151a5d320919b7eb1ab.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215307

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.72.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
index 9fda960ea7..d64286ef6e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -46,6 +49,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -56,6 +60,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -65,5 +71,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


