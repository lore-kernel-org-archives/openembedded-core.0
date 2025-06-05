Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D31C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:28:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.408.1749101323972143421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V403fOWJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad89ee255easo103159066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749101322; x=1749706122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxbfg/VcZLCzPhGBX8kQMXh+fGR54mBUpMSL3OScUTE=;
        b=V403fOWJHO9NNdnu6Gw/Rhj7sSf8BWMp41LMFfO3hZ/+hpWThpS6wfmKkCXMS+l0dZ
         liPZdfutgoYxCERcj4XOqEulDnsG4GrCYtnwjrZ0NvsCDMDCdaGuD/iXsfPlziBW2Exs
         vQgSpJgxPr3V/OAiio0pQ1Pn3+BDqOZqgEwcuH5FL51WiFx+uVM/gMP5bmdPSl716azl
         kMi646CvxQQpl5stbfepX4A791fhIj6OxxWa1O8yKs2HS93GryYGJ9leDQ8guu3vnCGR
         zc8URkl+MUU0R/uC817XuZJQe+24SXysZKIlKHQ+l14q6hbUFYC5yqCnkBxMEvl/xtnX
         ePXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101322; x=1749706122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxbfg/VcZLCzPhGBX8kQMXh+fGR54mBUpMSL3OScUTE=;
        b=MhM2q+eQ1P92dm5Twvl3lfP8bQhybDj4Tu8X5J23vkVv9RAdRq2piCragpS1NSPIRY
         xr0j1pb1cE5Pq4IBPPpKe6z8umH7XcwltcKT7s59BzQRQyYgSYVufkwnJdpWIPg5+JPT
         mBGMM5JeNmFvB0kr6PEPCQ2NHlY8OBGF4W48AM9+Wl1kcyYENdZHW8iK8KGTN86FZ5dV
         bJR3Ua7a8lA0NRNzqZaWhji6FMhLIVcDqdtUOhnj/MC6dyZ2xa+jK/XHv1Sz1/PIyD2Y
         93IHhJoUfOXuU1DAkixhz6dCTME4dM2eeIa9ZWITXkPxqToVS1BX9xA+Wg9zcS/iyZ6A
         xkCQ==
X-Gm-Message-State: AOJu0Yw25Bv+WQPf+unnWm3nGEz6AZsl7EKmcEe1aHJ5RqXAK+VvNn/W
	fM1EN+/bA6JacgzpQhznR6K7i6OCUOk+3O0u/MAzXwxNtyycqVt1CUthz+0HC4JF
X-Gm-Gg: ASbGncs+Su2rzbE7f2RkyLLTk4WhK2oa8Fu/orazoGk63MlCAV2vuMDgr1awFWnmkUx
	eTv9WRAMWH3NDRTQCi0T/R8vhYqJ4hicWTOp2nrZ8pSvuGfrEqJTMq+U9kY1B/hY5NHa3dkjICW
	4uVDeqUnv2nN9u0Emg97GaaXqFsV0RFN3gGWTedU28BUta8WncYi84Z8SsC129ZiK8IkLqojJx6
	ZS5vFsBqaNuqHfRUx2stPPTd6DSy9Qf0qPxPPielJTtqx3GEuXGdKldOi4hfgUF3bQydVyta4xh
	wEKstoVRTNwsAaXGR7cVTt+Tj1PSvrmZX5Jfg0PjB6DeKQITFbhkX05E5WwBNFUV+Nc=
X-Google-Smtp-Source: AGHT+IGWc8z1mvCcq3VhB7DQHt2y/thGDyKJT4StkxyRF74oz3AnmaYbBDbRsUPx7G4jJkIw2QkWeQ==
X-Received: by 2002:a17:907:a089:b0:ad8:9257:5728 with SMTP id a640c23a62f3a-addf8d1d859mr541105166b.27.1749101321958;
        Wed, 04 Jun 2025 22:28:41 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2cb16a1esm1101134166b.5.2025.06.04.22.28.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:28:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: upgrade to latest revision
Date: Thu,  5 Jun 2025 07:28:40 +0200
Message-ID: <20250605052840.2154843-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217983

Changelog:
  Describe front-end pixel scaling in devel.but
  js: handle most of the device pixel ratio in the front end
  js: replace blitters array with a Map
  js: index blitters Map by C address of blitter structure
  js: trust CanvasRenderingContext2D.drawImage() to DTRT
  js: unwrap most drawing functions
  GTK: avoid explicitly using Cairo image surfaces
  Document getenv_bool()
  Update reference Git commit in devel.but
  Remove BLITTER_FROMSAVED from drawing API
  GTK: correct offset when copying backing to window
  GTK/Cairo: simplify do_blitter_load()
  GTK: add support for using a GdkFrameClock where available
  Mosaic: make solver notice when it gets stuck.
  Mines: put a warning on the web page about bug reports.
  Palisade: preference to clear complete regions.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 15f6979bec..23eb20d350 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "7da46412223273b3adf6d513466342b9d3a5c869"
+SRCREV = "7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0"
 PE = "2"
 PV = "0.0+git"
 

