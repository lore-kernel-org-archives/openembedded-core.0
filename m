Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E95C77FC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I3LejU014404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:21:40 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 20:21:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 20:21:35 -0700
Message-ID: <a3105cfa18311bf192b5037e3bdfef6ccebe59e1.1500348040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500348040.git.liezhi.yang@windriver.com>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] runqemu: chmod 0o777 for lockdir
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
X-List-Received-Date: Tue, 18 Jul 2017 03:21:39 -0000
Content-Type: text/plain

Multi-users may run qemu on the same host, all of them should be able to
create or remove lock in lockdir, so set lockdir's mode to 0o777.

Note, os.mkdir()'s mode is default to 0o777, but the current umask value is
first masked out, so use os.chmod() to set it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index e9ed890bb27..2be27804841 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -910,6 +910,7 @@ class BaseConfig(object):
             # running at the same time.
             try:
                 os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
             except FileExistsError:
                 pass
 
-- 
2.11.0


