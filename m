Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsva-00055h-58
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:38 +0200
Received: by yhjj56 with SMTP id j56so2775525yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YSzL9Opw6Am5EnxXQe+WpVvLFL4NdBpkrqbiHnZ99hg=;
	b=B8BqYOtKm5enEjCMYDTyRa2h1/PUt+IaAlVDKYojGptObZkjK8xRhdgtLDzSPociYm
	C0rMAUteQZFo4NNm+wd0yIgLPsqNSL6Rwo4qUXDgBk3ZILLfXZJXHbnXNFntI9CVTDzh
	OPxBubquD+/TCgtzFfQJmngUo0BfWptbFURs8jPJxzcU8QJkbha4i+oWqLMERRWuHNyN
	DmsYkYCUrFDvLob0NfDAl2w2tHSzTUwbAS1eaQp9E1enjMSdJMqjBLLiaQy9pYT7p7l/
	e+HMZ88NLQ8waarOhKQcUZxTw8uFyqfpQwD/7Bow9BqKmX6WXm+Wu07w1IYI2U8e6gzt
	+6qw==
Received: by 10.60.28.137 with SMTP id b9mr17831452oeh.57.1334609052523;
	Mon, 16 Apr 2012 13:44:12 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:44:00 -0500
Message-Id: <d80e9cb562402d3ff4eec097920886ebd3de52ec.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 3/7] csl-versions.inc: capture version in signatures
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:38 -0000

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



