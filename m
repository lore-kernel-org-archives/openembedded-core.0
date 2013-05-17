Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHV7-00018a-79
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:03 +0200
Received: by mail-ee0-f54.google.com with SMTP id e50so2447360eek.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=1rjeKaOOqO+rZap0OvicxGZjPq61qe8jUwry6IhzZyQ=;
	b=NmyuTYwbJUsqsmhZYw2UPdkQKxHm6uTkmY1EsK1gm3yAf6sWgSWpIVaVUijoPVqu2s
	GUGsLqSBTzRzw3ev/eXmc96OLNqObP2P1PifFXXOmNZnHqRTimanuqZjF3OJXznKP36M
	Cc/BnXXev/FZ3OFT2LIPyJ7y+A35Lh/Ik55PTzwjoDePrNjskbj4CW39SbuDLnZknmWR
	BIJQPw7VaG/6Fu04DTC4Ptet+d13JEny3goyuZrSCamB4RHARWpDBVFg08X0Xr8noNtZ
	nXBbY4J0Eg0blC+e4qqapjLlahJU+scYRRJtBU/S4PzHIoGcJqyd6/6RJNFFfMzFMhM+
	7gPQ==
X-Received: by 10.15.24.72 with SMTP id i48mr106586209eeu.37.1368783885944;
	Fri, 17 May 2013 02:44:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:41 +0100
Message-Id: <18b03e64401ab99a14b03fe662f84cb58ac3ddc9.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnGvYiOAXwh28t+lvP9B/RCmgxtgp72pD7/Bp9OZGApfNq2KufFmcf+h5gzyhFWp5tn7OCK
Subject: [PATCH 1/5] pixbufcache: update the loader cache when installing natively
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
X-List-Received-Date: Fri, 17 May 2013 10:03:07 -0000
X-List-Received-Date: Fri, 17 May 2013 10:03:07 -0000

Register a sstate postinst function so that when installing a native package,
the gdk-pixbuf loader cache is updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/pixbufcache.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 37bf812..0596018 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -44,3 +44,16 @@ python populate_packages_append() {
         postrm += d.getVar('pixbufcache_common', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
+
+#
+# Add a sstate postinst hook to update the cache for native packages
+#
+DEPENDS_append_class-native = " gdk-pixbuf-native"
+SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
+
+pixbufcache_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		gdk-pixbuf-query-loaders --update-cache
+	fi
+}
-- 
1.7.10.4



