Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TC6Ut-00012n-DY
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 12:18:11 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Sep 2012 03:05:29 -0700
Received: by wibhn17 with SMTP id hn17so2753655wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 03:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=shn9nwG8BnQsaIde1K/wkVzzWb/nU2BvuXxb7MJfTD0=;
	b=ZCF2l0TVIsYT9H/9QdC479OmdOn0lLkzmQDHJih2Q6mhbG8cZzFPz6sszoJ+p33LPb
	ZZ8OS/T6Nc9Dsy96uS0yADctiMMyO7hsZBvaM3VQ07Dvwg5sG9iY/n9cCWl4ovRW2FWe
	78S91BF3IgU6h0SzqlSMy55u3pXyk8eBoIURm3gMBGr4KzVY3KV9s0tA3fdQJfgmZ5mC
	IFEOdKYRLkZBzOSk4/qsRs2vljk4UbR2ltz1vDp1suugNUwFRs5dRfKxZrAeKMHXq5vi
	WLZ772isPMrzit82OqtFueRbIaWNr1KV8KdTDsBJYzrbcd2EInuLKEk6EmMS/kYWdNn6
	v4gQ==
Received: by 10.180.8.41 with SMTP id o9mr3777463wia.3.1347530726556;
	Thu, 13 Sep 2012 03:05:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k2sm19344600wiz.7.2012.09.13.03.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 03:05:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 11:04:31 +0100
Message-Id: <1347530671-16622-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
References: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlCvdow1nnxtNwf6nWc1iA2KocmWxjJRqR64qcadh7TdfWCg0Nkfj4442597JHCOIsqdi/c
Subject: [PATCH 3/3] librsvg: make the libcroco dependency a PACKAGECONFIG option
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
X-List-Received-Date: Thu, 13 Sep 2012 10:18:11 -0000

Default to enabling it as we were build-depending on it already.  If a user
needs the disk space and the limitations imposed by not using libcroco are
acceptable they can override this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6bb5fe2..012b3ba 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -7,15 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
 
 SECTION = "x11/utils"
-DEPENDS = "gtk+ libcroco cairo libxml2"
+DEPENDS = "gtk+ cairo libxml2"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r9"
+PR = "r10"
 
 inherit autotools pkgconfig gnome gtk-doc
 
-EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco"
+EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
+
+PACKAGECONFIG ??= "croco"
+PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
 
 SRC_URI += "file://doc_Makefile.patch"
 
-- 
1.7.10



