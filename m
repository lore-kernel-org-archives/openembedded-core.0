Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US2B2-0004GD-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 11:28:00 +0200
Received: by mail-ee0-f53.google.com with SMTP id c13so126051eek.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=n2jnw6KVKRRpaAJw0h8hb60c2/GTaKATSXkuFlsdqag=;
	b=fgkMY8YEiCXVF3IgOI2kz5OFzsxC7CkYICbTuDnTIiyioa3izDNAwzM7DiY+/D6aRL
	gQUGb6OCG/piNG0iWBItFM12xI6UiHIkOYiEW1nCSSPpsbs1ouFJx51FZUK3ceC9Thma
	r4Z7BQ+2OzobRHmqpBqnFUKzB0a4wtKmYNcv6gCzkNcE42gP2eROCcHa3y/qlPztCJg/
	irRVTrcvF7czRVqW8g/cajIHKzDDBIM8gQ83onVDsx/KZN6G87GinfbyQhO1NgY40m3r
	emg4bAe+o+wnvBExTDnMDoU279wkm300I4YjNKahu/COajN2Vo/l/OvDjbniY1AeJEB5
	uPGw==
X-Received: by 10.14.111.133 with SMTP id w5mr746372eeg.33.1366103419041;
	Tue, 16 Apr 2013 02:10:19 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id n48sm1603811eeg.12.2013.04.16.02.10.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 02:10:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:10:12 +0200
Message-Id: <1366103412-10924-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmfEa03bI21rjxJBDmGTm8RpaK+npyjqu55DDVeT20mFdfNUubuq/QRbWHVH6TMttwUXu3s
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pango: add libpng to DEPENDS
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
X-List-Received-Date: Tue, 16 Apr 2013 09:28:55 -0000

Pango links indirectly to libpng through the cairo-png dependency, but does encode the libpng version in its .la files. Changing libpng versions will make a rebuild fail, so let's cheat a bit to let sstate rebuild pango as well to get around this.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/pango/pango.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index f622903..c1beb9e 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils harfbuzz"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils harfbuzz libpng"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
-- 
1.8.1.4



