Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.8728.1596639031076765406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RxWPDElt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 17so2472914pfw.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Bf4x1DZM72dIPLTfu5yJqLzKTfpUjpghKT2hfuPwWMw=;
        b=RxWPDElt0xC5uDpiDhtlh66D6GH6wL6jYRCmJCkjW2uM4f3GiC8Ywq7GY5Qcsd4M9V
         0xGxWbWfi4dZy1RmuCgsbjLbdm6GkaWyW5Jsx/aw5EQD9emITCdV6zvfcnSzooAoVr1b
         lsIIzpM0d4meeAz1KRjZYZTQDFSIR/VBxElAcWOhuW32tIfvcLbwNH7Z/uvZ/z4UeNUZ
         RXpxaHMY4UWR92e+W+nFRsQqdedpGaiPjnR9UZ1CMGP6WUcajX6VHMaRofmLRtLzxTIq
         KSjIBtn8ofou2YHKnVJ0iT/VAdpnPe/IV20Gc3BTM8oBG7DZ+5uckfaDIeTLl3LnaW/h
         p/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Bf4x1DZM72dIPLTfu5yJqLzKTfpUjpghKT2hfuPwWMw=;
        b=ota3SXAFVI2Ek3icf5ZmM6ZfyMIjZlklnlfPBKWnxY65oLkcG5kEkjha6L3h9rBEvc
         puPfqRpX31licPxGGyDB9ah1XiUelfLKKN1vaMCDdcdtmfTEBadWCVYYqRo+uon8Pcvs
         dNC/TytqwoSVFlIyyOrV3JfiBBsRg6Qh/bCaxuh9M++Kw0dPn9h3OK3aRo7PMw/ky41M
         C3TiaGvKuP7YmOPH3eaY5M/xdp62EeMPO/4yRlWoie1KycEFTDMvhXVnYP3pslJlkFvr
         cu1fJt+YhvRtONK6Jd3pZRTrGvoCnDGvtGmVlfVkdmMt2pApkhuwjWqoA5wgH9biTdnk
         qakQ==
X-Gm-Message-State: AOAM532Vnjaslzvyd6R83Ni0lgE5AE86p9XqBxn17PV499jn9z+w6Yvn
	HxskQ22pVHsDnVojrbTjEoFjfVmpzb8=
X-Google-Smtp-Source: ABdhPJxlGQWQTAz0fUp4jRLMeTDPGDHoVBlP0228bpIMo10cK5OfqcSzMG1fUDBx9TS/ojsr6w8o+Q==
X-Received: by 2002:a62:1543:: with SMTP id 64mr3819880pfv.242.1596639030125;
        Wed, 05 Aug 2020 07:50:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 11/11] Revert "gtk-icon-cache.bbclass: add runtime dependency"
Date: Wed,  5 Aug 2020 04:49:34 -1000
Message-Id: <257758f175cdcb99f4fe890cc0b1a60e82b5b84b.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

This reverts commit e921edd27e71af00f07e3f1e973d2b0c6c777bf4 since
it breaks adwaita-icon-theme and other recipes using gtk-icon-cache

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-icon-cache.bbclass | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index dd394af27c..91cb4ad409 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,10 +1,6 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} \
-            ${@['gdk-pixbuf', '']['${BPN}' == 'gdk-pixbuf']} \
-            ${@['gtk+3', '']['${BPN}' == 'gtk+3']} \
-            gtk+3-native \
-"
+DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+3-native"
 
 PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
@@ -52,18 +48,9 @@ python populate_packages_append () {
         bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
         rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
         d.appendVar('RDEPENDS_%s' % pkg, rdepends)
-
-        #gtk_icon_cache_postinst depend on gdk-pixbuf and gtk+3
-        bb.note("adding gdk-pixbuf dependency to %s" % pkg)
-        rdepends = ' ' + d.getVar('MLPREFIX', False) + "gdk-pixbuf"
-        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
-
-        bb.note("adding gtk+3 dependency to %s" % pkg)
-        rdepends = ' ' + d.getVar('MLPREFIX', False) + "gtk+3"
-        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
-
+    
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-
+        
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-- 
2.17.1

