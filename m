Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C22F774712
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 08:33:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w488XOdL023201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2018 01:33:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 01:33:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 16:34:48 +0800
Message-ID: <1e0c9af91ddb0503b3c02df77a6fd71cba12bab2.1525768293.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1525768293.git.Qi.Chen@windriver.com>
References: <cover.1525768293.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] create-pull-request: handle '/' in subject correctly
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
X-List-Received-Date: Tue, 08 May 2018 08:33:23 -0000
Content-Type: text/plain

When subject contains '/', we will meet the following error when
using create-pull-request.

  sed: -e expression #1, char 59: unknown option to `s'

The problem is not critical. But it's better to fix it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/create-pull-request | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 280880b..b4cf706 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -278,6 +278,7 @@ fi
 
 # Replace the SUBJECT token with it.
 if [ -n "$SUBJECT" ]; then
+	SUBJECT="`echo $SUBJECT | sed -e 's#/#\\\\/#g'`"
 	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
 fi
 
-- 
1.9.1


