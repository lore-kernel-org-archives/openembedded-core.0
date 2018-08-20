Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE4D874703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:55:01 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id v71-v6so19768itb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzm4PP8Rfr9dLQ6rQ78qn9qhBRnbD0EX9ZPUHX2FxNI=;
	b=IDFF9mBhwP0JnDO5WZupVH6YkpfPmpmGNSmWfNiH+iJEYLaW/KZk3eXU59lmwBxU0s
	1gekTX97qawea2NOXxs6KpCpUiJ98iE/jZqQysPhFyKMelQYccLWp80OxW4bJVxmCI3W
	w1IYTAYHDBzATKon27SSmcNxwj5LxO8dLpkJjw25HjagA6wchc8vMCag6VosF/08rV8z
	gh0OI12TAza/DVg/cAJaziTHVkp7HX+t1gjS3FpL98TFKcgZPozgWwtc8B/wmH9j4l2M
	r+FjVcSlf1aKXDuftEZySsHoEkxwocrQI6qtrhu9abkh3GTENzkfErOEukURZTSp2xRj
	Yo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzm4PP8Rfr9dLQ6rQ78qn9qhBRnbD0EX9ZPUHX2FxNI=;
	b=aCXGcysHMQIdRdGVP3X4W2bxc3n5d9B49DKjSduB4U+LPI1w45zRRem7dg3V9UPd2U
	t4DT8FOqGTWHGXmyd6fonU9aCgxJp1TABefdbia1Koq5qZYDRIqKvKmlRkAa4jOZWNO3
	2HsGBEzZAcN8kcyXucdvQWe+3qCJhy4XutFXDTL4JEuP2nqKH52sfG9r3Yjhgb7mzy7K
	bZ3Mz1xTHAE5EKZFBS2Y+RGEI8ZfVxzOr4/gX9gFv9cmqb5TsnUGrf0H8Nkk7zutKnpa
	GNW4awKfXKZzrDxlJRbkj8jcaHISdi6M3MrUVCv5i0rBSWrpEwPk86CFW4//eaOp7KNZ
	CUmw==
X-Gm-Message-State: AOUpUlEDF9tJJov62dVQuv0I+vqRNKsImhG4tNPE/vekG9X03n0ETmLb
	X8YBXQ7TU1Zw7bkCFacMw+MCdVx2
X-Google-Smtp-Source: AA+uWPy03yeh6yy61O5qWgawNlxu2q297U0GQ5dNwyEVS7CEPxES5U3GKCpcEDFJGQyRMQjr6J7hKA==
X-Received: by 2002:a02:9936:: with SMTP id
	r51-v6mr41183295jaj.46.1534780502716; 
	Mon, 20 Aug 2018 08:55:02 -0700 (PDT)
Received: from localhost.localdomain
	([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm1319136ioh.3.2018.08.20.08.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Aug 2018 08:55:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 10:54:40 -0500
Message-Id: <20180820155440.12626-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180820024342.15484-1-JPEWhacker@gmail.com>
References: <20180820024342.15484-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Mon, 20 Aug 2018 15:55:02 -0000

Replaces usage of the deprecated oe.utils.getstatusoutput() with Python
subprocess calls.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2f573..3976811d19f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -380,6 +380,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     # sourcefile is also generated containing a list of debugsources
 
     import stat
+    import subprocess
 
     src = file[len(dvar):]
     dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
@@ -409,16 +410,10 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
-    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    subprocess.check_output([objcopy, '--only-keep-debug', file, debugfile])
 
     # Set the debuglink to have the view of the file path on the target
-    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    subprocess.check_output([objcopy, '--add-gnu-debuglink', debugfile, file])
 
     if newmode:
         os.chmod(file, origmode)
-- 
2.17.1


