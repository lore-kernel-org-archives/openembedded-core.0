Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACD478D43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 01:42:11 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id z8-v6so8351694pgu.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6wNI5jW71tkRMqp6jpicWX3u7KOn+ARiPhq9CrWtybQ=;
	b=JXWKd9DBRVjw5nYM5tiyFA8M7gZ0LtFV00ho+SPQt9UI/2V21pfx6YKnH7Q6Hofpix
	5di89KypGp3qYtMdwq7HMePF95FWKYT1ypVQ095GfgqJ2zoBBTdhk4rAm95wg4UJLTFn
	SqlA+1grBIMQex/sgGIBnsAmULruzyF2PZmgEMz2Kxvget8PeJml8Pa+osB/A1HNcgHa
	AI6wdVWgtIqq7n8bSaWLuHk+Y6+sCW7z6GdRWljyu9z//wsvei48ZUOfgOHwkdAmOLJm
	EL8rnzd8VzXK6B3evR84q2nl3D1TisEi+ERPa5EI66xKsoEBWOUO6aTbXjCqO2prM3lS
	sdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6wNI5jW71tkRMqp6jpicWX3u7KOn+ARiPhq9CrWtybQ=;
	b=lBJmqS6GnzOh4Nh+2UqIZIk/YR59vzs4sKLVtc9ibTKvXYTd1/JKD3zOBbuGdeOux+
	EwzUz04/+bISuqOBrg9ll1lW+Q6M+ytdVFyFuGIzSo4sX9Sck2xIWuu5w7PH7z87fpIs
	6aB3ELcJkW3FdCiCjK6i+x3S71JBoeCuG3xKm3aVdYYJYO2cu08TzjOFUY6M5nglvEGC
	8M7CUp2zlZZI1Lk+wQ2VAS38fXU69nMr1TKro1n5Na6kyhUGGPCTNLtYBUFGFWnKagPs
	rqN6Wf92d2jX0XbBEwdlSnZkB24RDAdeoeLOkCmjQ5MNc8enbo73do4t6u6X9tCLfvfe
	YNTA==
X-Gm-Message-State: AOUpUlEA6qEY9A606BO/YQgqzgGzr/OlqL4Zhz5ddrWrci+iPR+DY2/V
	Ui3qfOi/nxyGJQgD6jGg9vp4UAaKgbE=
X-Google-Smtp-Source: AA+uWPyOVU2nCd4pey4WXy4F2ATGaKzPIz/QSWrEtb+IlqaaJ6oI15EDkEYFXeWNJHCMxPofUFOUJw==
X-Received: by 2002:a63:cd02:: with SMTP id
	i2-v6mr18766471pgg.93.1534210932971; 
	Mon, 13 Aug 2018 18:42:12 -0700 (PDT)
Received: from localhost.localdomain ([157.49.93.228])
	by smtp.gmail.com with ESMTPSA id
	75-v6sm32337836pfr.115.2018.08.13.18.42.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Aug 2018 18:42:12 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 07:12:02 +0530
Message-Id: <1534210922-3414-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH resend v2] runqemu: exit gracefully with an error message if qemu system is not evaluated
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
X-List-Received-Date: Tue, 14 Aug 2018 01:42:12 -0000

It solves below error:
-- snip --
return 'qemu-system-%s' % qbsys
UnboundLocalError: local variable 'qbsys' referenced before assignment
-- snip --

[Yocto 12846]

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index f52b9a8..409d17c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1118,6 +1118,11 @@ class BaseConfig(object):
             qbsys = 'riscv64'
         elif mach == 'qemuriscv32':
             qbsys = 'riscv32'
+        else:
+            logger.error("Unable to determine QEMU PC System emulator for %s machine." % mach)
+            logger.error("As %s is not among valid QEMU machines such as," % mach)
+            logger.error("qemux86-64, qemux86, qemuarm64, qemuarm, qemumips64, qemumips64el, qemumipsel, qemumips, qemuppc")
+            raise RunQemuError("Set qb_system_name with suitable QEMU PC System emulator in .*qemuboot.conf.")
 
         return 'qemu-system-%s' % qbsys
 
-- 
1.8.3.1


