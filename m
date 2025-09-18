Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E30CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:11 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.669.1758230882562739346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ot/V4WnR;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b7a8ceace8so16519031cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230881; x=1758835681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5G0izAOMBB34tEWiPkQO9hn16nlggIYvJ6JCBpvfGo=;
        b=Ot/V4WnRipK9a2/5PG5Y9DK3VAxmwIfmdqUp5lGLktEugm82aFrbX4JkIyLnFfGy2B
         b4rbbK+Y65q1asINlRa6fU279s08Uoi4NNQ0AIzzPM5OZHiLgxfmQBQJ8l0zGbW5J4BS
         V7ZWxMIE5wfaytyRMrejcAJAM9raSzZZN4Z0gUJnJtqket5oq2d6B/YwmRuf61i6JuF/
         6aT1WWK8Af4WU8iNaN8z44Gnn+bN9KFUvC/QDZjijCSQRaL4J6KHDryeA/26iqC555r4
         WypDEvHdfpwFlTje+LM88Fm4Y/2JtaCy8Ubi+RT0EsKoOSVGdOCic00looI87kmqgl4q
         aiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230881; x=1758835681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5G0izAOMBB34tEWiPkQO9hn16nlggIYvJ6JCBpvfGo=;
        b=HoROeyJSeyxcPJ/APYv8jPLzBhh2A3xQBOD6S/Xju24uQLvT4hUEzV1tTVztNF0sAu
         22rW/A5CSRS7C4j5/IqqIDDNJ6W5Bh2rfUVZpS+r0AizWkrDTHnokt4hGE+TxY+gQJie
         Rx09E0qEQwoCUi+6bumRy2oOpKMF5ZugO/5PyF9Gc9XvBsSZn5wTpoUQLZhDqf2vDsEY
         rKo8xhMoj/OXhOowuDx+PT0RGHdHAZ/22VPZGmk7sA/EXnsLZrSNUxxNqHTuXYulSY0A
         7w1xrbNi/uDU85U6opm2caRzitnq8E4ePC+ge88Y/Pgc2GqmIShyHukv99PoSYajRqQN
         I1kQ==
X-Gm-Message-State: AOJu0YxVZUDh2oQQl64rhlz1J2PNq+0gnaxXDkWxZ4V8JENtJJKiNVex
	kHMOwzrT+VSbK7OLNa77fviPDqYEq2/Dstr42qRnc5obxl+6Sbv+XGpKQeagQw==
X-Gm-Gg: ASbGncu+mO/ucA7miEhmHowYfyoqF/r+4RRh5uS1d0YYSRHiPaS1uHE6fFompnV2DlF
	xxo4hh4SjsBbnKtZqiwizhNuKtL52V43ALCDD/ESdyKWS3nSCE0g9Sfo1duZqPym+bR76eyWaPn
	m91IUqPvLlkiTErwG7E1Qjz5aHMZlRzyXPUsnLH/UaPjmeh2Cd6VFy7WG7ztte17NvDzcFmGfI6
	FWU12LzqvvH6dQ9mB9AVc+05e1lYW6qMPTNbvv/YzJu6rLoipExq95pDnuUDGx1JUN7NIDPLwQ6
	zMzcHP9Yx+gplDWvTrvny4u2G+esYdrG3Y+ZZDg0qoN7u2CkvUc9YzHvayVx1aSw9J7tqS36YWD
	+rnH1348etAVuNrqpODO2G1dUSpu+Q3/cvwyFniKD7cL3rrVJRCEX3P38umQahZnzWdhMNMiMeV
	GRTdE=
X-Google-Smtp-Source: AGHT+IGPBtfEfaazRkkoH8FiPSJmJ/MvK9d+tQjMh+lvoyrMg/tmQhXvApCTIpi+Q/Qka19qje6r/Q==
X-Received: by 2002:a05:622a:a953:20b0:4c0:e6f4:d5b3 with SMTP id d75a77b69052e-4c0e6f4d751mr628011cf.58.1758230880632;
        Thu, 18 Sep 2025 14:28:00 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:27:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 2/6] patchtest.README: update name and location or patchtest layer
Date: Thu, 18 Sep 2025 17:27:25 -0400
Message-ID: <20250918212743.3960-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
In-Reply-To: <20250918212743.3960-1-twoerner@gmail.com>
References: <20250918212743.3960-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223681

The patchtest layer's name and location have changed from:
  patchtest
  https://git.yoctoproject.org/patchtest
to:
  meta-patchtest
  https://git.yoctoproject.org/meta-patchtest

Update any references of the old name and repository to the new ones.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 1c674e23c9ab..5a9dabc50b44 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -20,8 +20,9 @@ which environment you prefer. If you plan to test your own patches (a
 good practice before these are sent to the mailing list), the easiest
 way is to install and execute on your local host; on the other hand, if
 automatic testing is intended, the guest method is strongly recommended.
-The guest method requires the use of the patchtest layer, in addition to
-the tools available in oe-core: https://git.yoctoproject.org/patchtest/
+The guest method requires the use of the meta-patchtest layer, in
+addition to the tools available in oe-core:
+https://git.yoctoproject.org/meta-patchtest/
 
 ## Installation
 
@@ -43,7 +44,7 @@ To work with patchtest, you should have the following repositories cloned:
 
 1. https://git.openembedded.org/openembedded-core/ (or https://git.yoctoproject.org/poky/)
 2. https://git.openembedded.org/bitbake/ (if not using poky)
-3. https://git.yoctoproject.org/patchtest (if using guest mode)
+3. https://git.yoctoproject.org/meta-patchtest (if using guest mode)
 
 ## Usage
 
@@ -98,8 +99,8 @@ from the mailing lists. When executed this way, the test process is
 essentially running random code from the internet and could be
 catastrophic if malicious bits or even poorly-handled edge cases aren't
 protected against. In order to use this mode, the
-https://git.yoctoproject.org/patchtest/ repository must be cloned and
-the meta-patchtest layer added to bblayers.conf.
+https://git.yoctoproject.org/meta-patchtest/ repository must be cloned
+and added to bblayers.conf.
 
 The general flow of guest mode is:
 
-- 
2.51.0.193.g4975ec3473b4


