Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2710E786D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2D6F31882D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Tpe9hYW8rJA8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2E04518833
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17FC61E0A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CE5B1E0A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 012322430;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id E30219C051; Fri,  1 Dec 2017 16:50:41 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 16:50:23 +0100
Message-Id: <20171201155024.3002-5-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171201155024.3002-1-olofjn@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 4/5] lib/oe/package.py: is_elf: Disallow shell specials to be expanded
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
X-List-Received-Date: Fri, 01 Dec 2017 15:59:08 -0000

By using single quotes instead of double quotes, we don't have to worry
about escaping dangerous characters, other than ' itself.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index eab94feb91..976d2ef36c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -78,7 +78,7 @@ def is_elf(path, on_error=_is_elf_error):
     A return value of 0 means that the file is not an ELF file.
     """
     ret, result = oe.utils.getstatusoutput(
-        "file -b \"%s\"" % path.replace("\"", "\\\""))
+        "file -b '%s'" % path.replace("'", "\\'"))
 
     if ret:
         error_cb('"file %s" failed')
-- 
2.11.0


