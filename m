Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB64C7D90B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g3so2869403wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J3ZCMcab4dJ0WzwUSfyKAhG7UPzcfu1eWwP5Y2Zfpbw=;
	b=RpTtcyv9xRgMjsolMIvW1R5p6x2cshui+t12QkGQtlMrsOox/qltH1zYNpidg7UC8v
	8L11+06L/3nd+/+rvVCI7XkoR9QgU+XzSOzVl6mDIpLKTPix0QM5llQKvygtN9j5hSrH
	G6AhMS6nUv+t5Zv/oLLLou6hoLtMRzVsK/SvsUc03VddEHUXV6FX+HD3GkiMMgv7UwmQ
	jCkzMxMrOHORxMclX6KFshP8YDaTIECPMD8BKUCuX1O0RZiDe3Po/nnbUTdtEN22hNlu
	CDZlfraC5NTLuh58wjCUbl1j/4dJLvvMm0dZmKFGaxrZFXWMU/WcWvIR8zahFi+p9Ith
	4McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J3ZCMcab4dJ0WzwUSfyKAhG7UPzcfu1eWwP5Y2Zfpbw=;
	b=HiWrk4d8hhbVY1UmuIdsPgtqJOW6UcucUHY9pM1Cy1r6ABfjH1ss1xIyYUkt1dgQfp
	7LxcZjPAXCwIp459TWHrNhvjWA74lhlRlV7GrKAfft8op2ZeDE37um0jmV0UJ6CyF2GD
	+6pB0VPoSDxyhKnpZMjV1Aas2MX1adN54mvlJohj6f3a04JnsCfgTRf37DO0zl43Gc1M
	IRGL7SHEWZcAV9uw0IB9VfGOpWf9NiroToRfOLHSQHry97d7XwCTvR35P6LHSJsKnFsK
	UYBD42b7PYYDKzxrjnWEbuMHfK+MOtK2/MuythBprr1t401cITazLmT4FaJUpwdpKO0O
	znuw==
X-Gm-Message-State: APjAAAWjPgyr9IyoPyWZ4Cs8HHpmtK40Gc72eYdDCet81mpxx1LC+ivN
	v5sIyVl4csfWCaRxY2F7A+Yvda6zqbY=
X-Google-Smtp-Source: APXvYqxSpLsIs4b1DCSx0NeaSzDT99KjxTXO69Cbjyl9xBMCAxfK1qvy+Yq1QHhZUZsjA+8hQLoS4g==
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr28004583wro.274.1554901951506; 
	Wed, 10 Apr 2019 06:12:31 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:44 +0530
Message-Id: <b9ccf44edccd31264890fa790d6120fc9e2c0238.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 25/33] scripts/lib/wic/engine: Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:31 -0000

From: Leonardo Augusto <leobsd@gmail.com>

Python subprocess' shell=True defaults to /bin/sh[1][2], which
often refers to a POSIX-compliant shell. As the -e flag is
not defined in the POSIX standard[3], some shells may
interpret "-e" as the first argument to the echo command,
causing the rest of the command line to fail.

In this particular case, "echo -e 'cd {}'" is interpreted
as "-e cd {}", which causes the first line of the command
to fail, and causing cp to always place the source file
in the filesystem's root.

Replacing "echo -e" for a printf command makes this
more portable.

This issue only affects "wic cp" for ext* filesystems.

[1] https://docs.python.org/2/library/subprocess.html
[2] https://docs.python.org/3/library/subprocess.html
[3] http://pubs.opengroup.org/onlinepubs/9699919799

(From OE-Core rev: 9a5b703d4e60c3ccdf80b5289b8e6fc91133fcde)

Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4eefc94..951bf30 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -331,7 +331,7 @@ class Disk:
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+            cmd = "printf 'cd {}\nwrite {} {}' | {} -w {}".\
                       format(path, src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
         else: # fat
-- 
2.7.4


