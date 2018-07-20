Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 64608784B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id v25-v6so9062050wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x1fOdxIVW7EGkZevCYqfd+HiPYzNsQf2oaH/+esJ6PM=;
	b=YivuB2zGZZBCBFpMop8cLY5sR+0DGMq4M+OAB0jlDgqIZRqhYG3ihAoiNQJ/NcHS+q
	ooHssYwzpP+DDTpxGwmoo4Y2yzbp2DNMH0qml4EfhqvvyxaoD+78U3FPR/Fmc7OdX+79
	vFIgX5LFu70ykUc4YABDW2CCx0RkOtNa6pVXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x1fOdxIVW7EGkZevCYqfd+HiPYzNsQf2oaH/+esJ6PM=;
	b=sRcsE9O53H+ZQei5SBiU/foYCvt/M9xMhr8AIkNQO1zFYsJ1WaLCp7tR6qG7hk0pSZ
	4Nb6Fy3GT9GiLdBJFp24N14iRBKovdf6l73ZLQU2Xc52dn9vOw/Zp8n+ewqvtJeaXNrz
	xqjmkelfIfzbTnTFZk9AKGlZP6fJ9/CW27T+2pHNALHVdgnHUvYsDKMeHO+HJGaGQSGL
	V7+GIQ8ukCzIQqY+zH4GpnpqcrHArpX7jQywdcyhipziETgcc5Wcx3VykVyN7sNENtrt
	qEZXyOjmRq47eFf4qcU36TCuwZED7FP7MdjbV3FbheZrOAl78y6/r/nZ5XRTtWXs0pHu
	0juA==
X-Gm-Message-State: AOUpUlGLqxUOraw7mDvCXAXsmAdFlAHjAkJxTuUdRu6an17cLnemU0aV
	+Z3C2Fbbnt/oMiGA3f9eVujNqyg50nN87w==
X-Google-Smtp-Source: AAOMgpfKDS0wACG5uvSkW1UFd9FHagF2pwSrXGSxStk59DTw14L74/CIiLkTxgNHDP8KvlrR1KGlQQ==
X-Received: by 2002:a1c:19c2:: with SMTP id 185-v6mr744877wmz.79.1532083194989;
	Fri, 20 Jul 2018 03:39:54 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:42 +0100
Message-Id: <20180720103948.30044-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/10] package: Drop subshell usage for dwarfsrcfile generation.
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:54 -0000

The command for running dwarfsrcfiles is simple and does not need a subshell
for each execution. By expanding out this function to use check_output()
from subprocess and a list of arguments, the shell overhead can be dropped.

For recipes with lots of files this gives a significant saving.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6f7015d9129..7a49e4f3516 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -345,8 +345,16 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
     return debugfiles.keys()
 
 def append_source_info(file, sourcefile, d, fatal=True):
-    cmd = "'dwarfsrcfiles' '%s'" % (file)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
+    import subprocess
+
+    cmd = ["dwarfsrcfiles", file]
+    try:
+        output = subprocess.check_output(cmd, universal_newlines=True, stderr=subprocess.STDOUT)
+        retval = 0
+    except subprocess.CalledProcessError as exc:
+        output = exc.output
+        retval = exc.returncode
+
     # 255 means a specific file wasn't fully parsed to get the debug file list, which is not a fatal failure
     if retval != 0 and retval != 255:
         msg = "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else "")
-- 
2.17.1


