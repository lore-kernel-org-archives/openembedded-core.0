Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T02MR-000058-Uk
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 05:27:36 +0200
Received: by pbcwy7 with SMTP id wy7so3447309pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bMJuAcTsxaznJPdfG5WTVDvjWubbgC8h+R9oPwI1usQ=;
	b=z3xTVYwR36sUjrwWf3egbK6lfFekzpP60czRmXSAnhcRqLSNIUAwYEvhnj3NhM9L4Y
	m3X+f0LZQUqhYeV64WiJ7mwXDqh4kgIcb2MyKjTUCtaY1SDHwjGUbkwK5r9TLpPadYFY
	XgKa/OPuwu3UezW8J08U/INK4Yba2i9wS7viAGag/QtnrwPddGzQY+M+lzZTwuIb1pf+
	LFrlKQElGVlGcf2sdj4hre0jHG0Wr9YqKjYwNLV6lXkN5YnW/4HVtAI0E56tjMaOXPW7
	ARA+ePl4x8DGIvcG08WZpleCpyFIrHBz2vOo5mijm8WlIglBRkjorC3dtc7bd9DNe+IN
	d3vA==
Received: by 10.66.88.39 with SMTP id bd7mr10504171pab.50.1344654944649;
	Fri, 10 Aug 2012 20:15:44 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id te10sm502689pbc.45.2012.08.10.20.15.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 20:15:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2012 20:15:24 -0700
Message-Id: <1344654924-655-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] chrpath.bbclass: Account for case when ORIGIN is in RPATH
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
X-List-Received-Date: Sat, 11 Aug 2012 03:27:36 -0000

This fixes a case when RPATH embedded in program have one of
its path already relative to ORIGIN. We were losing that path
if such a path existed. This patch appends it to the new edited
rpath being created when we see it.

so RPATH like below

(RPATH)              Library rpath:
[$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]

would end up being empty

but after this patch its kept intact

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/chrpath.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 10b5ca0..e903b65 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -49,6 +49,7 @@ def process_dir (directory, d):
             new_rpaths = []
             for rpath in rpaths:
                 # If rpath is already dynamic continue
+                new_rpaths.append("%s" % (rpath.strip()))
                 if rpath.find("$ORIGIN") != -1:
                     continue
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
-- 
1.7.9.5



