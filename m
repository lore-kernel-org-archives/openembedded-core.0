Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UaVfV-0001Od-Nu
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 20:35:13 +0200
Received: by mail-oa0-f46.google.com with SMTP id h2so3839096oag.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 11:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=lO8P01JosgHVPbotT0z0d3MHMi5zvcNPw3taPFffW3U=;
	b=kLTbr67DRHFuY0LJpMVmAFnWcJhnoBFcMn1DOcwzrSt6nxUippqRuDfwUD/7r4GNDR
	Et3aIW3Vzr1OXunwA+mz3hncgVl3/rRuBuDK8RK97XwxDWrEmH1vnqnpihzPFLGl6p/T
	0m6br6iRAjxEjw6886jdtL/xiyW4MpurJ/y1Ay82xeQRlgGfWQXDu/gs+vEdX6U/8d8m
	jR8LO0ZOZ+aq+n+frHu4+rQZP2WWweRQQkZHZicytF9yeVZ6AESLlEq2imME5g3VqII0
	bpDYefKpWfc6jPQMjYXMkyK49FZbrpC51ICijFKHmj8zbjHmsanMBpVsWOHYCxUD/noG
	YVPQ==
X-Received: by 10.60.134.241 with SMTP id pn17mr4884277oeb.140.1368123373216; 
	Thu, 09 May 2013 11:16:13 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id w7sm4292343obx.9.2013.05.09.11.16.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 11:16:12 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 11:15:58 -0700
Message-Id: <1368123358-10995-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkfTKAbrnkRX2gr+R2cBi26yNLzWr4NydysdxRzYvNc2eM/3EqqPM4nZ0EBB/K1mjR9wDE0
Subject: [PATCH] qt: updated qmake2 class to export qconfig.pri mkspec
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
X-List-Received-Date: Thu, 09 May 2013 18:35:18 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary when Qt applicatins want to know variables such as
QT_MAJOR_VERSION, QT_VERSION, QT_MINOR_VERSION, gcc version etc.

OBS: This change made the build system crazy. When I changed it and run
bitbake my-qt-app-recipe, qmake was consuming 100% cpu usage for long time. I
had to stop it. So I recommend rebuild the entire Qt stack when changing this.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/qmake2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
index 5eebd8e..8b9861c 100644
--- a/meta/classes/qmake2.bbclass
+++ b/meta/classes/qmake2.bbclass
@@ -6,6 +6,7 @@ inherit qmake_base
 DEPENDS_prepend = "qt4-tools-native "
 
 export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
 export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
 export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
 export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
-- 
1.8.1.4



