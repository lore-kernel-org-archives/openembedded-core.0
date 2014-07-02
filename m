Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id CFDA660167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 10:24:23 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so190208wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ga6jJtL1Z7HMa2BAp2EqiRUKmITdlLkHmktS8q23bcs=;
	b=aq6AuIGPMm8yfQ+A6Vcv2aVBFCyt/6d7h4AUswqvxJmjWnQyrcW2Jmhfm1SnyaoY8q
	1TmX4/LH7ncPv9gd5MeLgjfGRhu1A/LhCLAlYKog/PW/oyxi5rgud1nw3fijzKufLL/H
	giGNRwAWjluJWwcNm2c+GS2C3RPcDnS+kdULcB77xfCU4/OKz0yo1c+oasD2FUkO2WcD
	Sal2Xrep56DEQAAPYz4ICbi1Lbu39uB0XMtO1ErDYgaSaP8tZkINaN4B0BV735j08N74
	0HUYPaK39/JPcosoP/v78GvO2bIXailAsy5D9mzADUapy7096hHjhJKgJKsfQcocN0jP
	MTng==
X-Gm-Message-State: ALoCoQlRhNMckUlcqHozLKegbStR8q/lps81RQWi4na2q+QdH+nUlRmP5HfNE3+fDFQcoa1Tt1eo
X-Received: by 10.180.102.98 with SMTP id fn2mr2280375wib.39.1404296658967;
	Wed, 02 Jul 2014 03:24:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id i3sm53655725wiz.13.2014.07.02.03.24.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jul 2014 03:24:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jul 2014 11:24:11 +0100
Message-Id: <1404296651-25024-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] autotools.bbclass: remove autotools_set_crosscompiling
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
X-List-Received-Date: Wed, 02 Jul 2014 10:24:33 -0000

The only reference to this function is a commented-out assignment, and nothing
in oe-core nor meta-oe uses autotools_set_crosscompiling directly.  As it's
unused, remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 0dc1e6b..19edc54 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -49,19 +49,12 @@ export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 export LD_FOR_BUILD = "${BUILD_LD}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
-def autotools_set_crosscompiling(d):
-    if not bb.data.inherits_class('native', d):
-        return " cross_compiling=yes"
-    return ""
-
 def append_libtool_sysroot(d):
     # Only supply libtool sysroot option for non-native packages
     if not bb.data.inherits_class('native', d):
         return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
     return ""
 
-# EXTRA_OECONF_append = "${@autotools_set_crosscompiling(d)}"
-
 CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --host=${HOST_SYS} \
 		  --target=${TARGET_SYS} \
-- 
1.7.10.4


