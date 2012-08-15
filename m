Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1gVa-0002tG-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 18:31:51 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 09:19:29 -0700
Received: by weyt11 with SMTP id t11so1031676wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 09:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=DrTnID7NaoTPzw9PgiHncfeiJKIo9S1BG+BO3M9lBUc=;
	b=RXjzEULTRz0BoHKwbgSEX9XX55kCEsroQsaDhWJ95e2MxY8FW+ty8Y8ZC8gZfVufcY
	msgKc9tnLtauoj2tmaUD2XGG3MaZSC4M0DewgasTdUaPNsALfATr4ocNVxPA5yd9g/PE
	4lCMK3+b2SfYXhrPuh/VFyGvGaalY2fpVa8Bz+SaMlgrioy3zuCNEy2WBOu0pQCBm+AB
	q2UPjE4xh1uRO6nzhmZsuFKrFf3KXkcQKlZZxe45VNjFFA0ADVRDltcAK9GEy9KJGrcI
	WejZOmU2okDpwdDDDUecUDVY/yZJNyBANvVxvjp4ZMBofTJkBrriZtUhlpsFDC6OrfdY
	zI0w==
Received: by 10.180.85.167 with SMTP id i7mr38166082wiz.8.1345047567479;
	Wed, 15 Aug 2012 09:19:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cu1sm29480723wib.6.2012.08.15.09.19.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 09:19:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2012 17:18:50 +0100
Message-Id: <127bffbf550f6357ad14c1b5b03c1c908e4e51e2.1345047378.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
References: <10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
In-Reply-To: <cover.1345047378.git.ross.burton@intel.com>
References: <cover.1345047378.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmSnuSUbPlTmSFNMWh0epQii1D1dyC1uXCaRr45eXuaCsig7+2m+0sNm5PcuyqyFyjJJJq0
Subject: [PATCH 2/2] webkit-gtk: add depends on make-replacement-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 16:31:51 -0000

Depend on make-replacement-native 3.81 so that we're certainly not building with
make 3.82, which some distributions have moved to.  3.82 is known to fail to
build webkit-gtk with -j and building without parallelism really isn't an
option.

See https://bugs.webkit.org/show_bug.cgi?id=79498 for the WebKitGTK bug, and
savannah.gnu.org/bugs/?30653 for the GNU Make bug regarding the problems with
3.82.

[ YOCTO #2816 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index dd43811..e6aed7d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -7,14 +7,16 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
-PR = "r1"
+PR = "r2"
 
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
 
-DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
-           gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
+DEPENDS = "make-replacement-native zlib enchant gnome-keyring libsoup-2.4 curl \
+           libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer \
+           gst-plugins-base flex-native gperf-native perl-native-runtime \
+           sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
 PR = "r1"
-- 
1.7.10



