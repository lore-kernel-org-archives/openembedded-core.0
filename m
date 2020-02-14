Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 67B5760213
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 13:02:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id g3so10797429wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 05:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cFnDItQl2O1kPusV7uAE2u1C6q2bu2ZcfPiRbHhB7CQ=;
	b=RqsgIUb3nxCCOwwbZrkCj6bTDK5dIDcI7RFXUzC1B77GvM+qt8JpIefIkeLBvRFIf6
	TkUfzTC9Sjix10BPg25ZxxFvrEsgM9NKOGgPJE3zJbORrZpbwwmqPQbhe3NqcerzPWAz
	PWkPdvikDi/M/KbR0wUzqUriJbXtGgn6S2JFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cFnDItQl2O1kPusV7uAE2u1C6q2bu2ZcfPiRbHhB7CQ=;
	b=WJM47yss6OQuyyZe4v5F4kivcPEn9f0MR4+HLZB4VsQlMdOhjmFTfXbsXuG3CrPd9h
	EKKdobbltJKT9H1gpmaG8bZJoy3EUppPjJ6L8v30om7P7ysVqZe5a2wqpE2m7I9JGTrp
	Ma1vmKS7oFCDY7TG2pFwJTFeajKzH57JAB9NNuOwG1h3b2xOLpmsVX6PU10RIjE2eDPD
	RSB/qiyVB2cBYyzv5QefE4DUAW6SxavQpmJNP4RqSQdwZFDgQODIMxEiiXCuNNNSQDhD
	aGdTZIS8t0qtXHdDUaZ+mUe+khA6sraGC9P617zd1UEQc8gC/fcMmEYjYsZbdCbbMqLL
	vmWg==
X-Gm-Message-State: APjAAAVVZ0tYynPTnGHuom6Olnvf6jSgZReAAYwCcod+kDXp5xX3OtXz
	eeIqHaTlVAIurV7SkfX3JgK6MUdwYHA=
X-Google-Smtp-Source: APXvYqyEgP95huorgblHkH47MJ1t+Vy/pxgOErE0xNHu2j+6dxOK8cf/e8jzivgfM8DpKkKklklafQ==
X-Received: by 2002:adf:b193:: with SMTP id q19mr3984331wra.78.1581685360288; 
	Fri, 14 Feb 2020 05:02:40 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o4sm6931353wrx.25.2020.02.14.05.02.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 05:02:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 13:02:38 +0000
Message-Id: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] staging: Handle races between binaries and their libs
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
X-List-Received-Date: Fri, 14 Feb 2020 13:02:40 -0000
Content-Transfer-Encoding: 8bit

There is a long standing issue where a binary could be installed into the
sysroot before its library dependencies. We've always argued nothing should
use the binary until its been installed by a dependency but there are issues
around binaries which conflict with the host system, for example patch,
python3, gzip and more.

With the recent patch changes we've see issues like:
ERROR: gdb-cross-canadian-powerpc-8.3.1-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gdb-cross-canadian-powerpc/8.3.1-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch 0009-Change-order-of-CFLAGS.patch
patch: /lib64/libattr.so.1: version `ATTR_1.3' not found (required by patch)
Patch 0009-Change-order-of-CFLAGS.patch does not apply (enforce with -f)

which is a symptom of this issue (libattr-native is a dependency of patch-native).

There are other ways to fix this such as disabling libattr in patch, installing
patch to a subdirectory and requiring PATH manipulation and so on.

We can simply fix the staging code to handle /bin/ after everything else so lets
do that and avoid all these other complications.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 4dd2ed01010..530e23b1853 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -470,6 +470,7 @@ python extend_recipe_sysroot() {
         elif os.path.lexists(depdir + "/" + c):
             os.unlink(depdir + "/" + c)
 
+    binfiles = {}
     # Now handle installs
     for dep in configuredeps:
         c = setscenedeps[dep][0]
@@ -562,7 +563,16 @@ python extend_recipe_sysroot() {
                     if l.endswith("/"):
                         staging_copydir(l, targetdir, dest, seendirs)
                         continue
-                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)
+                    if "/bin/" in l:
+                        # defer /bin/* files until last in case they need libs
+                        binfiles[l] = (targetdir, dest)
+                    else:
+                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
+
+    # Handle deferred binfiles
+    for l in binfiles:
+        (targetdir, dest) = binfiles[l]
+        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
 
     bb.note("Installed into sysroot: %s" % str(msg_adding))
     bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))
-- 
2.20.1


