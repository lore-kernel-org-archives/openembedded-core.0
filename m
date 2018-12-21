Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCA16BA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1318; q=dns/txt; s=iport;
	t=1545432033; x=1546641633; h=from:to:subject:date:message-id;
	bh=YIiNvW8EBsznA24Ynx7nOWvowuUl/n2wJ8EZxzBqP6c=;
	b=SOMSbWzGt+7OVJ0/d8YPSbZW2QUUIapu2U0FmLrbqnF2Ftcm42G3APXU
	hgQCQiZO39UWZcH2gHx750FV0+ynVFsA6Exsw+7OAokeqSK5TqKUo0jQF
	MONK/+oPgTV2ztvQx5lTQyML2qh2GER4p2HjctTzUilhjQry2l5i8zG+q g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ALAADxah1c/xbLJq1kGwEBAQEDAQE?=
	=?us-ascii?q?BBwMBAQGBUQYBAQELAYJpcBInjBZfpQiBew0bh2M0CQ0BAwEBAgEBAm0ohhw?=
	=?us-ascii?q?BVoEVARKDIgGCAadNg3sBhiwUh2qEWIFAP48DAqFFCYcSilcCFpFeAYlTkEm?=
	=?us-ascii?q?BRjiBVjMaCBsVgycJkFQ9AzABjzQBAQ?=
X-IronPort-AV: E=Sophos;i="5.56,383,1539648000"; 
   d="scan'208";a="9023101"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2018 22:40:32 +0000
Received: from localhost ([10.63.15.139])
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id wBLMeVmh030795;
	Fri, 21 Dec 2018 22:40:31 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Date: Sat, 22 Dec 2018 00:40:31 +0200
Message-Id: <1545432031-27272-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.139, [10.63.15.139]
X-Outbound-Node: aer-core-1.cisco.com
Subject: [PATCH] gdbm: depend on readline
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
X-List-Received-Date: Fri, 21 Dec 2018 22:40:32 -0000

This package depends on readline recipe.
In traditional OE build readline is a dependency
of python3 and few other packages, thus at the time
of gdbm build it is available.

However, if some custom set of recipes is build,
there is a race between gdbm and python3 build
and availability of readline isn't deterministic,
causing next build error:
| ../../gdbm-1.18/src/input-rl.c:18:31: fatal error: readline/readline.h: No such file or directory
|  #include <readline/readline.h>
|                                ^
| compilation terminated.

Thus add readline dependency explicitly.

Cudos to Kostiantyn Iarmak <kiarmak@cisco.com> who
found this issue.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 16ecc50..215ae47 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
 
 inherit autotools gettext texinfo lib_package ptest
 
+DEPENDS += "readline"
+
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
 
-- 
1.9.1


