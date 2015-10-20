Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4665376AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:40:38 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so61030113wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 12:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nfbEGo/+iX9uvDEfjUORrEolvZEZafeEC3jCVYTkuEA=;
	b=IXqCsLXwrYkWeodLT1DXSWdahU3kqNrPTbHyuEX4v5kXVwRGj4ykjwgLpwqiJQryL9
	neDhpoe7d75aQawDU+Zg5STlMMsXq4LEloZtrT1VRJYUz0AEL1MFOWGlIKY95stnOw+J
	nNsZfJNCPr7jJT7xS3E257xiRv0Lh51ZPA8+etKLnEOoHLp+wf3p3qd40u7ux65QzKcz
	5WbOe1yjBmB4XqlWK7OJkgIpYhUKFJ9TTM/50yoFDFgF7WdcNp9X/eXgbPtanEIPpCJ+
	oD8fcT0IJmObdYSuaCWKu0+OyJ/2KchTFkcWPbVcSjMWKfY2Dyj42uRfsx5iCSacCHRb
	BxDw==
X-Gm-Message-State: ALoCoQkW5m2RPXWXmyPSbZKtt8MLwPf4otQmHYHA/wGmHdr4Cb5roY3V4jznKUAuVeIsJjWsMqZE
X-Received: by 10.194.201.130 with SMTP id ka2mr6120335wjc.123.1445370039023; 
	Tue, 20 Oct 2015 12:40:39 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	gd11sm257966wic.20.2015.10.20.12.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 12:40:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 20:32:58 +0100
Message-Id: <1445369579-14839-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445369579-14839-1-git-send-email-ross.burton@intel.com>
References: <1445369579-14839-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] intercepts/update_icon_cache: use STAGING_DIR_NATIVE from environment
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
X-List-Received-Date: Tue, 20 Oct 2015 19:40:39 -0000

Instead of expecting that the calling postinst has exported
STAGING_LIBDIR_NATIVE (which will get set to the sysroot at package build time
and may not be correct if sstate is used), use the new STAGING_DIR_NATIVE that
is exported by rootfs.py.

[ YOCTO #8547 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/postinst-intercepts/update_icon_cache | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
index c02273d..df9bdec 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -3,7 +3,7 @@
 set -e
 
 # update native pixbuf loaders
-${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+$STAGING_DIR_NATIVE/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
-- 
2.1.4


