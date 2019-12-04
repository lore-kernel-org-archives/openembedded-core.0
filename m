Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 36EF57CDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:14 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389456"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:51 +0800
Message-Id: <4e5430de840c1803d17530e56cb0c6e728871cd4.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 10/10] dosfstools: fix CP437 error from `dosfsck -l`
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:13 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

Fix this error seen when using dosfsck -l to list fs contents:

    CP437: Invalid argument

(From OE-Core rev: 8a5fdac3c2d207b2cfac64ec2a2626c3ef154d84)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 69aa81af44..23b8836670 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -23,3 +23,6 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native"
+
+# Add codepage437 to avoid error from `dosfsck -l`
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
-- 
2.21.0


