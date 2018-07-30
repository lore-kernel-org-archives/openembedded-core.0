Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E94DC71B2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 22:25:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s9-v6so949289wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=OmQV9L2ITLM9pOw3eby6LldiBaHsBGLdQBcQFgJ4JZ4=;
	b=OzucIp3LWEq/pFTZlWD2xfaWAlrxe6/OB/OinmbvGwrZG8GbCgc9+1AUXtBjMEbKgv
	Df+bPj5lxTaccVQJLX1ArJKKOcvWZwz9w2FUyh+JKQcGQtIu8/yah7lxdq02iU2H0dLA
	pCARdgNnBNMs3DgJeFiUl5LeLgKkhUHoC0ZA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OmQV9L2ITLM9pOw3eby6LldiBaHsBGLdQBcQFgJ4JZ4=;
	b=YbdY1m53QrOVnCvxVVOauU14+AtXjsWL44Wuv4y+EX5PWTVCbwYC7dpBuQtC4t05Y0
	IOSQN+++iaUknesp5gKQ7PZ/Ptuxyw4EScTh+NvJ9SgFIp0tqM0yq+aDjEnvUscOgOD9
	cESeNP+35rM5XnmWRlowgat+uL7zP9QF6A9HZBFY3tisL+15FSrxKcYK74LkfsKeSlwr
	F5kEye63b0rc3/y4W4+LfiKJPXRjlgC0QI7HXejguxu7rnYBZTCiWbOo1ZSanPlkR/40
	H+Lxixijszo4HgNaWsb8Q5wjXGOe0EpS6X4bngqOtB+AyXfIC1c5xuNSXWPz3ntrNMhN
	NCkA==
X-Gm-Message-State: AOUpUlHEzFIdOU+4IqSIzZT4EPO5sH8Mgbs6hdFGUv5v7qVANTDlzBAH
	MIcYDtVdn/mzJpwwnG/QnWT3CVQ/ewDqJQ==
X-Google-Smtp-Source: AAOMgpeYLW1X8Q15RQfZ2OdrtJMPqY6AxdkKbLY/BAIlj+fqwVH7+Bo3Bmfo3Y0co9ZtxFXEbJEOew==
X-Received: by 2002:a1c:910f:: with SMTP id t15-v6mr655168wmd.51.1532989531201;
	Mon, 30 Jul 2018 15:25:31 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm11258415wrh.85.2018.07.30.15.25.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 15:25:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 23:25:28 +0100
Message-Id: <20180730222529.17655-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] multilib_script: Add support for multilib scripts
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
X-List-Received-Date: Mon, 30 Jul 2018 22:25:31 -0000

Whilst the package managers handle multilib ELF binaries well, they don't
handle scripts in the *bindir directories well. This adds support for
marking these up so that they can be handled using update-alternatives.

Its done this way so that non-multilib systems don't see any changes and
there is standardisation amongst the multilibs on how the alternatives are
named and prioritiesd. The priotitisation code needs to be added but this
change means there is somewhere to add it.

Recipe needs to set MULTILIB_SCRIPTS in the form <pkgname>:<scriptname>, e.g.
MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/file1 ${PN}:${base_bindir}/file2"
to indicate which script files to process from which packages.

libtool is used a as a reference to stop the libtool scripts conflicting
in a multilib case and allows the kernel-devsrc change to be merged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_script.bbclass          | 32 +++++++++++++++++++
 .../recipes-devtools/libtool/libtool_2.4.6.bb |  4 +++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/classes/multilib_script.bbclass

diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
new file mode 100644
index 00000000000..a5a552b7163
--- /dev/null
+++ b/meta/classes/multilib_script.bbclass
@@ -0,0 +1,32 @@
+#
+# Recipe needs to set MULTILIB_SCRIPTS in the form <pkgname>:<scriptname>, e.g.
+# MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/file1 ${PN}:${base_bindir}/file2"
+# to indicate which script files to process from which packages.
+#
+
+inherit update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+PACKAGE_PREPROCESS_FUNCS += "multilibscript_rename"
+
+multilibscript_rename() {
+	:
+}
+
+python () {
+    # Do nothing if multilib isn't being used
+    if not d.getVar("MULTILIB_VARIANTS"):
+       return
+    # Do nothing for native/cross
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
+       return
+
+    for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
+       pkg, script = entry.split(":")
+       scriptname = os.path.basename(script)
+       d.setVar("ALTERNATIVE_" + pkg, scriptname)
+       d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
+       d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
+       d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
+}
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index b02620b4b41..b8a52408853 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -26,3 +26,7 @@ do_install_append () {
             -e "s@${HOSTTOOLS_DIR}/@@g" \
             -i ${D}${bindir}/libtool
 }
+
+inherit multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/libtool"
-- 
2.17.1


