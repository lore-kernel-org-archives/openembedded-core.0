Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9462A72E1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:27 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8543555pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Vgz8YOaaEf5aut8+w1Tdqb7nNX8oJOUH7w9wCald/sQ=;
	b=XkTGFoNz4BFCw0PqO81gwLFKyLHRtmKnHDjmyyfZj0LBZ4wR/g5ayzTcJCCvscoekI
	9wyBSr+g4HE6ld8u1aIlWxfe8nO2AGTIGC+mV1I7ZJOm0MiiQgrUuAsWlZEnmB0boOr6
	fk7uk8ZQMCCr5Nv8y1rJtCcK3GR83+cgSnv3XvoxRWaGaNeSf7+gnfgGZ0RGoEUvOjYS
	bOEFmz2wwFEttF2zpc4wB1CEfb/BhnZFYqmuhU7MogmbX5bd/7B9HNWz/AzVszfpWPCg
	Gv8RYquNmyuUS2qayjNd6Y2KsZGwMJE/kAp8n41rkrbQ4jg2L2EMNSUYOw1BWqteIW0O
	kV4A==
X-Received: by 10.70.137.33 with SMTP id qf1mr6830103pdb.158.1423152328541;
	Thu, 05 Feb 2015 08:05:28 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:45 -0800
Message-Id: <3ea41bead98e76dfc98d8db94bee711d1d2a88e4.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 37/61] lib/oe/package: Ensure strip breaks hardlinks
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Normally, strip preserves hardlinks which in the case of the way our hardlink
rather than copy functionality works, is a disadvantage and leads to non-deterministic
builds. This adds a move into place after the strip operation to ensure hardlinks
are broken and we bring back build determinism.

(From OE-Core rev: 7c0fd561bad0250a00cef63e3d787573112a59cf)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/package.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index f8b5322..a26a631 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -30,7 +30,8 @@ def runstrip(arg):
     elif elftype & 8 or elftype & 4:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
-    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    # Use mv to break hardlinks
+    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     ret = subprocess.call(stripcmd, shell=True)
-- 
1.9.1


