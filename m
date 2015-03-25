Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 70126723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 22:09:23 +0000 (UTC)
Received: by wibbg6 with SMTP id bg6so42186796wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 15:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=79GsGM1KnZVCFdIZbRADVNMAMnPmettk40c76IVRpfI=;
	b=YW4QRQ6OKqB1BwxFESGxHNDq8bxRSIL5ZxboA7MnrjC1NGcmW8MHnjv+OOhCdqhjvL
	on5EXnIOhJZrQ0841lqZYOecTTpDQFOOy6xYIt+caAZJffZz2wj1gU6+mvbZf/oTi9R2
	FLAWzs/IZsvVbi0WAxF2ATfqSkb4QXkHWd4S1SfLzrqe4oHYmVL7P+YYxQoRg/BJu7qW
	29exsoVfhRdpPNPNnEdsW6vGRbHpmGlJgZGg9R9FPKc/YVn6lS/3CBABx0skyjsGk7lX
	sDAe/bNX2ltG1/GcumhZ/wQS5prDpfX0qYai5oTVPy7rxRfUAwNs9ZCikxB1dzcHpZ+J
	iwVg==
X-Received: by 10.194.77.230 with SMTP id v6mr22547583wjw.25.1427321364430;
	Wed, 25 Mar 2015 15:09:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo8sm1268018wib.14.2015.03.25.15.09.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 15:09:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 23:09:36 +0100
Message-Id: <1427321377-25844-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.3
In-Reply-To: <1426040756-27293-1-git-send-email-net147@gmail.com>
References: <1426040756-27293-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [dizzy][PATCH 1/2] udev: fix ptest rule syntax check
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
X-List-Received-Date: Wed, 25 Mar 2015 22:09:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.oss.09@gmail.com>

The ptest which checks for correct udev rules fails.
Missing files and paths for the build host caused this.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc                    |  3 +-
 .../recipes-core/udev/udev/add-install-ptest.patch | 17 ++++++-
 .../udev/udev/fix_rule-syntax-regex-ptest.patch    | 59 ++++++++++++++++++++++
 3 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 280da10..24463b1 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -27,11 +27,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://udev-cache \
            file://udev-cache.default \
            file://add-install-ptest.patch \
+           file://fix_rule-syntax-regex-ptest.patch \
            file://run-ptest \
            file://init"
 
 inherit autotools pkgconfig update-rc.d ptest
-RDEPENDS_${PN}-ptest += "make perl"
+RDEPENDS_${PN}-ptest += "make perl python"
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/recipes-core/udev/udev/add-install-ptest.patch
index 0f8e9b6..755946a 100644
--- a/meta/recipes-core/udev/udev/add-install-ptest.patch
+++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
@@ -8,19 +8,32 @@ Signed-off-by: Björn Stenberg <bjst@enea.com>
 Signed-off-by: Alexandra Safta <alst@enea.com>
 Upstream-Status: Pending
 
+Add missing files for rule-syntax-check
+- Add rule-syntax-check.py
+- Add the deployed udev rules to the testdata
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+Upstream-Status: Pending
 --- a/Makefile.am	2012-03-18 16:28:14.000000000 +0100
 +++ b/Makefile.am	2013-02-18 10:03:36.531101244 +0100
