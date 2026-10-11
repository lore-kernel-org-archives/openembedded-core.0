Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62434CA9ED5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23438.1791708075339148001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ddEzhRzZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso887426f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708073; x=1792312873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/azLy5sz+KPXZ4Tfoo04za8IeQ8sdstVgh3eT/Hb3PA=;
        b=ddEzhRzZOEGWQBuq6/AbEy/f+X0wR0g4FIf3UmWLZnD2S2lA5mkpOKHDC4KEaDRKX4
         tfqNHMTgG1WtdGLQIq/RriBABQrOl/DlciWHYKbTQ53vbaGK5HVIF7XCTrwJ7+1slSr6
         bdezGkcPQdX4r4e6xUUJNhrgwxkGcrf2q09jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708073; x=1792312873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/azLy5sz+KPXZ4Tfoo04za8IeQ8sdstVgh3eT/Hb3PA=;
        b=YAJluylGDaqHa0VPY6s7WbrK4WbuX+a5HzXcieNrNKCiVWUoFA8nGFSP2MJcVlONFZ
         gnvDWECx6bYNsK1SP/Oz+MiBJkKT2PKisdDyPahawDLGS5+ox+AqWViCHv2DNIe4hMjT
         2y5U5qJib8/72uINrLb2IO7/lOlJ4ypfCW8ub4UUg/oY6oBxOC0AFooJNOEbJ4mYNa8f
         aJ1Xc4nktfWaw7HGsszRCgWSAs5MdEeTUgmX1oKbW3LPPa6dyj2ukPxGw3ZSaQbMuuT/
         ZbFrtKwsSZzqG38BQdNP4OvVEsjI/eLVchgOohmqrnaIvIpfuKv0+zZwEUCj+AMrKhTg
         SwPg==
X-Gm-Message-State: AFq9FYLZcizPK+0Dgu9QIZZpKKoJPY0TaYmEpvggYIzqF0XwUYwpxzlA
	LGMD3TCQWBJ7D1REQHRhlabQVFAwqY6MAQhIcBgujQOubujGnU3i9g4una+7ZjCKpBLiQUi1Ue7
	PB+42AxY=
X-Gm-Gg: AYBFou3S0cCIwwhxZEGLuSCc9Ps+dp0OruFUGZc8efl9ahcFhL2e0NM/lG6Tac5PAB+
	nBXfnDU/F7U7EH/WPM8FUaA3KCHLcuelkfzcjNs8bZIkj2swQOK5IfnksMYmdbfUoE3pZxlUFCD
	2CVSr4yN8r/Q4mU3NAn3CcccGTz695JRxEnCmF+D/qB8c7O3KiscT82GLEmLYUI3PdA1V6mR/0q
	mZ6BAzmzw8wV5s2PiUWJY2nJGU0IO9OPG45b0Emtgt3zN3aObrMDo+6QgWB8T/3XDq9UpJ947vz
	vRM4CQ/IIH33z2a0f7RW0FHtza+ILmYcvxT/V/W+45gf0XCtPUDJPDox1d1/Ufed5pF8biU/eGZ
	bELZw9K8LfFpTfBoWYPYcvtfkb0S0X5/eN24qLciDe2N/DTFXYWLqqhH5vbPnQauGEUnUySaq7K
	Rp4nIzFdbSGDb8qBL9uRfjJFkBdZ7iIIXfaKJT96umMEsdSIf5bw6kHosrAW0SmjdKaL32Ri1rU
	5Pmx3n9gzwqheABPvTIf9pp5wSkmREAmjSOqLqFqVycpOG+IJXSzdH6vmdJHVP4Vj6OBvKecg==
X-Received: by 2002:a05:6000:298e:10b0:48c:7f53:9603 with SMTP id ffacd0b85a97d-48dba77d033mr8983890f8f.7.1791708073402;
        Sun, 11 Oct 2026 01:41:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/60] vim: set CVE_STATUS for CVE-2026-51401
Date: Sun, 11 Oct 2026 10:39:54 +0200
Message-ID: <af88a9811b58b6b823468de7a783483c0e5368a8.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247530

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51401 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51401

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 37c5cacaaaf..3fbfd887a5f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -53,6 +53,7 @@ PV .= ".0340"
 SRCREV = "6addd6c101117706bc9b3609d3a418e26e92618f"
 
 CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+CVE_STATUS[CVE-2026-51401] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"

