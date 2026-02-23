Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA35EA4FDC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:36 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37894.1771861173058453479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=rC/5j3up;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a3ea5133fso440987a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861171; x=1772465971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYkAelViJM19AMnkPZT0mCiXmsDdz/KrEytaKVlQ6ic=;
        b=rC/5j3upBQqFM1eqT7Ofh254+/iniTfLMy1tZancjQggyYhpbg3xUOVlWHRy+Loaad
         VP1u7zw6M5U2OCCc9X5p+GRVhWH8Ey00UpNXbmiXPLDYK7mal/pV9yVubF2rYfUL/50v
         /Vo3Y3dGf7gRC9AZCA4uj6Yzrp8WUPEo4ftDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861171; x=1772465971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYkAelViJM19AMnkPZT0mCiXmsDdz/KrEytaKVlQ6ic=;
        b=lWlxhL+QM4ChU0Kw5JYizZL5jQyHGPj3JYQWopmCphLcb+0qarHCjkxw8BW6sFnzDA
         F8xhie7MiZxfX1vkwfW+TZzTK0KSHKITQjTsiyaQkkJXoSlW3jUboCRVu5t0h+nAysI6
         gVXrj5TUViaj/iypERJhEg0hNggyOcVegwxHVU0sfTpvRyrAYJgYKvefguB+4aGLy6iZ
         CSVZPvYLIOAAMmNRGT847Yh+UnnvlO/7Dyf5tJVgy5I4skg61YT2+1vadpjZItTxi2M6
         dTPuK5GEyP/RqjpLVOJUke60O/dNZy/YESQY60+Jjl0Ni351ku3PoG2CckLmYriSlP1N
         1wqQ==
X-Gm-Message-State: AOJu0YxyhM483TIT7fCuNqB4Q7f2i2hMe+shhDxYYmcNGHdGlxb5tk6P
	GyvgUwMRzOQnwsYXV2SAwZIgXpr0Tnw2Gh5o6IG8ltnyypmi65VB6EkdzucsEKpQMcUWtFTLeNM
	oM92BmUU=
X-Gm-Gg: AZuq6aLKXOFJLb2dOMp9PcJphGQ1ZOwbesWgKqFPjzBFsbhSHq3GE4zbRT0eTVVDCDz
	pRlfw4FmmWYURMaDO/WxVUD0IsmnmD9+yl7jtSsscaRTwpfyAgKk6Pj3i3edpJJKdu3NraV6zGf
	WgUty9BDLzJseLRAgEOljDeGBpzS48IemfGiSros1d8Tq4lwcJblzYpSEyAROaA5HmDo114Goa/
	uaaNXFN0vwtWTvrmsgd3Zu52bx2KzSbhNQTi88ZS1ZEq7ukzIipVPDSLPOslQeLXipUoDILzvUP
	mwbnAjfrCAin7jE5duC/gfdK8Jz1S4DQAPKOHcwrnyYmDzk2BnBRMt+O8iBixSsz3FdQ0SLawR3
	FqlspkOy4Hd//MwvSC6LSiuHTxS9PsDI5xA34lLDFk+ll7YJ6/jIPkc9VMaZmn97I7bzQa0ZMY1
	LhSUaQLmrJNEjT2UUMwdz+mvROyrmqVYeEwBZYw5EkH6n12aba/ZB4mxV8T8w7+j+kz9cOSbz1j
	fLqYlxYB6juuxHD1xf79leV4vGBILfoG12kq5LMcvqA1wVCX5yZcfi81FyJ8wT58M+RwA==
X-Received: by 2002:a17:906:fd84:b0:b83:95ca:22e1 with SMTP id a640c23a62f3a-b908191f3dfmr282419166b.1.1771861171262;
        Mon, 23 Feb 2026 07:39:31 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 1/8] rpm/rootfs.py: ensure exit 1 has a word boundary
Date: Mon, 23 Feb 2026 16:39:22 +0100
Message-ID: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231673

Currently, If a package installed by dnf has the word "exit" followed by
"100%" in the log file, the rpm/rootfs.py regex matches a failure thanks to
the "exit 1"00%, such as the following:

[682/932] perl-module-test2-plugin-exit 100% |   0.0   B/s |   8.5 KiB |  00m00s

Add a `\b` to ensure there's a word boundary to prevent the error from happening.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v5: Add this patch to the series

 meta/lib/oe/package_manager/rpm/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 3ba5396320..698685c067 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -14,7 +14,7 @@ class PkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
-                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|exit 1\b|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
 
         self.manifest = PkgManifest(d, manifest_dir)
-- 
2.53.0


