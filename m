Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9100.1794059716040314899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 05:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jw80Qnij;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 577E94E41498
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F4665FFBC
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C4CE103288D3;
	Sat,  7 Nov 2026 14:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794059713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1QTREY2BMV1oATkahfW2cVphfABkFFeZcBzODcU3Or8=;
	b=jw80QnijrOpzk9y0ScpirIGAPJIiWptiwTTL+7frVP+CgeuNU78b9Eb+W1c1f+DIOjIW7Z
	ERDo0YYdQInXz27bwr/5QWKStbnYNkopERfNhjRaUhfaLnVAChAf3rZ6Owg7u1etBGAw5w
	BqjGWtiIPl67D7OEbg2xBYP8b7yWei+oAPmKA+kK9qXCGKKUmOgdCfMMsJKir7zChqHb56
	BsC/iptrHX6wcgHGETGPiDAoyzLe64PVMfgyaGOxpJEj+FMkzEKMW2Fq9+Iwd+iN4g19AH
	f+nmheRhF+gX4HjdyS+slyHCT2yQ2qGvgX+54cWtSbjk681xzIEHiTpVz4Voyg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 07 Nov 2026 14:54:54 +0100
Subject: [PATCH 2/3] runqemu: Also remove file when copy failed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-mathieu-master-next-b16487-v1-2-2fe0e7b9b1fb@bootlin.com>
References: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
In-Reply-To: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794059710; l=1501;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BPuHMMrKn1BjEn8UmUXCzbk4wJXeae+7z3TREkiEnOs=;
 b=ZrmEixkPkl4naRBllQLUyAACYQc6pdPqZpeJwq/3oWnGygTsxZwGVo30ngyiPYsI8eo4PnWgf
 7lArVwoB/x7BCG9msz/26/Eb3iiqma1+7gVXZpdYTbIxDxmAToUA2SP
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 13:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249741

Failed copy might still result in a file created, either with a size of
0 or with incomplete data. Make sure to remove this file.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6e757d375386..c9f6481cd11e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1314,12 +1314,12 @@ to your build configuration.
             newrootfs = os.path.join(tmpfsdir, os.path.basename(self.rootfs)) + "." + str(os.getpid())
             logger.info("Copying rootfs to %s" % newrootfs)
             copy_start = time.time()
+            self.cleanup_files.append(newrootfs)
             shutil.copyfile(self.rootfs, newrootfs)
             logger.info("Copy done in %s seconds" % (time.time() - copy_start))
             self.rootfs = newrootfs
             # Don't need a second copy now!
             self.snapshot = False
-            self.cleanup_files.append(newrootfs)
 
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
@@ -1712,7 +1712,7 @@ to your build configuration.
                 logger.info('Removing %s' % ent)
                 if os.path.isfile(ent):
                     os.remove(ent)
-                else:
+                elif os.path.exists(ent):
                     shutil.rmtree(ent)
 
         # Deliberately ignore the return code of 'tput smam'.

-- 
2.47.3

