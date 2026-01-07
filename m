Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1057BD0D157
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:10:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12721.1767809401079095131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VH9KEaFJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso22777145e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809399; x=1768414199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue696gEvltjoimcBnDEOVgoFfDcdXE5IPspy1w8cNBc=;
        b=VH9KEaFJqU2bE8tZZZ/QqKZ0ObYBxL0dAbFDXhZy2xrpZb6NTdOPji4Q5Y7Hr/y0ka
         LxB1QILXkjr5o/QiTq8LvV1YtzXLG0ATd9L+W+OnXvsAJWDwQBLQ5gG1t7EWaeoR/gzj
         vSAOYluG5Zi/QtDAUMVgdBn6lRf/L+xFcm8ROgtHOIBp9CbhACHPilbbYhK8zl52i0IM
         XarZGa4Mso5cSXLtzHvpALuX+9yBGQKuJhH9jlI01L3gmzk3dFYLiLBbwJAAhBDbRZwm
         e58TiaCbI9fepqeQ+v/HkfPQXjPZ78zaJtnVGXI87ixxW+gAvsnbcFbhNbJAJR1I4R3S
         lrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809399; x=1768414199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ue696gEvltjoimcBnDEOVgoFfDcdXE5IPspy1w8cNBc=;
        b=w/vMjHDOvrgT3/dj6oP/hG/+B+/OIq14nxAK2IhjPU8FTBYQHjrHLwmx8CCegXG/Qd
         TqbMcTYVoAx0XDrtkRXwK7vRnlfwy/F+kZ1Eq7EYVDrQ9ebUB/+89e/JtN3tjB4uqHwD
         z7kE6TjzMgqz5EsZJpvtjYWRtMiEXLNLJMtaq7me8XIS0H95MbRDy3iCeqISPd/t0LWc
         RdhaNfeJLuVVV9i+0axRnYsLFrT4LH9hgdxcRRptcVYeZEBUnWr8E0lo13D2NdDnhlvk
         /ueX3kKVi9xb4ChOkuMdvvtv2ET3oSY3Rsg4I7U5EOkMN57pXalSgqMbi8d37lNv6Bm6
         83gA==
X-Gm-Message-State: AOJu0YxvYixqmwGMow0f08pjtsPQdutxFBc5na8ga3O7Rfo6vh6PAbvv
	/rlLzJzLZCHYuld0tdlOlPo1v9F2jgcOXCT0PwXrf3JrHHW+wUS/rX0BUoxGXQ==
X-Gm-Gg: AY/fxX62Slrj3zBxbBXJtlV420co/yhLkuVgHhk4eJW0wKDm9Fhsb/P+5XzWjPxiO25
	5r97h3RU+wv3FF2STs6OdFKZF3aTqa9t+07tgXVMaNBMphHE3EP/+uLwEOYmNtGn5HvxnBzAK3S
	3Zo432h9KeFnB/o8hJ0QG9HVluoW8HhDl4FReWhSdW1MHJ5PGo0MMP59813V26vEYv39FwP8w8u
	nyRCJuH1+JVCzvGpIT4jI/TdX4WXoS42kIVVL80cenwahFbBINIqMqJWIZKZEl0xizvwSVwNxCv
	HDGAK5yvEC1aEUvoo49BmcyWxLKxyvEEDuGNbT7fpyBZm6NdG1NTTso/Bhi4FauYyftw2HiEkjK
	ki7u02tX28HfLsYVPRwsK8tDmSL7Lm5VsfAZLoU9oZNQVHPfvb/Tq/9RMj8SS1TpCrcHfAoD29j
	tdPPCPXY+74p/7iuocj+tbKMPLY53f/jZcUQ==
X-Google-Smtp-Source: AGHT+IHe9Xjxd6xCByxiUZKskJS8QxI1gkjIW6rwLdlkPPqFgz6azQJdFBdm6jDzmst1njck3NKmrQ==
X-Received: by 2002:a05:600c:83c9:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47d84b3b650mr42227105e9.26.1767809398919;
        Wed, 07 Jan 2026 10:09:58 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm11895630f8f.22.2026.01.07.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:09:58 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH 2/4] spdx30_tasks: Add PURL generation for package identification
Date: Wed,  7 Jan 2026 19:09:48 +0100
Message-ID: <20260107180951.140895-2-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107180951.140895-1-stondo@gmail.com>
References: <20260107180951.140895-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229021

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add automatic Package URL (PURL) generation according to the Yocto PURL
specification to enable package identification in vulnerability databases
and improve NTIA SBOM compliance.

Field added:
- software_packageUrl: Auto-generates Package URLs per Yocto PURL spec
  Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
  See: https://github.com/package-url/purl-spec/pull/372

PURL Implementation:
- Type: yocto (official PURL type for Yocto recipes, per PR #372)
- Namespace: Layer name from FILE_LAYERNAME variable
- Name: BPN (base package name with prefixes/suffixes removed)
- Version: PV (package version from recipe)
- Normalization: Lowercase per PURL spec

New BitBake variable:
- SPDX_PACKAGE_URL: Override auto-generated PURL

The Yocto PURL type specification (purl-spec PR #372) has been approved
by the PURL maintainers and is ready for implementation. This follows
the agreed format from JPEWdev (Joshua Watt) and petermarko.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f731a709e3..86430c7008 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -474,6 +474,36 @@ def create_spdx(d):
         if val:
             setattr(obj, name, val)
 
+    def generate_purl(d, package=None):
+        """
+        Generate Package URL (purl) for a package according to Yocto PURL spec.
+        Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
+
+        See: https://github.com/package-url/purl-spec/pull/372
+        """
+        bpn = d.getVar("BPN")
+        pv = d.getVar("PV")
+
+        # Get layer name using FILE_LAYERNAME
+        # This is the correct variable that contains the layer name from BBFILE_COLLECTIONS
+        # (BBFILE_COLLECTIONS itself is not available outside of layer.conf)
+        layer = d.getVar("FILE_LAYERNAME")
+
+        if not layer:
+            layer = "core"  # Default to core if layer detection fails
+
+        # For sub-packages, use BPN (base package name)
+        # Per spec: BPN has prefixes/suffixes removed
+        name = bpn
+
+        # Normalize name per PURL spec (lowercase only)
+        # Note: Underscores are not allowed in recipe names
+        name = name.lower()
+
+        purl = f"pkg:yocto/{layer}/{name}@{pv}"
+
+        return purl
+
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
     deploydir = Path(d.getVar("SPDXDEPLOY"))
@@ -646,6 +676,10 @@ def create_spdx(d):
                     "software_packageUrl",
                     package=package
                 )
+            else:
+                # Auto-generate PURL if not manually specified
+                auto_purl = generate_purl(d, package)
+                spdx_package.software_packageUrl = auto_purl
 
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
-- 
2.52.0


