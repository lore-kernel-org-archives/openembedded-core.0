Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC1C6FF79
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 11:03:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5HB3MTK027624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 04:03:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 04:03:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 19:03:03 +0800
Message-ID: <f60b841e5e40ecea0d77438831f6617cf68a0dc0.1403000537.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403000534.git.hongxu.jia@windriver.com>
References: <cover.1403000534.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] ghostscript: fix sizeof(GX_COLOR_INDEX_TYPE) not equal to ARCH_SIZEOF_GX_COLOR_INDEX on mips
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
X-List-Received-Date: Tue, 17 Jun 2014 11:03:27 -0000
Content-Type: text/plain

The commit: http://ghostscript.com/pipermail/gs-cvs/2014-February/017271.html
newly added a 'compile time assert' on 9.14 that causes the build to fail if
the sizeof(GX_COLOR_INDEX_TYPE) is not equal to ARCH_SIZEOF_GX_COLOR_INDEX.

Disscuss on IRC:
http://ghostscript.com/irclogs/2014/02/06.html

The commit from OE-Core rev: 78a13ba170c1de6d7ef077854e3e34e18d17099f
...
ghostscript: add pregenerated objarch for mipsel/mips64/mips64el
...
has defined ARCH_SIZEOF_GX_COLOR_INDEX according to the type of archs,
and assigned 4 for mips/mipsel (8 for others).

The GX_COLOR_INDEX_TYPE was defined at do_configure time, which used
large color index (with 8) by default. We should manually choose the
opposite one (with 4) for mips/mipsel.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
index 73cebbc..e14e656 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
@@ -42,6 +42,9 @@ EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--enable-little-endian', '--enable-big-endian', d)} \
                 "
 
+EXTRA_OECONF_append_mips = " --with-large_color_index=0"
+EXTRA_OECONF_append_mipsel = " --with-large_color_index=0"
+
 # Explicity disable libtiff, fontconfig,
 # freetype, cups for ghostscript-native
 EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
-- 
1.8.1.2


