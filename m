Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35703C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 12:48:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.14594.1738241307399009111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 04:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=Lnj/OVMm;
 spf=pass (domain: foundries.io, ip: 209.85.208.48, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so1128201a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 04:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738241305; x=1738846105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOZ42tTeJRNQwmLmnFfY/QpHM4ey1TbIl+a3eVhKAZQ=;
        b=Lnj/OVMmF+ACQQaOqFsQqrXA5UCXHNd+25VANZOAo4Z5CfkzLU/+U2N13AYFXOIZ/c
         gS9TZpDQpg5lDQLch6MRltG3+BeTMebsV8GRtYfdO2cmnI8CyKgZvQpDhgjzEXNI6l6y
         WQlij36Jv4GS3clkBFLkZbA1InLTCyXgGSBg/ucg5osH2YUVRtpYa8T0oQAo34dVqHiX
         2aH1g31hfJYZ8BTji+qDz2NSWa6L51tDvfwUgu+C4Rd7WCk0cf+cy6vTFqfwuZqTNpgq
         6xcAsTEJc0NHgnjodN6Y/WYqTVsdMhJtzXOlL7Q9po4wEgK+FAWMeDwIOm+2CvrgQ066
         DiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738241305; x=1738846105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOZ42tTeJRNQwmLmnFfY/QpHM4ey1TbIl+a3eVhKAZQ=;
        b=gx0uhOnSEo9wFT145YsrYrkOXVaGlTqELCELfCBs8hfZHO/JsJqzigo/+dmfNYPd1i
         bIIH0aE2byveLt9gbhk3qr84wWpxotH+mjdlgr0SFyv82fuG5t5995YizZo0KYFpQGxT
         iqJ7ibzMSzolZf3kDUWKTT6XQF61tLR0YKs4W6bX8hxCef/jTWkzGE9SVZ3M/TFKJ2If
         uB0Eyy5F/HSRzdLA0gS1JO/ZTkc90hewuZR9RW/Xrb6+FU0GJkvnE/1enMaU1JQlIGhV
         3iuOiUe372zxoFET12bTKRa0vDMqBzu9ERSQHwc1YvHOZeGJcRumBI1rE221HuuJNskP
         5+Hw==
X-Gm-Message-State: AOJu0Yyvf7zAYwW3jvLtYl4+Aaq1SXCMaZBJcRW9J+aEN4wrVtiHwsD3
	+u7GREDuMXUa5Wp1eXeZhuDl8yWbWQQQvdO3MWvlKqpaKTPC3IAIPV3sN7GyRacuNCpx9S9pX24
	/YcM=
X-Gm-Gg: ASbGnctjgDHj8PT3jw+D+N1x45FneNnts7asxcBSTYEp9yuvPyJXi5w++6uwPyi0BN9
	yhHNX/r+3sgdLYyBQN81EnAal8GUH3LEo5W0WDP0nQj14bEnZOhk2NcMzIRVjHFlmJFwPKs3PzS
	lJoCYreruzkhCD+JggFwnQbuVcuVqkJzFXHOBtf7zUY7sMfud0LkFDH2bQA8JzBfk4IIp3UK+uI
	pzLcdj/OVn1BISc551ozH5b77fd+X/dGh/5gVr8yqyXh+xgqc3/eRIFPiTahyp1k/3OQFC57MAP
	eTgPrXfHA/1ZiOYNgjwjP+k=
X-Google-Smtp-Source: AGHT+IGDqMoSnmtr5a5nV53N3r+FI8XV4yRIWF/5PbkPuy+U1StWJgMieM+Ug2W18+rRfUbUcIXuVQ==
X-Received: by 2002:a17:907:6d09:b0:ab6:ee8c:a1da with SMTP id a640c23a62f3a-ab6ee8ca2b9mr129983766b.43.1738241304415;
        Thu, 30 Jan 2025 04:48:24 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7fd9sm115934066b.34.2025.01.30.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 04:48:23 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH] wic: bootimg-efi: Support + symbol in filenames
Date: Thu, 30 Jan 2025 13:48:14 +0100
Message-ID: <20250130124814.1134564-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210442

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Allow the '+' symbol as a valid character in filenames listed in the
IMAGE_EFI_BOOT_FILES variable.

The '+' symbol might be used to support boot counting for boot entries,
as described in the UAPI Boot Loader Specification [1]:

The boot counting data is stored in the name of the boot loader entry.
A boot loader entry file name may contain a plus (+) followed by a
number. This may optionally be followed by a minus (-)
followed by a second number. The dot (.) and file name suffix
(conf or efi) must immediately follow.
Boot counting is enabled for entries which match this pattern.

Example:
IMAGE_EFI_BOOT_FILES:append = " entry.conf;loader/entries/entry+3.conf"

[1] https://uapi-group.org/specifications/specs/boot_loader_specification/#boot-counting
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index c05f38f229..96c710bf77 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -252,7 +252,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
             # list of tuples (src_name, dst_name)
             deploy_files = []
-            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+            for src_entry in re.findall(r'[\w;\-\.\+/\*]+', boot_files):
                 if ';' in src_entry:
                     dst_entry = tuple(src_entry.split(';'))
                     if not dst_entry[0] or not dst_entry[1]:
-- 
2.43.0


