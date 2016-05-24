Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4C560667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:28:46 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id l10so2508075igk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Tv8qtMB0uZYc9LaiYN2bLp9c7/hNpAfpkdHy/Sf2PDs=;
	b=rOE1600XilQcHQqslQFLXE7WfFzsVDcOR/mSoLZmphQL7iZ7ne+y/pBhQDx0xlhjrE
	+OfyV81qLDvSiK8hy8T3cmE3g3+LpI0gIzTf1v6fgv+cRP9vxa8b3vrGYI0UCpGpBbzX
	gSB2QJ/nRz+z+4b2eVOIaMyxEiKs0hrphg86Ic50sEbpS/WIsc6/DpsQkv2BZzIj4F0o
	BHE1pSzsf9iDTmAKISCWGrTCtXlBMV4mmK5I6xJIrxONvmuv7qnOWUfdwI4PGxMVTA0o
	+agE4AK5abD3rFIa7hd3f9vZtHJBewj+stW+zJXh/bKuKWqvruJb8eLOFQEuiryfV2KV
	iXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tv8qtMB0uZYc9LaiYN2bLp9c7/hNpAfpkdHy/Sf2PDs=;
	b=dpPIdCqhgWZN1Rqu1KkIXG+qZdFlpqi9k3syO9Rus7xz5+vCmU3XeEIL0O3BGui/6R
	kaC8lfUZIaHfFYikNQJrTgUSjrkXL9hpFoyebxnwg/IUJkRajmjtYkcbRC060z2uSnBn
	pGcnKNpHHEbHGXAUUton0J755aEx8xw9IXYAKYwli6H4j2v0B9LJnagVyeIaHoMjZd2M
	0MxT1PFTxpGcmKOfcmzUUtxjCB3MH3Vcj2FoorcQAkGQWjg8um9HaiLQJUP9lNUncc2i
	8XNqXXAfGi8KooMdd64fFXzajIdCDp0nuIeM7R+SuVMNA3566fXKrBbz2fGrE6siGdxo
	PC6A==
X-Gm-Message-State: AOPr4FWrAdc59RneVJq7zxpa6iII8trhXonikN3V77coX48wM+oPY67k3xBWGdBxHCq92Q==
X-Received: by 10.50.36.9 with SMTP id m9mr18712031igj.91.1464107326885;
	Tue, 24 May 2016 09:28:46 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	q99sm1324709ioi.17.2016.05.24.09.28.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 May 2016 09:28:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 09:28:40 -0700
Message-Id: <1464107320-28480-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] dhcp: fix non-deterministic libxml2 dependency
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
X-List-Received-Date: Tue, 24 May 2016 16:28:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

This dependency was floating, which results in non-deterministic builds. Add
a configure argument and associated PACKAGECONFIG to fix this.

The libxml dep is only needed when bind was built with a dep on libxml due to
its httpstats feature. So, when you enable the httpstats config in bind, and
want to build dhcp, be sure to also enable the bind-httpstats config in dhcp.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../dhcp/dhcp/libxml2-configure-argument.patch     | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |  4 ++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch b/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
new file mode 100644
index 0000000..9d2fbfb
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
@@ -0,0 +1,27 @@
+Add configure argument to make the libxml2 dependency explicit and
+determinisitic.
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- dhcp-4.3.3.orig/configure.ac	2016-03-16 20:25:53.830697637 -0700
++++ dhcp-4.3.3/configure.ac	2016-03-16 20:28:19.415355257 -0700
+@@ -631,7 +631,16 @@
+
+ # We need to find libxml2 if bind was built with support enabled
+ # otherwise we'll fail to build omapip/test.c
+-AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],)
++AC_ARG_WITH(libxml2,
++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
++	with_libxml2="$withval", with_libxml2="no")
++
++if test x$with_libxml2 != xno; then
++    AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
++                   [if test x$with_libxml2 != xauto; then
++                        AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
++                    fi])
++fi
+
+ # OpenLDAP support.
+ AC_ARG_WITH(ldap,
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
index 4e8cd27..97dde1d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
@@ -9,7 +9,11 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://CVE-2015-8605.patch \
             file://0001-site.h-enable-gentle-shutdown.patch \
             file://CVE-2016-2774.patch \
+            file://libxml2-configure-argument.patch \
            "
 
 SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
 SRC_URI[sha256sum] = "553c4945b09b1c1b904c4780f34f72aaefa2fc8c6556715de0bc9d4e3d255ede"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.8.0


