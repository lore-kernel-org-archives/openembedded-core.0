Return-Path: <jan.kiszka@siemens.com>
X-Greylist: delayed 488 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jan 2019 16:56:47 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 3479F60402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 16:56:46 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x0TGmaXD014644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:48:36 +0100
Received: from [167.87.11.234] ([167.87.11.234])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x0TGmZod005197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:48:36 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <131b9938-823f-5c0a-136b-df38d272a399@siemens.com>
Date: Tue, 29 Jan 2019 17:48:35 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Subject: [PATCH] oe-git-proxy: Avoid resolving NO_PROXY against local files
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
X-List-Received-Date: Tue, 29 Jan 2019 16:56:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Jan Kiszka <jan.kiszka@siemens.com>

NO_PROXY may contain * elements, and if we are unlucky (or want to match
all hosts with *), we will pick up local files rather than doing the
match in match_host. Quoting helps here.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/oe-git-proxy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 7a43fe6a6e..1800942f36 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -131,8 +131,8 @@ if [ -z "$ALL_PROXY" ]; then
 fi
 
 # Connect directly to hosts in NO_PROXY
-for H in ${NO_PROXY//,/ }; do
-	if match_host $1 $H; then
+for H in "${NO_PROXY//,/ }"; do
+	if match_host $1 "$H"; then
 		exec $SOCAT STDIO $METHOD
 	fi
 done
-- 
2.16.4

