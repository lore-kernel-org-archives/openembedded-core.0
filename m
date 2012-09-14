Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TCSel-0000UN-AP
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:57:51 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Sep 2012 02:45:07 -0700
Received: by wgbdq11 with SMTP id dq11so440471wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 02:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=P4xSQCpvYI5DoctvQZleKPz6gJKW/Kji9QntqwwVzbc=;
	b=EJVW8s8y+aEqMUPGlQT/V+0MJwtLV+CyNi7izMakcwf71F1VY4h9+YgtG7/o3wMy6c
	kfkLWfwQonBs4V1qv9txzCEDvCDjcSjBJWg2t2mKGUyYg2PKTbk7K1cR5tTRaaHSnI2R
	OY04SZEF7GvLhD49YtBBjbod/ck0jaxmkmnE9yIhAf1xM49gtbKUt9nghapWdYt09bDn
	PL08/lRHzG6qdBrmr6gqBs9i4/DUXQKLDmkfT098OMFdgCRFgnjtQpKviy29ON7oJ4fM
	nIYNjrs2yxTM9P7MkwTamD5cmb5DKXrQrsDzG5WmaVopQVDMg12TrCPrUrOQPT+7SxPh
	Ax6A==
Received: by 10.180.100.131 with SMTP id ey3mr4743636wib.15.1347615905808;
	Fri, 14 Sep 2012 02:45:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id do5sm2906350wib.10.2012.09.14.02.45.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 02:45:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 10:44:13 +0100
Message-Id: <1347615853-20491-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl1/iDwM18KNxqkj2p2xDi8APdBiQPHFQxIAploR0thU/i3OiXCaPiQmeqZ4DisgR7v3OGB
Subject: [PATCH V2] librsvg: make the libcroco dependency a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 14 Sep 2012 09:57:51 -0000

Default to enabling it as we were build-depending on it already.  If a user
needs the disk space and the limitations imposed by not using libcroco are
acceptable they can override this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6bb5fe2..b118805 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -7,15 +7,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
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
+# When native we can manage without croco, as it's only for GTK+
+PACKAGECONFIG_class-native ??= ""
+
+PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
 
 SRC_URI += "file://doc_Makefile.patch"
 
-- 
1.7.10



