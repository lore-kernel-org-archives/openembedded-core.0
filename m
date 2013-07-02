Return-Path: <joe@deserted.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0674562062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:19:11 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so2757321eek.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 06:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:x-mailer:x-editor
	:user-agent:x-gm-message-state;
	bh=NCo05bqa7qE1ak1fh+uM8SpJqGCEzicq6TBeUqL2SZA=;
	b=Hd3oTH3w3FShilmStU6p8LDN0RdU71bu4mobPx5gzeTTqUaGxUv07CFEflG7SsDZ4d
	kfcFcoGW5OsFz5Cs9qbZGxs6U7HxYyRl29dNNmHAtH0l2hmY37waU35b/dDkgiIdceqi
	NY1pXaB7vOju6+qF9DUzX73TNXERGAziItuG0iGPTTtP+npCVdJpW6jJdiEM4wvFnHOb
	TeGIci7VXXcXg1+AOaTtScl5MJyc9lSQYorM8vei/VFBIrzIuLBSn5IwXptlBxTlkWRf
	b311vWMf6f454/Z70/nDLPeRQ6rY3c2txhsEP+IvC5paaXMAhmVDs9cL96aaMjS2D661
	XWdw==
X-Received: by 10.15.32.67 with SMTP id z43mr26489648eeu.24.1372771152701;
	Tue, 02 Jul 2013 06:19:12 -0700 (PDT)
Received: from burninator ([128.224.252.2])
	by mx.google.com with ESMTPSA id o5sm36551403eef.5.2013.07.02.06.19.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 06:19:11 -0700 (PDT)
Date: Tue, 2 Jul 2013 09:19:07 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130702131906.GB7855@burninator>
References: <1372447783-24719-1-git-send-email-joe.macdonald@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1372447783-24719-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.10.4
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQkU8Nz5rnfKg/My9KaWKDP5A711q9bFAC92ABfVf5cVz7Nv7A5rCHtw2Pq/osGhCpihzwKE
Subject: [RFC PATCH] sstate.bbclass: Add an extra check for sstate_mirrors
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
X-List-Received-Date: Tue, 02 Jul 2013 13:19:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BB_NO_NETWORK disables any fetching, however if we're using an external
sstate cache, we may want to be able to fetch those objects even if we are
not fetching the upstream sources.  Denote this situation by setting
SSTATE_MIRROR_ALLOW_NETWORK in local.conf.  When it is found, for sstate
cache fetches, mask off BB_NO_NETWORK for the local function.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta/classes/sstate.bbclass |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 28dc312..c1ca54b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -509,6 +509,11 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
 
+    # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
+    # we'll want to allow network access for the current set of fetches.
+    if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
+        localdata.delVar('BB_NO_NETWORK')
+
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
     for srcuri in ['file://{0}'.format(sstatefetch),
@@ -619,6 +624,11 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
         bb.debug(2, "SState using premirror of: %s" % mirrors)
 
+        # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
+        # we'll want to allow network access for the current set of fetches.
+        if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
+            localdata.delVar('BB_NO_NETWORK')
+
         for task in range(len(sq_fn)):
             if task in ret:
                 continue
-- 
1.7.10.4


