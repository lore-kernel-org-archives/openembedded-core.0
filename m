Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5907C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10314.1787155058376775765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zmXfISYu;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe377a217so720005f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155057; x=1787759857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7CeprVtOXc5UWOTFD6RDtPwVyJNqq/tfmTsAQPYPtwY=;
        b=zmXfISYuypUj/cYG0aLpkBOcgWoRgJhMYFix5eYs8L0fkOWLX87/wKDzapGjj23mBQ
         H1g6x0rD41pQuq0yKgB1RYG3swBTRNTmx8F5nhhYtcCfyArULTYi/Icwh1ZC3ukGuP4d
         iH7MPYDjqFV0q+pVEH+pBKBxlQhn6uacEE/EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155057; x=1787759857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7CeprVtOXc5UWOTFD6RDtPwVyJNqq/tfmTsAQPYPtwY=;
        b=SN48zy6RFlGnwFcMJqXtNyojM0Ivm5eKjClEP7n6DEYNJMEf/ULTTyR1p5A09m7PXl
         SDtUZm2A5Q/oIUsfLzIolqv9supWYny17nGJgS/M9+HTfu+lS03pmuf2oilVejWDXvuY
         asTOxT7IAhhZBVryT1jeYz9GqV9Bby8sHdZhn7+zosC8ijsRzNIlEuTjGtDTRKT8AhLU
         1Bwb/k0l1iKBQFRtLp+VNtd+7rWm0VOkrbAi8t5SPkWYdZ+LO/Y+NVyPQBhXmslHd7Qe
         Xtpel7zMpo7RXICXntaJRIhveXm3MA0tFPqr/vMhnn8wJcyOwSUrVWpFWKWTnf3FL3EE
         F+pw==
X-Gm-Message-State: AFuF++mAopZwWLwC4tvD+3jo/qyr7quPiJoaAMKlIPwi68EZqGeuDVdR
	CvZxF/Ofb0dbPBn2/+k+7QlsJhlbDOai9cWW6fE6A93wsSpfRwYpqv7AekTUcwZ6/U1lTknKIXl
	7MAqX4jg=
X-Gm-Gg: AR+sD120Q5a4Wxdh+pdSipd7V19Flety0K2YOmXv8JzYPOYRLe+RYnKpdSC5O3tphEE
	xcvO6jaSKywo6frXJZLj+WxjvBRZsYxwB89fzxkz9isq+irXrz/C0jtoNI1104ubqyohU0G3DU8
	kzYq7aUlxPHVE4mz4m7DL9Hz3P4p4J5kDbEsDZMjst7uz2XheJBbteyCOFdXBnWd9e2jnv2z3VN
	svxrw7jZdH30q20SXFMO4v20CLN1IfdyMsqgYCp6WVM9z/NxLs2V4bci96b8tMCRJUn1iJP3vqM
	RuIc+D0+WZ8CVlxzC+JK14kR8ypuatPCmY1ANPPUUvnyWKqgC7sePVseXGZF/tIXmg3sxP7cQhs
	EEeJgaROOm5wg25JBay9dFtSjiF338aWkX/HWYVNAJM6ox3r+gYAB4QPH/T1rFOyWX18pv2Qg9w
	Z8fQPNduVOG3ORB/XwCQT5NcVkMlmvkHmZA/shXANP4o2Bdt0cZdf2Urxt+AWywQCDZW+BLM1rb
	d6sEqD69C3bADz/K91HM0tSU7SybRtC/vgNv1AkmOgN2vnNkJTcBRKIqse0JAWi4RWWaQEkM9vO
	vhVIzumRL2v1KccILFxj/DZ2QxUReZ/p0KCfZQix
X-Received: by 2002:a05:6000:41fd:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482b1fef313mr10721691f8f.17.1787155056671;
        Wed, 19 Aug 2026 08:57:36 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:36 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/37] python3-idna: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:33 +0200
Message-ID: <67cfd22208b69ee05756bea754f18726bb8d13da.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243738

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:idna matches nothing in the CVE
databases, which track the Python idna CVEs as:

* CVE-2024-3651 (kjd:internationalized_domain_names_in_applications) [1]
* CVE-2026-45409 (kjd:idna in the CNA record, same NVD CPE as above)

Set both vendor:product pairs.

For scarthgap, python3-idna is 3.7. CVE-2026-45409 affects idna
versions before 3.15, so this metadata change will expose that CVE as
applicable/unpatched. The fix for CVE-2026-45409 needs to be handled
separately.

The bare product name is not an option here: it would also match
"servo:idna", the Rust idna crate (e.g. CVE-2024-12224).

Note: Original commit was for python3-idna_3.11.bb. This is adjusted
for scarthgap where recipe version is python3-idna_3.7.bb.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3651

(From OE-Core rev: 70a1b17edf909715065c1d727f989fc07f8db8bf)

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48428c0fe22d8ecbfa53efffb28173d4d37539e6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-idna_3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
index 729aff1c462..e4213be5dfc 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
 SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
+CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
+
 inherit pypi python_flit_core
 
 RDEPENDS:${PN}:class-target = "\

