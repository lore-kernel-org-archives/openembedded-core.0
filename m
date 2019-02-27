Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF0B7CB20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w6so15717644wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zU8Dr6aHDq709JXEpdB/i12dBJRFZnG5hHwGDGie1ZQ=;
	b=OekFROHu9UTg7xzVlJGHfOVoN7wL27BCUXfBzU715ov6szOeKLxalZ/CJHv1RkrpEn
	STr2b+VlYbURitnFVWAofUpgbujfFy507he+Or7gnGn1+wZT7XP26pwcP8ijAQPqYqz6
	XLxfqoMifYCyN8zLtAT/AmcbKqoMxvEzdzCRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zU8Dr6aHDq709JXEpdB/i12dBJRFZnG5hHwGDGie1ZQ=;
	b=JoY9//QJKc9XH1eMWL8qq8B1DDDH3M4KehkbUKcZVSg5K+S8TKjiQ47iHA9xkslfkI
	r+JFcrihEaNjKwjhpqpFo0SQ6Fdz6LduOYNie80H02Mxl94Rm6f2m3S7ZCSskLoA2IYO
	M9yo/+zXaZXt7ue8khAOCGVyQvfDhDP1rx2tCk+n9SXZpiY788iPa6KxHPcMlh5GFeVY
	CAWp5doRBNYzSxNH/9vQv12YIR9X+X8pnNDHhnkij3IzXeMO5Dt0qYDS9HZmVNHe636x
	J2fi7RKqrdPUYXj9B4V+9cB6mkpRs0P1WSTadcH5PdVn9ZXAns45cyDJUQQH/g7Za80F
	4Riw==
X-Gm-Message-State: APjAAAUTBdDnWRf5KAuO4I3REnZc3EXa/qT5dbojdxvM3qCeClhRNfG8
	kqVhInxhId8T38Qt8QYJnjQVWerCQvU=
X-Google-Smtp-Source: APXvYqwk99YrhK1T+r1Ih4377pNlGK9m7GORHDYyCGAYbly9GWH+uE1jWKviB4c5Zr5JnnD3TT6Jtg==
X-Received: by 2002:adf:a4c9:: with SMTP id h9mr3249538wrb.254.1551289671024; 
	Wed, 27 Feb 2019 09:47:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm28754659wrx.45.2019.02.27.09.47.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 17:47:43 +0000
Message-Id: <20190227174746.21127-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
References: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] resulttool/store: Handle results files for multiple revisions
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:50 -0000
Content-Transfer-Encoding: 8bit

Currently we cant store results if the results files span multiple
different build revisons. Remove this limitation by iterating.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 39 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 6744fb3c05d..43e57b913c6 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -29,7 +29,7 @@ def store(args, logger):
     try:
         results = {}
         logger.info('Reading files from %s' % args.source)
-        for root, dirs, files in os.walk(args.source):
+        for root, dirs,  files in os.walk(args.source):
             for name in files:
                 f = os.path.join(root, name)
                 if name == "testresults.json":
@@ -38,7 +38,8 @@ def store(args, logger):
                     dst = f.replace(args.source, tempdir + "/")
                     os.makedirs(os.path.dirname(dst), exist_ok=True)
                     shutil.copyfile(f, dst)
-        resultutils.save_resultsdata(results, tempdir)
+
+        revisions = {}
 
         if not results and not args.all:
             if args.allow_empty:
@@ -47,26 +48,32 @@ def store(args, logger):
             logger.error("No results found to store")
             return 1
 
-        keywords = {'branch': None, 'commit': None, 'commit_count': None}
-
         # Find the branch/commit/commit_count and ensure they all match
         for suite in results:
             for result in results[suite]:
                 config = results[suite][result]['configuration']['LAYERS']['meta']
-                for k in keywords:
-                    if keywords[k] is None:
-                        keywords[k] = config.get(k)
-                    if config.get(k) != keywords[k]:
-                        logger.error("Mismatched source commit/branch/count: %s vs %s" % (config.get(k), keywords[k]))
-                        return 1
+                revision = (config['commit'], config['branch'], str(config['commit_count']))
+                if revision not in revisions:
+                    revisions[revision] = {}
+                if suite not in revisions[revision]:
+                    revisions[revision][suite] = {}
+                revisions[revision][suite] = results[suite][result]
+
+        logger.info("Found %d revisions to store" % len(revisions))
+
+        for r in revisions:
+            results = revisions[r]
+            keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
+            subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
+            resultutils.save_resultsdata(results, tempdir)
 
-        logger.info('Storing test result into git repository %s' % args.git_dir)
+            logger.info('Storing test result into git repository %s' % args.git_dir)
 
-        gitarchive.gitarchive(tempdir, args.git_dir, False, False,
-                              "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
-                              False, "{branch}/{commit_count}-g{commit}/{tag_number}",
-                              'Test run #{tag_number} of {branch}:{commit}', '',
-                              [], [], False, keywords, logger)
+            gitarchive.gitarchive(tempdir, args.git_dir, False, False,
+                                  "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
+                                  False, "{branch}/{commit_count}-g{commit}/{tag_number}",
+                                  'Test run #{tag_number} of {branch}:{commit}', '',
+                                  [], [], False, keywords, logger)
 
     finally:
         subprocess.check_call(["rm", "-rf",  tempdir])
-- 
2.20.1


