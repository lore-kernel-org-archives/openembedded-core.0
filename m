Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M3-0007ds-7Z
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:59 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=75kWEp4MCoZA6YFUoD2aoWa/R7ZQy30tLkFA+RaP3Mk=;
	b=B4W7XGqt/3CwRN8QUWKP1I2Y72Cur5COyBzUoMTCyktNjzTTrQCss30LcXTTLGBLMK
	9GHrfOmKjhx4m6eP6qcO0KKDGB9XWZ4Pin595XKUbFUho1gb/Wld90rvO0olT/OSDW+E
	DJmbNeE9WkRC3SdaiDaOA52XKqyxWDnbxInGvCklmAXVEJVajqiJ8iafyoQEODyJY+KO
	kjW7iOXez0wFDtAcJ5KtJEiLaUArj8tKbrzh7l4ZebONpMt2kelqi9Yok9YjlSAl8wG0
	IWaYIScYjudErXOzDneVknqu3pBJw4lr4O05xdFFvFWf7SyNkCjPC/nXc2IFzISMAmno
	oViw==
Received: by 10.180.78.2 with SMTP id x2mr11489064wiw.10.1344182118039;
	Sun, 05 Aug 2012 08:55:18 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:17 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:06 +0200
Message-Id: <1344182057-15981-20-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkfARxpthH6oIl5DHIWzXe3uaYIlnv2BYeo75JMNp/Jtj96w0q9m2y15/abiPNN1kRMuG2t
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/30] libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:59 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/pam/libpam_1.1.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index dd75d42..241519f 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -79,9 +79,9 @@ do_install() {
 	autotools_do_install
 
 	# don't install /var/run when populating rootfs. Do it through volatile
-	rm -rf ${D}/var
+	rm -rf ${D}${localstatedir}
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_pam ${D}/etc/default/volatiles
+	install -m 0644 ${WORKDIR}/99_pam ${D}${sysconfdir}/default/volatiles
 
 	install -d ${D}${sysconfdir}/pam.d/     
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-- 
1.7.7.6



