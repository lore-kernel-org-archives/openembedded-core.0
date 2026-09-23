Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546F5C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2817.1790154684380150459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JH2bSH2V;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3403125e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154683; x=1790759483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CSPa6FdpPl84cGMx4k4JZlQeplDNbdORwd36YCwSEV4=;
        b=JH2bSH2VP4kif0fAMYsToYk5dp25+DVIV+VqCt8qg/HCNZ0mQc8zppZ4wbk/vH/2HM
         OT1sfW+6GwkYY+HldzMtDwLRu6+aDihfmrRAXKsCIg0fjO972sigtw1ocLwwG0pQDfOZ
         7/KR6lFOTTL/9PtG2gNLQc4MXsmao6yy+Os2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154683; x=1790759483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CSPa6FdpPl84cGMx4k4JZlQeplDNbdORwd36YCwSEV4=;
        b=guFGo7qpVW9Td8iLtwAnHa1yPzYe1yZVN0HUQE5wUceTzRGCqJAy8J7fdXsFG5Xkkr
         go966XyDH66u7/+bs0xHPrPuFO7Jz3ksKLuG+3tth/jDvbRgjJQ5EixptzlZWhVWbeTT
         Ytv9J4vmSKtt93XkiMERDDGRpNz74cgSHPP89GI03gSQ7mNkJF6J3FWG8P+bCGSv6I3l
         f+2AUlxhLjyWWywhBnQWPdhEeH/NQTr1sAT1v8dK5XagR6EoECCNAYNlkQKCs/OvR5K3
         wM1hWZyAmFsQoM3zPynrGSggZcDgQohhYtR4OwxXE4kCYJyZcaWsMnG0hekzwWoVKIDW
         I4PA==
X-Gm-Message-State: AFuF++n9hRPEgdd7VaE7159cr6SY2fgjlvThqcF65tNVWiqAqWMj+fzs
	9fqNA2/dX2/ne3l82dqIvvhg20ozlT0DhnUUdfnx4A71s2Cc8ZFettBXyfFlWMr/j+lVTAg6fgi
	Ky8qBEhU=
X-Gm-Gg: AYBFou3nrJP9AgYy//wTelqCrtSQE+5GuXT6pFVOEPEoC33eSc36qcnNAhQkyymYvpb
	V2vUiFEWHq8JhNVEaLzO9yN3eopBM2a9pFzSumYEZheqT/0DroQjJn2kpGnIfb0JdPGRjJMR6oh
	DO6dZHSBW2eRVzbjJsYYKNMxRIilw0GD0stNoHlX787pCZvXljWRASdjdmR8NYJvcDTsfqQMLqf
	UM65Mc3n5VjY82lWVTTo6L8pgy1WtbLNK7o6G3iC6XVHkU77sHCK3HwxFt2doVz9I/n77Bgvh2o
	np7/D98W9XHbb5smrBjjKo2FWpND+XsXzywA5HLu+xJp86MRzJI704ua7q/wlJhJ+1NGtn/dpej
	T03mFfPrMDTSRRamh4Dz/YYjPAmV9UllSWjhuLs0s/Kna4CgfrjCkCPSO0Ug8mjtVWKG8jdccb0
	NkrXHSl4zYp/F+VYZz0hIQhwYJejB1YOTyzGyf2jzr46jeFV/7Lf3OgmM/STO0o7m9d6WH1J38s
	JvestRp/GChX/ZMXdp3WaTBiQK1gMSo6ZeXgqPHsvu8pAAdAfL/0ov+yxtW/Kv3PoBpbFmTU/+A
	qByCKhA=
X-Received: by 2002:a05:600c:8b83:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49fdf148f13mr25554175e9.29.1790154682605;
        Wed, 23 Sep 2026 02:11:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/48] python3-ply: set status for CVE-2025-56005
Date: Wed, 23 Sep 2026 11:10:07 +0200
Message-ID: <9bce52b90a6783e0ba23ff048209ea88922fd1da.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246467

From: Hetvi Thakar <hthakar@cisco.com>

PLY 3.11 contains the picklefile parameter described by
CVE-2025-56005, but exploitation requires an application to
explicitly pass an attacker-controlled pickle file to yacc().

No OE-Core consumer uses this parameter. Ubuntu ignores the issue for
the same reason [1], and NVD records the CVE as disputed [2].

[1] https://ubuntu.com/security/CVE-2025-56005
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-56005

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 0855c871cf6..5bed977158b 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -16,5 +16,6 @@ RDEPENDS:${PN}:class-target += "\
 "
 
 CVE_PRODUCT = "dabeaz:ply"
+CVE_STATUS[CVE-2025-56005] = "disputed: Exploitation requires application-specific use of PLY's picklefile parameter with attacker-controlled pickle data"
 
 BBCLASSEXTEND = "native nativesdk"

