Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TmKcp-0006i0-EK
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 09:40:39 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so2441495dac.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 00:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=buPOe1tlKVciYPPHUohqJ/sidMDegF8tAd52Co3+oUQ=;
	b=Fn3x+aH1qLEkMsgEFLe1jSovfHkYeWr5Af6UwieZ3vAauCg4aUQXI4fx6zl+KzXhYB
	I/k/W/bupQJznQDrztmTjRlOV82vl+VgDC6Am9Bfrru1wz85AApuD3yDtrkLpeuwN7Ch
	FTPthzJe0kWNbFVun29IZl4prVwaTFMzOmQZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=buPOe1tlKVciYPPHUohqJ/sidMDegF8tAd52Co3+oUQ=;
	b=if3MYv2a01CcDbZAEn9ehecNANOUt/zb6428Auyt7QqapEeVdv59urt/Nv6HaGIZ9p
	Rk2EegPAmMEgvYbOGaqb2rPEXc8ID05hnp7TP5xqvjYalRFYiL36OHvhVIajvyMGU22U
	/xr/Xh+HtVP3OtUWUMilsYiHd6ECpskAxU44HgfuH4Ptl+yvv8PMOeWYBNbq7Ylhseft
	+tElkstfNmL2hKabNLql+1ujPkhAIG368wV+Gy7iV3e+Sv1f67vidN+qukNTQOrAAz1X
	6OBjUDF5Nduy9VavSpSn29J/s4yBrFR2kXDVR6BpJEEa/PdBVs3kQdfJM14X9EjdIVWz
	yuGQ==
X-Received: by 10.68.136.163 with SMTP id qb3mr46924988pbb.129.1356164719687; 
	Sat, 22 Dec 2012 00:25:19 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id hc4sm8465082pbc.30.2012.12.22.00.25.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 00:25:18 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: yocto@yoctoproject.org
Date: Sat, 22 Dec 2012 00:24:47 -0800
Message-Id: <1356164687-25863-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk/TCIDDf39SuYa7pXG3PzBT65dtn5M3yxc9uLlfUUp8IZ7JQ4bf2RqjBI1gbaInLWggWSg
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-qt3][PATCH v2] qt-x11-free-native: Use internal 3rdparty libpng header
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
X-List-Received-Date: Sat, 22 Dec 2012 08:40:39 -0000

Ensure the 3rdparty version of libpng headers are found first, otherwise
the sysroot libpng15 header are found which causes a mis-match issue.

[YOCTO #3625]

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



