Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 09113765A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:59:20 +0000 (UTC)
Received: by iodv127 with SMTP id v127so71395231iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=MryWAtgkJevsKnJ5Y4j809pA/KCfx+jBN+NI1wD0jGE=;
	b=M3WWcBlZ83oXc43E23TpMhOlXFRHbRC0dvvX5dRuD5hiqnqsFrPJKQs8E2LwAqxq4R
	L9dY1nV3YhF78D9dPU9TASdt0W5uag0xxTQ2JuSbDbAkzN2hKROsXEYcZ8NOHlIuCKvk
	pFe2d0sQAOU2/pDlbAEqRehfd10qhLYm/B9JoEIdhclknGOXuj616Dxx1CDClG/B1cp2
	BniyEaGbro2jx05ajWPJ9RFyU/PQNO2RMTOp1P8uwPFe2lJYg/H2jWPcVJatoK2PQtl2
	I5MDqtlsIHsiKJMecOPMF03XAQ0AHoaoTaGV5rergWQHhFyBoR0j0Hj0KETLUoTZcHsX
	YHyg==
X-Gm-Message-State: ALoCoQnaahrijN1BNcRmGYTPG92O7lQX/MykNAUnfZ1wJSOKKr2FObKG5uM5HoZMubxvnCnkAZm3
X-Received: by 10.107.137.208 with SMTP id t77mr41912213ioi.2.1439564360527;
	Fri, 14 Aug 2015 07:59:20 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D814.dip0.t-ipconnect.de.
	[93.232.216.20])
	by smtp.gmail.com with ESMTPSA id d3sm2701488igx.5.2015.08.14.07.59.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 07:59:19 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 16:59:03 +0200
Message-Id: <ab1937fa04c389c153d2a7ffde76b73e7846e093.1439564102.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439564102.git.patrick.ohly@intel.com>
References: <cover.1439564102.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439564102.git.patrick.ohly@intel.com>
References: <cover.1439564102.git.patrick.ohly@intel.com>
Subject: [PATCH v2 1/2] tar-replacement-native: relocate via NATIVE_PACKAGE_PATH_SUFFIX
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
X-List-Received-Date: Fri, 14 Aug 2015 14:59:21 -0000

Building tar-replacement-native as replacement of the host's tar in
the standard path was meant to be done manually by a user in
preparation for the regular bitbake run. Such a usage has been
superseeded by installing the pre-compiled buildutils and might have
been broken on hosts which need it by the sanity check for tar >=
1.26.

Therefore tar-replacement-native_1.28.bb can be removed in favor of
adapting the normal tar recipe such that it installs an opt-in binary
under a different path.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/tar/tar-replacement-native_1.28.bb | 6 ------
 meta/recipes-extended/tar/tar.inc                        | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar-replacement-native_1.28.bb

diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.28.bb b/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
deleted file mode 100644
index 071ede7..0000000
--- a/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require tar_${PV}.bb
-
-inherit native
-
-BPN = "tar"
-EXTRAINSTALL = ""
diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 7416927..752b74d 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -18,6 +18,7 @@ acpaths = "-I ./m4"
 
 EXTRAINSTALL = "do_install_extra"
 EXTRAINSTALL_class-nativesdk = ""
+EXTRAINSTALL_class-native = ""
 
 do_install () {
     autotools_do_install
@@ -48,4 +49,7 @@ ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
 ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
 
-BBCLASSEXTEND = "nativesdk"
+PROVIDES_append_class-native = " tar-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


