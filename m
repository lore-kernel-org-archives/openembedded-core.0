Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD17D58CDF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 06:16:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11461.1774246575258898919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 23:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ftVPEhwO;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c742824e1d3so1218697a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774246574; x=1774851374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcvdVEFD/V96FhRIKIsRmt6A8IiXX69hOz8DrCa/zcM=;
        b=ftVPEhwOPgu3k/U16H3b2uhvrv8bMx9qDT0B26SuWbxCBAibwz9VCOBD5Y0/G0TjI3
         /ZnG9O+e/25I/Y0KNYiQNhIGmkZFJTaJGifSZ8hxNkLVv4DXeNSMJvjKgl9fY7EIQS49
         txa/TXaDpdhWp4YFTKTTUTKlig0UUoZ/IpXkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246574; x=1774851374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcvdVEFD/V96FhRIKIsRmt6A8IiXX69hOz8DrCa/zcM=;
        b=eNBtRj4lm6PR84N4cLQXxkRfOlXuDs9c4fPRos95IaiR+pbL0ykCecvU4c4ZA/aNpz
         nKQNkDDWLKJonR3v9XckM9TkLy6bi+s3IWgC6mGKJIRkJuUEBXWx+yw/1x0nceolwLUg
         gpkQFZyssdfWW/p0gEOLlpfQe0rgwUb/eLDAJtqVhCB0ASmHHg54hk2mU4U4V4GoQRPg
         7FUX0R1lrd+AVp46Y5B/aE5HW/lih/QluTaVwrKicS31kw2oA1uqhqM4IpgQ/KRWCTwd
         mrXOdW70uPD3sx1Y5qQz4d5py82oK4NGN7OvC1NDqNJB7bQ9PqZcYnyJZNCyiXn+zway
         7dBg==
X-Gm-Message-State: AOJu0Yxz1Aas7eyluaOMi32xtrdUFlMqSnSs6h+BHzY5Q1PljHn4kZkd
	Pi0CQBwsbeLdpgiU33WUXgcksvI6i28Fot+1idqKSRKO0Bv6m41Ym2t+SnfYKWK2vxq9nRXeh6u
	a/9VJVIA=
X-Gm-Gg: ATEYQzyXnbJTty5kFK+WgEDJRdFBUkKZowaMHz+7IqABnAOP8FV3UKoIDeqD5yo4WGD
	XCIf3I4b+2Mxbg+YDlpu1Ix8lrzeJ7BYFXChcf/kb0xbs2gZTnLE0TGIppAk3rH1fwK0bK5Mkfw
	HbcYV1fxdJXSqscmaR0bc9et8vpbBBdUheJQ6UzsAp/wzPitwqJFFVTuUDYCjbLgDkLQA7L7YZk
	EdQBXGADylodXEERdlKR2cepb1puKReC1pw6Xg0dhzEuhfAUAxvze/o4zn7i3jMpcaXhYEv5E9h
	JNyMm/Sj09dVJg6nZEC+G3iCYR7ARZQy2iuIMfVu5bBaGKidtbhC7FoNGeXM98RUpcCflATw3Uk
	6wDa/IyUtHZ2aVtI3L+Y6o1CYCnAVpyKD3m9WIUyctzVT7EKvZk2+ZRMzTU0qDClWL5uOLcxdAZ
	yaD3pldehI5uRmMhTufqLCRInIbm1exeZXghVB
X-Received: by 2002:a17:902:c408:b0:2b0:6df2:8cdb with SMTP id d9443c01a7336-2b0825e83b4mr106339895ad.0.1774246574117;
        Sun, 22 Mar 2026 23:16:14 -0700 (PDT)
Received: from MVIN00016.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm119829955ad.54.2026.03.22.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:16:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Mon, 23 Mar 2026 11:46:03 +0530
Message-Id: <20260323061603.38060-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233702

From: Vijay Anusuri <vanusuri@mvista.com>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index bb81d77ccc..1c08d4b102 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
-- 
2.25.1


