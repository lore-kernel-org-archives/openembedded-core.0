Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtSmP-0003lS-FS
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:42:57 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so912733eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9A6r3t1t51JHgvpbA889m25z9bNpx0z6t/bYEfcZJGQ=;
	b=ruFyUe4i3JzG6dSXwGFq89NjQLaFV6obYeg8E/y1sZv5NCM7k0IvDa1MQBU0MgZ/Uc
	0cLm/EI56k6q6gwern0nzW1NghwneQnZTPsPDd7v97esjdww3uUhNg5HCLtclpZog6ER
	kJb7BpLiVST0mju792srT0J0NFLt6kmR4khO0=
Received: by 10.213.108.73 with SMTP id e9mr24260ebp.27.1328312101865;
	Fri, 03 Feb 2012 15:35:01 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm27553559eeh.6.2012.02.03.15.35.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:35:01 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Feb 2012 00:32:51 +0100
Message-Id: <1328311971-2340-2-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328311971-2340-1-git-send-email-tworaz666@gmail.com>
References: <1328311971-2340-1-git-send-email-tworaz666@gmail.com>
Subject: [PATCH 2/2] webkit-gtk: Make webgl support configurable via DISTRO_FEATURES.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 23:42:57 -0000

* Add missing dependency on virtual/libgl.
* Make webgl configurable via DISTRO_FEATURES="opengl".
* Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 92ceb50..2d9ec80 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -8,13 +8,14 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
 DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
 SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -41,6 +42,7 @@ EXTRA_OECONF = "\
                 --enable-image-resizer \
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
+                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
-- 
1.7.3.4



