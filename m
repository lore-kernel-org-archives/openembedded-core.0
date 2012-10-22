Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQJse-00004v-0c
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:25:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9MFC3PT026054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:12:03 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 22 Oct 2012 08:12:02 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 10:20:38 -0500
Message-ID: <a768e844d80bba65c2784fce80fca234088485ab.1350918262.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1350918262.git.mark.hatle@windriver.com>
References: <cover.1350918262.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/4] populate_sdk_base: Ensure that the multilib cross-canadian tools are used
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
X-List-Received-Date: Mon, 22 Oct 2012 15:25:28 -0000
Content-Type: text/plain

Update the host toolchain list, for cross-canadian toolchains, to ensure
that all of the supported multilibs are built and installed.  This
dynamically generates the dependnecy set based on the current multilib
configuration.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 8258224..2fe7f15 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -7,7 +7,7 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${@' packagegroup-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-- 
1.7.3.4



