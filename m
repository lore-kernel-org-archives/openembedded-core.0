Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7D46A98B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:22 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q10so1917193pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S8W1338dLP4Rm1Hiq5+Ql6Ar3Wqrh7Ow9xvloYMDv3A=;
	b=D9EXaGEu7QU0ldiLsdJO620SVrNyKthSwe2s01L7m1P8fppQU7KAD9UIpYN/S8scFp
	OZZ8lvptqHTJPpKZUTEAI2l+rpIsVscMEYj50HjwaGY40fpSmpsu8CBjrd2+XAQeOz6V
	HRznN8hjka3hYaQqbbCRSHCwXGWGKVUV20lucRG2Ktvq4blYGwNZzgPCxabP4QI+6f6V
	AOtRmk2rgu4XAGZiN1vVLW9ycEAJsJAFzJMDkd3ISD+GuwZAvaryfUHIsc7J4qryizJb
	/CZV5/L17HUMu/fvwPvegqXA1wB+qOK5odwyytY+LBDUROzZ1El9iFGAFK68ymGxIIjS
	CPLg==
X-Received: by 10.68.247.131 with SMTP id ye3mr11592796pbc.87.1370897184067;
	Mon, 10 Jun 2013 13:46:24 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ix3sm11541082pbc.37.2013.06.10.13.46.21 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:22 -0700
Message-Id: <20c43ce563bb2645ae95b1795b0fe2248b9e1b43.1370896970.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] sstate.bbclass: kill MIRRORS and FILESPATH to speed up fetching
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

The default FILESPATH isn't really of use, as we don't expect to find sstate
archives buried in layer recipe directories, and the default MIRRORS is
intended for use for fetching SRC_URI, not sstate.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e74c642..3aa4371 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -508,6 +508,8 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     bb.mkdirhier(dldir)
 
+    localdata.delVar('MIRRORS')
+    localdata.delVar('FILESPATH')
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
     localdata.setVar('SRC_URI', srcuri)
-- 
1.8.3


