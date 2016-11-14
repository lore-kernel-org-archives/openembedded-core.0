Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1684B71978
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:34:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAEEY9hq023091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:34:09 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 06:34:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:34:05 -0800
Message-ID: <a8815d31ece4cad1d47fff14f87c275b26c11f8f.1479133967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479133967.git.liezhi.yang@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] sanity.bbclass:check_connectivity(): print more error messages
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
X-List-Received-Date: Mon, 14 Nov 2016 14:34:10 -0000
Content-Type: text/plain

This can help fix the problem when the error happens.

Now the error message is:
    Fetcher failure for URL: 'https://www.example.com/'. URL https://www.example.com/ doesn't work.
    Please ensure your host's network is configured correctly,
    or set BB_NO_NETWORK = "1" to disable network access if
    all required sources are on local disk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7682ffb..7e383f9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -380,7 +380,10 @@ def check_connectivity(d):
             # pointed to a support mechanism.
             msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
             if len(msg) == 0:
-                msg = "%s. Please ensure your network is configured correctly.\n" % err
+                msg = "%s.\n" % err
+                msg += "    Please ensure your host's network is configured correctly,\n"
+                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
+                msg += "    all required sources are on local disk.\n"
             retval = msg
 
     return retval
-- 
2.10.2


