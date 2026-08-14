Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E071BC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:49:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14756.1786718967014023497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FbaBVrA+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F8431A04E9
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F4866046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FCDE11C4EDEF;
	Fri, 14 Aug 2026 16:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786718960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G6NjlAO6xuFjdDfsV5VQ1mNnOIgf6ePFGC8uRYaiPcQ=;
	b=FbaBVrA+psJW8w0NQRp8RasJ8y1eqqK0UutCPanssJqoJu57ZUvp6Y5tTFWwHSfNjeChKM
	EH/rJBxO2tNJwz3NalgYh9h2G4UL1BiD0nYambKeE1CWbuGG6IQOwPJ/KpCGNymL/UpOks
	BhT5ndkGh1Q5i36xFWhr2Upu3QavTOQuu4kO+pxtZ2RoGbmu/f6iSMoY5+1gqa4Z5VtYqu
	zewhxAvhLd5zYu5DyVS6/8WW0Rc2je6QTWe7aQSK7yofAeTH/KACkt/8DC5XYYCUVLMxIw
	5ykoO54FTonKkKdTjDH5s0reS71YpuFKW3WBlZg9oL13dKGIJZE71sgT51BV1g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 16:48:51 +0200
Subject: [PATCH 1/2] classes/insane: improve HOME checks exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-sudo-home-v1-1-d6c8251de9f4@bootlin.com>
References: <20260814-mathieu-sudo-home-v1-0-d6c8251de9f4@bootlin.com>
In-Reply-To: <20260814-mathieu-sudo-home-v1-0-d6c8251de9f4@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786718955; l=1846;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=qyhutDYN4NNtYzxPMM4vI8Ee15Tmp6u6q5kBgINzHb4=;
 b=LDi+ld2tQFt5HvzbNOk8z1r9P8WF97/wZOpFkbj9fXTOm5Apkl2tE3ICEOJlkGu8mpiqrd+JO
 mvx/qyqmUrvBvPZm7jc0gNYRRkYXgqrfk5LXnQoR2hFMknYM6m3G9qy
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243455

Allow buildpath HOME checks exceptions to match for substrings.

E.g. if the recipe source code contains "/home/buildroot", the QA check
will also trigger when the home folder is "/home/build". So adding
"/home/buildroot" in OEQA_BUILDPATHS_SKIP should also ignore
"/home/build".

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-global/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c0868849fbe0..a4d17ccd2ad6 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -437,12 +437,13 @@ def package_qa_check_buildpaths(path, name, d, elf):
 
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
     homedir = bytes(os.environ.get('HOME', ''), encoding="utf-8")
+    buildpaths_skip = (d.getVar("OEQA_BUILDPATHS_SKIP") or "").split()
     with open(path, 'rb') as f:
         file_content = f.read()
         if tmpdir in file_content:
             path = package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name), d)
-        if homedir and homedir in file_content and not homedir.decode() in (d.getVar("OEQA_BUILDPATHS_SKIP") or "").split():
+        if homedir and homedir in file_content and not any(path.startswith(homedir.decode()) for path in buildpaths_skip):
             path = package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contains a reference to the build host HOME directory. If upstream hardcodes a directory path that matches your home, you can set OEQA_BUILDPATHS_SKIP = \"%s\" in the recipe." % (path, name, homedir.decode()), d)
 

-- 
2.47.3


