Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3LY-0007cz-Ms
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:28 +0200
Received: by wgbdr1 with SMTP id dr1so1751842wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xje12hCvFwom4820gDZSdgcMlG02TpEa+Evl1rMbPZw=;
	b=d8HBCb0PFVwRW6a7SjSUcACejDDS5ITDt4NsOAlXKRWGwVNOlrnKKYOiwVBU12+Wh5
	imSTCTqeSdYeBLp5iyTJt1IHy/orvGXQcix1KtTA4rjaQF/4sc8S093qPswkkw7JWJ6e
	XySdYioG5Tni/vKzHzwY59l9B7JXE2UcyDWB1R6Bm29k7U0sGNj5HU5urL/IkEqBUDvZ
	ReQ9JDQv3OlLR2DFL/wx87/Wg6j5MAt83k8eDqdoGhLwZkyn8uxd0bnYkFHaSgP+KUrG
	AVryn2jyb6Vmq+KfruMvvE/QnJjM+lr9/NWTr2FALwJ+VEIQur0qxYxIeHyaIrV0FDuX
	yjig==
Received: by 10.180.80.134 with SMTP id r6mr11534280wix.1.1344182085297;
	Sun, 05 Aug 2012 08:54:45 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:44 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:48 +0200
Message-Id: <1344182057-15981-2-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmDacTNZecf50HBzHeOuJNxQ6YmckAvAybPBsWJ2vU5wo4UQijw4+A4aLXIlnXphnuj4Kee
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/30] xinetd: use ${sbindir} instead of /usr/sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:28 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index a142143..579c28b 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -38,15 +38,15 @@ do_install() {
 	# Same here, the Makefile does some really stupid things,
 	# but since we only want two files why not override
 	# do_install from autotools and doing it ourselfs?
-	install -d "${D}/usr/sbin"
+	install -d "${D}${sbindir}"
 	install -d "${D}/etc/init.d"
 	install -d "${D}/etc/xinetd.d"
 	install -d "${D}/etc/default"
 	install -m 644 "${WORKDIR}/xinetd.conf" "${D}/etc"
 	install -m 755 "${WORKDIR}/xinetd.init" "${D}/etc/init.d/xinetd"
 	install -m 644 "${WORKDIR}/xinetd.default" "${D}/etc/default/xinetd"
-	install -m 755 "${S}/xinetd/xinetd" "${D}/usr/sbin"
-	install -m 755 "${S}/xinetd/itox" "${D}/usr/sbin"
+	install -m 755 "${S}/xinetd/xinetd" "${D}${sbindir}"
+	install -m 755 "${S}/xinetd/itox" "${D}${sbindir}"
 }
 
 CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
1.7.7.6



