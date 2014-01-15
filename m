Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DA6126BD14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:17:41 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so1202368wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 18:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mViQsNoxhVoCgg1GFNvTvT9+ks37YIz/pgDlqERP1xQ=;
	b=zPpfNdHnA8r5/nZlKMELSIeT8FhXoUtB7luDPItfJCF35vyoN7OfPdviiB5pc7WtxG
	VdJDEA/BAjb2MWZRlJKjaYqiZqhF8b/UEO/T0GlVLo22lZg26LD3h5pxZdMN+EoL/FMs
	X0PM4UhbDTHe0jAMgGk2f4Hq7PW/b+pw7zS1bgZdMh6vcMK2ywQvicHjBf6Ki2BBTNei
	GzM3PoocZAxxJ3DTIR6+5kUm5YnD9wDLi6I+89EZ9juSNAJEItGlcreDmtkbl49lkiXZ
	FSlX1G7xENGVenPV2mDEloXWYUzGAkBqqgD/85pLSnMOsgc5egsKUfFG/bQDCkiI7uU0
	GOpg==
X-Received: by 10.195.13.113 with SMTP id ex17mr1579551wjd.0.1389752262326;
	Tue, 14 Jan 2014 18:17:42 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id gd5sm26004632wic.0.2014.01.14.18.17.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jan 2014 18:17:41 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 02:17:26 +0000
Message-Id: <1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Wed, 15 Jan 2014 02:17:42 -0000

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


