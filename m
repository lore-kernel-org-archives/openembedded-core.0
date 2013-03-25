Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKByS-0000jj-Kw
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 19:18:45 +0100
Received: by mail-pd0-f169.google.com with SMTP id 10so91684pdc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=+DiaUXnVlLm2tFK3QbLQVTdNuXvPS8wGjXK6yjKIXvI=;
	b=Yy27EZ2cRlOiNbDDnOIFlqdpwjys2+5hDEcB0wC/BbH30lExfsb5qwT/PlAqDd7bau
	8vwfQvaJKrtz4/KPCdL9p2t/qxU1/4buf137dvylDk7Dn08gHFuXoLODPI9lXPwFgEei
	IZGK+TwXl+X9g/iVb2X6yB69zhCLJha/5ahuiYLL7CGx7xWn3kJ5Yo7VKuOEcDVksG0R
	PIFK8yN9CJf9TLj18v3HIkLGfgbLkEeZtvqkIDr0QsY/QELdIG5poWKxUfkXJkMaO5st
	Ofm+ShKel+UEQr0S8KY5lokrdyqY3IOEl8wDik/nVxDoXYrworYeWnAtlFkdWWoclueY
	rgkg==
X-Received: by 10.66.164.198 with SMTP id ys6mr19253278pab.77.1364234485395;
	Mon, 25 Mar 2013 11:01:25 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ip8sm14203080pbc.39.2013.03.25.11.01.23
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 11:01:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 11:00:56 -0700
Message-Id: <1364234456-8744-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] docbook-utils-native: Unbreak the build after source and build dir split
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
X-List-Received-Date: Mon, 25 Mar 2013 18:19:12 -0000

docbook-utils-native started to install frontends and backends in
wrong locations after this change. The absolute build and source
directories were being created in install locations and the recipes
using docbook-utils-native were complaining like dbus-java is saying

| jw: There is no frontend called
"/b/kraj/jlinux-next/poky/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/sgml/docbook/utils-0.6.14/frontends/docbook".
| make: *** [CreateInterface.1] Error 2
| ERROR: oe_runmake failed

Rightly so because now they are installed under
/b/kraj/jlinux-next/poky/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/sgml/docbook/utils-0.6.14/b/kraj/jlinux-next/poky/build/tmp-eglibc/work/x86_64-linux/docbook-utils-native/0.6.14-r3/

This patch fixes the install to be like it was but consider
the build and sourcedir split.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
index 78034dd..c3a5f3b 100644
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -45,14 +45,19 @@ do_install() {
 	done
 
 	install -m 0755 ${B}/bin/jw ${D}${bindir}/
-	for i in ${S}/backends/dvi ${S}/backends/html ${B}/backends/man \
-		${S}/backends/pdf ${S}/backends/ps ${S}/backends/rtf ${S}/backends/tex \
-		${B}/backends/texi ${S}/backends/txt ${B}/frontends/docbook \
-		${S}/helpers/docbook2man-spec.pl ${S}/helpers/docbook2texi-spec.pl \
-		${S}/docbook-utils.dsl
+	for i in backends/dvi backends/html \
+		backends/pdf backends/ps backends/rtf backends/tex \
+		backends/txt \
+		helpers/docbook2man-spec.pl helpers/docbook2texi-spec.pl \
+		docbook-utils.dsl
 	do
 		install -d ${D}${datadir}/sgml/docbook/utils-${PV}/`dirname $i`
-		install $i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
+		install ${S}/$i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
+	done
+	for i in backends/man backends/texi frontends/docbook
+	do
+		install -d ${D}${datadir}/sgml/docbook/utils-${PV}/`dirname $i`
+		install ${B}/$i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
 	done
 
 }
-- 
1.7.9.5



