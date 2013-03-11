Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9H6-0002sc-2C
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:24:51 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so4149813pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=zKsUoBYNzS5RpJQxtdiQCtmSKOGkex467RIXcXgCVUA=;
	b=o/8yNrNXSVXbHBr1ud9EoXo6RrQMu/zCHw/dL9FOlCf3hCnRzqnCKgd8cdI754dO1s
	gh2TSR07IPRP21CpwgOgfnzlnVu32bLjAtxJ+mrsYoDS2fU4XsNgEKUjmaXwO9l98mcG
	9jd94BIGUQHB7BR+p2J9TNMSQYj3JufvZBZRJ6bXiRuYd5Kku/uJoicj6uFDBNsD97/O
	Co+6VNylt8aQiW19xc2G0dqapuZLxc0OskVsFx2tNOjgrCsaf4576SwmeLusMdHj0M5D
	9dX8lrF9KwbwEKUOCBQi88ck4pH+tptR6O2iauZ2OuGfQTO965Mc12b5/wULiEkrB4kh
	q7yQ==
X-Received: by 10.68.225.40 with SMTP id rh8mr31429462pbc.137.1363032488789;
	Mon, 11 Mar 2013 13:08:08 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:33 -0700
Message-Id: <235fd7e6b568af089d6591d6ed8c4f2d577cc5a7.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnaJP8arTTHO0b682cZMTdGlPo7Fu4NocsCofnjT5mlz9V93oQ7omwnwSgzWmxXqFfHIp7L
Subject: [PATCH 3/9] systemd: make xz support (compressed journal) optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 20:25:03 -0000

Defaults to enabled but if you don't want to use the journal and need some
space, this can now be disabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 962b120..9a66a4e 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -43,9 +43,11 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "xz"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.10.4



