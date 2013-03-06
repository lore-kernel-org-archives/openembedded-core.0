Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDMWQ-0004tL-D4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 23:09:24 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so6615837pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 13:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VpRWl5XlZTmCB97tZ6U2+eZk5i5fYOzYUnO4/X2rJ9A=;
	b=0lnyJV6mqAtHVQZ7aIbNEimWNc37WSS+LIVbuqkb4hoSNSv8/WNbMUXUA9DBzcR+4o
	qpgqcIZlG9wODI+XAXvbEJGbAxtR+yrvlMOn2/dpCZSfNaS3ElPqCt3zn/YDCbHpe/Hy
	dkIOeNz0Py1LlXRpCE8OgIjC+yOPYN2zQ1Lr42diBaqAkqjmkvhDzSYUU6A3Urj36J6Y
	HIiiKpgOkG1tOOweNyyuYKORvFX1cHOpDE/VWPy73I1ZGLi2VxJcXYW6M/LYFu/GwC1M
	tzKzxo0Jiimxqm0+/KNF6A4GKGOFIvk8bFFEwjJfxDNvQ/T1ZW2KyCjXB0vpReEmk2St
	aFeQ==
X-Received: by 10.68.213.132 with SMTP id ns4mr50874893pbc.84.1362606762321;
	Wed, 06 Mar 2013 13:52:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gf6sm32946978pbc.24.2013.03.06.13.52.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 13:52:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 22:52:33 +0100
Message-Id: <1362606753-10342-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <20130306214818.GG32228@jama.dyndns-home.com>
References: <20130306214818.GG32228@jama.dyndns-home.com>
Subject: [PATCH] gst-plugins-package: return few ALLOW_EMPTY settings
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
X-List-Received-Date: Wed, 06 Mar 2013 22:09:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 3e9ef92..7ae3ef6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -24,6 +24,13 @@ python populate_packages_prepend () {
     d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
+# metapkg has runtime dependency on PN
+# each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev
+# so we need them even when empty (like in gst-plugins-good case)
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dev = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
-- 
1.8.1.5



