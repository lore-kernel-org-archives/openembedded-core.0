Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254B9C5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:19:59 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18646.1786317596752872502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MCu9EF1S;
 spf=pass (domain: konsulko.com, ip: 209.85.210.181, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1167955b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317596; x=1786922396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89+j0zqT17ngr3p0d56RXaLr1RgMtdRfhUB9IBsh5og=;
        b=MCu9EF1SGCRpy0NlZniu0HCxXzVfhviN3Motlf1UtMBEAOdnkP8BtEAD0Kp6YQHw7j
         rGKXPkkzgBtEzlq2x4GsPk310bdLTaZ5voE3dNofqelJtba6AWSLN9jDAka7yCFKjHzb
         O/nJzT0lgsiYqjFqhDmMyP6597hqOGxbFQCLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317596; x=1786922396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89+j0zqT17ngr3p0d56RXaLr1RgMtdRfhUB9IBsh5og=;
        b=rYE/wII8Uoe8cDnmYEgKfdKnV5FvNXWjBgX1A7jrO5eN54UPmzZsfxtpdUsboBQl3w
         219WIRcRJ0e3Ja9hI69jH4t1/6T+ypO/ya4B0vlkie8N5S7Pe5oKaFm/Qzgwq0/7Mimt
         5Jg/b7Fd6HQSJO25o/aetj7NxB4jvYpQctiSIjkP+kD5R4AquKoPU+ETxc1EdoUEYuRD
         vQPPZrafrGxt3BQXQyxxpG6bHjRV2n87ndzvI8Kp3AWYXxQve6TPjoWpRvU24QRCQTzy
         c1hkgHCJqte2ECq75RuNWbrtBR/eMCqrDtgCSuwGXLuJZe/qxzw8mF3OpKe34D6t3q2K
         IijA==
X-Gm-Message-State: AOJu0YzWgaVv6E7SgGOdzewwtFIkYhrPAhv51IuEDudLKuHaCV0p8QQl
	/JIMzudH2kOHH3wNcFUgt2GedVTtuO/iQ+oIeJ9Qee+wm4QGap/Iv4IJYjPwLTttPJX7BOK0UvD
	0Vj3w
X-Gm-Gg: AR+sD12ONzZd2IXlxgHDGmD1/rklJWLSytcTU8ru6nx3sX87tQnsbmOFIxXPAODUm0d
	MZRdBBfRtDqAso9qWqpWFTRNFvJISQ6LQTHEU1F8vuo7veN24pEtn/f8KIR08V2HLiC9oen67hX
	kT9m5zHryiZZ6GEHeQqOySi3+61zE+nlqwEc4xHu8lRCrbVjzoVicUyYuVikE/y+AV8yufPmWzL
	DnPhmDw9f9h7djnVDGiU4UCub0+rcew/lwa3ROD59H0Iz7s0b84XGzeVhu4PvTmILWnbBWf9LKp
	qwtCP2PQh4W/GYxfc/8YsTWJoBiP/yq5Iny8wNs8fSFJeCvwkRFevvA0lQBjKQwM3IIFqyILg8g
	A3oCHgpr6O16sasS1nB2NsrkNxPVa0sTHM5ifcFy8AgxgnAY6J6c0GGJTwBXARXGf4tvYjBRlH4
	gjIVvEFj/1ei9/vjWbT4yWo2baqPyMUfatxqa7spXpa6fKqiBY8sl5puVXUe39U4UXdnh1hhAKG
	Bk9Fw==
X-Received: by 2002:a05:6a00:99c:b0:847:80f5:c616 with SMTP id d2e1a72fcca58-84f2dfc89b0mr42781918b3a.10.1786317596083;
        Sun, 09 Aug 2026 16:19:56 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58998bsm2976866b3a.55.2026.08.09.16.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:19:55 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] python3-gitpython: upgrade 3.1.43 -> 3.1.58
Date: Sun,  9 Aug 2026 16:19:04 -0700
Message-ID: <20260809231901.366919-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809231901.366919-2-tim.orling@konsulko.com>
References: <20260809231901.366919-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243082

From: Tim Orling <tim.orling@konsulko.com>

Upstream tarballs changed from mixed case GitPython-3.1.43.tar.gz to
all lowercase gitpython-3.1.44.gz and the regex in pypi.bbclass was
not catching it.

Similarly, per PEP-625, the PYPI_SRC_URI since 3.1.44 needs to be
lowercase.

It appears the proper fix for fetching is to set
PYPI_PACKAGE = "gitpython".

Multiple security releases, see the change logs:
https://gitpython.readthedocs.io/en/3.1.58/changes.html
https://gitpython.readthedocs.io/en/3.1.57/changes.html
https://gitpython.readthedocs.io/en/3.1.56/changes.html
https://gitpython.readthedocs.io/en/3.1.55/changes.html
https://gitpython.readthedocs.io/en/3.1.54/changes.html
https://gitpython.readthedocs.io/en/3.1.53/changes.html
https://gitpython.readthedocs.io/en/3.1.52/changes.html
https://gitpython.readthedocs.io/en/3.1.51/changes.html

CVE: CVE-2026-42215
CVE: CVE-2026-42284
CVE: CVE-2026-44243
CVE: CVE-2026-44244

To see the details of each release:
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.58
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.57
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.56
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.55
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.54
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.53
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.52
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.51
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.50
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.49
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.48
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.47
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.46
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.45
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.44

For the full comparison changes (1292 commits, 201 files changed), see:
https://github.com/gitpython-developers/GitPython/compare/3.1.43...3.1.58

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-git_3.1.43.bb => python3-git_3.1.58.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.43.bb => python3-git_3.1.58.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.58.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-git_3.1.43.bb
rename to meta/recipes-devtools/python/python3-git_3.1.58.bb
index ccf6def292..82c8076a97 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.58.bb
@@ -8,13 +8,13 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
-PYPI_PACKAGE = "GitPython"
+PYPI_PACKAGE = "gitpython"
 
 CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
+SRC_URI[sha256sum] = "621416df10ef3fd0e19fabf9172ddeed0fa704d353d04f194eec56a625a95b22"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.3


