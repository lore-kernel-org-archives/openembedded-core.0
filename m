Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 030E47715E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id ED67D600F52
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:34 +0100
Message-Id: <588de5198c641ea1cfc3e01a6d129296bd2f706b.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 13/52] scripts/gen-lockedsig-cache: fix race with temp file creation
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

As part of populating the sstate-cache with an artifact (.tgz file) we
create a temp file and then atomically move it to the final name. Due to
the glob used in this script such temp files were being matched, and
between the time they were matched and the time the script started
copying files, the temp file may have vanished.

This fixes random "No such file or directory" failures building the
extensible SDK on build setups where the sstate-cache directory is shared
amongst multiple build machines.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/gen-lockedsig-cache | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index c93b2c0..806c1e4 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -34,6 +34,10 @@ for s in sigs:
     files |= set(glob.glob(p))
 
 for f in files:
+    _, ext = os.path.splitext(f)
+    if not ext in ['.tgz', '.siginfo', '.sig']:
+        # Most likely a temp file, skip it
+        continue
     dst = f.replace(sys.argv[2], sys.argv[3])
     destdir = os.path.dirname(dst)
     mkdir(destdir)
-- 
2.1.4


