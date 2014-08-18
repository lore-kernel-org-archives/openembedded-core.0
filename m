Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1E8870BA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:53:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I9rfIU028713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 02:53:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 02:53:40 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 17:49:18 +0800
Message-ID: <1f4e6704c78278cc0916714d576be40056db8134.1408355312.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408355312.git.Chong.Lu@windriver.com>
References: <cover.1408355312.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] librsvg: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Mon, 18 Aug 2014 09:53:43 -0000
Content-Type: text/plain

When trying to build on my Centos 5.5 machine, got below error:
| checking for gdk-pixbuf-query-loaders... /home/build/clu1/build/qemux86_standard_glibc-std/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-query-loaders
| checking if gcc  supports "-Wl,-Bsymbolic-functions" flag...
| configure: error: -Bsymbolic requested but not supported by ld. Use --disable-Bsymbolic to disable
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed

Set --enable-Bsymbolic=auto to disable it when it is not suppported.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
index 34d8ca1..e2b26f5 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
@@ -22,6 +22,10 @@ SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
+# The older ld (2.22) on the host (Centos 6.5) doesn't have the
+# -Bsymbolic-functions option, we can disable it for native.
+EXTRA_OECONF_append_class-native = " --enable-Bsymbolic=auto"
+
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
-- 
1.9.1


