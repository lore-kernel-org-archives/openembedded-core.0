Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web08.342.1606846332590679527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=B3b8v27w;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1402; q=dns/txt; s=axis-central1;
  t=1606846335; x=1638382335;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=znQot1Bmu/awOFjtbwqqKZcQu4PO6BYGzlg4qzRHPEs=;
  b=B3b8v27wdz4LhbgwPoYeVUOoUPmydiq9Xs3zVsK0zPDr1o4C04hcJeJ7
   D9rReb5bzDUzcwz11uHVVrH3vYZJ3KlbI27DS2QKya5Uu3plg1izHi9Z3
   OVNJGcHqUNuexemIr73vPRLjMaYakq2qKIqTxQHZcji+pf6fpRSVRIQL2
   KEX3CLFdczsAEz4CC7ptKSBdktxOdiC+Sxcy7JA/CRis5MWtc8NsYz4ow
   yZofcbGXcFQktchD+OUxQViJ1dycjNe0Ay0gsewk8o/dn6eRWNYrDj6kE
   Sn1ou5gZH+y6VMjnawa+ccCJGUb7XEhqT/4heMcLUVuHdIINc/vT9VB38
   w==;
IronPort-SDR: 8EZ4Sum9BT4ADKgqiXOaBzGue+JDmi4jQT7hIbOGhGbuZMPRJrsTWei4JL7kGPyPuv/4oFcTD1
 hdTE0gxjBhkmzkGkPE9j4A/kqwKnNmmZlDqdgocnghkcHoIeDjt6LRWgA+15wBuSKKfm6MOSJL
 bhM4scxKpJWSjXkIU01P7dN61uOX9tN4mUhPDd+sQoF0Kgnle8pzAYeVnDhKGyRmKVQKvBXce7
 Be5nAPX5WsdJvHTzHXDJ79Sal4WQvHFsscFHD7XrIxc+SyBJyNUiEY2xgbBrhU59bztXCtv5Y+
 XkQ=
X-IronPort-AV: E=Sophos;i="5.78,385,1599516000"; 
   d="scan'208";a="15621786"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 5/5] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Tue, 1 Dec 2020 19:11:51 +0100
Message-ID: <f58bc4a89bd9a47d3735b45a0d7995ceb1cb0173.1606846217.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606846217.git.pkj@axis.com>
References: <cover.1606846217.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/wic/partition.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ebe250b00d..323a9580cc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -207,11 +207,15 @@ class Partition():
 
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
+            # Canonicalize the ignore paths. This corresponds to
+            # calling oe.path.canonicalize(), which is used in bitbake.conf.
+            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            ignore_paths = ",".join(os.path.realpath(path) for path in ignore_paths if "$" not in path)
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
