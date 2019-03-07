Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 664CF7CE7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:32:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x278Vuw0002491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Mar 2019 00:32:06 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 7 Mar 2019 00:31:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 16:41:33 +0800
Message-ID: <77df29ed1d31ee29c374a4c18f4f87519aec7958.1551948039.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1551948039.git.Qi.Chen@windriver.com>
References: <cover.1551948039.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] metadata.py: return info after fallback methods
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
X-List-Received-Date: Thu, 07 Mar 2019 08:32:15 -0000
Content-Type: text/plain

If python3 git module is not installed, we fall back to some git
command to get info. A previous commit (b8d22ed6) accidently deleted
the return statement, causing errors like below.

  Exception: UnboundLocalError: local variable 'InvalidGitRepositoryError' referenced before assignment

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/utils/metadata.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 70a2756..e0808ae 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -76,6 +76,7 @@ def git_rev_info(path):
             info['commit_count'] = int(subprocess.check_output(["git", "rev-list", "--count", "HEAD"], cwd=path).decode('utf-8').strip())
         except subprocess.CalledProcessError:
             pass
+        return info
     try:
         repo = Repo(path, search_parent_directories=True)
     except (InvalidGitRepositoryError, NoSuchPathError):
-- 
1.9.1


