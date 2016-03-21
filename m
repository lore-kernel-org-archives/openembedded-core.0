Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 35B5D7317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122196"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:06 +1300
Message-Id: <c7d45562daacd7af2c9771e0c1c394eab9801633.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] oe-publish-sdk: drop SDK installer file from published output
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:38 -0000

We don't really need the SDK installer in the published output, for two
reasons:

1) The directory produced is for the consumption of devtool sdk-update,
   and the installer isn't used by that at all
2) It wouldn't really make sense to point users at the update directory
   to download the SDK installer because it contains a bunch of things
   that aren't meant for manual download, so it wouldn't be very tidy.

Leaving the file present can mislead you into thinking the opposite of
both of the above.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 9e4f1bf..e91888f 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -53,6 +53,7 @@ def publish(args):
     else:
         is_remote = False
         dest_sdk = os.path.join(destination, sdk_basename)
+        destdir = destination
 
     # Making sure the directory exists
     logger.debug("Making sure the destination directory exists")
@@ -83,16 +84,19 @@ def publish(args):
 
     # Unpack the SDK
     logger.info("Unpacking SDK")
+    cleanupfiles = [dest_sdk, os.path.join(destdir, 'ext-sdk-prepare.py')]
     if not is_remote:
         cmd = "sh %s -n -y -d %s" % (dest_sdk, destination)
         ret = subprocess.call(cmd, shell=True)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destination))
+            for cleanupfile in cleanupfiles:
+                os.remove(cleanupfile)
         else:
             logger.error('Failed to unpack %s to %s' % (dest_sdk, destination))
             return ret
     else:
-        cmd = "ssh %s 'sh %s -n -y -d %s'" % (host, dest_sdk, destdir)
+        cmd = "ssh %s 'sh %s -n -y -d %s && rm -f %s'" % (host, dest_sdk, destdir, ' '.join(cleanupfiles))
         ret = subprocess.call(cmd, shell=True)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destdir))
-- 
2.5.5


