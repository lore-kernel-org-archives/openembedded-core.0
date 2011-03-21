Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jbd-0007mn-3x
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:13:29 +0100
Received: by gxk10 with SMTP id 10so2462116gxk.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=29PLLOxIPGIb+6ziKXe3vwqp+5/ecMDGyQJuZFzjKxk=;
	b=vcK+BCNUEGfAT/fRL2MUNTjfX5y4itV/IRWewRnyOr1vKhLP7zsvOQfBB9YxMaRXBn
	c4eyAH+kMpwtieNA7unq/1L4W5O7UPTsYxNfJhxAMg9//sHp/RIGhMWoeclNNNpIxct1
	jw8Baj9lvGNTBXhjhIHTfi1P/19ZoyA966XCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tZlselgXnHFRTfMoPNCgDoxbDg/s6bp9qTR1BZKHUIiEsm118wh+hIMpC25UM6Vv9w
	Y0e4owYtgG9uP94U4oKlg9JUYtBZp7AwsSDGO1G2RCWuqvg2K6lo3OQ9RnENEu6C2qfi
	K5kfq1IZRYgOEx9+R595EjOVaByNRDUjR4PYc=
Received: by 10.236.72.200 with SMTP id t48mr5837851yhd.21.1300731099165;
	Mon, 21 Mar 2011 11:11:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x76sm1317900yhn.94.2011.03.21.11.11.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:11:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:11:33 -0700
Message-Id: <a24f4837fa1e26b4a5797f31c095c94c4c3f9c95.1300730825.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300730825.git.raj.khem@gmail.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc-runtime_4.5.1.bb: Fix ICE in gcc-runtime with -feliminate-dwarf2-dups
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
X-List-Received-Date: Mon, 21 Mar 2011 18:13:29 -0000

GCC 4.5 ends up in an ICE when compiling libstdc++ pre compiled header
so we eliminate -feliminate-dwarf2-dups for gcc-runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 9eb658b..9d4e158 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
@@ -9,3 +9,8 @@ SRC_URI_append = "file://fortran-cross-compile-hack.patch"
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
+
+# gcc 4.5 ends up in ICE when using -feliminate-dwarf2-dups in libstdc++
+# compiling pre compiled headers so we remove this option when compiling
+# to workaround it
+CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"
-- 
1.7.4.1



