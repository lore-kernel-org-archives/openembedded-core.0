Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 07E6C77216
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 16:07:21 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f65so41038693wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QS8AmnE94j43/lTcQ9UhavNYd/V8nU9M9dzsHf8Epk0=;
	b=IFUWc5kRqzGI2LbS6MI4BvMQxDiYxMzApBds07aSdRr2oet3QgwQZnkdS4ehHsHg0I
	q2Q/G/o0e83heaLBX3T88Y/3g134DmKHdxV9AX09IMnmPhynwDjlfa6EKIqnhueO4n5U
	AdbLZL5Qlwl95VF0aRzigPvXH3oUnrXUmdfKW3zfTcr+NzcSMcUBYH7NvDTx/1zXJuI2
	Dlh2D4PdzenMHWIqwLGJRkaLXjJhfsujdVMdFT8WKaGrtEx9LatkgUj7O4dNiw+AMVI9
	SmD1961gbBjjIX22a0HBjs76cktGmPwBpHRkqp/Qn1ntGRJrXSIpS2oDNRx6O43Jq9CP
	QIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QS8AmnE94j43/lTcQ9UhavNYd/V8nU9M9dzsHf8Epk0=;
	b=GjhA4OqKdAlTHtQ++oQMEsBq9YCPrKXKs2X5zu9Pb8y8tRHiv/i6y8nJH4PmyZp+9t
	Q0531hDPj5J+psUBFxtxW8/CqHF9XLfr0j5O8fQb+om7InUaLLzrQOc59vQX62Bur6sW
	sdOC0hhuH5bankszQXH3ti7zXQEDBFdf8Q/lmfHJOhFB7fMw18aCIuW0Wbott29KJ+zD
	f7YFHoKsyFedKhD7UvF4el9n02v3JRnVPyDdrzKsrjUuhx2OyYS15mhN7eVXHucdyg38
	nDbfW2m3SIJ8ROuGz0z3+mhRQDcSeMwVw4P579ExojaAs8Yma+KggULLLPd8f877FWwn
	WA9w==
X-Gm-Message-State: AEkoouujanPWLtSTdr+eVGWgFMUPAktWWrGT3rMicbskAM0Fvylf8LJemeRHvMP4LxTucWNZ
X-Received: by 10.28.95.67 with SMTP id t64mr21094735wmb.99.1470758841176;
	Tue, 09 Aug 2016 09:07:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g184sm3985057wme.15.2016.08.09.09.07.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 09:07:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 17:07:16 +0100
Message-Id: <1470758837-6835-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] connman: disable version-scripts to fix crashes at startup
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
X-List-Received-Date: Tue, 09 Aug 2016 16:07:22 -0000

With binutils 2.27 on at least MIPS, connmand will crash on startup.  This
appears to be due to the symbol visibilty scripts hiding symbols that stdio
looks up at runtime, resulting in it segfaulting.

This certainly appears to be a bug in binutils 2.27 although the problem has
been known about for some time:

https://sourceware.org/bugzilla/show_bug.cgi?id=17908

As the version scripts are only used to hide symbols from plugins we can safely
remove the scripts to work around the problem until binutils is fixed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../connman/connman/no-version-scripts.patch       | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/no-version-scripts.patch

diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
new file mode 100644
index 0000000..e96e38b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -0,0 +1,27 @@
+With binutils 2.27 on at least MIPS, connmand will crash on startup.  This
+appears to be due to the symbol visibilty scripts hiding symbols that stdio
+looks up at runtime, resulting in it segfaulting.
+
+This certainly appears to be a bug in binutils 2.27 although the problem has
+been known about for some time:
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=17908
+
+As the version scripts are only used to hide symbols from plugins we can safely
+remove the scripts to work around the problem until binutils is fixed.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index d70725c..76ae432 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -132,2 +132 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+-src_connmand_LDFLAGS = -Wl,--export-dynamic \
+-				-Wl,--version-script=$(srcdir)/src/connman.ver
++src_connmand_LDFLAGS = -Wl,--export-dynamic
+@@ -166,2 +165 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+-vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
+-				-Wl,--version-script=$(srcdir)/vpn/vpn.ver
++vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index b31b146..5485c15 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -3,6 +3,7 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://connman \
+            file://no-version-scripts.patch \
             "
 SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                             file://0003-Fix-header-inclusions-for-musl.patch \
@@ -12,4 +13,3 @@ SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
 SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
 
 RRECOMMENDS_${PN} = "connman-conf"
-
-- 
2.8.1


