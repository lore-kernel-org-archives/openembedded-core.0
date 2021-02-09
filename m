Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: R1sTLuLBCg84fCDAd6uIK65OIva4A6z8c4GI1H5BVUu6OflOtfkaENSD7Jqewf+7gDt6Mqcm6Q
 zV0FRn4JBz/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968635"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968635"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:56 -0800
IronPort-SDR: dzX6DVdU8jGtYnYmgfgsxorPmfbf3zcNMIJrRAzflZRgo+SXwFapFod89l6VfLN/zJYnYRvSdi
 Tu/sgInqzASQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215467"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:55 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/35] sstatesig: Add descriptive error message to getpwuid/getgrgid "uid/gid not found" KeyError
Date: Tue,  9 Feb 2021 23:51:58 +0800
Message-Id: <ca324a6fef99eef638a3577543592443a043f4e7.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If path is not owned by any user installed on target it gives
insufficient error "getpwuid(): uid not found" which may be misleading.
This exception occurs if uid/gid of path was not found in PSEUDO_PASSWD
files, which simply means the path is owned by host user and there is
host user contamination.

Add more information to the exception message to make it easier for user
to debug.

[YOCTO #14031]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38540b59ed4ec8632e30a5fd6364b010d9da8470)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/sstatesig.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 34558a6672..31a6140984 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -557,9 +557,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                     try:
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
-                    except KeyError:
+                    except KeyError as e:
                         bb.warn("KeyError in %s" % path)
-                        raise
+                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
+                            "any user/group on target. This may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
+                        raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
                     update_hash(" %10d" % s.st_mtime)
-- 
2.29.2

