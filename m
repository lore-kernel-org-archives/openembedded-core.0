Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE91CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8234.1778224345630276722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mPieOZ3n;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-444826c16ffso1480557f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224344; x=1778829144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/tUb0c4w7uSZx4c+KOXtqc3Uk7o5RfhEr+gtebHMys=;
        b=mPieOZ3n5hlqf3VWyFNwQqbjWqGdF8EBBKPHFXiUUAItpwvePr6gDpm5OVxpcg1wfx
         aWxaE/gKLkJY/n8FaDozMdkQ2LYSSpiQljiOxHfuX6ohMiZSbLjwle19J1muMDh5ptmL
         WtDwHLSEdrvhhwUWFE6dmz2d4YEL/935xqR+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224344; x=1778829144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/tUb0c4w7uSZx4c+KOXtqc3Uk7o5RfhEr+gtebHMys=;
        b=hfyV8nLntjjAyf8fWNH0ro91KrtOr/M/Fc9XlKzsRDKC74z7pi3BI8Q0DT0I4+gs6L
         Nr+QK9RkKSzqOvVwUZGA7tQjUWbaqBdEYBq++XhJ9/CP6dOPk9q+aGtaiL/iSApWJ9ey
         dS1fwViQ36/0qFJehSU1P3YvP6ONaAHGZ+1ZX7bgQpnostFFBTpqPSNqp+bCTLq2kttt
         GaHid7zAPq0TxnLSMuJ1W6LomCjY5M8zqS8WxGt23HipM33obQuGJvNTnSjjjh9kHRHf
         OzA4A5MNYEFfVtvn5Z2+iynG7jpRqAloeQMbNWD0kPipm0w4Cg1f3x/NET5ic9eVrAD3
         V9lQ==
X-Gm-Message-State: AOJu0YxBY9xP/SfeiBrII62uCsQC5CHgNBNW+usNc8hL5Qa45bHDjdFk
	Zuit9CMUZoinRpGgdlyn64djLvKn+KKGTdhLCkbsD7IIRcU9KT7ETTZgU8VwZ2wTWrQvO6qoM90
	v8BHFZP8=
X-Gm-Gg: Acq92OF54CvO5DvHiZ6FO9vZylA2tuYFI5Fa7cs9g5RsPG9uU9SSkr5E1lWGULwyakN
	JRTMgNseQvJr8nFSAL8l8jLabUV6V4VbIn2vvRNUW3PYh69F08sJVknBecOKYeCCA2twmz8PYPS
	97aEeCiQp4dXvs5bpGBWKsFkmc2d0Rb3B++d3jvBniu/HJ+MNEIFnpEbEsfUFMcxshZP8cWzzss
	GyvUiA9JX8WJL0IwYqAEVtCuzUuTAxoMzLtSqwervyeo/pkqpqexMLj3w/iTUq+N70Gowvcq34W
	yxcGfmWIQzf/l7G0B9/tkk6gjXnVLpclRt4tI0pXAaEIaQdW+ejZQpwUy6LWuU3hfr8Mj7zORpA
	RRHR2L+Aa58J8oQT5JS8LVgSisyX7qGvza9W5w1WG9nnE5Yzoob1sSDry8wQ7Mp2MdTfn1JA/mh
	SvL+fcJEbkNav4YD0XKocLhrIn+V0oXUUqSDhHTd9OvvbTZRYHVngkl+ZaN5ExVhWkUOv+IiLfH
	K24ObQxYn44K/N+wY5pk2j0YbaatuuXPjnyghfG7lFx/v0C
X-Received: by 2002:a05:6000:144c:b0:43c:4810:dc4a with SMTP id ffacd0b85a97d-4515da9619bmr17962120f8f.38.1778224343640;
        Fri, 08 May 2026 00:12:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/52] classes/base: add explicit bzip2-native dependency for unpacking .bz2
Date: Fri,  8 May 2026 09:11:12 +0200
Message-ID: <8e4d03a616246eaab9f15b4140c95ca9b709b89e.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236661

From: Ross Burton <ross.burton@arm.com>

Currently this is in ASSUME_PROVIDED and HOSTTOOLS so doesn't have any
effect, but declaring the dependency is the right thing to do.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05e14c476823b7598ed063c5ef758d94cdc222fb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index f2e8326e39a..62f2814bb71 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -657,6 +657,10 @@ python () {
         if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
 
+        # *.bz2 should DEPEND on bzip2-native for unpacking
+        elif path.endswith('.bz2'):
+            d.appendVarFlag('do_unpack', 'depends', ' bzip2-native:do_populate_sysroot')
+
         # *.zst should DEPEND on zstd-native for unpacking
         elif path.endswith('.zst'):
             d.appendVarFlag('do_unpack', 'depends', ' zstd-native:do_populate_sysroot')

