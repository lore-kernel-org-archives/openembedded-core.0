Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00FECAC5A8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 13:35:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.52136.1758548120447353343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 06:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5vdq7md;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso4136977a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758548119; x=1759152919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GCjEciDRPb5iA+23Kja1uaPg2Ky+hZOV8bB5RpOJKU=;
        b=P5vdq7md/Ed+Yt0LepR0MoEcINR8O0xA2YJzM5DQBClioW8FsXimjEA59TMq3K9GpK
         LDmLS5bgPGSl5R033ldP1pIZDkFgKI3ld83mW8W6xrbSpHGmqYZaeXl8cm/CrDZdQpeH
         jnmiacumsWzxFGO8/c/Zs6cN9QP4gDl/b4lpA4zXV9hYDF1xpwwibEwVAD0Gjk8DhzqQ
         0+4xxHjxbmNv977+8q6JHuMJRcqTrQ/4x4poZWkSCOTB/s5DjEIZ9Bea15O7tNQxnFxk
         ri5d9GAPuaNpJX0Tvj/b86EkcNFNcPRFvEz+cehTzBc0yOhpZTF0n0NvmMR3fjokx/nW
         ITAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548119; x=1759152919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GCjEciDRPb5iA+23Kja1uaPg2Ky+hZOV8bB5RpOJKU=;
        b=oS/Be7KKQ/p2j8XxAcyobihuR1HrKkayukK4jaaFBa81I+oY+5bV1BVnxOiPuHuBFi
         UgYJo1+Ex5oDhpEQkO4ELvyhsx0rMCgJHsWGXPu4H8Gl4+lchCowD7aZZ6lOcdOf4b7s
         MayTh0DDOHLnA6ZofHR5519HAUY6f0iQKBPvYz+W210ugUYdRYZHggL5DCSR6CCi0qtu
         FsYHO6Ly463uV/RP0caPrbfPt6aJ7Li/SZOhEfO3ckwqsY/ZFzlYIz5EQKWu4W2Ztg5r
         himcWGz10d2IsW2ZEPGNV2RweXF5vrqhHHcjUgOZjG8ujmWPrBVEfXrzF5dz3E5X93hC
         6v3Q==
X-Gm-Message-State: AOJu0Ywppxd8HBIT4QvOQLnIIg2tLu7Q1lmGRvR3/RokoBpUCCtXXGpQ
	o51ubiQlP2OvuPI0BvrDQtIuHnuMN90E/IP9fTNuTVN/cFJahulT23yFVJ4tCw==
X-Gm-Gg: ASbGnctuyh2pcuu1ONE32nJrJC/TSz89dgKTZHuesXVPVWBNjHSC2BSbthZHLhybNps
	s3hR3iIr6GGyCMmbRYQcbYAPOI/MIfoI2vtBZVBIBU5SQrRUc3BQePb4AelI0sztvuU7O/fasf4
	gaMFRNx8SIqvC7sAbcrO6QEWW6oCTg25e8sZrFyeAaeSazZXaKsSunGdgLv386FFFm1eE9L4TEC
	TOksqgmnuIaYXkgIS2zKWAb9sQ9tMSwVo6m1tUn+8P1srvDiWS4L7740nH7EER2Ghj7+UrO4QW1
	Gmt+hN8CpzqeAKmawADh0lnC9gb0M6mhhTMFpv67a3bWUWYMNl6afHEz+kGTF36XwMGesthyDJo
	FQvVvKcaOh5C6VpsFg0Z1
X-Google-Smtp-Source: AGHT+IGjiV3uiHFO73ttW6tjHKWJyWi2L6/9ejMtDGKfEkHUUroi6qOEOSAzUYHs6HKopXR8mSde9g==
X-Received: by 2002:a05:6402:280a:b0:634:4e56:ba02 with SMTP id 4fb4d7f45d1cf-6344e56bdd1mr1725974a12.23.1758548118601;
        Mon, 22 Sep 2025 06:35:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f28511sm8763402a12.40.2025.09.22.06.35.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:35:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] libhandy: update git branch name
Date: Mon, 22 Sep 2025 15:35:17 +0200
Message-ID: <20250922133517.243697-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 13:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223820

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index 722593dfb1..4b3f43df1c 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main \
            file://0001-Add-private-headers.patch \
 "
 SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"

