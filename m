Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RjJg0-0002Zw-OO
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:58:27 +0100
Received: by vcbf1 with SMTP id f1so1668482vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WhJHkiNOhHhW3fEMaYcYjnVDYpp/k7z3K63h2Onloic=;
	b=ND3d6fPyskplAWN9o7lDUA+NTubKY7klM0SiaxJxDlTTIP/g1vz9iqjwMRvFRtCuk+
	0CxuKvXbYVPlm3ZNmcR5hRAfsD/1AiibnvnmRKdCicLz5lh122FHEhNfTJcWTTwsi+lL
	PtMFvXYavLzgfD+6IwCoG3LShNgl/yEN6hZSc=
MIME-Version: 1.0
Received: by 10.220.229.200 with SMTP id jj8mr2049778vcb.53.1325893860092;
	Fri, 06 Jan 2012 15:51:00 -0800 (PST)
Received: by 10.52.95.211 with HTTP; Fri, 6 Jan 2012 15:51:00 -0800 (PST)
Date: Fri, 6 Jan 2012 15:51:00 -0800
Message-ID: <CAGDS+nm-VomoPkd6VfLJ2dPgeFgVdWd=85eXrPmV91yUaD4TBA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH - RFC] gtk-icon-cache.bbclass: add -f option to gtk-update-icon-cache in postinst
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
X-List-Received-Date: Fri, 06 Jan 2012 23:58:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

The gtk-update-icon-cache utility does not create a cache file if
one does not already exist.  Since some packages (notably gnome-icon-theme)
do not ship a cache file by default, the results of the utility are
not saved.  Adding the force option writes out the cache even if there
wasn't a default cache in the package.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---

diff --git a/meta/classes/gtk-icon-cache.bbclass
b/meta/classes/gtk-icon-cache.bbclass
index eac3061..0204fd3 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -14,7 +14,7 @@
GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
gdk-pixbuf-query-lo

 for icondir in /usr/share/icons/* ; do
     if [ -d $icondir ] ; then
-        gtk-update-icon-cache -qt  $icondir
+        gtk-update-icon-cache -fqt  $icondir
     fi
 done
 }


