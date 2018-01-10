Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F39F27884F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 14:32:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 143so2374380wma.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K8SorJgVDxxsnfu3lbdIMlhzREcNOVqK7vCZm6iSiNM=;
	b=P2kftJyJ+d60RSZHKUax+eJGvoAbgWMmOk9BwzXWKJQXgrEhDatxc/zIJeEfo9OrIt
	UDVwKxyUhCaJem0a1VasuLJp4UxzvkgkPCS6GK5XMe4qHcZqbNwTEoip1w3dJWFl/ysx
	yYmTWqV+bz7lySP6ySPSUrDxF5WOXZqBsOrCHouYAzehjp0tF16DHpQPzCs3ELkv/NWd
	+EpoMIf1Ud6y8Kb5MLV1Tev4S27TSmjZn8dsn6dVyBNiGmsPjrDM8E8PvqVJEVxhcZRa
	KTeKDjJejhD7QEaLpMgBsKhT3HF3SpE2lkEBIewYUbhYjBcsZaew4sSUFp8HI88cTn4i
	aJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K8SorJgVDxxsnfu3lbdIMlhzREcNOVqK7vCZm6iSiNM=;
	b=U2/ZPk+1uycZgju/VvUXdMGP/eaUHZowAOqgKxPdFI2AteoVioe0lTKOIlaywnwP9R
	JWNuBtI6VkTja81VXyuQto6Y7HhbKljJv5i+Tm+EIP9KHOPkLkp02ORPBWKyKXfj6Oh/
	iirsEXplPuqyLP35Ge2k339BE1pFTkPaDuwUbTzL2mHoEEsewVRcZr4aQw21bfX4DpIX
	gDeRVpHG6pPRgII3/ip0SdQSakYvXNnwirxKbyjevWCMWLUsAZP45JxYqgZrim5oN76k
	CM8JuE8dr+vn6APCTSgJotdbcywyhSa72lY6WkOPsU41hFC5j74nhQilzyhVaaBqjaKT
	i9wg==
X-Gm-Message-State: AKwxytcvodUYbRoyLUwsIP1STyiYVrvvhiDwZNAYgbaa7MpVuq46GL7E
	ANyWDRSwaQBeJtleHiJU89f0GH0H
X-Google-Smtp-Source: ACJfBovCS7cu+CaPZJ7/4aBJzwgP245n2Mlm/XsX80seDb/7Av51cl/pYIhJIvlJarAJtB5ZpyfccQ==
X-Received: by 10.28.30.82 with SMTP id e79mr2298747wme.6.1515594741481;
	Wed, 10 Jan 2018 06:32:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	89sm16416434wrl.22.2018.01.10.06.32.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jan 2018 06:32:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:32:18 +0000
Message-Id: <20180110143218.22958-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] perf: conditionalise pythonnative and perlnative inherits
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
X-List-Received-Date: Wed, 10 Jan 2018 14:32:21 -0000

Only inherit these classes (and so, add perl-native and python-native to
DEPENDS) if the scripting PACKAGECONFIG is actually enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bb943ecd1c5..1bad6f4e9bf 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -35,9 +35,10 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 PROVIDES = "virtual/perf"
 
-inherit linux-kernel-base kernel-arch pythonnative
+inherit linux-kernel-base kernel-arch
 
 # needed for building the tools/perf Python bindings
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
 inherit python-dir
 export PYTHON_SITEPACKAGES_DIR
 
@@ -47,7 +48,8 @@ export WERROR = "0"
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
 # needed for building the tools/perf Perl binding
-inherit perlnative cpan-base
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perlnative', '', d)}
+inherit cpan-base
 # Env var which tells perl if it should use host (no) or target (yes) settings
 export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
-- 
2.11.0


