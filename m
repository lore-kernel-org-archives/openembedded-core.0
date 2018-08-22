Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id A9E5C6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:21:37 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v71-v6so1088856itb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzm4PP8Rfr9dLQ6rQ78qn9qhBRnbD0EX9ZPUHX2FxNI=;
	b=CaVi52KMTMasRLIyhCRcdHOdZ+0ou2B9/DKXRkRRjBNyea3HeezrQDQJS3VD1hQeRY
	CjolaPUZ0NO9Ts/gVa2Kv7WdcftYMgV/2E19hksyi4XStpl8Q1v0qq1G3s8exwewRlm6
	OmCowhsuHSPsAEY7J+bAK+igj5KX95rGUxeVL9g+pF1HOfEG7amEplfeJ79pQ632JbqS
	JjiHr1D3ZLgM9SoSS5izfqMKMiNS+TI6KRZn65C8vKZO4qILuHk/RcHwdq0Kd4IY3A0E
	ewP+81aM/dN0DkrO3Mn9PSeswwBOvjUTlL8qmik1xufEt+okblvsM4FTuVtz181w+5dF
	z6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzm4PP8Rfr9dLQ6rQ78qn9qhBRnbD0EX9ZPUHX2FxNI=;
	b=eyDkM1P86gmBhFEB5ILIOtbdO+01paDmZO5J/2+5laDD2CRW7yCfGa42faryzjVi7o
	L0tIibwfGehslWt3TfV+wvxTTyxuCpVgTzaMJ0W5u3gKMEmx60VGgzzyxbK63M4RFEq6
	2V9UUQUSFoADpQHgzBpWqSU8FxyU4uf5LM8EwvS9g3PMLNZhygJBZd8SmMbxqYCwx3TN
	Cf8MLeuXBWTVvC/C2BI7p188i9HMt/xogO105/SJqwhM67QxlwxCpbnt5AqCp9xbosUL
	pGFF83STL8zeGGbi2iDcC/MaH22XSQVG7QvJ8k1LsrorDIu2sCML4oZ6EPdOa0QIlQvV
	5ydQ==
X-Gm-Message-State: APzg51BwGPO7PKy7FBt9y+948VPO7nU2mouEc9t+uai6Swj8SeTips3l
	FAYrPD+dLyT1Z5ZdVjKrOX4pVhjC
X-Google-Smtp-Source: ANB0Vdazlbws34uGCxUtx7M3fVWQfUCqLHOtTOAgbfkflhdzggcQWrntfJEHxVWpkueBuQC9bHyruQ==
X-Received: by 2002:a24:ed0c:: with SMTP id
	r12-v6mr1642691ith.37.1534904498235; 
	Tue, 21 Aug 2018 19:21:38 -0700 (PDT)
Received: from farscape.garmin.com ([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id
	l26-v6sm142440iok.34.2018.08.21.19.21.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 19:21:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 21:21:34 -0500
Message-Id: <20180822022134.7947-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180820155440.12626-1-JPEWhacker@gmail.com>
References: <20180820155440.12626-1-JPEWhacker@gmail.com>
Subject: [PATCH v3] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Wed, 22 Aug 2018 02:21:37 -0000

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


