Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9B4460402
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:13:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11-v6so22426812wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8RDiIL0GIQ2rj2GYWArqHPOKrnWmmvEe4eNB8da5wnI=;
	b=R3WtsLr/lKf0f2Zs/np8WEwxj8NujDTJdo5DOnNqx+KmDlnwSrrt5/0fmVhZKWyZNI
	vh6idG/WR6GSHGsJhj3aivvKjgaqEJddVF5pvHkFuzHSkLzwNF/TAA47uwUkwHMDiUz1
	/t+sWubGWLjYP0Ev2mFeTijM6BbecMV3WQWb1YIS/9sDeCslA1GNFrp7A9DptIB9VHXL
	n3HBzdz+Y6b0lL7A5fb2ONm6qls64BTj/M+Aux1vawket8qVuLL2v5X5itH7mEYAtnWO
	fRne7bnHUHWadXnD8nutkR/t9zmuXors5a28wzWVf9I+BN8yUpSAk3TVvpZ9kmCGhw0W
	/E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8RDiIL0GIQ2rj2GYWArqHPOKrnWmmvEe4eNB8da5wnI=;
	b=iI3WCGnFQH2iDhiy/8mlBaBrUpCGJnL4rO6XyeaOaTGEwiXcPCq3VDuMvR3TztiK2m
	u3K/Ba5qf6uhjwyfB3IW0Oy3+vq4s0Dd+GAqe8ZupBpMLylTo2Auh0U/NkzKsJ0Vpw1R
	PXgioSi0fbwpFMU7e85OSKbYZTfJ5zq4RmxNtWOOc34XjdXGERrvw3vAkgxr4PbKoMTy
	2seM2H28d56SrRPZ8jfYPQYEas1HY7sciqItKNRT4c9XkJZTMlzPKho/97+5MZajcOnM
	qancTbwUR7oEzF/ccbn5MRZaqppcCgUzxvGRmT1aPhRxuhOyD6BBMalo6WqS3QwNOzrl
	zfsg==
X-Gm-Message-State: ABuFfojq84V0VKZx8pRuRQzOX43eB4rFU/ontE7BXcH9qInMxKw/ZJAl
	8LJi22Qf6tzNiEAgTuUNwPT6D2Lpy8g=
X-Google-Smtp-Source: ACcGV615oAxaX7h33p4iih2cLX4+PTs1VdLxSHWmdKSnIeK76WwwH8IRiFe/0TzH6uqFqlu3LoRfPw==
X-Received: by 2002:adf:f712:: with SMTP id
	r18-v6mr15580281wrp.85.1539627185989; 
	Mon, 15 Oct 2018 11:13:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t3-v6sm9551698wru.47.2018.10.15.11.13.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 11:13:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 19:13:01 +0100
Message-Id: <20181015181302.9865-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] python: don't wipe RDEPENDS when parsing manifest
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
X-List-Received-Date: Mon, 15 Oct 2018 18:13:06 -0000

We want to allow the main recipe to extend RDEPENDS directly, so don't wipe
RDEPENDS when reading the manifest.

This fixes the missing python-misc dependency from python-modules.

As the wiping was having the good side-effect of removing the PN-dev dependency
on PN (which doesn't exist), clear RDEPENDS_${PN}-dev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 3 ++-
 meta/recipes-devtools/python/python_2.7.15.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 372f27b15dc..72478f8663d 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -245,6 +245,8 @@ FILES_${PN}-man = "${datadir}/man"
 
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
 
+RDEPENDS_${PN}-dev = ""
+
 BBCLASSEXTEND = "nativesdk"
 
 RPROVIDES_${PN} += "${PN}-modules"
@@ -288,7 +290,6 @@ python(){
             for value in python_manifest[key]['cached']:
                     d.appendVar('FILES_' + pypackage, ' ' + value)
 
-        d.setVar('RDEPENDS_' + pypackage, '')
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index e3a4ddb3274..d78400b6e61 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -177,6 +177,8 @@ FILES_${PN}-man = "${datadir}/man"
 # Nasty but if bdb isn't enabled the package won't be generated
 RDEPENDS_${PN}-modules_remove = "${@bb.utils.contains('PACKAGECONFIG', 'bdb', '', '${PN}-bsddb', d)}"
 
+RDEPENDS_${PN}-dev = ""
+
 BBCLASSEXTEND = "nativesdk"
 
 RPROVIDES_${PN} += "${PN}-modules"
@@ -220,7 +222,6 @@ python(){
                 if value.endswith('.py'):
                     d.appendVar('FILES_' + pypackage, ' ' + value + 'c')
 
-        d.setVar('RDEPENDS_' + pypackage, '')
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
-- 
2.11.0


