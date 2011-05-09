Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVQg-0005fq-1B
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:43:38 +0200
Received: by mail-px0-f172.google.com with SMTP id 6so3954525pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=jCRgbc/uchfK3P7QQ4XqEeKOFdkxpqE8yc1BdKLqLpM=;
	b=atU+WwbeCy+s8gqAtvzil3X52GEQGis9URjluKIAg8+l6yOMoLKO1q3lZh0ZGLkDkw
	upl98ERtqwArtd32AVjAMxCUV73JspLmMV+prT8PSF7dGPVOCkgHY0Ni1qlt2vWnvQMO
	7c4mnQWSCtojrCK8KgOp6PUWvH99LRqvMj3nA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=UTqm9rdUUEmsTBF2Z4kCg70h5Kh/dYwVMd2sPweSevj0WblGZ81CplcF+uQFSphtjn
	cW19PGRv4cglHE/phdo/Nn330cADSyFL0YRqjbPJtkr2eL0BLEit90mPPFQPyt+MyX7T
	P51CJ30uFxcfV76j8dltRITt+zOsaRzmqe9B8=
Received: by 10.68.15.101 with SMTP id w5mr10043455pbc.134.1304966455392;
	Mon, 09 May 2011 11:40:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o4sm4262100pbl.98.2011.05.09.11.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:48 -0700
Message-Id: <3db0d3e0bd1cc46050b05d9490087dc0a73b412d.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
References: <cover.1304966147.git.raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] oe/patch.py: Remove series file during Clean()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 18:43:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if there is a failed do_patch the series files get appended
so if there were two patches

a.patch
b.patch
and b.patch failed during next run it would append a.patch again
a.patch
b.patch
a.patch

and this would keep growing.

We can remove series file in Clean() because we populate it in Import()
anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Chris Larson <chris_larson@mentor.com>
Acked-by: Eric Bénard <eric@eukrea.com>
---
 meta/lib/oe/patch.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 16d3d08..1406e19 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -198,6 +198,7 @@ class QuiltTree(PatchSet):
     def Clean(self):
         try:
             self._runcmd(["pop", "-a", "-f"])
+            oe.path.remove(os.path.join(self.dir, "patches","series"))
         except Exception:
             pass
         self.initialized = True
-- 
1.7.4.1



