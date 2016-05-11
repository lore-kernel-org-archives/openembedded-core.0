Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1706276F8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:21 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id i5so4047813pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gj7oXLJSMFa6C+K164h8YXEheXIHR9Ci5Q/wdpOHg/E=;
	b=PH2w4Ih1vTxxQtOTld6lGrF7SpqpFudWXL3X722lzPIZbKdjFCT3f6gqPrPfDkdX/3
	WqlPV100NQte8Sb5vkQkEM+RLK2xsNKaXd9L/UmvpEiGeft3PJqK1jbDuDmfUDUhwSAq
	3frVWbQouU6jAPVpKDrgao6zpYDLBlvO84cXcH7W3fLuhQRYSp0oRLMQHl1XCi0kY2jr
	SklrDujrf/sSXSMVoYOF/erAkS9gnUYqxJez6BixAXk8Dj2P1s6QcArv0XW2mUs3Fl7Y
	v0eYoyDDpHkzNd2ADu+sSamcetxrabsZdg8GiTVbIpCFUZZDbnenPba94SBHG7FWnoeq
	facg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gj7oXLJSMFa6C+K164h8YXEheXIHR9Ci5Q/wdpOHg/E=;
	b=SoKtn3G8g7o4JYmIuqthAYLfexegBrFalLUGgwbUPSSFw/qUNT5qLihy8Pp6Hxq20+
	z6CNrqpFMFDHe8lPRfHwWKXuKpFjUZ6ps3e9L34bZW6fISfhPlkTHPqQ7JdTKkFt7JjO
	PkzmVkP6CaFN0Sn9zlq3ih8/9ujGgiut9eRcmHRnhPmjwOtu1vH7WRECIr1xAeXLCSPL
	GxZ/J5iN9ayP83TtDOxeR+GRRm1yyALCjDieAIyt3up6BTtLIfmXOfHKWhkp/4+VsJBF
	Y32SSVrumxfrssZECC5QcMJciHTg2mjZlBWQ1FPpTi2SSPLiXu8uhcfpW0za5SqHr9/0
	uvCA==
X-Gm-Message-State: AOPr4FUH63bg5s7sH8RMkLct9RsGyqNY3B6JiocWE7A5mgUIlv6ynSHhtim2N8jEO/AkPA==
X-Received: by 10.66.25.133 with SMTP id c5mr6770695pag.104.1462988182133;
	Wed, 11 May 2016 10:36:22 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:33 -0700
Message-Id: <f944d2d076f57fc05c5fda6904a70febda25209b.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 30/42] libgcc: Ensure that gcc configure options are passed to libgcc too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2016 17:36:21 -0000

libgcc uses certain options from EXTRA_OECONF as well, curently we are
ignoring them, as a result we do not configure libgcc to match cross gcc
in some cases e.g. ppc/musl should have used 64bit long doubles but
it went for 128-ldbls which is default, works on glibc but not on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index e6d31bc..cb1237c 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -1,6 +1,6 @@
 BPN = "libgcc"
 
-require gcc-shared-source.inc
+require gcc-configure-common.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.8.2


