Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05463CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:30 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.1275.1758300501082190381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=PR8xV7mM;
 spf=pass (domain: baylibre.com, ip: 209.85.160.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4b5ed9d7e20so24210671cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300499; x=1758905299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90wh3UjzwWi/UUa00/n0l1rLsaekns+98y8E3QLbr2k=;
        b=PR8xV7mMB5Vd6dDrKgJQp8JUP/VsaRmbWI2L58b/i4uV/vHubsPdD0/d0K0RftsPWv
         OEinJrNYDPzmIO1OXl136uEK4wgNlc0r125N+OR+KzRe7cGsVImC3ivhHhEPMo3VNYMB
         dxk7RS5i0RaYWwl0P6PZxbap97wJOAQOMHPUBzogTlDPlV3GCBG/jbKLyZ0euBhAWsq8
         CboFEXeDE/t84Rf6H7GGiqgb5pESBvJBqjgeJdmCJ3uPmCAm9jak0IIvQdpCr19hGjsa
         Qx6Ac0W2hOGwNeBbgRNN2oP3KeKLB+THXx0T4NRKjLqmdrQ1h77sM+LPI+86xKbTZEBK
         6JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300499; x=1758905299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90wh3UjzwWi/UUa00/n0l1rLsaekns+98y8E3QLbr2k=;
        b=bSnbMXtCD0PTM3enpayCIaWMt9UZNTlnlbKZ/G9/erOXqOiBEb2m4xkdWTQM9DiV2c
         a1m9M3m/NH556CwZi6taT/XPFltGpC6qn4of0sPub6+WorN7HKls1xRAcxnEnAU7iPk2
         iv/yemDZz0Dfd2zigC0uGmj9lsO+6tQxkgIyUovIJETYcXM4hwyP2DcVbzsbsn8Klpzm
         jHrdEt+mG6fChUDcYCNHH9NBk3VmYwmEgxpnaNiM8neO2duuBDNLKJ1Vv/mdOo2UWsWp
         XqntS1+lC9JMv9zsmGK8AOVdnkwOuoi58HaYie32yVAE8sz0L2o5wcoCQSLOry1QsOLr
         juPg==
X-Gm-Message-State: AOJu0Ywayao7SlxSHazJWDyTTveokpUoNu49cYEbeuvy882z1PDCGi0Z
	Np4AbfuwiCJHpYR+MqiuUucKWe5dXWRoxDxPRp6wift3Pzw5vLCD49iU16L5wgjubdfT/F5e9wj
	AsSBPeeP39A==
X-Gm-Gg: ASbGncuzXSnY7Dn+GHsGvF6SoLOlLHgPDTSiCa755ZqKDRew3dxloouSIA8hXy9I3im
	Sy+Q+y1vi7SpFd37DJahroziSyqgKcZOPE9UPnT/H7iE2qBYblq2eLCTGsv5sRovYCzoQhtTAmr
	ebxretOZUzcum8zsffPDuhwUs60WRp9mMZXdnNh3ZnZyOqvDWzZ2dEwQ9gieXYzZj3Qy2ABhwJ6
	CxWNA5zw6lRSgmx+c74d9oM3F7oZjZ2B6jsERVqXy4sCLIEDA2H5tHygk7a6zCU1+HYD+vG0ioq
	0TKKEajlOARUM8fmVqdsikhZJLoHwcBz2m4cuS1QMkteB8zYBBsqQFn2o3t3iAPFHqiDlI3T67u
	22HJbs5JT06NYTvVk1JN8SE6vxp1wcwohJnSk+iTqrE4n5W/Y3y3pJSMr8A==
X-Google-Smtp-Source: AGHT+IEkQdApqv7JrLzYKfvFlANXSQHv99L0+Ft9NVbzc775S/vpVjI14MsH4F+nT/+/2UtUVLBlbg==
X-Received: by 2002:a05:622a:1f0d:b0:4af:1912:5966 with SMTP id d75a77b69052e-4c072b441d8mr40750071cf.55.1758300498856;
        Fri, 19 Sep 2025 09:48:18 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83633fcab48sm372131785a.65.2025.09.19.09.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] python3-setuptools-scm: upgrade 8.3.1 -> 9.2.0
Date: Fri, 19 Sep 2025 12:48:03 -0400
Message-ID: <20250919164803.3174518-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919164803.3174518-1-tgamblin@baylibre.com>
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223765

Release notes (https://github.com/pypa/setuptools-scm/releases):

v9.2.0:

- reiterate version inference by RonnyPfannschmidt in #1202
- simple activation now requires a extra instead of setting up many
  pre-existing projects for failure/error

Note that there were several v9.2.x releases yanked upstream before this
one was added on August 16th.

Add python3-tomllib to the RDEPENDS list so that the module imports OK.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_9.2.0.bb
index 81e04ddea5..322bb1fe6c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.0.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
+SRC_URI[sha256sum] = "6662c9b9497b6c9bf13bead9d7a9084756f68238302c5ed089fb4dbd29d102d7"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -18,6 +18,7 @@ DEPENDS += "python3-packaging-native"
 RDEPENDS:${PN} = "\
     python3-packaging \
     python3-setuptools \
+    python3-tomllib \
 "
 
 RDEPENDS:${PN}:append:class-target = " \
-- 
2.51.0


