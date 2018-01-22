Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 556E87863A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:44:44 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z48so9169719wrz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rVON5cfaAFEnhwXvx1DI/9yukm72dhvsSiHNNIcwuSY=;
	b=j1IV6Lxxf/38eDgryBJP+AJYkNGWjL5cZCsHkmKGszUyYaTCxwtkwAe9e0xRj4y9mP
	etZRb3XDQkP/hfyBepLuU1xDh+wSGUeBDQ4aOL4RKN8w24OSKAMKCWfIuBT+4pgYm0W0
	Aq8o9wCw5vse568iH67rkPZzcF0xpES2NBcjuapr2cyRpon7/ltpT6rAOWPjY8acP3hg
	cLRY2KlSo3wWuhrBMxlDTqzeunlu+Fd3viQpVJ57vDlRnVFlL5v04F8IrI4WGJY02hkz
	dYatE9uZRmJGt3tozrwEAWNkHX5EgFPrWLa3Ed1kW9wEaeGjXmLD3t4+/IT381BHShB0
	Rg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rVON5cfaAFEnhwXvx1DI/9yukm72dhvsSiHNNIcwuSY=;
	b=iSk1UkLGdVMF7S0WVvKER1CfZ8RoG6tF8bR5+d75TlEfThHTytsPJDKDWi5a6/n0JR
	9CUgB5bih+txAO/zmS1nsU/Kc8t6oIAo2E6cBjIROw77wTfrAEpoYBFQ+6O5KGly0uta
	asYpyEYT1kpHIN7LGKhRCUMdaP/2rn96q1ojSbqnMGaVQXqSRHOJxKwkH73+pQTJ2kVd
	RUO93xLhhbgbez/UKROXX4Ab9itBRJKLauFv4HTKowqiFWfVYGHWS6YB+jgq6ix4Duex
	H9yKVKuN7WuNkB4OOWjz8X/wuHsruLZPPIdzQHk/HNTelHDubtUQOvJYTR1tYa2mWJfk
	Vxmg==
X-Gm-Message-State: AKwxytcXq2v3n/w3kcuTv6bsztwfXUkNgAn/mi73tXekU7Cd8TOeaFwm
	GUuk/e+mG48l3lCVMGg8GhqKl+Tw
X-Google-Smtp-Source: AH8x225CHhSCODCbYD6A8eTpHQjOZs77R/ToQzwnAdlB0FK6QlgCg5QIeXxWJh2DJpdwpmY0geUEGQ==
X-Received: by 10.223.167.14 with SMTP id c14mr5323984wrd.123.1516635885001;
	Mon, 22 Jan 2018 07:44:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r75sm8843172wmf.25.2018.01.22.07.44.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 07:44:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 15:44:42 +0000
Message-Id: <20180122154442.23769-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package_rpm: correctly handle LICENSE_${PN}
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
X-List-Received-Date: Mon, 22 Jan 2018 15:44:44 -0000

RPM spec files don't distinguish between spec-level license and the primary
package license, so always output the License for every package (defaulting to
the recipe-wide license) and use LICENSE_${PN} if set for the primary package.

As the primary use of package_rpm is to generate built packages, this fixes the
license fields in the generated packages.

[ YOCTO #12057 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b08608c8466..3cbbd1eb537 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -382,6 +382,7 @@ python write_specfile () {
 
         # Gather special src/first package data
         if srcname == splitname:
+            srclicense     = splitlicense
             srcrdepends    = splitrdepends
             srcrrecommends = splitrrecommends
             srcrsuggests   = splitrsuggests
@@ -421,8 +422,7 @@ python write_specfile () {
             spec_preamble_bottom.append('Release: %s' % splitrelease)
         if srcepoch != splitepoch:
             spec_preamble_bottom.append('Epoch: %s' % splitepoch)
-        if srclicense != splitlicense:
-            spec_preamble_bottom.append('License: %s' % splitlicense)
+        spec_preamble_bottom.append('License: %s' % splitlicense)
         spec_preamble_bottom.append('Group: %s' % splitsection)
 
         if srccustomtagschunk != splitcustomtagschunk:
-- 
2.11.0


