Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6242A79164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:29:00 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id e14-v6so1114996itf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 19:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YBI4hggGeQM92VtlFFbUsTRuNjOVmBOlwpDArghKn78=;
	b=WHCbIck15/YRsrjxVk9a5EE+ST03wkB8+UzqBI8VXQdNUEr7YagWOP6c5l99ra14Xi
	XiZHFwZLkDOUWho23lKjZRSMI5O8uNFJ6mSx0X34XRkJ7TKAPNb8Hf+LSNQutg4V13FF
	42pJL4lbv5w2qa3ulnt4FkeF7AUT5UrXp1WcFjruy8I5fAdvzhbq11CysMJFl2XkKALq
	HWwWCCW6QpUBY1+9wccYFXxsaw3ktc4TU51tg6DQVD/O2cECSNRs//0wkr9bCqN/4hFs
	NFRwgW3pKjN7w7V5h+kTQXOzDb0r8MGmagrpGUFAUSxEK7jtY3s+V95WzzB+eeNJWuJc
	39+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YBI4hggGeQM92VtlFFbUsTRuNjOVmBOlwpDArghKn78=;
	b=TtlRIf0t7SSoAbVAgWIJ5LKKH4lTawKsfpxWi+RFoMi/GZZxHCxozj4IWz2XM+RNS0
	hmngAU4AxasF3h454ehpF3UIJJVbTNHN1GpFJakCq2+1NYZhmQm1fc9eYlvSKLjjCXfV
	tLhZeh0LbzeYb8xfYau6bxvKkxk90SsZMjij7hfjjUNvKj2UmXZPHdCNiLC3aLJ1kM97
	7HbvI+aZkOWXu/2PiiUYIRyF5pK8s7ZXGF22L668ASiEXznUcSjDkKtiDanUb6ztC/Ts
	2cvFXd2Fylvtd8vU5yXAsNJtYDFI0WRt+7Y5DRJgWWo+FHN8lFdSUw1farayI4bswRm7
	rcew==
X-Gm-Message-State: AOUpUlGhxh118+jmRUClzdPLJPKFCgyRfOzX/K8f5zFc8Lh7WaaeH8ui
	APNGQtEdGZrFL9TLzp+Icj1KE0kx
X-Google-Smtp-Source: AA+uWPyCOMy4VtrvHr8YNOkEIdtFJ1U45uUKAI2U2iwFRiMTwSN1eEpWup0t3zBRmJXXDiOkhZT8Lw==
X-Received: by 2002:a02:8b7c:: with SMTP id
	w57-v6mr10758869jak.123.1534904941160; 
	Tue, 21 Aug 2018 19:29:01 -0700 (PDT)
Received: from farscape.garmin.com ([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm174631ioe.61.2018.08.21.19.29.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 19:29:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 21:28:52 -0500
Message-Id: <20180822022852.8270-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180822022134.7947-1-JPEWhacker@gmail.com>
References: <20180822022134.7947-1-JPEWhacker@gmail.com>
Subject: [PATCH v4] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Wed, 22 Aug 2018 02:29:00 -0000

Replaces usage of the deprecated oe.utils.getstatusoutput() with Python
subprocess calls.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2f573..323ba051ae0 100644
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
+    subprocess.check_output([objcopy, '--only-keep-debug', file, debugfile], stderr=subprocess.STDOUT)
 
     # Set the debuglink to have the view of the file path on the target
-    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    subprocess.check_output([objcopy, '--add-gnu-debuglink', debugfile, file], stderr=subprocess.STDOUT)
 
     if newmode:
         os.chmod(file, origmode)
-- 
2.17.1


