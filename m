Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 713A17D34C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:40:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z11so7773139wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9MEOedJXeQ29m7mder6vly4h6msnQBwRFRyRWiyJUkM=;
	b=dt81bzkMz2snXHHKqgLth2FDcioJYmsSfps6IvlrOHl0IAK0ig+h23QNrwqm2ChPEo
	QsDXLEdu1GEU6G4gkgwq5OwJIa0zyyE7L/+iR7l0kd3q8YhWg9ublgKblFBdeLSNjWZM
	kTPBvyV1dN8uSNXpU6TQRTl8rxkPlVe1T7Vyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9MEOedJXeQ29m7mder6vly4h6msnQBwRFRyRWiyJUkM=;
	b=VN4CzH9ELylI33BiKeiTnVfIPrtPYSzlih4NNLwZb2jmPpxGHJEtFx1kR9vOQFl9pl
	NHfnxMLkslsJeQHRMzfoXKO39CvUGhWYEwg+krPIhXA7sSMGdc2ird3uuardgBpNao13
	GW6UYp3DRR9aq4PFIs/88zoHe5qy5Xl9e4HXalN0BLO17WHxBDxd6J2eNmw5c0CJq9OF
	BigJFquMHhla1fjGoMGhkYf5EIKru6T2qkqr2gP087sAJyM1JImRPMPnoqzpZwwvM+56
	syGo3bpEfRkUTosG/R6+Q0dp/B3WZIGoEtFS/CmRe96aKSpbuhGVDi2foTL95DXFJUh9
	ry7w==
X-Gm-Message-State: APjAAAXTLTj/SrPPCTdVkJn+XW0HxfKvLimQLlYAzF0yOeW+u7wpcQUe
	yXMZFpaDn1yuehb8j+G5OyzFvB/fIK6zvg==
X-Google-Smtp-Source: APXvYqxNLXBOclKcLcxGFDnUBAMEnu+3IjQNU2q1V9zsHu8Ml1M7kx/FU7iqUpDx6vCW8eju7ffXJQ==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr293085wma.71.1554302445607;
	Wed, 03 Apr 2019 07:40:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r9sm17216873wmh.38.2019.04.03.07.40.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 07:40:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 15:40:42 +0100
Message-Id: <20190403144043.4566-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] resulttool: Allow store to work on single files
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
X-List-Received-Date: Wed, 03 Apr 2019 14:40:46 -0000
Content-Transfer-Encoding: 8bit

Store operations using a single file as a source weren't working as the os.walk
command didn't like being given a single file. Fix the store operation to
work for single files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 5e33716c3dc..3a81933242b 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -29,15 +29,18 @@ def store(args, logger):
     try:
         results = {}
         logger.info('Reading files from %s' % args.source)
-        for root, dirs,  files in os.walk(args.source):
-            for name in files:
-                f = os.path.join(root, name)
-                if name == "testresults.json":
-                    resultutils.append_resultsdata(results, f)
-                elif args.all:
-                    dst = f.replace(args.source, tempdir + "/")
-                    os.makedirs(os.path.dirname(dst), exist_ok=True)
-                    shutil.copyfile(f, dst)
+        if os.path.isfile(args.source):
+            resultutils.append_resultsdata(results, args.source)
+        else:
+            for root, dirs,  files in os.walk(args.source):
+                for name in files:
+                    f = os.path.join(root, name)
+                    if name == "testresults.json":
+                        resultutils.append_resultsdata(results, f)
+                    elif args.all:
+                        dst = f.replace(args.source, tempdir + "/")
+                        os.makedirs(os.path.dirname(dst), exist_ok=True)
+                        shutil.copyfile(f, dst)
 
         revisions = {}
 
-- 
2.20.1


