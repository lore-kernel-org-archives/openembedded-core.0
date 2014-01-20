Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id DA0CE6E7E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:32 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id y1so5563595lam.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3F0axVskkRokqAuQtKQPa9bhWL/ANe/C8t682S2pDmU=;
	b=Vkp2vti/zK/nWDGqu8SbNS4ASidKsN3KQkfkf/MtR9XM/aQ1DoSoQTfUqqZjUMYC/r
	pkkIe++pDA4U9KEhf6CLTfqZgX32yTIdmRE9vyEVddaFKhgsUejkL57Fs66awYcRacia
	O2ftIfUNGrUgg4me0PI8N9mkVzECOUwZbN+f3AD/hWSeTak+JaxwHUNGwirzo0aSXmdK
	n6yxBV22qPXJ5rfs1S4fdtGbOScNW9Upv65B7J6qjxFstIyRcwXd0T1jnwaRH8wz5V7y
	2jwZK0cFtpgjZH56rV2NjTs5lb3hCDLhF+NVfO5R1N57GXgpIyL+1O+ADmRAkQc44nDj
	ez6A==
X-Gm-Message-State: ALoCoQn2uoiNve32eXFCqQucMYKKMYNZNNSqhpcwqkbn4ohIjl09esYeFuQAKvUKxoXudGFzJSyR
X-Received: by 10.152.5.101 with SMTP id r5mr342248lar.56.1390218033157;
	Mon, 20 Jan 2014 03:40:33 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.31
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:32 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:17 +0200
Message-Id: <1390218017-10423-8-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 7/7] ltp: fix ffsb ftbfs on cross-compiled environment
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:33 -0000

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


