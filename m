Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.82976.1629463309052397808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 05:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=b8JrIbbt;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: opopovyc@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1207; q=dns/txt; s=iport;
  t=1629463308; x=1630672908;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QLkn3lPrn9hhI4GzusfDFl2pAyENiyah9RfqMlVBEQQ=;
  b=b8JrIbbtNnQjXWcULzCq0xcIzKxKilU0Hbf60XdTQMqzumL/4RB/YTQp
   AtTUTlp3gAAHfKhF2ewNcmV55Cij5VXDnyOE1oKWK/pbc70d3R9nn2lX+
   AFNUhuMA73Tb7j/xpuM1hoZ1isw6gWj0zYEbLKgErtXB3LXk92tvgd97h
   8=;
X-IronPort-AV: E=Sophos;i="5.84,337,1620691200"; 
   d="scan'208";a="913070308"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 20 Aug 2021 12:41:47 +0000
Received: from sjc-ads-8395.cisco.com (sjc-ads-8395.cisco.com [171.68.209.183])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 17KCflqQ026644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Aug 2021 12:41:48 GMT
Received: by sjc-ads-8395.cisco.com (Postfix, from userid 743233)
	id 63797CC128E; Fri, 20 Aug 2021 05:41:47 -0700 (PDT)
From: opopovyc@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Popovych <opopovyc@cisco.com>
Subject: [PATCH] utils: Reduce the number of calls to the "dirname" command
Date: Fri, 20 Aug 2021 05:41:43 -0700
Message-Id: <20210820124143.1153785-1-opopovyc@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.209.183, sjc-ads-8395.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Transfer-Encoding: 8bit

utils.bbclass contains create_cmdline_wrapper() function that
creates wrapper script with additional arguments for any passed
"$cmd" command, and uses several calls to "dirname".

Because "dirname" is an external command, in cases of lots of
calls to wrapped "$cmd", each call of "dirname" will incur
significant overhead.

There are three same calls to "dirname": one for saving it`s
output to "realdir" variable, and other two in "exec" command.
So last two "dirname" calls can be replaced with cached value
from "realdir" variable.

Signed-off-by: Oleksandr Popovych <opopovyc@cisco.com>
---
 meta/classes/utils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 120bcc64a6..072ea1f63c 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -214,7 +214,7 @@ create_cmdline_wrapper () {
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
 realdir=\`dirname \$realpath\`
-exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $cmdoptions "\$@"
+exec -a \$realdir/$cmdname \$realdir/$cmdname.real $cmdoptions "\$@"
 END
 	chmod +x $cmd
 }
-- 
2.25.1

