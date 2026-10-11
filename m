Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA46CA9ED2
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23433.1791708071694317115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KR00gBQO;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so1684785e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708070; x=1792312870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rNRyhAIgwedZCvvSf//nbSMfhHBPkUVX2ATPd+AX9Rw=;
        b=KR00gBQOGWlU0G35ym2t3+yRrgEfbRaP1dBCSLXiebbxjyhaGikryujZ72qpe0pY1s
         Q2fi1j/nwtVYaXfeKc/xRvJ/Jh1AKTPjj/uBcjV7KQLjDD5mBEJ0YZHV99rYai3VhE8s
         Si5PjV5WxJAKvtS6Rey/OTBv0D6yJAOAVr97Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708070; x=1792312870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rNRyhAIgwedZCvvSf//nbSMfhHBPkUVX2ATPd+AX9Rw=;
        b=eUftCwj9ZAy5eGexKW4x6qpui90nR6o9tDtaJEY00XcSSfYSE8cYbF7gjwNfzz0jPI
         S3z7EhEy0OB7RKIOLqEwM+qvJvOl38osoTeqKU91zFrwU8GhtPKRAIlaR5CK6CzBm7yO
         hbGDN/Ha5bV4n89xDa8O1KZPGmmPIr3fsoSobFVM7/2rzoqfPdx3Zo0c42rPiJ2YLjwB
         pxpRso5Yo5Y1BMb9AAdbjgfw+LPc1GNISimkcabBqFUm6XePF1f0QZShDrojKiAcjOPS
         kCyIyYoL3+g/9vbnP6xqmKEZziR0hdgk+JwlX361m+hKtJK0/xJWxfFtnbbIhLppRzkO
         kXow==
X-Gm-Message-State: AFq9FYKcTfiXUap+aLStez2ZnR+Mu1qmgClRHNOSu6T1+8C96lopRwgI
	6VTH9//As2zjOq3UNabF1GUWZm4dD3gxOLVGyTYJL5rLklg7xodjKpK6s8t6SeP75ULhF93at80
	ZK9CBLyY=
X-Gm-Gg: AYBFou0bWeVVvmqpQn9FPLCpuPpKG+WpZfn8GXID5ZWdZhlzflCoSmehQ31dg/eEsRn
	nL33Ng1luRBJUMH071z/WAThpI/lPoDTQsgi+6Yn7QBdE3yU7eAK0RPuKG9RRClh8rZxhuBjiXc
	UPTacyHXXot4EKP2f0M8EdxR9G/2+4Da5fVF2mRFYnljz9xfRtMW8gQCmRe+Zb/BxHu0zKnnP9X
	Mm/YFuAsdspdli66ZBM7xY/vE20nA6vuBwg2kPP+vaC9h4ebnS8PuXGdhY56uA5dq+uDRdbHDMO
	NWpQ8f7/o83lzmXWwNnBOvNkMDqc/jXR1d30GXUNH2xDJ0oi3U806xLVZkg+dUX4GfmCUvBxZUB
	5KxzgU6uyQJl2K7OiZAccPtsE/hxXQ+OPhTQYZEcKTEWq/3ZLmfxJJ6unpFRXs8KWrccRohdEop
	CmY3R1VR//jRivRbXmIi51rEoYDXGtUK7Vl6zK9ztnLVegvS4DjE4o+kU2oivbegWCEY1f987vP
	ltGD0mfOG26S+Euoq0aOHz3jQOTMYT1XKTVKIkR4ORk+Gj/UoiO0uqXuJ2ETSKwEWPxS1ECNxZ+
	fkkn40ML
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr111242335e9.15.1791708069590;
        Sun, 11 Oct 2026 01:41:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/60] xserver-xorg: set status for CVE-2026-55999 and CVE-2026-56000
Date: Sun, 11 Oct 2026 10:39:49 +0200
Message-ID: <3ac73f299c2f78d9a37f20951917d7ee0f036930.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247525

From: Peter Marko <peter.marko@siemens.com>

Per [1], CVE-2026-55999 was fixed by [2] which was backported as [3].
Per [4], CVE-2026-56000 was fixed by [5] which was backported as [6].

[1] https://security-tracker.debian.org/tracker/CVE-2026-55999
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/fbf7bac22e2c6bd627fb042742a23318263edae1
[3] https://gitlab.freedesktop.org/xorg/xserver/-/commit/0f1f4bcbfb1f23b800dfe386782d3a0f05b6756f
[4] https://security-tracker.debian.org/tracker/CVE-2026-56000
[5] https://gitlab.freedesktop.org/xorg/xserver/-/commit/2779affbdb4354e894f490e56f962527d6125043
[6] https://gitlab.freedesktop.org/xorg/xserver/-/commit/d6d96084f305a142eb3db7f720d7edd21e4c98b4

cvelistV5 has correct version identification, so CNA (SUSE) has it
correct, too.
NVD however shows non-existing version 21.2.24 (probably from CVE
description), so it's showing up in reports as unfixed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b6ab21c7e75acb65a3993565929be9c72f4a3d39)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 782c1f76ca4..419e539a541 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -31,6 +31,8 @@ available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
 CVE_STATUS[CVE-2026-34000] = "fixed-version: fixed since v21.1.22"
 CVE_STATUS[CVE-2026-34002] = "fixed-version: fixed since v21.1.22"
+CVE_STATUS[CVE-2026-55999] = "fixed-version: fixed since v21.1.24"
+CVE_STATUS[CVE-2026-56000] = "fixed-version: fixed since v21.1.24"
 
 S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 