-@@ -708,3 +708,11 @@
+@@ -708,3 +708,18 @@
  	for i in src/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/libudev/; done
  	for i in src/gudev/docs/html/*.{html,css,png}; do rm -f $$i.sign; gpg --armor --detach-sign --output=$$i.sign $$i; done
  	for i in src/gudev/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/gudev/; done
 +
++RULES = rules/* src/accelerometer/61-accelerometer.rules \
++	 src/cdrom_id/60-cdrom_id.rules \
++	 src/keymap/95-keyboard-force-release.rules src/keymap/95-keymap.rules \
++	 src/mtd_probe/75-probe_mtd.rules src/v4l_id/60-persistent-v4l.rules
++
 +install-ptest:
 +	install test-udev $(DESTDIR)
 +	cp Makefile $(DESTDIR)
 +	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
-+	$(MKDIR_P) $(DESTDIR)/test
++	install -d $(DESTDIR)/test $(DESTDIR)/rules
 +	(cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
++	(cd $(top_srcdir) && install test/rule-syntax-check.py $(DESTDIR)/test)
++	(cd $(top_srcdir) && install $(RULES) $(DESTDIR)/rules)
 +	tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
 --- a/test/udev-test.pl	2012-03-18 16:43:36.000000000 +0100
 +++ b/test/udev-test.pl	2013-02-18 10:31:29.706357321 +0100
diff --git a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
new file mode 100644
index 0000000..548a241
--- /dev/null
+++ b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
@@ -0,0 +1,59 @@
+The rule-syntax-check script fails with errors like this:
+
+Invalid line /lib/udev/rules.d/95-keymap.rules:49: ENV{DMI_VENDOR}=="ASUS*", KERNELS=="input*", ATTRS{name}=="Asus Extra Buttons", ATTR{[dmi/id]product_name}=="W3J", RUN+="keymap $name module-asus-w3j"
+('  clause:', 'ATTR{[dmi/id]product_name}=="W3J"')
+()
+
+
+Move line comment from end of rules file to its own line, the regex used to
+test correct syntax choke on it.
+
+The rule-syntax-check.py uses regex which errournessly complains on ATTR rules
+of the form ATTR{[dmi/id]board_name}=="30B7"
+Use the regex from systemd's script which allow [] characters and additional
+compare operators
+
+The Makefile passes rules-test.sh script a build host path to the testdata.
+Ignore the argument and use a relative path instead.
+
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+Upstream status pending
+Upstream status Inappropriate (cross environment path)
+
+diff -Naur udev-182.orig/src/keymap/95-keymap.rules udev-182/src/keymap/95-keymap.rules
+--- udev-182.orig/src/keymap/95-keymap.rules	2012-02-07 00:01:55.154640792 +0100
++++ udev-182/src/keymap/95-keymap.rules	2015-01-24 20:58:40.156930520 +0100
+@@ -94,7 +94,8 @@
+ ENV{DMI_VENDOR}=="Hewlett-Packard", ATTR{[dmi/id]product_name}=="HP G62 Notebook PC", RUN+="keymap $name 0xB2 www"
+ ENV{DMI_VENDOR}=="Hewlett-Packard", ATTR{[dmi/id]product_name}=="HP ProBook*", RUN+="keymap $name 0xF8 rfkill"
+ # HP Pavillion dv6315ea has empty DMI_VENDOR
+-ATTR{[dmi/id]board_vendor}=="Quanta", ATTR{[dmi/id]board_name}=="30B7", ATTR{[dmi/id]board_version}=="65.2B", RUN+="keymap $name 0x88 media" # "quick play
++# "quick play"
++ATTR{[dmi/id]board_vendor}=="Quanta", ATTR{[dmi/id]board_name}=="30B7", ATTR{[dmi/id]board_version}=="65.2B", RUN+="keymap $name 0x88 media"
+ 
+ # Gateway clone of Acer Aspire One AOA110/AOA150
+ ENV{DMI_VENDOR}=="Gateway*", ATTR{[dmi/id]product_name}=="*AOA1*", RUN+="keymap $name acer"
+diff -Naur udev-182.orig/test/rule-syntax-check.py udev-182/test/rule-syntax-check.py
+--- udev-182.orig/test/rule-syntax-check.py	2012-02-15 20:10:12.872333342 +0100
++++ udev-182/test/rule-syntax-check.py	2015-01-24 21:08:00.496049600 +0100
+@@ -28,7 +28,7 @@
+ no_args_tests = re.compile('(ACTION|DEVPATH|KERNELS?|NAME|SYMLINK|SUBSYSTEMS?|DRIVERS?|TAG|RESULT|TEST)\s*(?:=|!)=\s*"([^"]*)"$')
+ args_tests = re.compile('(ATTRS?|ENV|TEST){([a-zA-Z0-9/_.*%-]+)}\s*(?:=|!)=\s*"([^"]*)"$')
+ no_args_assign = re.compile('(NAME|SYMLINK|OWNER|GROUP|MODE|TAG|PROGRAM|RUN|LABEL|GOTO|WAIT_FOR|OPTIONS|IMPORT)\s*(?:\+=|:=|=)\s*"([^"]*)"$')
+-args_assign = re.compile('(ATTR|ENV|IMPORT){([a-zA-Z0-9/_.*%-]+)}\s*=\s*"([^"]*)"$')
++args_assign = re.compile('(ATTR|ENV|IMPORT|RUN){([][a-zA-Z0-9/_.*%-]+)}\s*(=|==|\+=)\s*"([^"]*)"$')
+ 
+ result = 0
+ buffer = ''
+--- udev-182.orig/test/rules-test.sh	2012-01-29 01:15:46.000000000 +0100
++++ udev-182/test/rules-test.sh	2015-01-24 17:53:51.201858658 +0100
+@@ -4,7 +4,7 @@
+ # (C) 2010 Canonical Ltd.
+ # Author: Martin Pitt <martin.pitt@ubuntu.com>
+ 
+-[ -n "$srcdir" ] || srcdir=`dirname $0`/..
++srcdir=`dirname $0`/..
+ 
+ # skip if we don't have python
+ type python >/dev/null 2>&1 || {
-- 
2.3.3


