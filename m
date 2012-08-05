Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3ME-0007eD-2U
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:10 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=cnitq2wau+cRmWtu8CISQkCGbXdrvfavpK3z0NEBiaY=;
	b=SOvScqHXbgQ4DqF0w2sCol6tH2iivG82Vsdvmfw4+EOiAhua3Hu/3LPcjqNf+sl6OO
	rLP6J4NAdU0iG1RkIc0NikPfJWFQh32pbIVhlHtj40kqQgmGoqF/14V2oFcqdMX8Iv/v
	KqCijFr8XSavYJqva1ySVYbP6PTLhAYbS8ZA35dGROTfs8p2knjq7MwaCiyqGEVgKiIi
	hxCWedRwotCoWuRb7aM/5xBLUw3om9LbVq3jMiUvIi5TMRMNtBLVJydlo4Gm/5doKguL
	P+jlliiapvFTOX90XqcWK5T5vWNxfcE7brTMgVyLyK0SRgb7gMV3GGq0KTe787lfc6hA
	so5A==
Received: by 10.180.81.165 with SMTP id b5mr11451037wiy.17.1344182128880;
	Sun, 05 Aug 2012 08:55:28 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:28 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:12 +0200
Message-Id: <1344182057-15981-26-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlIQiwjcmeoeTLe3BnGOlkXRH5I/R9pGp22IRGmaxkZUmL0AquQdnpWiPuTLbRZjGuo44o6
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/30] xinetd: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:12 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 579c28b..2e16822 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -39,12 +39,12 @@ do_install() {
 	# but since we only want two files why not override
 	# do_install from autotools and doing it ourselfs?
 	install -d "${D}${sbindir}"
-	install -d "${D}/etc/init.d"
-	install -d "${D}/etc/xinetd.d"
-	install -d "${D}/etc/default"
-	install -m 644 "${WORKDIR}/xinetd.conf" "${D}/etc"
-	install -m 755 "${WORKDIR}/xinetd.init" "${D}/etc/init.d/xinetd"
-	install -m 644 "${WORKDIR}/xinetd.default" "${D}/etc/default/xinetd"
+	install -d "${D}${sysconfdir}/init.d"
+	install -d "${D}${sysconfdir}/xinetd.d"
+	install -d "${D}${sysconfdir}/default"
+	install -m 644 "${WORKDIR}/xinetd.conf" "${D}${sysconfdir}"
+	install -m 755 "${WORKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
+	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
 	install -m 755 "${S}/xinetd/xinetd" "${D}${sbindir}"
 	install -m 755 "${S}/xinetd/itox" "${D}${sbindir}"
 }
-- 
1.7.7.6



