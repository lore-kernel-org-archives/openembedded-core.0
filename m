Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T76Il-0000PE-RF
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 17:05:00 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 07:52:40 -0700
Received: by weyr6 with SMTP id r6so1056116wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 07:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=XN4NYKgvRn7ld0fQox9W2+fijaAGA2wsKM4TiLJXzTs=;
	b=GH3cCHyO1XoCYflOYH2Vka96UIP4pPAGDNXk22kyd+v4dcejVlyFj/TA5C9YdlCFAy
	9PW6rlpVjxuDkmQYBkktlRrAGKWjdlIw+7zMHf9AYO9k3NPj8NUsNUiLgYkBQejzIWJO
	FYGihJJS7B2xGvkHzEXkUeyi4AM0qIc/RiznHU/CSq8n6X79rFF6CQZYCftKLNgU/X/5
	rtaa5d6FoNgGCgrzTXs4ikmHXV5C2Y5iBo9ejWdtks4VUxNHCCanIaBmpJUkC13XUkhg
	o2jqv+FeDbCJdCgEpgFlMCuCO2zF4D9J8ZhHhaqxeu5DJJ32J9ofo4JWbvN76mEpG7UW
	qJJA==
Received: by 10.180.105.130 with SMTP id gm2mr1133228wib.6.1346338361387;
	Thu, 30 Aug 2012 07:52:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm1703418wiy.4.2012.08.30.07.52.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 07:52:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 15:51:59 +0100
Message-Id: <1346338319-17685-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk68E+tmhhhWmAKi4SzH3cF9SgM5Kslivkl1WDIp4SE1q3g+PwharEXhC2tuafcP0YRiOkR
Subject: [PATCH] glib-2.0: don't disable all debugging functionality
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
X-List-Received-Date: Thu, 30 Aug 2012 15:05:00 -0000

GLib will use "minimal" debugging on non-development builds and the extra safety
net and ability to debug at all is totally worth the small performance cost.

If someone has a need for every ounce of performance, a simple .bbappend can
restore this option.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 8f7cd69..7bc97d68 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r4"
+PR = "r5"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 3540cd5..9dca440 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,7 +27,7 @@ S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
-EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
+EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
 EXTRA_OECONF_virtclass-native = "${CORECONF}"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
-- 
1.7.10



