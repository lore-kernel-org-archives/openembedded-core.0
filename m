Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4C165C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t249Ttv8009272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:29:55 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:29:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:29:53 -0800
Message-ID: <01ebe6cc268aef6ee9da7e27c6a2a5b9cf6e29a5.1425461365.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425461365.git.liezhi.yang@windriver.com>
References: <cover.1425461365.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] create-pull-request: fix git GIT_VERSION
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
X-List-Received-Date: Wed, 04 Mar 2015 09:29:53 -0000
Content-Type: text/plain

If the git version is 1.7.9.5, then 1795 is bigger than 210 which causes
errors like:
fatal: No such ref: :rbt/bash
fatal: Needed a single revision
ERROR: git request-pull reported an error

Use the first 3 numbers to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index d83362f..97ed874 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -178,7 +178,7 @@ git format-patch -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].')
+GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].' | sed 's/\(...\).*/\1/')
 NEWER_GIT_VERSION=210
 if [ $GIT_VERSION -lt $NEWER_GIT_VERSION ]; then
 	git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
-- 
1.7.9.5


