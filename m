Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 526B37D5BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:00:08 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p10so9401365wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mSRLz6ijc7TjxFAwnTC1b2BHaKIKz1j6Ppklbr1RzeM=;
	b=qpVjmtdA9jVx75Ztb/OzyhNuAjFJr1sAxz7TPiu4VQCEVbP4QTlf5w7qNP4C1M5skn
	csz4rMDqC1MeuottmNhJiNphkfit1JNLisn26SYCCQzP+M1d9vqNxjrV8Lb79UkTkor2
	t/t63SzmQFGO9fSr1gy5qpW99A5a+qT5iOx3Yrh0QdcpIk0vqRUWl8Gv0WkbrOo8R0S3
	ojiaVFcZLwsCGijjwSGO0a7/elZCY3SBmoR3p0RhPedKxZwEjACnZDHkkOQsaYixPlQU
	Canyvp8be6QvvU6REeJjHWGPqrMv3JsT4gLPxCw0f+mLIiN9dAmwoIvjdgjB5NLEoVnB
	MC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mSRLz6ijc7TjxFAwnTC1b2BHaKIKz1j6Ppklbr1RzeM=;
	b=PMktE1u1x2gqZ65SUKTZM3tMjkXsYINhOth341CnvvdcoeXGL8eeV9LGuPd5GyylGJ
	PgEZlfAh/JIW8xnVqvM1pINThMaLg+5zlg3tTH2EG2I7oRWTdy5WHSKV8Fdowf2EwYV6
	2YmS6xAdKX83t3U28wg3H6+Q+RdisK/MEK1T3pvaRkrAMFh9dwUdjwmm8u6O8Shc+MaM
	XZWGuVQhDWpgqDCwKea1GOWEF8XcK7KtNyc44NfR0pUMes8iRxSDFaKFgRBw4dQFSwEl
	HBrS8CiwHfaEE8N5Y2FNSWwm5xghrpUB2SI2pjwER94NKLHhglYbLjoNl9TORcV5n6Ay
	9zBQ==
X-Gm-Message-State: APjAAAWQA7VHNTyvMevNYMedivBlg/kwFA7ihQD1vRfnM+OiBvlcSd3+
	BqxirHuOqFue18AGN1e9dBE7+nD1WtA=
X-Google-Smtp-Source: APXvYqwO225HiBOtA3QQU87jP1McmblhXWBzu66wAQ9MDKiC67UuZiiZxg26uN5rTkzXAL6iRSb+CQ==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr9995224wrp.268.1554494408737; 
	Fri, 05 Apr 2019 13:00:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r9sm20269665wrv.82.2019.04.05.13.00.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 13:00:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2019 21:00:05 +0100
Message-Id: <20190405200005.29748-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sanity: clarify error message if TMPDIR moves
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
X-List-Received-Date: Fri, 05 Apr 2019 20:00:08 -0000

If TMPDIR is moved the error message says "move it back or rebuild" but the
obvious rebuild method of running 'bitbake [recipe]] -cclean' fails with the
same error.

Make it clear what we mean by adding "delete and".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cab09214014..4cbb1f3a61f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -876,7 +876,7 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "r") as f:
             saved_tmpdir = f.read().strip()
             if (saved_tmpdir != tmpdir):
-                status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir)
+                status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or delete it and rebuild\n" % saved_tmpdir)
     else:
         bb.utils.mkdirhier(tmpdir)
         # Remove setuid, setgid and sticky bits from TMPDIR
-- 
2.11.0


