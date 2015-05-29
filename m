Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7EF75774
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:32:21 +0000 (UTC)
Received: by iepj10 with SMTP id j10so67920720iep.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XHFLoqoqXpwFr70XrDZlWgwXknj6hNQWhgCCLN1M8Rw=;
	b=AyNf/jiYxYQcqT17vqGspoBBL419P+YnRIgJEwU7jqIIJR6VOuClTRgJSj0HdM7LXE
	cNSlildYVHgkGODuidkZtJL2duopPSsPt205rIYhJPSznHNZ/E6mB4Oh0k6R3DjE0VN7
	FDg1fcJHki76GCRqy4HkXsG9G6qTCURH4/FUh+axAXK5AlpjENX2UnympYG9pt7xznBh
	NJY9gTRhz3jOIo+341Uv9Zy5McoI+pdvSbVrlThOEO9yDN5sCRNkD+BapiAirioZdC+1
	Q0PNHWENPLhNJih0IeBUY/NMENZL/1it/f8KWzlJ+op4Zcw00hKjnK4D53n+JRAYNWZ8
	dKtA==
X-Received: by 10.50.8.68 with SMTP id p4mr5570625iga.4.1432920743104;
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm4628876ion.5.2015.05.29.10.32.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:32:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:32:14 -0700
Message-Id: <2e1e2222f25b8b30793b67e8e43c1b2a1baccc44.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
References: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] alsa-plugins: Install 99-pulseaudio-default.conf when pulseaudio is enabled
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
X-List-Received-Date: Fri, 29 May 2015 17:32:24 -0000

The source file does not exist when pluseaudio is disabled

Change-Id: I78e0b9f4b8e66d8f41415c8672c1cb62c8fc5dc6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 5105e77..80f0446 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -50,7 +50,9 @@ do_install_append() {
 	rm ${D}${libdir}/alsa-lib/*.la
 
 	# We use the example as is, so just drop the .example suffix.
-	mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
+		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+	fi
 }
 
 python populate_packages_prepend() {
-- 
2.1.4


