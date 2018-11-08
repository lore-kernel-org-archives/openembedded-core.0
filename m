Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B21D860017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 20:59:02 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r9-v6so9370057pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zyffFnPEOnfZrMC5gUwkbbZWkL9+WRXRwa3wXNDReno=;
	b=gYZfnBnis1MIpNjbXc7Jm+NtZjAg4HkpjMgjO8cIVvSp3wjne01a+g0Sxp+qxESZSJ
	Efav2H0XbIX1Ep+LFbzCOIlbLgtUZotqPO8J9ojs7e+Q88IB9q0OkIlfi4hZX/89M/SV
	Z9DlrrLh6DSMw3EFVEXQZoRUUrp+WuXn7L0Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zyffFnPEOnfZrMC5gUwkbbZWkL9+WRXRwa3wXNDReno=;
	b=Ot5/BdMQXYXS11fKhgrBuoowPKCR8p70+6RbiCd8t48H2nQgemRHD1oT25qdXSQUEP
	wfl+oMcsABw+ud5imd6ijK95+BCxNmg1N40cRxV91RKYoDH9lxOugZDlGY9vRYXcoVvY
	hRlqF2M+2iAiETitTHutm9btLrY8NZe8bQxOacY1fw9vdU9iNmMVH7RECSWU/ooPofv/
	yRXNHEo3d7qJBTk+DR8hU5ykXOKi+YwCaQCSEPqICIpQiGflNUF4Dd9cpnYa17Kqiceo
	n1dLiA4Dl3FGhZDGQcdvaDB9yB2wp6ZHhvGDePSIms1rH142ZHM8uHVetnqn+jcNaoqe
	xDVA==
X-Gm-Message-State: AGRZ1gIsiBaadWSfxBOnPCP4pv82+hsyNFkSrcCCgyc2tDzslztTs1PN
	qjDMKTfej943z1yHl5j7cnRslRBnMLUAmg==
X-Google-Smtp-Source: AJdET5cfRYh88cJvag4Xilhue3ioVGTbfvRKn8cF/MRFVlHC3W8kkcwp5s4P/qmU15Gk+lDlqcOZbg==
X-Received: by 2002:a62:198c:: with SMTP id
	134-v6mr6082693pfz.33.1541710743323; 
	Thu, 08 Nov 2018 12:59:03 -0800 (PST)
Received: from yct-lpt.pdx.yoctoproject.org (5751f4a1.skybroadband.com.
	[87.81.244.161]) by smtp.gmail.com with ESMTPSA id
	e12-v6sm4724605pff.5.2018.11.08.12.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 12:59:02 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 12:58:39 -0800
Message-Id: <20181108205840.24972-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108205840.24972-1-mhalstead@linuxfoundation.org>
References: <20181108205840.24972-1-mhalstead@linuxfoundation.org>
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH 2/3] scripts/runqemu: Replace subprocess.run() for compatibilty
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
X-List-Received-Date: Thu, 08 Nov 2018 20:59:02 -0000

subprocess.run() was introduced in Python 3.5. We currently support down to
Python 3.4 so I've replaced it with subprocess.check_call() which is available
in that version.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0c61253d6a..c79be9a846 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1321,7 +1321,7 @@ def main():
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
-            subprocess.run(["tput", "smam"])
+            subprocess.check_call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1343,7 +1343,7 @@ def main():
         return 1
     finally:
         config.cleanup()
-        subprocess.run(["tput", "smam"])
+        subprocess.check_call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.17.2


