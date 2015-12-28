Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE4C73175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7ExRO013843
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:59 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:24 -0800
Message-ID: <a28eba9fb03720c805eae02c3d0aebf9294e300b.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/40] classes/distrodata: split SRC_URI properly before determining type
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:58 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

We weren't splitting SRC_URI values containing multiple URIs here; this
didn't cause any errors except when a trailing ; was left on a URI, in
which case the next URI was considered part of the parameter, which
didn't contain a = and therefore was considered invalid.

We only care about the first URI in SRC_URI in this context (since
that's the upstream URI by convention) so split it as we should and take
the first item.

Fixes [YOCTO #8645].

(From OE-Core master rev: 8e75b7e7d54e5638b42b9e7f90f2c6c17e62033f)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/distrodata.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 5a4c1b6..44c06e1 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -271,9 +271,9 @@ python do_checkpkg() {
         from bb.fetch2 import FetchError, NoMethodError, decodeurl
 
         """first check whether a uri is provided"""
-        src_uri = d.getVar('SRC_URI', True)
+        src_uri = (d.getVar('SRC_URI', True) or '').split()
         if src_uri:
-            uri_type, _, _, _, _, _ = decodeurl(src_uri)
+            uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
         else:
             uri_type = "none"
 
-- 
1.7.9.5


