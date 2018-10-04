Return-Path: <gtertych@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA7D798BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1324; q=dns/txt; s=iport;
	t=1538630974; x=1539840574;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=qb2WX5VVmw0C7AX6ZXZjjNWLXXvcBiHhjx6ZC5TiSIo=;
	b=Jnd/W7OyhLfZwU1KTDmh7NEV9mvZ9sAZfEp2J+6B7HjdFsYYiOgxSlMm
	moXbzR/Ac/CkM4Oyt85xNqXEhQzGSKeqlOeBnRFYUORfGik0aCpYuobka
	Bf00JkeG7PiN21asEuejWPUyaP2EajBtrxPOP0tZN5iK68SDQJ9vzVk2I 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AaAAArpLVb/xbLJq1bGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUwMBAQEBCwGCa20SKIxoljeNcIF6DRuEUYRDNgsNAQMBAQI?=
	=?us-ascii?q?BAQJtHAyFcgFGgVGDIQGBdA2lKYR3hSMUhnGENIFBP4VlAYMFgQSFCwKPCI5?=
	=?us-ascii?q?FCYZJiWoLF4FLS4cihisslS2BSAExgVVwFYMnCYIoiTaEcDwwikKCTQEB?=
X-IronPort-AV: E=Sophos;i="5.54,338,1534809600"; 
   d="scan'208";a="6985665"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2018 05:29:32 +0000
Received: from think.cisco.com ([10.61.199.244])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id w945TV5N016108;
	Thu, 4 Oct 2018 05:29:32 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 08:29:31 +0300
Message-Id: <20181004052931.21389-1-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.199.244, [10.61.199.244]
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH v2] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Thu, 04 Oct 2018 05:29:32 -0000
Content-Transfer-Encoding: 8bit

Append '\n' to the non-empty formatted string before return. If you
write it to the (manifest) file, it will ensure file ends with a newline.

Many GNU utilities have problems processing the last line of a file
if it is not '\n' terminated. E.g. if the last line is not terminated
by a newline character, then "read" will read it but return false,
leaving the broken partial line in the read variable(s).
It can also break or adversely affect some text processing tools,
that operate on the file.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---

Changes in v2:
 o make sure we don't append '\n' to the empty string

 meta/lib/oe/utils.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 93b0763b0a..d05f517a70 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -347,7 +347,13 @@ def format_pkg_list(pkg_dict, ret_format=None):
         for pkg in sorted(pkg_dict):
             output.append(pkg)
 
-    return '\n'.join(output)
+    output_str = '\n'.join(output)
+
+    if output_str:
+        # make sure last line is newline terminated
+        output_str += '\n'
+
+    return output_str
 
 def host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
-- 
2.19.0


