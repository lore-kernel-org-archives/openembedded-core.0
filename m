Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TyuIp-0005NI-7X
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 02:11:30 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so515153pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 16:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kVeHDRWVV81sF+4v1AqJ2gMdU2u3mRJytvw1B8Ucuqg=;
	b=fAVpqRvEattvCDLJNM9trSZw3IZHhIIkT64S8Uccp5uwX0wTuO10Lqovkpqz6byitd
	IKYv0WsPOrAWT7xPwEMMw6udnzUzb777ek2tjfVYfUF+IKFOnElbNfKLn6uJKXeIKpb/
	iD6/jW1m6PYUGJsaBdHudkFX0Ou4WFXDfUx6/Wc4PhRe+0ZVsybxw58T21BEfoatvQm/
	jsJpwxe/ABVDEr2X/w6XilKzPJbOJ9ZmS/S3OQVarJO4bunAz+ugioiV2IXo7/8BpgRV
	QxbIanOyYtS5HwY+Y6FTHINmGczKwMjPXOS93mgGOAbR2kOKJSYUOS1OlDkzGU00IWL4
	OJpw==
X-Received: by 10.68.203.137 with SMTP id kq9mr18257270pbc.115.1359161751575; 
	Fri, 25 Jan 2013 16:55:51 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ai8sm1575477pbd.14.2013.01.25.16.55.48
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 16:55:50 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 17:55:44 -0700
Message-Id: <1359161744-4193-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] tinfoil: support other fds, enable color support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2013 01:11:30 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rather than only handling sys.stdout, also support any arbitrary file object,
and enable color for the formatter if that file is a tty.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 lib/bb/tinfoil.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/bb/tinfoil.py b/lib/bb/tinfoil.py
index 73d8fe9..cb53f3e 100644
--- a/lib/bb/tinfoil.py
+++ b/lib/bb/tinfoil.py
@@ -29,15 +29,17 @@ from bb.cooker import state
 import bb.fetch2
 
 class Tinfoil:
-    def __init__(self):
+    def __init__(self, output=sys.stdout):
         # Needed to avoid deprecation warnings with python 2.6
         warnings.filterwarnings("ignore", category=DeprecationWarning)
 
         # Set up logging
         self.logger = logging.getLogger('BitBake')
-        console = logging.StreamHandler(sys.stdout)
-        format = bb.msg.BBLogFormatter("%(levelname)s: %(message)s")
+        console = logging.StreamHandler(output)
         bb.msg.addDefaultlogFilter(console)
+        format = bb.msg.BBLogFormatter("%(levelname)s: %(message)s")
+        if output.isatty():
+            format.enable_color()
         console.setFormatter(format)
         self.logger.addHandler(console)
 
-- 
1.8.0.3



