Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.10289.1607533515279407702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 09:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iAs0bkxj;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1607533518;
  x=1639069518;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EwwUrF7UlvQfo1JOAow4RTKyJ2M0dxmk2xJcwxX9bXw=;
  b=iAs0bkxjwdq9Ohz/+R8gewvf8On0mrJTuaurE+3Jz7HMkIQxVpfJYaN/
   Ami3HcpUC8yCeIbC5fKat4jc7+ChLum/qiIaB+EuxkR+GSTg+he2WKA2m
   yXPVPjMh3xOi+tUQ2A3ZZijBHXzTm+TYPttP9NOg7L4yKUgLJ6RDHR9Yx
   Z2ETkuqGNR0QoFUzHOOK1G53wMgy50iCG7/ye+vtlAJq2SCYn2ywV31SQ
   hJQOcLYPbBWS8yttOo6zyJzpVUKY7rSpZx9JKSmSYb7TwZE6JCgdiPOI0
   jGcLTITrxDECYxsUxWvDUucmQ5osKHSPxcPDP+e7BGqEgeXXYj6RxQQed
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 3/3] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Wed, 9 Dec 2020 18:05:09 +0100
Message-ID: <47c5c4be5d4157518da2329d3465ad17172c8c05.1607533369.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1607533369.git.pkj@axis.com>
References: <cover.1607533369.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/wic/partition.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ebe250b00d..286c7867cb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -207,11 +207,21 @@ class Partition():
 
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
+            # Canonicalize the ignore paths. This corresponds to
+            # calling oe.path.canonicalize(), which is used in bitbake.conf.
+            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            canonical_paths = []
+            for path in ignore_paths:
+                if "$" not in path:
+                    trailing_slash = path.endswith("/") and "/" or ""
+                    canonical_paths.append(os.path.realpath(path) + trailing_slash)
+            ignore_paths = ",".join(canonical_paths)
+
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
