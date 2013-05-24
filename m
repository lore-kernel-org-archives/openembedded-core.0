Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABCC60130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:56:58 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id wp1so1003410pac.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 16:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XaFdWkdWyW8XD3dJWhaMCvh2+xURbb+qe61/25axp48=;
	b=Xa4CLt2KQsiT+TObS4X6gAgE9lMuCtXE5YF/wvTYJagkuDriCT5qSYXB4pFaxm2cbr
	jLGUHdqmRxzN1F3JokLA6J802KvURKoZz50vGoQA30V6Wo2AqbrfxhQFcCTDF6cE/y+F
	PSaEnDpCtoNmRwn/r5c0062+RWkiLjCjxsbqxLPYTLiolMhB0ml2GVj0gAs4gJiH+Cwi
	fhB/7n+T9/zwpCy3lDARtuwxpLjTzvFrD26J9KJNTOyaruX+ZbnNgm1AzOTtl/rNZqLH
	/TjkgVVtQQEGPkQTd5D7WCWu1eS9PITdIA8EMauYLzmf8D0AIDYgfNIlUXqlS8eVG9nE
	yzBA==
X-Received: by 10.69.0.226 with SMTP id bb2mr15305828pbd.34.1369353418979;
	Thu, 23 May 2013 16:56:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	lq4sm14688941pab.19.2013.05.23.16.56.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 16:56:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 10:10:06 +1000
Message-Id: <1369354206-9466-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Thu, 23 May 2013 23:56:58 -0000

- Remove /etc/resolvconf/run/interface from package as it actually uses
/etc/resolvconf/run/interface
- Create /var/run/resolvconf/interface on startup using
populate-volatiles.sh and tmpfiles.d for systemd
- Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
index d342a6e..78de492 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
@@ -23,7 +23,15 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/run/${P}/interface none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		echo "d /run/${P}/interface - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
+	fi
+	ln -snf ${localstatedir}/run/${P} ${D}${sysconfdir}/${P}/run
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
-- 
1.8.2.3


