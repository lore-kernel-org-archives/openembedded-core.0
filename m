Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3969CA9ED0
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23557.1791708064943136866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2FKG35qw;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b042c0728so142836f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708063; x=1792312863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kZqQnKu/8mZh0OsxmNrw2ySDLNirZ3Jwtzb/EghNPUI=;
        b=2FKG35qwsqPnk6dmvD8+yJDUPeDG0Gs9QSJ9U8uYaupeoFU7fjYyyBp9YLZTj6IPa+
         zTU9A1pnIOy/7YiCdpyZGkpus2b8t7VJIUI3MyaovWfdYMElZ6npF9UBh3zaw42IJNqn
         ZHlPeN6XcnxWcDv3djAnG8k3zl22ly0w3lLJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708063; x=1792312863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kZqQnKu/8mZh0OsxmNrw2ySDLNirZ3Jwtzb/EghNPUI=;
        b=nw3yeN15jJ6HsBD+iYMKp9ixx36QTx1Vp9ANuRQVBl3C4vM1v9/UOOw8xUkiXk75BZ
         dVbsEXtaBBH/tRrQ3QSR3WjAb2h0vTKA0Tkoyz56bfo2f+pjlPnq9zTud+Nd3ouE9yHC
         DmN1nz3RCmroqGibh5irMXta6LeKWN1O46I+AvT8eq64y13mRoihdkeXt5cgWdw2Hc0z
         xMF1KJ4Rxef8tZ6Unb6xAzbkhqxrbkHyXw/MIpDWD+JTopPBkI6rm3EmSCZoA7u5u949
         gH0L9ROGdlIpnM1UPfy6xyljqmsbJUvsI2tjF+ZUOyKzNX+PVJFBZ+UTVDk5+EoblZNj
         jOoA==
X-Gm-Message-State: AFq9FYIk6F8IPN04pDRA4a9JdfzOKsjnXb2pk5ou46ZZbJCxBDAGwNrk
	rQX/NC8S5xk6pK41UgxBGofvDrNghiza2W23d+dWvEdS7Zr1pxfh8uXJzHLUAVQpHcUhrOWWRXl
	mVQ9iQP0=
X-Gm-Gg: AYBFou0XfdyEuD1+Sz59AZKT96AqnxCUuiZJcgmcK3cXahLTz9vvJjRZzmDfgR03h1d
	+yxiZsYx8ILmBPNiyXWKeJpvu8hO+5WEHwgjt2J6UzGP994HdlpjfiQOj5ak+3J+vQidA9KMqD0
	rX6UcRKKESloF6/NZC7k5YjafE/cRqONWvtsA/1dBNEpxDQb2BgwaIPL4NtvuIUOi6YvIBMu1Uz
	akfudUqPExDossZVwhv4ajuFQ9OK8GMTF7y+60s5w1EtY8cS524hs/Pdzg8b2QCu8GPmNihxyUu
	HcfAwmSXXDUwWAg+m35J310Umtz0GXSxuLBAJ0EfYn07o52tqsCksKAgSOiI8l7k5WOmlyWhils
	M6hET72+QVry3gctVCTSOqZsXkuoTVA3NNszJbw2bAah3kx8jl3y4FvFWJOhNuifmj8DERYZEGO
	6i4SYgofn+A3FWjN1K/g9CeSEymTdDaSDP84/SBpjyXWFKV5eSX0jchZqtRw7e7b5/+0cTD274d
	WQ2sxOxHYZxe7VH44wvx8n1TdzBS8/A53KZ5xP8kF+qBX1XngY/fegGj3jfHQQ7LYPIFEG62w==
X-Received: by 2002:a05:6000:4b0d:b0:48b:d2d:2fcc with SMTP id ffacd0b85a97d-48dbaade73amr11046434f8f.9.1791708063067;
        Sun, 11 Oct 2026 01:41:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/60] ovmf: set status of CVE-2017-5731 and CVE-2019-14584
Date: Sun, 11 Oct 2026 10:39:39 +0200
Message-ID: <6131cb81820260cefb20bf03663b597546ef52b7.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247515

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

OVMF has a generic problem that version is encoded in different ways.
Both CVE have their fixed version in NVD CVE reports encoded as
YYYY-MM-DD...

CVE-2017-5731 additionally predates tags in vurrent git repository.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1ac5e07968d2dc23343ca3a7c1eab7c3788fff41)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 01f840c2154..cd6a40a9d07 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -40,11 +40,13 @@ CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
 CVE_STATUS[CVE-2014-8271] = "fixed-version: Fixed in svn_16280, which is an unusual versioning breaking version comparison."
 CVE_STATUS[CVE-2014-4859] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2014-4860] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2017-5731] = "fixed-version: fixed since 2017-11-07"
 CVE_STATUS[CVE-2019-14553] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14559] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14562] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14563] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14584] = "fixed-version: fixed since edk2-stables202011"
 CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2024-1298] = "fixed-version: fixed since edk2-stable202405"

