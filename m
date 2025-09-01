Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C66CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:19:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.39928.1756686133104250517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 17:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVSGjV6m;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: m.kurz92@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so4480540a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756686131; x=1757290931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqoBFMLHVKZCn4kT4QMg24DVo2OYoYyUUtYMjO5dHRo=;
        b=gVSGjV6mSJ6fvISy7jdUrGH0NsYoKJ7V4OCGrBLVkxhMrJxjIaYk5PPwSr+5nf5fyC
         zg40Xd9OBwBfSBOwEMpv5iCzen0Oiy1nx697AEc7TXPhagujAli5Fhz17/MNVUhSltvv
         TGYCPMVG36BVqIuKZX5cQXWfu/vi2ImJzeQ05kX/IklMd6R0Uj0zDuFh640VgTgdUwmy
         7/cVCZPyc9RslNsxgARB9/BuEDHCb9QWk4BIUtaXrsQ8+hsGlhuwMQ7Uqhm7TPJJh3k6
         +zS/upDzs5OiID+3XalTE3+ASvqG6iG8QIWzdXXYvFkjmeCua1AMtm5H026JGVVIT2q9
         PaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756686131; x=1757290931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqoBFMLHVKZCn4kT4QMg24DVo2OYoYyUUtYMjO5dHRo=;
        b=DkoI0UnDMvGuz5FHhD/sXD4rYx/U+FuPmVnRsPtDNNeh8A6BAitJz5wxvybKaVDLwF
         yNWXH4SXhBslBKseSwz8mCW+9AGz89OE/EUj6euBxmU4Kq1m9BUOM1CaSUBc9quPtpwU
         or2I095Itv2SPMIFwgase0AAu6uaOSO/H8i9uvBDAt3DvDNe9RwyNKI0DQ8dZW9NlB6N
         mwg6YlkAl1f9dz1MkuYsODwIyGIhlgmS5Zf72H2oTFaCSzGTIAuqYv1VuOwt1NgjQ378
         /Zn8Lo5WK3CgXZJdfi11Z7tTiRdtis9ErQgGyqDZL/RUrRJV3beDuGGzFu8rlOHjeStS
         cQrA==
X-Gm-Message-State: AOJu0YxmKW9lKLrvKTCoJMVwfDuTiVmab4grAAWOiQSYc5L0dbUb5TbT
	AtnCteszGjRb4XAfgelYaRo4N3u/Ue+9SrsLu1gvOiblOhkkAEKJwpBWS0TSxsw+
X-Gm-Gg: ASbGncsMdkrWowDBKjuvL1nx6hKoO/qrMIZPaDm+9xzjkMaZWHk8AQG0vVOB1L5fv1A
	3aWEHg0o1BOpJh++pDB13GiGD1glgSdt6NVN2OeH5c+Bz3N4LVpgygn+h3DCiDypqCyJr2CuUoA
	tClZzC2Rpxk519Es/oiKDbw7Tl4ccgCF8tz/BoRdZE9lC4QfT3ayz3NKKZ8thJ2Lw19YocKz6Eu
	I+cKh+WtfXta4jX3INuopvNSd113SxzDY80whZDzl6v+88fFlNTu80sy5Kp/tFQo+r9ui2dCep7
	fKRd/NawYZ7NAnArYs0loAv/Dr29ZLlbLCr1uZGkPS7/kx8Ct1c0b1/N63RLZ7ONEExusbXXU3l
	j79qPT0VdO6tFqUbVUW5c12RNdwlI7zZLwC2knBh6SqPgBYoqYTMv/UviIJihzTzB2+WQ1VldsW
	BBkfktIr2B7mPQVeukrHXWa5R1d5aJ6g==
X-Google-Smtp-Source: AGHT+IHn7YzJdc/8ObfBlH8nMCA1y+xQaZL7a9Y8lT2dKH3a43w5wlTeL0cLrId/eeaV018P4NNOBw==
X-Received: by 2002:a17:907:1ca8:b0:aff:321:c31d with SMTP id a640c23a62f3a-b01d8a277c5mr564250866b.7.1756685640585;
        Sun, 31 Aug 2025 17:14:00 -0700 (PDT)
Received: from pop-os.fritz.box (ip-046-005-139-085.um12.pools.vodafone-ip.de. [46.5.139.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b016e56a4e2sm466971366b.26.2025.08.31.17.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 17:14:00 -0700 (PDT)
From: m.kurz92@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Markus Kurz <m.kurz92@gmail.com>
Subject: [PATCH] repo: upgrade 2.56 -> 2.58
Date: Mon,  1 Sep 2025 02:13:24 +0200
Message-Id: <20250901001324.1789161-1-m.kurz92@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222674

From: Markus Kurz <m.kurz92@gmail.com>

For changelog, check https://gerrit.googlesource.com/git-repo

Signed-off-by: Markus Kurz <m.kurz92@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.58.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.56.bb b/meta/recipes-devtools/repo/repo_2.58.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.56.bb
rename to meta/recipes-devtools/repo/repo_2.58.bb
index efdb9bd0c9..76fb2d214c 100644
--- a/meta/recipes-devtools/repo/repo_2.56.bb
+++ b/meta/recipes-devtools/repo/repo_2.58.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "99b5a17f2c951fe5979100c36e7e1dbb4c61b36c"
+SRCREV = "38d2fe11b9df521727fcca23c9dac086ce8378d3"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

