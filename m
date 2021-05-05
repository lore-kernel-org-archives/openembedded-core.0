Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.332.1620237401539631631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 10:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B206320007;
	Wed,  5 May 2021 17:56:39 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
Date: Wed,  5 May 2021 19:56:15 +0200
Message-Id: <20210505175614.66322-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This expands the error message when a network failure is detected.
It happens that some ISPs or networks block the default example.com
domain. Therefore, instead of disabling network access, it
lets the user know how to modify the test URL.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a377917f2a..e907a3566f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -392,9 +392,12 @@ def check_connectivity(d):
             msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
             if len(msg) == 0:
                 msg = "%s.\n" % err
-                msg += "    Please ensure your host's network is configured correctly,\n"
-                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
-                msg += "    all required sources are on local disk.\n"
+                msg += "    Please ensure your host's network is configured correctly.\n"
+                msg += "    If your ISP or network is blocking the above URL,\n"
+                msg += "    try with another domain name, for example by setting:\n"
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
+                msg += "    access if all required sources are on local disk.\n"
             retval = msg
 
     return retval
-- 
2.25.1

