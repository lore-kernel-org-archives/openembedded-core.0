Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyb-0007DK-Nr
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:41 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:20 -0800 (PST)
Received: by 10.216.187.82 with SMTP id x60mr1246810wem.9.1298799020438;
	Sun, 27 Feb 2011 01:30:20 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 16sm989366wet.8.2011.02.27.01.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:54 +0100
Message-Id: <3ccaf7d316fd0875f6d9d810bb93ddd3c49ce3ef.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 42/50] Fix LICENSE parsing: license.bblcass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Feb 2011 09:36:30 -0000

From: Beth Flanagan <elizabeth.flanagan@intel.com>

LICENSE parsing was missing some cases. Fixed

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 97d4e4e..4e3cd1c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -66,7 +66,8 @@ python do_populate_lic() {
     # I'm sure someone has written a logic parser for these fields, but if so, I don't know where it is. 
     # So what I do is just link to every license mentioned in the license field.
     
-    for license_type in license_types.replace('&', '').replace('+', '').replace('&', '').replace('|', '').replace('(', '').replace(')', '').split():
+    for license_type in (' '.join(license_types.replace('&', ' ').replace('+', ' ').replace('|', ' ')
+                         .replace('(', ' ').replace(')', ' ').replace(';', ' ').replace(',', ' ').split())):
         if os.path.isfile(os.path.join(generic_directory, license_type)):
             gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d, True), "common-licenses")
             try:
-- 
1.6.6.1



