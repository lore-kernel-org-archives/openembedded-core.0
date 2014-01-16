Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 658216E7CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 17:59:44 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi8so2591898wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mViQsNoxhVoCgg1GFNvTvT9+ks37YIz/pgDlqERP1xQ=;
	b=sqkxdloYX3AKecGFs557EQHp5RAGE348RH7lLPncKO75vLf0JA4LRskTQNMyv5lJAf
	0R+W5tBx8HyMqo6j1IqrUbCuIVMAeLIkcPmR/D8cRlhaJM4aAJdvcdzpRvXm0nGEU5Cp
	wu/MVLINHxLqqlK11AKoN6QnVqaBGlQCVAjdAo8LM1BiLbf/CXtwRRy3DgE8HpeyUHIM
	YzJzbWhkJgwr9Ea7Vyhe4FCCg59uR0tufTbWshXGSUQfSJHg9YFLd6nhpPEAeqiSD150
	8WWcNGvQiOEsReC0meESkXx9KZTTtT73Rivrzku+caaIqPrjffOJh0bTYF7pvYeuJ5jM
	yyMA==
X-Received: by 10.180.12.238 with SMTP id b14mr9361284wic.42.1389895185008;
	Thu, 16 Jan 2014 09:59:45 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ua8sm6926729wjc.4.2014.01.16.09.59.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 09:59:44 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:59:26 +0000
Message-Id: <1389895166-2459-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
References: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH v2 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Thu, 16 Jan 2014 17:59:44 -0000

The new provider is the opkg-utils recipe.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index c9fb505..527fe5d 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -39,17 +39,13 @@ EXTRA_OECONF = "\
   --with-opkglibdir=${OPKGLIBDIR} \
 "
 
-PROVIDES += "virtual/update-alternatives"
-RPROVIDES_update-alternatives-cworth += "update-alternatives"
-RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 RREPLACES_${PN} = "opkg-nogpg"
 
-PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
+PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg"
 
-FILES_update-alternatives-cworth = "${bindir}/update-alternatives"
 FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so ${includedir}/libopkg"
 FILES_libopkg-staticdev = "${libdir}/*.a"
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
@@ -74,10 +70,8 @@ do_install_append() {
 	ln -sf opkg-cl ${D}${bindir}/opkg
 }
 
-do_install_append_class-native() {
-	if [ "${PREFERRED_PROVIDER_virtual/update-alternatives-native}" != "${PN}" ]; then
-		rm ${D}${bindir}/update-alternatives
-	fi
+do_install_append() {
+	rm ${D}${bindir}/update-alternatives
 }
 
 pkg_postinst_${PN} () {
-- 
1.8.5.2


