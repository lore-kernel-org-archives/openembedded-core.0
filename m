Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81BB177338
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIR006852; Wed, 1 Jun 2016 13:35:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AiSsOfMNchAQ; Wed,  1 Jun 2016 13:35:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpFo006875
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kV-9K; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:25 +0100
Message-Id: <1464784540-2786-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/22] sanity: Switch urlparse to urllib.parse
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:58 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

urlparse is replaced with urllib.parse functionality in python3

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b0e7451..0b63d6e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -904,13 +904,13 @@ def check_sanity_everybuild(status, d):
                 continue
 
             if mirror.startswith('file://'):
-                import urlparse
-                check_symlink(urlparse.urlparse(mirror).path, d)
+                import urllib
+                check_symlink(urllib.parse.urlparse(mirror).path, d)
                 # SSTATE_MIRROR ends with a /PATH string
                 if mirror.endswith('/PATH'):
                     # remove /PATH$ from SSTATE_MIRROR to get a working
                     # base directory path
-                    mirror_base = urlparse.urlparse(mirror[:-1*len('/PATH')]).path
+                    mirror_base = urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
                     check_symlink(mirror_base, d)
 
     # Check that TMPDIR hasn't changed location since the last time we were run
-- 
2.5.0


