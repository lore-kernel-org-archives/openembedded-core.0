Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE076A5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:27 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so5020366pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Y2DA9Z6If5dcWIRxJbZ4gQxOQFEwMFRPVQ0daQIxuD4=;
	b=L6fx5Z3dym1tqRoQBputnCrSz7WeGeo5zDDD1rBr3w0jlYHu68GN8nLJN+Ry0Ut7dA
	bjXxAPbnGl01hdKxf5+KC2s/YKEcd1P1Zq3CzwI40IeJZme6WA/Dwc95Hb0dLg39/D4b
	FwTGsBfN/Iq1oq1Wzj7+YowSHZaMBL/B7R36XtLlTJj/AhGA8Szc80YKLcns5bQfmaG8
	fof4E9hdj7b7qr9YpKIViOVEesZimmglt5pk06f6HG5GSyc4R/zBslIdMbBFj4TgI36L
	8k7WGNnmK69YOl9w8ZgyeJZjkZEscpmTVNYl48HulLPmm3SdTteHKVkJ3Gu9AoEjmcd6
	LdNg==
X-Received: by 10.68.105.164 with SMTP id gn4mr11494855pbb.42.1370897188700;
	Mon, 10 Jun 2013 13:46:28 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ix3sm11541082pbc.37.2013.06.10.13.46.26 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:24 -0700
Message-Id: <08c6a3eaf32dae3a636cbe9728850b28f079c9c4.1370896970.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] sstate.bbclass: brute force silence fetch errors
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

bb.fetch2.Fetcher.download() prints any fetch errors that come from the
underlying fetcher, rather than letting the caller do so, which means there's
no way to silence the fetch error messages without manipulating the loggers.
So we do so. The reason for doing this is that the user doesn't care if we
failed to fetch an sstate archive, the failure mode is just to rerun the real
task anyway.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sstate.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 28dc312..5b9d86e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -491,6 +491,7 @@ def sstate_package(ss, d):
 
 def pstaging_fetch(sstatefetch, sstatepkg, d):
     import bb.fetch2
+    import logging
 
     # Only try and fetch if the user has configured a mirror
     mirrors = d.getVar('SSTATE_MIRRORS', True)
@@ -514,6 +515,8 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     for srcuri in ['file://{0}'.format(sstatefetch),
                    'file://{0}.siginfo'.format(sstatefetch)]:
         localdata.setVar('SRC_URI', srcuri)
+        oldlevel = bb.fetch2.logger.level
+        bb.fetch2.logger.setLevel(logging.CRITICAL)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             fetcher.download()
@@ -526,6 +529,8 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
         except bb.fetch2.BBFetchException:
             break
+        finally:
+            bb.fetch2.logger.setLevel(oldlevel)
 
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
-- 
1.8.3


