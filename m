Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E28E785D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 21:20:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB7LK6jX001460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 13:20:06 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 7 Dec 2017 13:20:05 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Dec 2017 16:20:04 -0500
Message-ID: <20171207212004.3479-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.14.2.666.gea220ee
In-Reply-To: <20171207212004.3479-1-mark.hatle@windriver.com>
References: <20171207212004.3479-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] uninative.bbclass: Fix broken symlink issue
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
X-List-Received-Date: Thu, 07 Dec 2017 21:20:05 -0000
Content-Type: text/plain

If two builds are sharing the same DL_DIR, and the uninative file is local
to a layer.  When the first build gets to uninative it creates the link local
to itself, and subsequent users can use the same link.  However if that first
build then is deleted from the disk, the symlink is no longer valid (broken).

We need to update the system to detect this case, and use the model
implemented by the bitbke fetch2 code.  Look for a broken link, remove it,
then try to create the link and ignore an exception if it already exists
(since we just unlinked any bad one).

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/uninative.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index a410647328..670efa9f05 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -63,7 +63,19 @@ python uninative_event_fetchloader() {
             fetcher.download()
             localpath = fetcher.localpath(srcuri)
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
+                # Follow the symlink behavior from the bitbake fetch2.
+                # This will cover the case where an existing symlink is broken
+                # as well as if there are two processes trying to create it
+                # at the same time.
+                if os.path.islink(tarballpath):
+                    # Broken symbolic link
+                    os.unlink(tarballpath)
+
+                # Deal with two processes trying to make symlink at once
+                try:
                     os.symlink(localpath, tarballpath)
+                except FileExistsError:
+                    pass
 
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
-- 
2.14.2.666.gea220ee


