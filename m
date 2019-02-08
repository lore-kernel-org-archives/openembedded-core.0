Return-Path: <leobsd@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB8FF7C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 16:35:37 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a14so1904724plm.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 08:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iZA02skgNTQqhm18oH6Acr0e6VeDWWEHlcC82xsXXGQ=;
	b=hxndV5+WHRm+6SVw0LSRN6QtIQKwk70p2N38AvXvUEqVe2B0UCQFpS0PxW+Dg0tRSD
	bapmLlGpCwY9ClDOWHe9Z9Zxvko5bgO+nOINxW3Pk5DtQZp/HSnP10ZvdXLIBGhX/bmc
	tNixEItjHV9uQsZRWXw/ZG57+NzsKHZwauMZxepi3TXIRv1tU+wiRC4BJO3LuIABgCSN
	eQw1IttbbKviY5T68UcuN+B8m6eMdQXtchf9jRe9UfNaLk/UuZy9dyvOC+h3Rafcc0PT
	8LMEot59YkRB+D+nOuXF1/PAo+GPajogwUskFCqiAIwg0DR6EL196cRd0N/jCAMHudcy
	kfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iZA02skgNTQqhm18oH6Acr0e6VeDWWEHlcC82xsXXGQ=;
	b=DlPmB6Ay3PT5V5ua8C99LFrAuq0YZ0zZ049zRfXLAnIy1HjbPfwL7WMd+xqPbye17g
	0noWJ1zxQmdmUQQJRtPHsq4TKOdQMNUEAeqGxRrldljnfQT3AMWknkA8Ytl6FeeGSSWY
	HmXROnPD1L9FkXTqi9zXAqu3wKa0/dDyqrUMo6H/otmrrUITziZ1ZBD77sVuIKFxK8qI
	UDgculjt6RJdV2Ke+QHfAONiqBMEDvz62CTQNJRzsGVmjGjtwiCBQHEz+ACXNIVwNkfW
	3fSHhxrsxy8zCaoqQaKjocPJRVHRz+CaTiUhzyaDV5ul+nLuWqXWua6F2cyGEsQ9QIjj
	gGDA==
X-Gm-Message-State: AHQUAuZmvDtpY1zEw6PQGalSsHkR//gCQmvppdnTzNUS/jbfvAjASLHE
	iIz2y6wUP8yU39hsG7timzBmQCiZJuPjXA==
X-Google-Smtp-Source: AHgI3IZBI3Zy80gb/IC85bp0OcA6N6JhnpvRvqgb0dRSryzD2BgLKjIYsMptOFj/KR8Ad+dl5vwa6Q==
X-Received: by 2002:a17:902:9a07:: with SMTP id
	v7mr23122188plp.247.1549643738449; 
	Fri, 08 Feb 2019 08:35:38 -0800 (PST)
Received: from localhost.localdomain
	(node-1w7jr9qpx9oqtmftzk0df307j.ipv6.telus.net.
	[2001:569:790a:d400:8541:be6d:a320:e6cf])
	by smtp.gmail.com with ESMTPSA id
	w12sm2470031pgp.38.2019.02.08.08.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 08:35:37 -0800 (PST)
From: Leonardo Augusto <leobsd@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 08:35:12 -0800
Message-Id: <20190208163512.24889-1-leobsd@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Fri, 08 Feb 2019 16:35:38 -0000

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

Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4662c665c0..97f5e848cc 100644
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
2.17.1


