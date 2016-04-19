Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9397C6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:45:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3J2jawJ001267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:45:36 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:45:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 19:45:32 -0700
Message-ID: <c769cebdabecd799e55bb3b7fa294313c1f92ecd.1461033288.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461033288.git.liezhi.yang@windriver.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] create-pull-request: set subject automatically for cover latter
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
X-List-Received-Date: Tue, 19 Apr 2016 02:45:35 -0000
Content-Type: text/plain

Set cover letter's subject automatically as the patch's subject when
there is only one patch and "-s" not used.

[YOCTO #9410]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 613e7ae..660f3cf 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -251,7 +251,13 @@ if [ -n "$BODY" ]; then
 	sed -i "/BLURB HERE/ d" "$CL"
 fi
 
-# If the user specified a subject, replace the SUBJECT token with it.
+# Set subject automatically if there is only one patch
+patch_cnt=`git log --pretty=oneline ${RELATIVE_TO}..${L_BRANCH} | wc -l`
+if [ -z "$SUBJECT" -a $patch_cnt -eq 1 ]; then
+    SUBJECT="`git log --format=%s ${RELATIVE_TO}..${L_BRANCH}`"
+fi
+
+# Replace the SUBJECT token with it.
 if [ -n "$SUBJECT" ]; then
 	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
 fi
-- 
2.7.4


