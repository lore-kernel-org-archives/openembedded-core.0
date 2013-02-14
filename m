Received: from mail-wg0-f48.google.com ([74.125.82.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U63H5-0005PI-Ne
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:12:25 +0100
Received: by mail-wg0-f48.google.com with SMTP id 16so2065835wgi.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 09:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sq+Qsbj2y2z0tt1JELSDG0mCC8z3p2OisNaVg5HhbNo=;
	b=ipIFUqU3sfM3nUYI0pg/jCvSqb/kk3JCvJMzUDKKLQzOeE7r7lV1U+ibug0qhCzcQG
	ojCLeXXJGt6xgauO1g2XYZADaOplms0//wwCzRA0X+b60SLMq72zjLb5iwFCgSdS+r1M
	JH1S7IQ/5WKn+mFO5x0/OFgPbHOx1qEn07RSERoeks2Kw3UzNktcKM5JPbbJ+MmNiomE
	ah6axs8pwDAuwWnTnt4sDf4zz6z+bmCKKoom/yh3WD1WVRwHq3rPagam11ADcNnZLND2
	mX7vY4HsJaNZ5P4b6Bg7eluAu1MNPQ2UpPyL2AhPCErpqEgN7WcVa+RImr+qxXUXmRSq
	ppjg==
X-Received: by 10.180.79.37 with SMTP id g5mr979329wix.24.1360864509448;
	Thu, 14 Feb 2013 09:55:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o8sm636905wix.7.2013.02.14.09.55.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 09:55:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:52:51 +0000
Message-Id: <27e9c5a6d9e74885ffd923c29a0f5c55b7502a7b.1360864224.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkn7m/d4dwbudL19DPr07omFwBTxekurkFEgddr44ez6wYFw5Vj2MC+oD44wwWOsIbRc2uP
Subject: [PATCH 2/3] xserver-xf86-config: don't ship empty xorg.conf
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
X-List-Received-Date: Thu, 14 Feb 2013 18:13:48 -0000

Many hardware platforms can autodetect their hardware and don't need a xorg.conf
at all.  Make it easy for BSPs to not ship a xorg.conf by not installing empty
xorg.conf files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 3c29f8b..90d6f56 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,12 +7,14 @@ PR = "r11"
 
 SRC_URI = "file://xorg.conf"
 
-CONFFILES_${PN} += "${sysconfdir}/X11/xorg.conf"
+CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY_${PN} = "1"
 
 do_install () {
-	install -d ${D}/${sysconfdir}/X11
-	install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+	if test -s ${WORKDIR}/xorg.conf; then
+		install -d ${D}/${sysconfdir}/X11
+		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+	fi
 }
-
-- 
1.7.10.4



