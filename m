Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E70C78845
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.18457.1726839586203764624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vlJKpBGu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71979bf5e7aso1458613b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839585; x=1727444385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcfAy984+EqRTFM8jBdoM++e3/keMm8wI/koGhS1S2M=;
        b=vlJKpBGuwbl6REgN/7rwmAf9yKtHRyYj6k3xEAzSQ0/X17gKTVpu2sWhqeDAqFhSCo
         KV43ai6eTTvIGI8zcCegb0+ZFXd55m3np+1fgP/MgOJLayqCg69nMP1mytX0FCfg/cJU
         KArqVr3o2+CdUnc9022apURbE7p/udMRsqqtFXUIrmC6VE67cboCF2hmqsXbJVYZDVWx
         BTFHjeToypqS1eQFt6DKehLvqSIwytsc9Dj9to6bGv0rUJy6xQsjb6fiILW2Ws7fg36E
         7XTOeX5pbPFK/Eqi1wWhRt00MCXXYNPJJIW0+lCsBStyY+o4n75RQTHdRprge7fVO7Ah
         fsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839585; x=1727444385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcfAy984+EqRTFM8jBdoM++e3/keMm8wI/koGhS1S2M=;
        b=WsjG7UqBc13tFcWrBnV8Pl/VfEyCnit7Azu6w/nWuNbswj5tXwBB5zBd07doXvcapj
         iMVepc0JkHWwA2gd155iM0Za1lUe3vPVXla5AnV2vDPdicdZS+2oWTacqZCE248vjHVq
         oX03o/aUVFxJfsHSGYkFgEKJMbR+sQuMhkwqE8uWBJ7GYZINJOxxbuxRjVn7v65tCQjs
         jlxqNdNelSoBhrpV4hf+IA/ATWmiPCv8DvHRM64FAyJGTxWBxjNU4K/h2ZnHBVfj4FFG
         OAG2OApo9w41DyndjOe8HsMlxwoACPtcSSWOtBKKNKATS8viHkfotDGHiqVH0LWhniuP
         5VNQ==
X-Gm-Message-State: AOJu0YxScBLDsA2L0/8GIiH6rbf77ursCiSuyA2fg6W6j7uNYfXQ69xm
	+GVnYZMzZtYyRbXqZiyxGWiFpIPum6w35/JICAoR2RABij6z8IUvUP87dJc7Lp+Wmx+Lf6ytSvp
	D
X-Google-Smtp-Source: AGHT+IHtpFHyDIOmHO2zBt87ugEWa6fbH46/Ie9cvcWQ8/EIoLt0Rn/H/YimMFOIAPxlQZiufQIaXw==
X-Received: by 2002:a05:6a00:3d4c:b0:719:8f48:ff01 with SMTP id d2e1a72fcca58-7199cd62dbcmr3513781b3a.6.1726839585320;
        Fri, 20 Sep 2024 06:39:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/16] create-sdpx-2.2.bbclass: Switch from exists to isfile checking debugsrc
Date: Fri, 20 Sep 2024 06:39:13 -0700
Message-Id: <cc24c32795e6894387a6e7ebc9b1d9f4215621f0.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204754

From: Mark Hatle <mark.hatle@amd.com>

While debugsrc is almost always a file (or link), there are apparently
cases where a directory could be returned from the dwarfsrcfiles
processing.  When this happens, the hashing fails and an error results
when building the SPDX documents.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02e262c291c0b2066132b4cb2ca5fda8145284a9)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index d104668ffd..ade1a04be3 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -315,7 +315,8 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
                     debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
                 else:
                     debugsrc_path = search / debugsrc.lstrip("/")
-                if not debugsrc_path.exists():
+                # We can only hash files below, skip directories, links, etc.
+                if not os.path.isfile(debugsrc_path):
                     continue
 
                 file_sha256 = bb.utils.sha256_file(debugsrc_path)
-- 
2.34.1


