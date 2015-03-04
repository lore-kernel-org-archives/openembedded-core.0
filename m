Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D09C360144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 13:03:54 +0000 (UTC)
Received: by wghk14 with SMTP id k14so2664073wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 05:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=25XN4oxl0AOusB4ccWPiiOE1SwW5A3QbCI+oV1K3NVM=;
	b=AaxHltV/qUy8iOazBYLYMvBdQoAHBh0VsBl4EMAN5tNRQf+RDd1ulgXM78n/QuWNqL
	8sWDdJKnq6in8lEulFjJVb6Ihxw1JSw6l8Q0MbSeGhms/TYmRYpt7bcB9G34qgJnNISC
	qefUODrbap47ID6NkfPB9c00RGitIMEwzRbaoZbVOSAKQsWm9gzmP4vDKNpPyrnXHt5g
	lAaOR8qozG6Cwilw7BuoF9kVSfd15AiT0KXyN8TZEgrLCuHGCil7QmrxpDgSl5gGp5kk
	PDyP3WtKWBc4R5yFi0ohBZjlUd6HAGuXIJ0ZJ0xMXVXAIstP0IHPoK81EwA4AEPJj+FZ
	b+MQ==
X-Gm-Message-State: ALoCoQlKg6JtpvQiRT/n5plaUKMp4E+vevB5yyC3sOxswmKdCR/CqWLv2wWDAWRxcrdJCayhfQVu
X-Received: by 10.194.121.68 with SMTP id li4mr7838833wjb.138.1425474235049;
	Wed, 04 Mar 2015 05:03:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hl8sm5873667wjb.38.2015.03.04.05.03.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 05:03:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 13:01:22 +0000
Message-Id: <1425474083-4782-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] rpm: don't put LDFLAGS into the .pc file
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
X-List-Received-Date: Wed, 04 Mar 2015 13:03:55 -0000

The LDFLAGS are not generally useful with pkg-config and mean that the .pc file
contains references to the sysroot directory, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../rpm/rpm/no-ldflags-in-pkgconfig.patch                |   14 ++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb                  |    1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/no-ldflags-in-pkgconfig.patch

diff --git a/meta/recipes-devtools/rpm/rpm/no-ldflags-in-pkgconfig.patch b/meta/recipes-devtools/rpm/rpm/no-ldflags-in-pkgconfig.patch
new file mode 100644
index 0000000..410623f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/no-ldflags-in-pkgconfig.patch
@@ -0,0 +1,14 @@
+Don't put LDFLAGS into the Libs.private, all it generally contains is a linker
+hash selection (harmless) and the absolute path to the libdir in the sysroot
+(actively harmful).
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/scripts/rpm.pc.in b/scripts/rpm.pc.in
+index 8293471..2ea469c 100644
+--- a/scripts/rpm.pc.in
++++ b/scripts/rpm.pc.in
+@@ -17 +17 @@ Libs: -L${libdir} -lrpmbuild${suffix} -lrpm${suffix} -lrpmdb${suffix} -lrpmio${s
+-Libs.private: @LDFLAGS@ @LIBS@
++Libs.private: @LIBS@
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index d99a300..03a24f0 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -95,6 +95,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpmqv_cc_b_gone.patch \
 	   file://rpm-realpath.patch \
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
+	   file://no-ldflags-in-pkgconfig.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.10.4


