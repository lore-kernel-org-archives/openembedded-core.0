Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102C9C5DF91
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10317.1787155061186008586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JqGYuKCb;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-480033bdcf4so681051f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155059; x=1787759859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uosIFzMWYexe0n2Wau+bY8mTWxvT8qf90N9qITSN4qA=;
        b=JqGYuKCbvi6EnJcmZoq2rYel3vl1Pqhf09dhSPySjkBNf351MTnen52mT9zSSV+b4W
         JtS/5iZ9wVesezgLIwdK6ukIAZvgyjqSGSH1W7wDwRHw8gpKGP93CzKAPFYhFQuyiWbO
         X0FsPsb0UDPIZZU15JutfVM7r3hxnIxWeNX0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155059; x=1787759859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uosIFzMWYexe0n2Wau+bY8mTWxvT8qf90N9qITSN4qA=;
        b=LXUOE0xz/24REcBpd6qz1uSCxnb2JvmiahkJOMcFem5e5s2ZZYqo/7tz12c9PUYrw1
         xE2s2Vl2J1MUs7Q+qD/pWk6lCzjkmJxISseJrHL5y1SeyJlkNtKidqPCel42iGyAnazj
         XH3fS/mdsEi5tW0Hg9WDWK1dtXAJb9vZ86MSuZ0q73JrOvTTJ3dv/56AOEmUiQaBDM/b
         btDw3SalODa+Jwfcos9lEUVDGEa7ufSJ0eUa2codtb90PToBjB+oBlBajRGM0Zx6Ye9k
         zVIth5tON5HksaF/+a6mojtR9AGPFQFNPIZxviEIZcD+h21px7YODson7SpDgIMXbAS+
         wMJg==
X-Gm-Message-State: AFuF++lZiFKjWEgP3xH9Kafwk0DGR4NZ1gNeFO5pSLVb0/Mv8Xz2s4ug
	EztkhuJCqSaA0qa49S1gC81zK611ttdqWLaGgsCVHVSCs3x07SIxDdCQVCGVDk7QcbLDOBlpvNl
	yPlbfC6M=
X-Gm-Gg: AR+sD10+HsZKaTe8ghJp2/INXntNSO7Jevl98jt2BNgXCEcRebINE4RJ50CarfUZpSU
	GtTsLEBGMtlvx/2kpq24c1EgHmRs9+I+tUoCRHEuGMSUlsf+/1d6Aulyiktc8A68sUci5tqXfHU
	IoGggRw3iPKFovOrWzaw3huqCVPOGLJsFpZ9/XFXHfMwt3cWU/Vc8remQGImzjQDi68TrDmrgXk
	KZw/Me5cufV6scQPKexzjfZ5SCNMoJOPmybhJK9wrDfdLCLFfGPGFayJnui9a4wBTKmx759+CDh
	LJ7ELadqtAfdxxqmRjFXpyQNZ0/1zlu7T9JBGxYzGZ9JK91CH7SwB8dJkrk6cX+heQqycMf8YYe
	goDkPSTPnIfFF7x4JnIG0eg+EgZZ+5a5HFgxDuLSXATK72M7cmjkMcbwKiFjntvD3MCYp0f1Z5p
	cWAm3EG8O1gLhJhj1LBUZzChw/x73SNAx2nFYVcd9ctqSD1cw18Bo+gM4RaoFkqzHLj7r/jijjw
	JO07jUXd6Dvtk6rudlFNv651n0nl0yQ23vg/wv2jiO3gj4XdIF6EtAXbXa//g8OtJ5+IzY3co2N
	D7XD6nyfLaMsYnFiNfuAzY8+4dENX9HEOzk4nZTp
X-Received: by 2002:a05:6000:4283:b0:482:a909:53d3 with SMTP id ffacd0b85a97d-482b1e877a0mr9440973f8f.2.1787155059351;
        Wed, 19 Aug 2026 08:57:39 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:38 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/37] python3-pyyaml: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:36 +0200
Message-ID: <23322d524f34571a378c752c1a9cf2cef621d0ec.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243741

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyyaml vendor prefix matches nothing,
so PyYAML CVEs are not evaluated at all. The databases use two
vendor spellings: pyyaml in the NVD CPEs, and "Red Hat" (with a
space, not expressible as a vendor:product pair) in CVE-2020-1747's
CNA record. Use the bare product name to cover both.

All four existing CVEs (CVE-2017-18342, CVE-2019-20477,
CVE-2020-1747, CVE-2020-14343) are fixed by 5.4, so they resolve as
not affected at 6.0.1.

Note: Original commit was for python3-pyyaml_6.0.3.bb. This is adjusted
for scarthgap where recipe version is python3-pyyaml_6.0.1.bb.

(From OE-Core rev: 666e25c1fe1347da307726afd87554ffc080ed12)

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89a0ba3c2da2a7755bafb28afbf75dc7112e2549)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 33883125570..07bf851fce3 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
 PYPI_PACKAGE = "PyYAML"
 
+CVE_PRODUCT = "pyyaml"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"

