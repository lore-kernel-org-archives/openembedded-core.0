Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBDEE77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.25347.1733345135274652587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JayOkzfw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7253bc4d25eso204766b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345134; x=1733949934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md4GJCS0QBd4ewVrv2P1vwcJW4mhyIRlV6PtPj8oRbE=;
        b=JayOkzfwlfJLtNScpsCy+weV3Fe8b7QEKa7hlDCxNImCYutEhiCkdHgWZyGjWstuFU
         JP/KvFFMZdECgIXbqEbA91ifPaaAhOtWztVYi3OJOfnbZUJ90nDVaXY092UrZs27i8jt
         2+2Na1iAF750N0baPV6a/j3GpKEH3WWmYVx9+VLTNfLMS0+ClIjOSUyzN0x8ENHm4LtR
         8dZFbZLbNHzQcKR7gtFZxNZbeBqzW8/Mlz2TVRtamW0n3RQMQY8FiQTeg+7C5AwUV+3W
         ywiP4GcHl4W4BzIrJ/zQtTbF30cvFxMOGy0YsW+lK7fR5i8V4g3o5wclyV38K3tE9l4B
         vBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345134; x=1733949934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md4GJCS0QBd4ewVrv2P1vwcJW4mhyIRlV6PtPj8oRbE=;
        b=ZDWNmJYGSrRbhOdTr0s8PeolGvDSwj0aj0RpZoMl+eGCF42ke3xSThT7yr/IGVRvDJ
         B3TS6NHNyHxAbo86xQIiryaafNowd6a21axnXXMs9FhtmsRKCWMUcMkGs1MEJWknanLf
         dc3kn0Knm/HHo3c12vp56U6uWGbmoVHYkuHb1dddrhz91auq05Y/tm1Vr6sca1Wy1dxR
         J48EM+TtyrEq4cUDKwOpi1pNHTsmygbdlnHdMB2zdLSUyUODluOQDpGc88gt6EDG7SIy
         qdx1UDYah6906VQM4zV9Vvj26fNueFgcxK6RHaOAobYOfyIQWHXYSf+lYujhgO7Vp5g2
         vVZw==
X-Gm-Message-State: AOJu0YyX4sNet05Gul+19OWyQgDD+7oNKRrxJwHGHDheq70HGd7ZX9Af
	ej8fgVcC+SCD9ExPY+NRonAWcma+ixUiWb9fIoUhvjGaDUho12PM/MrbQIjXiH1e0Et7T246CPs
	V
X-Gm-Gg: ASbGncvppWvV1MhhDTXswWaGSYeFHzI86imH8ieo61GdXA4Sutl9QomY172dUZiq3IM
	dCnMrUKZttd+i81HRN9DZGUWFdF59k5nenys0jJdnF0nWVxgi7qhfb2gMeP6myTF138JbnagwBB
	bcXC3dXxeIGpIZsqOjdd7vn4QCCsOMgjrepVwb+TIVqfb39OuiwxCvlrzyeMGskPO4P7s+eg9zV
	yHQkbOplJRvZiTepYGJ+jzbu7gvvb9PwH4zigE=
X-Google-Smtp-Source: AGHT+IEAIr65dIqFyKbImaKmxrcwbvfBMY6/4rlEfM23G0yKGzsKDzq/HBTI8FzATBKYOEp5XR7XpQ==
X-Received: by 2002:a17:902:f70c:b0:215:44fe:163d with SMTP id d9443c01a7336-215f3ca1a7emr11104065ad.17.1733345134438;
        Wed, 04 Dec 2024 12:45:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/14] selftest/reproducible: Clean up pathnames
Date: Wed,  4 Dec 2024 12:45:14 -0800
Message-Id: <40b422edd954eeb917464e6baa0e952d2ed4184c.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208349

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several problems with these paths. Firstly they contain full
system paths which depend upon where the test was run. These are pretty
pointless and just take up a lot of space making the results files large.

Secondly, they contain the same path twice. The reference and target path
will always be the same thing in two different locations.

Strip off the prefix and remove the duplication. This does change the output
data but that can't really be avoided. It does shrink the results data and makes
it more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81a44de36e864b08687451fd85aeba7c529fd7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ed73184b37..92266ab66a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -205,7 +205,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def write_package_list(self, package_class, name, packages):
         self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
-                {'reference': p.reference, 'test': p.test} for p in packages]
+                p.reference.split("/./")[1] for p in packages]
 
     def copy_file(self, source, dest):
         bb.utils.mkdirhier(os.path.dirname(dest))
-- 
2.34.1


