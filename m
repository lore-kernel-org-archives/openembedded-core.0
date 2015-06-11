Return-Path: <denis@denix.org>
X-Greylist: delayed 3608 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jun 2015 20:08:20 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id A14E475841
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 20:08:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPS00MTJNT9ILA0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 11 Jun 2015 14:07:58 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ff9QsBkF c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=Idv6Z6YtAAAA:8 a=OScXe70xAAAA:8	a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
	a=GuAjhAW5BWGAXFMG648A:9	a=KullNb8nUTBxtLov:21 a=Yqms2T3aWmljOVjQ:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A58F0161A9C;	Thu,
	11 Jun 2015 15:07:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 15:07:55 -0400
Message-id: <1434049675-15986-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1434049675-15986-1-git-send-email-denis@denix.org>
References: <1434049675-15986-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>, Chris Carr <chris.carr@ge.com>
Subject: [daisy][PATCH 1/1] package_manager: Fix BAD_RECOMMENDATIONS for opkg
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
X-List-Received-Date: Thu, 11 Jun 2015 20:08:21 -0000

From: Paul Barker <paul@paulbarker.me.uk>

In package_manager.py, when using opkg as the packager, the command 'opkg <args>
info <pkg>' is called to get information about each pkg in BAD_RECOMMENDATIONS
in a format that can be written to the status file. The 'Status: ...' line is
modified and all other lines are passed through. Changing the verbosity level
argument for this command will change what it written into the status file.
Crucially, with the default verbosity level, no blank lines are being printed by
the opkg command and so no blank lines are being written to the status file to
separate each package entry.

The package parsing code in opkg expects package entries in the status file to
be separated by at least one blank line. If no blank line is seen, the next
package entry is interpreted as a continuation of the last package entry, but
the new values overwrite the old values.

So with the default verbosity level, a blank line follows some package entries
and these are parsed. The others are dropped due to the lack of blank lines. As
the verbosity increases, more debugging messages add blank lines and more
packages are parsed.

The solution to ensure that this works correctly regardless of the verbosity
level is simply add a blank line after the output of 'opkg info' is written to
the status file, ensuring that the next package is separated from the current
package.

[YOCTO #6816]

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
Cc: Chris Carr <chris.carr@ge.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(From oe-core master rev: 3fa24eee41c26fecd5e4f680082288ec772d2de9)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/lib/oe/package_manager.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1c33b0f..8e871a5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1381,6 +1381,10 @@ class OpkgPM(PackageManager):
                     else:
                         status.write(line + "\n")
 
+                # Append a blank line after each package entry to ensure that it
+                # is separated from the following entry
+                status.write("\n")
+
     '''
     The following function dummy installs pkgs and returns the log of output.
     '''
-- 
2.2.0


