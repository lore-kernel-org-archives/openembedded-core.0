Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F51CCA9ECA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23550.1791708061537838103
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NqsVy5oc;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486e70f2457so390886f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708060; x=1792312860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3AlABoLRDBKEGcZx+vwFThlHxvk7zr3QplF7+erfsIs=;
        b=NqsVy5ocij6zQ0BvS0fH/TIFRnH9CUZrOCD+2CvlOuVdBtx8bu2s1ALHtcgp5sNfMW
         fPtStJihyQrfs5JImklpABLF1/xr025GZvmakZD3BgxqqPWljBeJjvp3pH4r4c8BkM83
         mJ/JK/hFG3eA4gw2nbCcVVja6lENouEiSWGMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708060; x=1792312860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3AlABoLRDBKEGcZx+vwFThlHxvk7zr3QplF7+erfsIs=;
        b=OjOoUo27nEo7/mhvPhcIJecRnUxMhW8nKCifuOtss42XQE/+JkfcUMTE2Z6cYkyYnZ
         mnPJB18ZzBrOULvIf4flHL2axOxA50O97YaaE4W/k6RycWcEyEn3DybaSufsc4LlhYbj
         i6n1ARwkCPcv0O24yG+B9xyxCGyPSmYGFQnR8tuuar08eXk4vu8F+IoPdxLnbrWjaVh0
         x67MIMM+jI7tq/yeWM/WT0yGrNLzBmqvbJhJgGGSDFbRhG6q8fyg1CYfRLtnoe4BddQN
         plrHtYEzxxhGgI0uL8Uo6J8UIUPeq7DnHhjrYqBvp1w6eHTB+vkKJ677862uISoH0def
         GsrQ==
X-Gm-Message-State: AFq9FYJuUemEWgO9O+OURvyX4xkpKjJk+lbqIAR2GA9grF8PLd9/l1rC
	BphOi5sORM+vkJWLUalDzC2rDRY9QoIQ7dxVFGDlzPqc4vuRRHqBpI3A65um/uxrItj0IrM3JpP
	WeJ+xUrs=
X-Gm-Gg: AYBFou1EPMeEP3/wKUBDjn1xbvE4RU2o1yLaWIJv2dWuL/G5ienxpLXo8VTtzNh6pwe
	snNBItdJ0ugIumaJQYWfdOMWv/+z29ZLo4E9BVq3aUZZZVUCVyetZyMD0uRWEuPDEMTQKf/+DgN
	j2kKH7aJEfWr4ew5IEOdzi8Cgr2ASJCV8YoU09oQ7wuoKlfNh+nf0zAFPhFfMvScamrAdTWxGan
	z9NmkUo+SnR39UhxsGptedPYGqnweyaoocHId+QSQ7rAfsDknNLAqhUsq2CC1OIgCfYVENtsEbg
	bvO0h+cKjdMd/jDM98z2ip13pVy00ma255r4CCa6f/ZkD/FSD27jITCIX2CfO1KW7+cUttnHjDu
	arQ0G7DohvyBlCi6xRyRnZyv6WK+xJdqm7awhlXEIgyE1ZIWLh3fAkRT24fY2ZqrG7EJENPeh8J
	I0TwEON9/GQG3004XOD0Hi2ZWkHiWTxvYFAQ8VpOuNDEfviOAqzzdkLo1wmlsBacc7dXVss1mJP
	JD1POmnvQjvEDeieEk8XOpAbazFdABNo8uR0cZWB97osE3lNZVPO/FEMfjQSOCIQqUBm9yaqQ==
X-Received: by 2002:a05:6000:2905:b0:48c:6d9d:9f90 with SMTP id ffacd0b85a97d-48dba9d0b47mr13252971f8f.26.1791708058713;
        Sun, 11 Oct 2026 01:40:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.40.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:40:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/60] glibc: set status for CVE-2011-0536 and CVE-2025-0577
Date: Sun, 11 Oct 2026 10:39:34 +0200
Message-ID: <5eeaf71f4201f523d241d98c3b83819a12cf4ced.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247510

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

* CVE-2011-0536: CVE desciption says it's related to RedHat patches
* CVE-2025-0577: [1] linked CVE report says it's related to RedHat
  patches and no upstream release is impacted

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2338871

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 85babe3703588b00a03f7087c54440243a993ee5)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0a..5c21223b55f 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -16,6 +16,9 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+CVE_STATUS[CVE-2011-0536] = "not-applicable-platform: specific to RHEL patches"
+CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \

