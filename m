Return-Path: <leobsd@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E35C6BDDC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 08:20:11 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g9so1352002plo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 00:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5gzj+faoxAH4Na25pwp0ZmNTOVHCHMQFUKQxfhAVMao=;
	b=c4y8AIInzWKWqol2a5aSB2ZA9XfYSBIbECKhGMl7YLfRqDzioIWlklIRU6uI0FdzLI
	Qko3G9JJBjwQOGxB5VCoMXvifOsY6Zti0iQlstTMGS8rCvXY68g8HFCPh/09svuQ/cnd
	5LnxGKMk/qN/zrxEv1uUYVvkXcZhElAvEYlEoqX5ax0EqFLzO0a3MGZKDpzxrKAC5nvK
	ojTL3BlT8nVOVK6pK+fwMw9fFk6V3di0wjdTmdnWIvVuiuqyP4E/4C13leZl6sbVyH5p
	/qBCpV0GwzATWuWBt+T0xMR6XUqq8mdo5aF9E4kwdTnGJGD2IqFOPcMnkZcKOhqDeI/t
	A/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5gzj+faoxAH4Na25pwp0ZmNTOVHCHMQFUKQxfhAVMao=;
	b=JnZZfO9ee2TQ6UcX4E+ixE00CeMdTJBHD4tBQ+7V8zQqa9fopyK286CYthLoMdqpFJ
	RIAmLCv8KaJ30Gyt0nfd6doqnZFBCQP2MRYBUpLFAj51rA80l4uPRsnqnC0ZIYJnGkme
	AEd/nzS9AC4+Qsw02jcxhdtEkYZlVgIVtPHiNARvIr5kTityFHu0QuydzRxeMFU5YZaL
	oBhyCKVtk66Ne7PAx4eeLAhJPOF3GhpAU+AxeJeg8TOs4KcgpIeFjurGQxJXnZsY2T5d
	AyPS47QJ13w/F69/xDUk/EOq2MJPx1Hnb1vpM0GBzlRkZFo3Pg50ka9p/0SqquWgCUrL
	QWsg==
X-Gm-Message-State: AHQUAuZhGD1S2cjdipLnn84eUyoHRafuedwiLyvBqHqHGfRdViTHs4z0
	ge68wbbzj30uikPsWqa+5+D6cJUzzTso5Q==
X-Google-Smtp-Source: AHgI3IbU1WKbZ85zpLCv4FcIVGAOmzZcLD1ng1uJCMiHGBVhLDY+8k6MAN8qdxNVDp7IBgVxiFGOgQ==
X-Received: by 2002:a17:902:a50a:: with SMTP id
	s10mr20434845plq.278.1549614012834; 
	Fri, 08 Feb 2019 00:20:12 -0800 (PST)
Received: from localhost.localdomain
	(node-1w7jr9qpx9oqtmftzk0df307j.ipv6.telus.net.
	[2001:569:790a:d400:8541:be6d:a320:e6cf])
	by smtp.gmail.com with ESMTPSA id
	125sm1677858pfg.39.2019.02.08.00.20.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 00:20:11 -0800 (PST)
From: Leonardo Augusto <leobsd@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 00:20:05 -0800
Message-Id: <20190208082005.24173-1-leobsd@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Fri, 08 Feb 2019 08:20:12 -0000

Python subprocess' shell=True defaults to /bin/sh[1][2], which
often refers to a POSIX-compliant shell. As the -e flag is
not defined in the POSIX standard[3], some shells may
interpret "-e" as the first argument to the echo command,
causing the rest of the command line to fail.

In this particular case, "echo -e 'cd {}'" is interpreted
as "-e cd {}", which causes the first line of the command
to fail, and causing cp to always place the source file
in the filesystem's root.

This issue only affects "wic cp" for ext* filesystems.

[1] https://docs.python.org/2/library/subprocess.html
[2] https://docs.python.org/3/library/subprocess.html
[3] http://pubs.opengroup.org/onlinepubs/9699919799

Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4662c665c0..b4be796752 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -331,7 +331,7 @@ class Disk:
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+            cmd = "echo 'cd {}\nwrite {} {}' | {} -w {}".\
                       format(path, src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
         else: # fat
-- 
2.17.1


