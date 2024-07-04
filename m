Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D53C41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8890.1720096053645897084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fgnArbBQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f9e2affc8cso3508555ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096053; x=1720700853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGGdJK08O2c9GP/fS+ERQbsQm6U7DSf8v1MqgGOpnco=;
        b=fgnArbBQIXabOcEzVtva+DPVhexRkl5JtlypKjuIPjEVJKBFdHjR4SixtcCz4rW66g
         4zAUsvVfH+tyk0MndGN46DEyEL5bH5Mply8qeQVfHGympr4MnIR1AT5kv97CuS3jDQZM
         zkTntTY1i9KvFr8zAnzd1D5RUTt08KgPnA5vD+und7AzTQmZR192Som88U1eEqUm9bhu
         wUxTn84O/VZTJ2bRe24O4+nnj6l2atUvuxh88Ey+1YThsdyN7Y+vPKcRQb32GlK20xxr
         NRuZRPjBJm4Smdjfmu8bbc/wVsGR1feylLJGYhFanKnR7v1LX6BA4WZCtOf2JhM1QDhu
         /Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096053; x=1720700853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGGdJK08O2c9GP/fS+ERQbsQm6U7DSf8v1MqgGOpnco=;
        b=dCgLDtZ4tYTXVQ7lMv2EyawwWLrXq2y+um7DbGNLV0o0O5sHa9eILfhg8Z4MgiG0Zt
         InyasN8thdFiTEvFbleUV15dZN/EFR4uSxCD8kPXc2xIwdaGGrgzr5YQJxJrghsHbsjV
         8AORefQnBKW0XbGTzX4V/wMVhXyaDUyzThUmPevAWYcLU2RlBNwJ1hB2PV2vXOq0vmyS
         SvHoVbxr/DZDAPfHSLbUdXVw9qrvUvBoh7XvMXGV3rT6jm3ADKbxAYqK+QaSdVPT3thD
         6M/uotcjPuaHyNAKKp7Fi8Qr95DEDGnAk/fPKQ1pG2M3IlWLaRZKv59Pe44rS5Lbdxzc
         dVhA==
X-Gm-Message-State: AOJu0Yxr2DjSORUTm1uJLi54THSgetimQ32TSRIsRisUGQbdxNIBXlOY
	VEndSIK94iKa28F/XdTjoWIFq5ZmoVhxapzfQgllGuPOHThvxnvts26P7T+kFEIdVJScwI2nvNh
	u
X-Google-Smtp-Source: AGHT+IE3AxGZC3xGi14EFLpVrSKYtrFnOVeW7GvNkrbU/78VypDbHHN38z7DTWrBowcxhfTJ3H9QAA==
X-Received: by 2002:a17:903:244c:b0:1f9:c8cc:9e0f with SMTP id d9443c01a7336-1fb33e49fadmr10137515ad.18.1720096051513;
        Thu, 04 Jul 2024 05:27:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/21] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
Date: Thu,  4 Jul 2024 05:26:59 -0700
Message-Id: <ac35432687624ad58ff6586446e5e73710658a68.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201549

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Switch to use flit core since upstream changed.

They also changed the capitalisation under pypi.

The license didn't change but the file was renamed, probably as it wasn't
rst.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e352680528b18c3cdae26233bef7cddc2771d42d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index 636fb35811..2c02037011 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -2,17 +2,17 @@ SUMMARY = "Python Jinja2: A small but fast and easy to use stand-alone template
 HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
+SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
 
-PYPI_PACKAGE = "Jinja2"
+PYPI_PACKAGE = "jinja2"
 
 CVE_PRODUCT = "jinja2 jinja"
 
 CLEANBROKEN = "1"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_flit_core ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.34.1


