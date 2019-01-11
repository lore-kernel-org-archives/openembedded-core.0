Return-Path: <alexey.brodkin@synopsys.com>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Jan 2019 12:55:37 UTC
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 199EB7BE41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 12:55:37 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id BAF6E10C05CC;
	Fri, 11 Jan 2019 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1547211022; bh=SPf1OB2Q83MraP2BrkSLq+ywcX6eWgf77qd3vo6ds8U=;
	h=From:To:Cc:Subject:Date:From;
	b=gne2/KJw25OO4ssI3H/5MAGTkLh24aKaRMEl7+LUiWcZJzCtRTEZeaC9KUMKO2fFw
	bUVTKQk1JlLZvE1ZAXN8EH4bZBKfPJ2NUVxM7sn2WliiP+XT/Zo7pdnoC3sIGr/GVl
	ApqNhA4sOlad4ZyLlLeqIhgq+N+PHW2VaMz4NGHvjg1aLTg4ulljjAHJnI/7Wz6AVy
	Afv9PEQNHKpjXLX+/gxVIzKoDRlyvBZ3cqCdRzIMeeKqWQIRgwtvsUtWSM2NwbQS+H
	ZEG/o/StO1CeeSFv93YONkhm2Fk6lWBh6Yoqg34jycm8mpTUsp/9O6zf9tOaRPnd8T
	gvz75CJ5WPbrg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id B085F3A76;
	Fri, 11 Jan 2019 04:50:19 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 15:50:14 +0300
Message-Id: <20190111125014.34593-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] webkitgtk: Enable building for ARC architecture
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
X-List-Received-Date: Fri, 11 Jan 2019 12:55:38 -0000

For that we need 2 things:
 1. Disable JIT in JS as it's not supported for ARC.

 2. Compile with "-mlong-calls" so relocations with
    offsets larger than 25 bits are used, otherwise
    linker fails to link final binaries.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.22.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
index fc56822f7a..56f69c7a30 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
@@ -69,6 +69,13 @@ EXTRA_OECMAKE = " \
 EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
 EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
 
+# Javascript JIT is not supported on ARC
+EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
+# By default 25-bit "medium" calls are used on ARC
+# which is not enough for binaries larger than 32 MiB
+CFLAGS_append_arc = " -mlong-calls"
+CXXFLAGS_append_arc = " -mlong-calls"
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
-- 
2.16.2


