Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2WGqY/EUxzBI9+XPsXXsQz3Q2cgxg3dpumGNY9U0D7ZgeQ2E5ZSLLQZRqA/pIHR+d0f2acpI1i
 KK+cE49HYMzg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566006"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566006"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:01 -0700
IronPort-SDR: yQ/ijIPWVQFNIHXyga2D4x38ja5E/hEPQ2nsXLL76M3bGi6Oo7XG4vL76P2t1W/yzYmPHTXcht
 7IyOpt9t0Hjw==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091598"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/17] classes/reproducible_build: Use atomic rename for SDE file
Date: Fri, 11 Jun 2021 11:50:37 +0800
Message-Id: <8b2fd4e5e0841b81b4f709b061b655e2266dd4da.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

If an existing source date epoch file was found during do_unpack, it was
deleted and a new one would be written in its place. This causes a race
with check-before-use code in get_source_date_epoch_value. Resolve the
problem by making do_unpack write the new source date epoch to a
temporary file, then do an atomic rename to ensure it's always present,
and change the check-before-use code to use a EAFP exception instead of
checking for file existence.

[YOCTO #14384]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b5e3b33187bf78a2d62cc886463e4b27d6bd228)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/reproducible_build.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index f06e00d70d..1277764fab 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -77,17 +77,16 @@ python create_source_date_epoch_stamp() {
     import oe.reproducible
 
     epochfile = d.getVar('SDE_FILE')
-    # If it exists we need to regenerate as the sources may have changed
-    if os.path.isfile(epochfile):
-        bb.debug(1, "Deleting existing SOURCE_DATE_EPOCH from: %s" % epochfile)
-        os.remove(epochfile)
+    tmp_file = "%s.new" % epochfile
 
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-    with open(epochfile, 'w') as f:
+    with open(tmp_file, 'w') as f:
         f.write(str(source_date_epoch))
+
+    os.rename(tmp_file, epochfile)
 }
 
 def get_source_date_epoch_value(d):
@@ -97,7 +96,7 @@ def get_source_date_epoch_value(d):
 
     epochfile = d.getVar('SDE_FILE')
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-    if os.path.isfile(epochfile):
+    try:
         with open(epochfile, 'r') as f:
             s = f.read()
             try:
@@ -110,7 +109,7 @@ def get_source_date_epoch_value(d):
                 bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
                 source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
-    else:
+    except FileNotFoundError:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
     d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
-- 
2.31.1

