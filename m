Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A58E6607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:38:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2N8c6pa027614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 01:38:06 -0700 (PDT)
Received: from pek-wkang-u14.corp.ad.wrs.com (128.224.162.238) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 01:38:06 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Mar 2016 16:35:49 +0800
Message-ID: <1458722149-12730-2-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458722149-12730-1-git-send-email-wenlin.kang@windriver.com>
References: <1458722149-12730-1-git-send-email-wenlin.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] toolchain-shar-extract.sh: limit the length for target_sdk_dir
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
X-List-Received-Date: Wed, 23 Mar 2016 08:38:07 -0000
Content-Type: text/plain

Limit the length for target_sdk_dir, this can ensure the relocation
behaviour in relocate_sdk.py has the right result.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/files/toolchain-shar-extract.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 12d39c3..0295bde 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -110,6 +110,12 @@ else
 	target_sdk_dir=$(readlink -m "$target_sdk_dir")
 fi
 
+# limit the length for target_sdk_dir, ensure the relocation behaviour in relocate_sdk.py has right result.
+if [ ${#target_sdk_dir} -gt 2048 ]; then
+	echo "Error: The target directory path is too long!!!"
+	exit 1
+fi
+
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	# We're going to be running the build system, additional restrictions apply
 	if echo "$target_sdk_dir" | grep -q '[+\ @$]'; then
-- 
1.9.1


