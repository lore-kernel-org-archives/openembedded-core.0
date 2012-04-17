Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkG-0002jZ-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:08 +0200
Received: by ghbz2 with SMTP id z2so3168211ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YSzL9Opw6Am5EnxXQe+WpVvLFL4NdBpkrqbiHnZ99hg=;
	b=EBEC4aXVrBH59K8D25k1E3RzLbVN+nBU/9WgRqfWtWRtmLWPZC0WcXX3nTuD44dzmp
	vS8dY80PggSV74pXsv56HyuLli55padyCu5pwW32thENJGEwxICH56TmNWcrV5ElV3sr
	3z0Wr77kivLj2BnySQNYCQXNcYEZBvzl3zwXD2pux34/+36tfgUEonSFQmz3zVCr+LXg
	IvJi5sjLBY1uynIwkJnGAbjsuI4IXGXGjS9uMzeaSdVcUGLX7XNPrbfrDg5ePQkwH1w+
	Q/rUgGYPOiQOGukvp+k8Z+uDhJC94RGmPGKptkWnl5og6vhRVgZWzw88PFOuSCXuw8/g
	e9/Q==
Received: by 10.60.21.103 with SMTP id u7mr22079367oee.11.1334677541951;
	Tue, 17 Apr 2012 08:45:41 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:40 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:13 -0500
Message-Id: <d80e9cb562402d3ff4eec097920886ebd3de52ec.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 3/6] csl-versions.inc: capture version in signatures
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
X-List-Received-Date: Tue, 17 Apr 2012 15:55:08 -0000

We want to ensure that changing external toolchain version will change the
metadata checksums of target recipes. This will do so via ensuring that any
variable which references TOOLCHAIN_OPTIONS also pulls in the toolchain
version variables.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/csl-versions.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index 6b8b2c5..ec7a6ba 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -103,3 +103,7 @@ python csl_version_handler () {
     d.setVar('CSL_VER_GDB', csl_get_gdb_version(ld))
 }
 addhandler csl_version_handler
+
+# Ensure that any variable which includes the --sysroot (CC, CXX, etc) also
+# depends on the toolchain version
+TOOLCHAIN_OPTIONS[vardeps] += "CSL_VER_MAIN CSL_VER_GCC"
-- 
1.7.7



