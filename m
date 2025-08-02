Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEDBC87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:13:12 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.6140.1754169186754738272
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=vR6gxM0T;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.181, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4aedd1b006bso31972801cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754169185; x=1754773985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=vR6gxM0T/FDMl5jYtpwB6tkyWWaIeFix0TPPIDdBb9yRDAFoDQG3fQBOBahJ3MVq9C
         657XrQ5Mjt7HQKkKA2I+pyJKb+NoAhzuM/dhlP9TwaPUA8m6Ytj/ahRfjMeaWxCth1g6
         sVYsOpoEZ7G6b2Hxw7IE9aJX51c1F0IL96XNpYu8v9xch3U7ZQrGJwUEhlBHBR+jDyB/
         8q6uUrjNclOe5SvX0j/JzEGP3MyR2TMOGANMqRxy+Diclcik/dhr1a/Gwrj+8P8T+vc7
         ZA6omTFj5RD/V85XN1zGbCBemMehwnPUS3bBhtOIn04MTycGyZwbnRiZtRGJSRQW/diO
         jD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754169185; x=1754773985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=FbTzA2DhklWjZ1SX/a//+zSGG2tkQKQwItE6qtVYKz4QQjfLR9G23cedkFGQS/oPAO
         Y5IlHjvt5HT7MqiSE1HjKxQ5zl7dZbZ9Upcikk2Mlu1QovqF4iciZuHbPz34Bnaq0dQO
         ppK5GFiiZrAM/l2K6nvfdvt/YJXhnlTlp8Zcg4WvhvpoSEch4Zl0nqznt7nxe3xgUQ+J
         H+R52VNblMOD85nn6rzD5l1/6+d2Io78oslzV9vRd3Xji7mRmviSEguoKiJyTSejguHa
         KSEv3GbXe7/btwQVbG8fSJkWieXMwDonTpUItt0h63GQSfbt2wkjxXGHyoE6Qk8qNCzD
         wv3w==
X-Gm-Message-State: AOJu0Yz93b5rOV+pLdBZxo4cKLROyrnKPn6N7LqBS3fnPT7i0lHU6b82
	6DfmaDyYQdg+07DtjfUdnkoowHi/3eTWkwzHOBdLYV0LxRY8xDF4GLlshgAjRoWQXEscWIvD8Le
	BHjhDKemSPA==
X-Gm-Gg: ASbGncs7vUkGlfdlkURrMTQ0bmbpNX3le9wcsVRgtLblceedCI+wE1gkTAYFxcHbjHA
	/UPv/vTzisWVkKBUaJWBJ/FCM0fEuMKWetdAViD3xYIyKp37c/673y9OhLWB8U73b528xspDHnD
	OcPbK/1Y2XflyqJp5QmAP0VSdyabqFzKkCSoNPNCj4RIuYaK1WOeraQjb85gW33PotreocLGEbq
	fiZpEpCTWjLT2ij7NTg+Cf63zSYAtaW/qP9tkluUKq+tLzbGkTKAlR7gGFs5G5rHqusPhO6+G4x
	GJryL1dKTqE/CPA8rxS7JMqNogU2Uyu2WVlBti+IUnHRG7MEU0k7asFvglGtmSSVvBWiynTLyUH
	jNEFn5WwScazdS0bBK5oFl4ph2sk=
X-Google-Smtp-Source: AGHT+IGkH3r1QMWQ5MbbagJlSmkcCmXLtpPPD7Spafee8XSlo7CkD/Mkri1IpYYZ6BoClQLHg507zQ==
X-Received: by 2002:a05:622a:5889:b0:4ab:aa73:9600 with SMTP id d75a77b69052e-4af10d38326mr70264241cf.51.1754169185394;
        Sat, 02 Aug 2025 14:13:05 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af230d8a21sm4955651cf.51.2025.08.02.14.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:13:04 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 2/2] meson.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 17:13:18 -0400
Message-ID: <20250802211319.20060-3-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802211319.20060-1-anakin@childerhose.ca>
References: <20250802211319.20060-1-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221390

meson.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29..4f5d7b9e5e 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines qemu compile_commands
 
 DEPENDS:append = " meson-native ninja-native"
 
-- 
2.50.1


