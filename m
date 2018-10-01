Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Oct 2018 15:57:14 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 866BC79D14
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1098; q=dns/txt; s=iport;
	t=1538409436; x=1539619036;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=6A+UF6bg9osDrkeBOFh/uKELmobgw4H3idPnmZqrDq0=;
	b=f7SBV91n0Uv1v0gqjDN/6uY0Vqxknv6UXj8wH3dTgxPxfKEaqHlqlJxT
	pnqnPMr/OZYOo6KCVMq2VMDaEAi5yJ3C3CNYQmx8iz9XRBfV3U8v2/CBG
	BJ5hTrOu4KA8Q60j7SqR/qjjMvi6PGDAcQQh5MvKIFPeR35lTNn11YSKs w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AtAAAQQLJb/xbLJq1bGwEBAQEDAQE?=
	=?us-ascii?q?BBwMBAQGBU4JybRIojGiWNI1tgXoLG4RRhDM2FgEDAQECAQECbRwMhXEBRoF?=
	=?us-ascii?q?RgyEBgXQNpiOEd4UVFIZZhCyBQT+FZQGDBYEEhQsCjn2OLAmGRYlkCxeBR0u?=
	=?us-ascii?q?HGYYjASyVBYFJATCBVXAVgycJgiiJNoRwPDCKMIJNAQE?=
X-IronPort-AV: E=Sophos;i="5.54,328,1534809600"; 
   d="scan'208";a="6925577"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Oct 2018 15:47:24 +0000
Received: from think.cisco.com ([10.61.248.75])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id w91FlNp8004281;
	Mon, 1 Oct 2018 15:47:23 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2018 18:47:23 +0300
Message-Id: <20181001154723.32161-1-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.248.75, [10.61.248.75]
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Mon, 01 Oct 2018 15:57:14 -0000
Content-Transfer-Encoding: 8bit

Append '\n' to the formatted string before return. If you write it
to the (manifest) file, it will ensure file ends with a newline.

Many GNU utilities have problems processing the last line of a file
if it is not '\n' terminated. E.g. if the last line is not terminated
by a newline character, then "read" will read it but return false,
leaving the broken partial line in the read variable(s).
It can also break or adversely affect some text processing tools,
that operate on the file.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 93b0763b0a..cd12ce5263 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -347,7 +347,7 @@ def format_pkg_list(pkg_dict, ret_format=None):
         for pkg in sorted(pkg_dict):
             output.append(pkg)
 
-    return '\n'.join(output)
+    return '\n'.join(output) + '\n'
 
 def host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
-- 
2.19.0


