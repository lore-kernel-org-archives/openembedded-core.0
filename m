Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1E970239
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 02:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H28aNo002249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:08:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 16 Jul 2014 19:08:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 10:08:37 +0800
Message-ID: <8a2f5d0e429d76a916afc1177cd0d74acadc20f0.1405562859.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405562859.git.Qi.Chen@windriver.com>
References: <cover.1405562859.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: ensure correct modes on directories
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
X-List-Received-Date: Thu, 17 Jul 2014 02:08:38 -0000
Content-Type: text/plain

Previously, when we create directories in populate_packages, the
directory modes are not all correct. Take the base-files recipe
as an example. The directory package/home has mode 2755, but
packages-split/base-files/home has mode 0755.

So after using creating directory, we need to use chmod to ensure
it gets the correct mode.

[YOCTO #6517]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 26a20d1..7e85af4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1019,6 +1019,7 @@ python populate_packages () {
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
                 os.mkdir(dest, fstat.st_mode)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
1.7.9.5


