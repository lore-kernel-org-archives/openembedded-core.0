Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED1CE7C409
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1C9vtli008294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 01:57:55 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Tue, 12 Feb 2019 01:57:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2019 18:16:41 +0800
Message-ID: <b8d94b5b58d4a3572ae32accb269b71d3aeb934a.1549966555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1549966555.git.liezhi.yang@windriver.com>
References: <cover.1549966555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] yocto-check-layer-wrapper: Fix path for oe-init-build-env
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
X-List-Received-Date: Tue, 12 Feb 2019 09:57:55 -0000
Content-Type: text/plain

We only could run it in top of oe-core dir since it assumed oe-init-build-env
was in cwd, this patch fixes the problem.

[YOCTO #13148]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/yocto-check-layer-wrapper | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer-wrapper b/scripts/yocto-check-layer-wrapper
index bbf6ee1..b5df9ce 100755
--- a/scripts/yocto-check-layer-wrapper
+++ b/scripts/yocto-check-layer-wrapper
@@ -30,7 +30,9 @@ cd $base_dir
 
 build_dir=$(mktemp -p $base_dir -d -t build-XXXX)
 
-source oe-init-build-env $build_dir
+this_dir=$(dirname $(readlink -f $0))
+
+source $this_dir/../oe-init-build-env $build_dir
 if [[ $output_log != '' ]]; then
 	yocto-check-layer -o "$output_log" "$*"
 else
-- 
2.7.4


