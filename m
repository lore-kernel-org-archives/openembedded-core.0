Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C3C1B6E9FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:42:04 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so282853lab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 04:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3F0axVskkRokqAuQtKQPa9bhWL/ANe/C8t682S2pDmU=;
	b=BY/TlgsD3UoB5xaz55dHj6UlK0t8JM9kbvHYOWy65b00mnKWI8OmzqzDfILMe88Wbi
	uXwHjPsTr9UqDCaDBnGNHC4xhTE0mEVNhdUB3dT8+LMS5sFEXmFV9/Jx2mgcaVv8ay39
	albRQKK+gelrnRCxF2XUaK+7w/rh98k7+D3Y64kan5I+P+KDCEfONZMx3KmIV/1iW1DM
	EOJjlCKIDkaej1Eyjy+tBmDkRoK0xlgrpAIsgEcppFJgec+7LRmel1CNdNEhIn4Z3/05
	51mhnhck1obR5UZhLfa+SnWCojzMtveV8HepiQflwu5urxk1nsViy3+k21766SPopNlI
	bFww==
X-Gm-Message-State: ALoCoQnplTVcNXUDMySg2bBjDZ5EqcbGT8ufZTyebX4v3SdrtSMp4oRgLzK7mQs9v8KJ1PpE7Gsz
X-Received: by 10.152.242.165 with SMTP id wr5mr120329lac.47.1390912924983;
	Tue, 28 Jan 2014 04:42:04 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	mx3sm16345665lbc.14.2014.01.28.04.42.04 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 04:42:04 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 14:41:54 +0200
Message-Id: <1390912914-31576-7-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv3 6/6] ltp: fix ffsb ftbfs on cross-compiled environment
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
X-List-Received-Date: Tue, 28 Jan 2014 12:42:05 -0000

Add ffsb-remove-hardcoded-configure.patch: get rid of the hardcoded configure call preventing cross-compilation
Add do_configure_prepend to explicitly force regeneration the configure file and pass configure options as appropriate.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../ltp/ltp/ffsb-remove-hardcoded-configure.patch         | 15 +++++++++++++++
 meta/recipes-extended/ltp/ltp_20140115.bb                 |  7 +++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch

diff --git a/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
new file mode 100644
index 0000000..9f02711
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
@@ -0,0 +1,15 @@
+Get rid of the hardcoded configure call preventing cross-compilation
+
+Upstream-Status: Pending
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -29,7 +29,6 @@ FILTER_OUT_DIRS		:= $(FFSBDIR)
+ FFSB			:= $(FFSBDIR)/ffsb
+ 
+ $(FFSB): $(FFSBDIR)
+-	cd $^; ./configure
+ 	$(MAKE) -C $^ -f "$(abs_srcdir)/$^/Makefile" all
+ 	cp $(FFSBDIR)/ffsb ffsb
+ 
diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 4e20f24..2ab1d50 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -25,6 +25,7 @@ SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://regen-makefile.patch \
+    file://ffsb-remove-hardcoded-configure.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -36,6 +37,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
+# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
+# we explicitly force regeneration of that directory and pass configure options.
+do_configure_prepend() {
+    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
+}
+
 do_install(){
     install -d ${D}/opt/ltp/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-- 
1.8.1.2


