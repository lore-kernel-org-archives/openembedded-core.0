Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC56565C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0LBZ3AY019119 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:35:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HEjXpe5QJdeb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:35:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0LBYojQ019111
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:35:01 GMT
Message-ID: <1421840090.1798.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 11:34:50 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/package: Ensure strip breaks hardlinks
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
X-List-Received-Date: Wed, 21 Jan 2015 11:35:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Normally, strip preserves hardlinks which in the case of the way our hardlink
rather than copy functionality works, is a disadvantage and leads to non-deterministic
builds. This adds a move into place after the strip operation to ensure hardlinks
are broken and we bring back build determinism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ea6feaa..7c728fc 100644
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



