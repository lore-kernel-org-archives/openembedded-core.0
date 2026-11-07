Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9099.1794059715880269056
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 05:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aPfcLDgA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC1454E41480
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC5155FFBC
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF72F103292D4;
	Sat,  7 Nov 2026 14:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794059713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m9ZIFvPysgFXK+gkeg/fUupkUrao3ekzvVGdKC8zNSo=;
	b=aPfcLDgApcBFYkW+pDpabX+/qgvuZJVW2Dew9MzFs65UZvPUkWZNDFetWbCa+Sw85dOxbd
	Ll7TBEkNBrSvo0XovfUpd8ZSS5I1RMcLsCuIQt9KkCIiV15ahM+m2KF1GHmQhRdMoTXpO/
	zfX4uSaktMciuRxHWRgpZHFO5uFl44eEmU4h0zTcUWbWDI5/DaDfaDfNszFoxChTtMBngZ
	4HQkCgiSBEwoQndWo+0LBOzrdznEy5mdKfU75HVG0NCFenzvgYMtT9xkVNeO0TrT8dVLE/
	yP/P0RKsiNFET9t6ZPC+nmoBTxcfbMr1eA9AQbZAF0pdpM9GKKMSCY+bZBASeg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 07 Nov 2026 14:54:53 +0100
Subject: [PATCH 1/3] oeqa: qemurunner: Increase verbosity of SIGKILL log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-mathieu-master-next-b16487-v1-1-2fe0e7b9b1fb@bootlin.com>
References: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
In-Reply-To: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794059710; l=1039;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=a/y0aGZjJrpYwgISpzGPdFQIBlVrwHtLLsugdx/C4Mo=;
 b=JTsNwMvHuA2Uw8syKXASbPJdLQFKuQ8pIHQcEta0SO/SpC6D7TZvWIKAEc72VtiJ21wFxTZtw
 FiIrtSUmI1QBpq/OLciHIA6keFtuo1XejrhoXqAjppMPXpNAfaHnxUr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 13:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249742

Knowing that runqemu was killed is a useful information: it should
appear in log files.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1a83c01ea8f6..dada31661872 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -575,7 +575,7 @@ class QemuRunner:
                 if errs:
                     self.logger.info("Stderr from runqemu:\n%s", errs.decode("utf-8"))
             except subprocess.TimeoutExpired:
-                self.logger.debug("Sending SIGKILL to runqemu")
+                self.logger.info("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             if not self.runqemu.stdout.closed:
                 self.logger.info("Output from runqemu:\n%s" % getOutput(self.runqemu.stdout))

-- 
2.47.3

