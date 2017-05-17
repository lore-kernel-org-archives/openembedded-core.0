Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E74C671A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:25:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 70so10499725wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cYU6SPWmKWasVuaMPvDulkyLs22xJIj2fb7zdRG3M6U=;
	b=coxH+tUk9nhuFBW/gTsez4VzFI5ADzfRGBmspFN1mgOLC3hgdd0q2AQtPjEMc9L5/v
	c23EGNAcZZd4QqymvIVAWFo1cvOMOlOo9v29Cmjp7uIENW3Z1l3cMaM5qwvXsX+yyNFQ
	/WijzE3ANSQa5v361+hrJtvSsd3vPSTgNTBXi5Wo7zoMtCu82V4VDtxtfymyQ2nOaCQx
	Po5KcWNKmBjTSndewMjaNAsf7tyCDpIFB1I3Oz+u699op6N0OjrzNvtB1dFQh3labhXo
	qi+10umPb4nk7FCLHUEaTH3+WqAw9R/s6RULUr7Ryh+stY2l9wVC9CLdgAtoI3awan2e
	5lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cYU6SPWmKWasVuaMPvDulkyLs22xJIj2fb7zdRG3M6U=;
	b=S9OsQNQKqhOOunXAZcBuzJKBpfbfy4cFFCU6dziZ5+z7Evw5qmhAH4b4hk2GFEszIb
	rPhVzGFGreLdBHJEj4iJyIyWLRq60ap+KMcXL455ZzaFB5U7AVFuQyN/lPBCYX9K998k
	VOX3DrEVsSOdtDb8YZF0LwrHiJDpn2fjY626NypLyzxOratMHuoslCenc7aZRwNYKVSb
	VLkUw3c8jRHhAtJi0od5HuBN6IPFQbfxfrylahsK5KBOH9BoPlpSdMzz95duN8xLJFav
	sTDRTvcJ99iEKKUsa5keRb4vdqdnSpRewQJJpd0hrn78By5z0PqSHl3eBbufONUe93DY
	GlvA==
X-Gm-Message-State: AODbwcBm+J6HSDV8S2snXZ7QLZwFJgSyAhhr5rucwplzghGpPPQ4KUMx
	lB372JFt0X4DBu3RUiQ=
X-Received: by 10.28.216.129 with SMTP id p123mr11797193wmg.55.1495027550712; 
	Wed, 17 May 2017 06:25:50 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	h123sm17801874wmd.34.2017.05.17.06.25.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 May 2017 06:25:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 14:25:47 +0100
Message-Id: <1495027547-19537-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] opkg-utils: don't generate PN-dev and PN-staticdev
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
X-List-Received-Date: Wed, 17 May 2017 13:25:54 -0000

opkg-utils ends up in any opkg/rpm image with package management as it's the
provider for update-alternatives.  If dev-pkgs is enabled then opkg-utils-dev
will get installed, which is empty but will subsequently pull python3-dev into
the image (as opkg-utils-python depends on python3).

As this can result in all of Python appearing in otherwise small images, don't
generate these pointless packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2460a26..06710b5 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -39,6 +39,10 @@ do_install_append_class-target() {
 	fi
 }
 
+# These are empty and will pull python3-dev into images where it wouldn't
+# have been otherwise, so don't generate them.
+PACKAGES_remove = "${PN}-dev ${PN}-staticdev"
+
 PACKAGES =+ "update-alternatives-opkg"
 FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
 RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"
-- 
2.8.1


