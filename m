Return-Path: <geoffhp@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA04F60237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 05:16:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f26-v6so3764618pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 22:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Jptjf/7SIC6Lnlw+YvhhoGiXkNuT2EaWQDy6BvOIyI=;
	b=hDjvjCv+Phq6LkuUTihxZbXliewfWIs4n27RUSOgF1ifqXPc58be3XJhdtc8yPPPSj
	YXPf2zIg637VUoF5v/EfFN+queK2+1QAjjtsDu8wDX3GFyLQlBZxkk7JXoOhis2epGjS
	+tb/K+m158aKW5ko3dDZJsD8+f5orJ0RCkcJdXNlw9ohaAFXJ0f86HZ/tE/L40uMrpNg
	comfbsFzqLYylW+e+uo9Gu52UVb2KfBiBApJpt3qfaxoc2Nm3jfBh5G6jdHpwda+QRkG
	btWqw235gOvICeSqonOjlJY52/KAA4YZXM9KuaQamhW4GzhKOncj66UCXbnHh/lq96TR
	5yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Jptjf/7SIC6Lnlw+YvhhoGiXkNuT2EaWQDy6BvOIyI=;
	b=FB/TPguiL0ZKcNnyfqmqCj6nTUCoMez5OWdQYd0HDoSXRyY/nODJHlqct9TWeTYLk8
	40v+RK9yF/7gfCFlyi2HYfK93+f58FaBg0PefFLtnmCqesZgRIDaSIyXAu0AXANQxB4J
	JHqdJTfx/CtHtTpFAB5R/aHeXHIxY9RKVCUjEivnB/Ll3J1Lbc81X1/aZWNaTNgRsfZb
	lKP6JGf/bAY6QIzS5MJMaXevSnef06xQU8VVBZSUgMBPNWtHM46tTcYrv9eAgINnG+9F
	dooxtKi+g5JEi4ytL54vjT0CcI6gA/Jrx3VepMnn3P2d+jbtK9Y95MncrIkWY+41IbVo
	o6VA==
X-Gm-Message-State: ABuFfoh0IhQDkn6VZBba2iBmsErMs85L0848sy6xZCeCcwRcdnovRxYn
	XmEHwvcI/CSn6YrCYe8WLpx8hGcs
X-Google-Smtp-Source: ACcGV62Gywyw4UuFijMRnRxKbxHAwqHXtckY8TTCUrrqBlIZvqyxrkk1muPsRm71tB5SqMutqUtN6A==
X-Received: by 2002:a63:cb51:: with SMTP id m17-v6mr73623pgi.105.1539234995259;
	Wed, 10 Oct 2018 22:16:35 -0700 (PDT)
Received: from mosfet.lan ([2605:e000:1417:4457::493])
	by smtp.gmail.com with ESMTPSA id
	x23-v6sm27077006pfm.113.2018.10.10.22.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 22:16:34 -0700 (PDT)
From: geoffhp@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 22:16:29 -0700
Message-Id: <20181011051629.7750-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH v2] wic: make engine.py:get_partitions() resilient to parted/dmidecode stderr output
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
X-List-Received-Date: Thu, 11 Oct 2018 05:16:35 -0000
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffhp@gmail.com>

Running wic commands on Debian 10 systems fail in
scripts/lib/wic/engine.py:get_partitions() due to new stderr output captured
when trying to parse the output from /sbin/parted as a non-root user.

The parted command calls the dmidecode utility, which produces this error
as a non-root user:
    /sys/firmware/dmi/tables/smbios_entry_point: Permission denied
    /dev/mem: Permission denied

scripts/lib/wic/engine.py:get_partitions() calls misc.py:exec_cmd(),
a subprocess wrapper which returns a combined stderr and sdtdout.
These messages to stderr confuse the partition table parser in
get_partitions().

This patch has the partition table parser ignore lines before the expected
"BYT;" header string.

Running wic in Debian 9 does not have this issue.

Signed-off-by: Geoff Parker <geoffhp@gmail.com>
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index e6c830ce78..4662c665c0 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -266,10 +266,15 @@ class Disk:
             out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
             parttype = namedtuple("Part", "pnum start end size fstype")
             splitted = out.splitlines()
-            lsector_size, psector_size, self._ptable_format = splitted[1].split(":")[3:6]
+            # skip over possible errors in exec_cmd output
+            try:
+                idx =splitted.index("BYT;")
+            except ValueError:
+                raise WicError("Error getting partition information from %s" % (self.parted))
+            lsector_size, psector_size, self._ptable_format = splitted[idx + 1].split(":")[3:6]
             self._lsector_size = int(lsector_size)
             self._psector_size = int(psector_size)
-            for line in splitted[2:]:
+            for line in splitted[idx + 2:]:
                 pnum, start, end, size, fstype = line.split(':')[:5]
                 partition = parttype(int(pnum), int(start[:-1]), int(end[:-1]),
                                      int(size[:-1]), fstype)
-- 
2.19.1


