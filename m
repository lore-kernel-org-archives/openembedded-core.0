Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIc2M-000782-9Z
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 10:43:59 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so6279956wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=2xpUklDUPqsis7qCNA6y0gDa3ItQrz5mGS1Cuv622C4=;
	b=GpAjzYDjxbXHWxy8IEpQWCB16Oj2Hz43NbqeX9dE8/QATvZTFUZTkJsjInmOltbEGA
	tarlA6GtXm5VzDR6R9NHcqsGglS1zqrFHNkTqFDdGWTb3acjDrBQ4wh+o1T68+xv6MC0
	r02ufvz0tpmUiOiqtG+UwqWkv7qi2XxQ7zCIC4MP0RST1WsTQ4d3wKGqF7OZEDgDvoZE
	dLLFoRF5UO7uScY+5zOQy50LjStptCXy9YKNLGuC8lveujtpwJRwSvrLjSJvYBXtuwXd
	OTh/eEb7vatXzhQ2GUfLi+47jrvcIuXrHLneZldtjXNf7+3IHNhQR0uOpPielnXb1GH0
	aDpA==
X-Received: by 10.194.63.109 with SMTP id f13mr15853005wjs.11.1363858021124;
	Thu, 21 Mar 2013 02:27:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k5sm3951987wiy.5.2013.03.21.02.26.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 02:27:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 09:24:25 +0000
Message-Id: <1363857865-16992-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmnXMKZ8ttrYzsykOylW3IRrDNLb9AmDgJaE8OU60dmJ9+/M+QY7MHi26yhvW6dC+WS2187
Subject: [PATCH] consolekit: don't inherit gnome
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
X-List-Received-Date: Thu, 21 Mar 2013 09:44:01 -0000

By inheriting gnome this package was build-depending on
gtk-update-icon-cache-native, gconf, gconf-native, shared-mime-info and
hicolor-icon-theme for no reason.  Change this to inherit autotools pkgconfig to
reduce the build-dependencies.

Also, add a missing dbus-glib build-dependency that was previously pulled in
through something in the gnome class.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index f6a554f..a328108 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -8,10 +8,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "glib-2.0 dbus virtual/libx11"
+DEPENDS = "glib-2.0 dbus dbus-glib virtual/libx11"
 RDEPENDS_${PN} += "base-files"
 
-inherit gnome
+inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2"
 SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
-- 
1.7.10.4



