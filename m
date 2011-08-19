Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QuO4c-0008Nu-Lu
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 14:21:18 +0200
Received: by fxg11 with SMTP id 11so2113288fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1/gRyZ8Imql0HKNuBYUWlYOvur870ORf6wN5QLPmQ6g=;
	b=cQGzGFpVbLrG0mUJpUkE7Ee3dEiCq+kVTYtb/DB3e4rbrMQ9KXe1xpI/obspZei3tT
	NyQ0iF2gT3WULyKd6n75wZ1MPD0ZC2p4ea2UwV+qTUQrjzEOh2G6/O/SEFaV294JO4HG
	acgsuNTuXgsW3OSEycRMAFMvMr5DqRkdVbx04=
Received: by 10.223.62.134 with SMTP id x6mr1165486fah.39.1313756197888;
	Fri, 19 Aug 2011 05:16:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm2530326fam.14.2011.08.19.05.16.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 05:16:36 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 14:16:28 +0200
Message-Id: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 19 Aug 2011 12:21:18 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* if there is multiple .bbappend files with FILESEXTRAPATHS_prepend := "/:"
  then the one parsed last is causing trailing ':' and that's causing empty element in
  path = extrapaths.split(:) + path
* it's hard to keep all .bbappends from foreign layers to follow this rule, so it's better
  to be able to handle trailing ':'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/utils.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 56abdd8..3c2e342 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -338,8 +338,9 @@ def base_set_filespath(path, d):
 	# The ":" ensures we have an 'empty' override
 	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
 	for p in path:
-		for o in overrides.split(":"):
-			filespath.append(os.path.join(p, o))
+		if p != "": 
+			for o in overrides.split(":"):
+				filespath.append(os.path.join(p, o))
 	return ":".join(filespath)
 
 def extend_variants(d, var, extend, delim=':'):
-- 
1.7.6



