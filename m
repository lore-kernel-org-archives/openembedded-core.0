Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TmKaz-0006eY-Cy
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 09:38:13 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so3174381pbb.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 00:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=emZ/8gN6ZYXSCU5nEuvsC0db0JGYXuUVrEuOJubeEMM=;
	b=d/PY1+XPOU/oPZ1JcORqpElwk2KT4k2Uw1RRxTJ9luc7Neji/Hf+TCfdAeTXq0DJxp
	LFPYq6OxgXHG77PfO45Ws0SloBN/QJrMduClMxEhwsHLUE/1i+FGdQYe4cQ5MgtEACun
	IvOqgVeHB9fUAXteHiqD1Q85xH+JFFDJMYD6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=emZ/8gN6ZYXSCU5nEuvsC0db0JGYXuUVrEuOJubeEMM=;
	b=NYOcNnTTpX/e64Iwj8OUKh2Sj5cmmhVTE2FlKBnx2X6ibApZFCuoUOAGQlzZ58tlTG
	DtU9cClahs7owEvThYacPnmFAydGVwQn1XYeqrW7qfprht9XYq48aslnyvZtn+RpsCNH
	chreaKP5rBZsTV4gFlhYQvgqN5CUypI6LpxqHI1p35ep1QCx6TwIsMDvUtYVN4JR89gH
	gcCIEFNzuapvhUx12wSoajC24XVri5FhLC97WNpU8f5O0enEN/N2lu7KwUDbeJesIMDG
	1bUe0Wf3tkjiz9sImUEUDvzMy6sp8q75fc7QyYT7oz3uT6XHMejOSSdGPECzzyaRp3ID
	kLEQ==
X-Received: by 10.68.131.73 with SMTP id ok9mr47571753pbb.83.1356164605592;
	Sat, 22 Dec 2012 00:23:25 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id d8sm8893424pax.23.2012.12.22.00.23.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 00:23:24 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: yocto@yoctoproject.org
Date: Sat, 22 Dec 2012 00:22:52 -0800
Message-Id: <1356164572-25770-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm5GkH82o6EgBWYuv2/mMNMZj9Fwi2fbQm0sFaoaogVyA6nAWuMPiBrPzXMtHaR0Dcj6WRx
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qt-x11-free-native: Use private libpng
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
X-List-Received-Date: Sat, 22 Dec 2012 08:38:13 -0000

Ensure the 3rdparty version of libpng headers are found first, otherwise
the sysroot libpng15 header are found which causes a mis-match issue.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
index 2d87d26..b18ea0d 100644
--- a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
+++ b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
@@ -40,6 +40,7 @@ inherit native
 do_configure() {
 	echo "yes" | ./configure -prefix ${prefix} ${QT_CONFIG_FLAGS} -fast -L ${STAGING_LIBDIR} \
                 -I ${STAGING_INCDIR_NATIVE} 
+	sed -i -e '\:obj/release-shared-mt/qpngio.o\ kerne:s:$(CXXFLAGS):-I3rdparty/libpng $(CXXFLAGS):' src/Makefile
 }
 
 do_compile() {
-- 
1.7.9.5



