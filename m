Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B6E7E764AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 16:01:53 +0000 (UTC)
Received: by iods203 with SMTP id s203so89355532iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=s0btPeDf4uur0j1h6cz7mAPd9FN7ODoF52jhc9SFxeA=;
	b=i76N1Ul3pYF7lT9xIjcQvXh5WAESg9QFZuKM5Qquqg1ivI8C8FhPglCrBlRMrUWnJF
	woj0xSVCtBL3mp+y6Lwd34S0tGCNi2AgUKgP73T0AmjBEtBW9dqSC26yErcy1CHadlr0
	gr3WzaDEswIpvYl+i16yr06CIFNCrqgjTZN7T5jzFrOJWs297qlETJ9n/d5gvB80Ro81
	KwjfLJu3jIxbHSkI7eVCN67oy+v4cmE8NjLesqauRFo9eesl6hfgO/C+Sw1qdBvw6EZG
	FvzHA9UnvLITLIPHWUiLHgj43C/ig/pMTyqF3mtQq9wZFhoY6B8OmR0gQyuzPG+TtvRz
	SXLQ==
X-Gm-Message-State: ALoCoQmzvWGVbJNmwrq4uAdNHloWFnGeDPaT6P+bfqggvg/lXf97q+h1d18iFO8SSgYOgzkvlDew
X-Received: by 10.107.12.166 with SMTP id 38mr31109617iom.157.1439568113619;
	Fri, 14 Aug 2015 09:01:53 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D814.dip0.t-ipconnect.de.
	[93.232.216.20]) by smtp.gmail.com with ESMTPSA id
	h33sm5246371iod.23.2015.08.14.09.01.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 09:01:52 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 18:01:41 +0200
Message-Id: <d5e88b8ae273c6ccbd5ee2d8f435656c742ad71d.1439567977.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439567977.git.patrick.ohly@intel.com>
References: <cover.1439567977.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439567977.git.patrick.ohly@intel.com>
References: <cover.1439567977.git.patrick.ohly@intel.com>
Subject: [PATCH v3 1/2] tar-replacement-native: relocate via NATIVE_PACKAGE_PATH_SUFFIX
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
X-List-Received-Date: Fri, 14 Aug 2015 16:01:55 -0000

Building tar-replacement-native as replacement of the host's tar in
the standard path was meant to be done manually by a user in
preparation for the regular bitbake run. Such a usage has been
superseeded by installing the pre-compiled buildutils and might have
been broken on hosts which need it by the sanity check for tar >=
1.26.

Therefore tar-replacement-native_1.28.bb can be removed in favor of
adapting the normal tar recipe such that it installs an opt-in binary
under a different path.

The special do_install logic is explicitly limited to class-target,
instead of making it the default and disabling it (which would be the
case for class-native and class-nativesdk).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/tar/tar-replacement-native_1.28.bb |  6 ------
 meta/recipes-extended/tar/tar.inc                        | 11 +++++------
 2 files changed, 5 insertions(+), 12 deletions(-)
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
index 7416927..b339c43 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -16,16 +16,12 @@ EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
 # directory.
 acpaths = "-I ./m4"
 
-EXTRAINSTALL = "do_install_extra"
-EXTRAINSTALL_class-nativesdk = ""
-
 do_install () {
     autotools_do_install
     ln -s tar ${D}${bindir}/gtar
-    ${EXTRAINSTALL}
 }
 
-do_install_extra () {
+do_install_append_class-target() {
     install -d ${D}${base_bindir}
     mv ${D}${bindir}/tar ${D}${base_bindir}/tar
     mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
@@ -48,4 +44,7 @@ ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
 ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
 
-BBCLASSEXTEND = "nativesdk"
+PROVIDES_append_class-native = " tar-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


