Return-Path: <jan.kiszka@siemens.com>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Feb 2019 08:54:28 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 2245A7BE41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 08:54:28 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x1S8lvb1009401
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:47:57 +0100
Received: from [144.145.11.158] ([144.145.11.158])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x1S8lvbP024260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:47:57 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a0c48cc9-2ac0-1016-ec0c-740e7e369676@siemens.com>
Date: Thu, 28 Feb 2019 09:47:56 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Subject: [PATCH] wic: Ensure that sourceparams values can contain '='
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
X-List-Received-Date: Thu, 28 Feb 2019 08:54:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Jan Kiszka <jan.kiszka@siemens.com>

This allows '--sourceparams key1=val1=val11,key2=val2'.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3da7e23e61..ca206ece02 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -173,7 +173,7 @@ class Partition():
             # Split sourceparams string of the form key1=val1[,key2=val2,...]
             # into a dict.  Also accepts valueless keys i.e. without =
             splitted = self.sourceparams.split(',')
-            srcparams_dict = dict(par.split('=') for par in splitted if par)
+            srcparams_dict = dict(par.split('=', 1) for par in splitted if par)
 
         plugin = PluginMgr.get_plugins('source')[self.source]
         plugin.do_configure_partition(self, srcparams_dict, creator,
-- 
2.16.4

