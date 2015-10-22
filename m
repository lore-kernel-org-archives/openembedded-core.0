Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id DC70D7715E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 47643608F9D
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:46 +0100
Message-Id: <f6609aca5c533325411567a79130114654c50f3b.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 25/52] sanity.bbclass: expand warning when chmod fails
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:24 -0000

From: Alex Franco <alejandro.franco@linux.intel.com>

As suggested, add exception message to warning in
sanity.bbclass when chmod fails on TMPDIR.

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 34f8618..d0b5cd0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -843,8 +843,8 @@ def check_sanity_everybuild(status, d):
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
-        except OSError:
-            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
+        except OSError as exc:
+            bb.warn("Unable to chmod TMPDIR: %s" % exc)
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-- 
2.1.4


