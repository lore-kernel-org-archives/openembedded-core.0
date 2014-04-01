Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 49298617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:23:53 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so5098893wib.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qAeY35AUMClDd9JAL1drG4Qk3NFXsR6BRWlUdmFPV4U=;
	b=lq8jVWKGo7G14AAArzlCUmAsnhWMpCWUr8Cm6fMMhln8c4aucfotjRwjLp+EFFe3Ei
	XoP8ziydXSLNXUxH9BbHC/UVfIi0OtSob37yBpebl8gXqrgJjhKGaGcRqwZyDsFzlSPt
	GRu74Ft5Nx0uRQGyWewBtCOhrALaJ60btDZP3rM93Gp0bgZ3Z/2zMhQV0cvbjW+ykq3Q
	lnS5SD/+CEyRPTdNyHQwx1Afgxus598hoULVtNM8xudRiG7swYkG3cwzZZHmxyi7+FnE
	NCHu79KIIHNWj+s7GmO1C0CqFHNc4TcPNqi01R9J5pBY7KK7G7AGgiVvj25FrvLq2Mqe
	MsZw==
X-Gm-Message-State: ALoCoQlZ10hsPDG3k4yjK1cshh9cJ6d8YSEYsT+9/jtZbIb0iuKUcdzDvuzrxOLppcAQEcHf2g2o
X-Received: by 10.180.12.233 with SMTP id b9mr20983897wic.8.1396369434312;
	Tue, 01 Apr 2014 09:23:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fs16sm34072579wic.18.2014.04.01.09.23.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 09:23:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:23:37 +0100
Message-Id: <1396369417-22019-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396369417-22019-1-git-send-email-ross.burton@intel.com>
References: <1396369417-22019-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gdk-pixbuf: pass GDK_PIXBUF_FATAL_LOADER where relevant
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
X-List-Received-Date: Tue, 01 Apr 2014 16:23:55 -0000

Pass GDK_PIXBUF_FATAL_LOADER to the sstate postinst and intercept so that any
problems are flagged as errors instead of being silently ignored.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/pixbufcache.bbclass                |    2 +-
 scripts/postinst-intercepts/update_pixbuf_cache |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 414fd30..922174d 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -53,7 +53,7 @@ SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-		gdk-pixbuf-query-loaders --update-cache
+		GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache
 	fi
 }
 
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 3f93773..95bf4f9 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -1,6 +1,7 @@
 #!/bin/sh
 
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
+export GDK_PIXBUF_FATAL_LOADER=1
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
     $D${bindir}/gdk-pixbuf-query-loaders \
-- 
1.7.10.4


