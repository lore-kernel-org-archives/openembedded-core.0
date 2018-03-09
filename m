Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0337078942
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652018"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:01 +0200
Message-Id: <20180309185614.31113-23-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/36] rpcbind: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:25 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch   | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch b/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
index 859e67bbe05..4c23ee01ca2 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
@@ -15,19 +15,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  src/pmap_svc.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/pmap_svc.c b/src/pmap_svc.c
-index e926cdc..26c31d0 100644
---- a/src/pmap_svc.c
-+++ b/src/pmap_svc.c
-@@ -384,7 +384,7 @@ pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+Index: rpcbind-0.2.4/src/pmap_svc.c
+===================================================================
+--- rpcbind-0.2.4.orig/src/pmap_svc.c
++++ rpcbind-0.2.4/src/pmap_svc.c
+@@ -384,7 +384,7 @@ pmapproc_dump(struct svc_req *rqstp /*__
  	}
  
  done:
 -	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)NULL)) {
 +	if (!svc_freeargs(xprt, (xdrproc_t) xdr_void, (char *)NULL)) {
  		if (debugging) {
- 			(void) xlog(LOG_DEBUG, "unable to free arguments\n");
+ 			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
  			if (doabort) {
--- 
-2.7.4
-
-- 
2.16.1


