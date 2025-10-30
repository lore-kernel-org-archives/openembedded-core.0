Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAD2CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.22104.1761816180232899859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXlRacpn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7042e50899so204795666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816178; x=1762420978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuBse5COHmNm9x1v8tvRfWeQr5mAkSNYC3g1j5uN59s=;
        b=fXlRacpnAUPl8peejDvpGeu5XbaW4Hjxr4EGYtAgQ65a3pAvfi0kkpPxwn2DtNa/86
         wRbbuTBSwUsP5ARrFre62n/lV6d9xAeT6DNWuJOQfSPPiJreV3PI/mDYB1oSXbmYNgT1
         IO06PSQgmDu+pOLoJkYRXKPonQrD6UutOSGtVPH9p4WUQyDvR7XBHKISvSSJVS+/VYYS
         8/a+HDjrgZepEoYf0I074O7AusW8/vHv0/LL/2PlQJ4c/cXjeHT8Qwqpj1ztLk2U3+39
         ucA1/Q66wF55GKOwE+fFGge/v/yfG5VLbyNda9U8V2gjJ3SZYBgpaydF/SSbTyHruQRN
         8dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816178; x=1762420978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuBse5COHmNm9x1v8tvRfWeQr5mAkSNYC3g1j5uN59s=;
        b=eyQcAq4vQcJBcT8A9P76cgZdF2rRUgIJrZiC1Ops3YcJ4OYLiK8X81ta6aF9+5+7Dn
         5Nai7p74TmQrK+s5kIVbPWEwue5cpkZhqSg/sh3e2evI5M6DEmQ+bjzxLaEXPSGlqcPl
         Y+mXVQsFoTT4BaP8yf7GaKF24/QQ/a94RjD6nEvOfIWUjAfGeY57t2uR++PczqB1vrfQ
         0uLtniGBO0aF0Oq8K70Nq1vNnTDXtxzcQnajaMZdR8eZtSB7jXfEQZ4e3PKvC0ti5K3C
         feuhXXqPLQrUzRl70A08o+JkzGHKv7nLw3ZA7n+dVVyDw/FWTtyEMi8QgE6RMAeCaqB8
         /ozw==
X-Gm-Message-State: AOJu0YxWDiUora8OAmdA2QS3V53y46VOtFCZ8ttNgoizBKEp0tBoWLJu
	qlPgLZhMA5kIYKQSfbs18kvlLWihe8iFcCPsm44y526yd7ka5zxscn6vWY0nUg==
X-Gm-Gg: ASbGncuaDwRBIVqWnb4+wszE7DuRHhJumJEhbS2Q9PJcy2mT3380M9CqMjCqzmVpQ78
	WJHfswC2u5+xyXeQ6q8ihV6xy0GcvCnLDCKrBbwoxdEynryhY4pnCWsYSSxJ0GgF6qYZ6Vu8AHU
	kVyLd/eO7oN6olEOVaZvkimtFLJvvNjqGy4Jx4piZukFqjF1V0NV9+bRAm44MeGSOy5stV0x4xR
	xfUPaZTViV1hFsR8FK7SasuZbJewk+810lzhcxFgflBfqVceM3LPp7gTkfSu0y9G/7d5NzLNaOE
	6533G2rHcko6+GnlHY5ZHMObKdH/aEb+IbnLoWjhjADpilK6/4XgcQYKNDLt9I2E6iWwl5Nu5r+
	jxEWd8D/7ELzg9nlgMkmhP+WtKkjS4wbr7MVg3UIKshvobTKy8HjNmjDKQjrplTVt3We9sDDJWU
	ZPstJnO6hwBVkQvNmEbVWoz20JEZxfZKhsvKiI7xdcn9RstRGsOInKEIxl2zCc6o3Y2URp7UVA+
	dsVlduRdMDBIo/uYwh0jfrpZTKxj2JgXBw+Nic=
X-Google-Smtp-Source: AGHT+IEQmL+1PiL0ZOwdQjQjE9iWPvU114ZiDN/WOETElUEa3Nso+rVpM7OfBftCjdVf+/hXWKzQPg==
X-Received: by 2002:a17:907:3e94:b0:b04:3bfe:5b20 with SMTP id a640c23a62f3a-b703d492ffamr659712266b.30.1761816178506;
        Thu, 30 Oct 2025 02:22:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 5/6] testimage.bbclass: check that root-login-with-empty-password image features are present
Date: Thu, 30 Oct 2025 10:22:47 +0100
Message-Id: <20251030092248.723968-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251030092248.723968-1-alex.kanavin@gmail.com>
References: <20251030092248.723968-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225483

From: Alexander Kanavin <alex@linutronix.de>

More or less all of testimage relies on logging in as root, without password,
both on console and over ssh. Previously this was enabled by default in poky
and core, but now that it isn't, testimage will error out on timeouts in
both console and ssh login attempts. This commit adds an earlier check and
provides a hint to the users about what they should do.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/testimage.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 847a6f18a81..844c0f19ad0 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -131,12 +131,22 @@ do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
 def testimage_sanity(d):
-    if (d.getVar('TEST_TARGET') == 'simpleremote'
+    test_target = d.getVar('TEST_TARGET')
+    if (test_target == 'simpleremote'
         and (not d.getVar('TEST_TARGET_IP')
              or not d.getVar('TEST_SERVER_IP'))):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+    image_features = d.getVar('IMAGE_FEATURES')
+    needed_features = "allow-empty-password empty-root-password allow-root-login"
+    present_features = set(image_features.split()) & set(needed_features.split())
+    if (test_target in ('simpleremote', 'qemu')
+        and (len(present_features) < len(needed_features.split()))):
+        bb.fatal("When TEST_TARGET is '{}', IMAGE_FEATURES need to include '{}', and they are currently set to '{}'. This can be done for all images in a local build by running\n\nbitbake-config-build enable-fragment core/yocto/root-login-with-empty-password\n\nand rebuilding the image-under-test."
+            .format(test_target, needed_features, image_features))
+
+
 def get_testimage_configuration(d, test_type, machine):
     import platform
     from oeqa.utils.metadata import get_layers
-- 
2.39.5


