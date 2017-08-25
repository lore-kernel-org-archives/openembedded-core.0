Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EE2FD783DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:58:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3xdxSX2R1Tz1rG8C;
	Fri, 25 Aug 2017 11:58:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3xdxSX1sjFz3hhTP;
	Fri, 25 Aug 2017 11:58:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id hfrxOogWvwL4; Fri, 25 Aug 2017 11:58:35 +0200 (CEST)
X-Auth-Info: rN+NaMtQQiXRn0izperHJvNccTFlHHCVfeTRmdhZKVmGCtyzUiMeSHHVU8hYGn3L
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 25 Aug 2017 11:58:35 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 09:58:08 +0000
Message-Id: <20170825095808.31468-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <fa27449a-ffe7-c742-3d2f-6bcac9cac20f@menlosystems.com>
References: <fa27449a-ffe7-c742-3d2f-6bcac9cac20f@menlosystems.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v2] (PRE)MIRRORS: add pattern for npm:// without slash
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
X-List-Received-Date: Fri, 25 Aug 2017 09:58:36 -0000

For URIs with the npm:// transport but with no other slash in it, the
common MIRRORS and PREMIRRORS pattern of npm://.*/.* fails to match.
Add a new pattern in the mirros.bbclass and own-mirrors.bbclass classes
for these URIs.

Many URIs with the npm:// transport have no slash after the host part:

  npm://registry.npmjs.org;name=foo;version=0.1.2

This means that MIRRORS and PREMIRRORS containing entries like the
first one will not match these URIs:

  npm://.*/.*   # fails to match
  npm://.*      # matches

The npm:// URIs without a slash also matches URIs with a slash, but
then the file is searched for on the mirror with the same path that was
in the URI. Because of that, the pattern with the slash should be first
in the list, to prevent extra requests to the mirrors containing the
wrong path.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta/classes/mirrors.bbclass     | 2 ++
 meta/classes/own-mirrors.bbclass | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b98684f5c6..7ac654494b 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -49,6 +49,7 @@ osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
 ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 npm://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+npm://.*        http://downloads.yoctoproject.org/mirror/sources/ \n \
 cvs://.*/.*     http://sources.openembedded.org/ \n \
 svn://.*/.*     http://sources.openembedded.org/ \n \
 git://.*/.*     http://sources.openembedded.org/ \n \
@@ -59,6 +60,7 @@ osc://.*/.*     http://sources.openembedded.org/ \n \
 https?$://.*/.* http://sources.openembedded.org/ \n \
 ftp://.*/.*     http://sources.openembedded.org/ \n \
 npm://.*/.*     http://sources.openembedded.org/ \n \
+npm://.*        http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 "
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 12b42675bc..c70b94e7dc 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -10,4 +10,5 @@ osc://.*/.*     ${SOURCE_MIRROR_URL}
 https?$://.*/.* ${SOURCE_MIRROR_URL}
 ftp://.*/.*     ${SOURCE_MIRROR_URL}
 npm://.*/.*     ${SOURCE_MIRROR_URL}
+npm://.*        ${SOURCE_MIRROR_URL}
 }
-- 
2.11.0


