Return-Path: <geoffhp@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAA160102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 16:31:32 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s5-v6so4685664pfj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Jptjf/7SIC6Lnlw+YvhhoGiXkNuT2EaWQDy6BvOIyI=;
	b=YfonJDJr6Hnb4mARW+hsYhgrZYV103ulyKuTZAlw6rtUlt1rpGoEQj9y8IKzgfUbLx
	LQxV7HI7N6Gvs/T27NgBn7/gul1v9MYKrOhCXNHRiO23CKQtYRiYbkf4WuC3toOfuWmo
	BMBNxC8v1w2yDS7qZrNetrCq6PW/ZZ4jIiaxAs3CuDNAT749TUlu84I2gXArlqOAH7m7
	u+Q3amfCdT5xMVbzhQ7ZydEYY/6x1bB3MRDFg3mk0RFzulT5tFg9Xg+mmGp84H79n0o3
	a1h/Ff5L3S7S1xjAebAJQ9NL1f3zs9kxy4/bvUMU0a61jR7zJ84qzz/ZlIkUlRtG7mJd
	YIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Jptjf/7SIC6Lnlw+YvhhoGiXkNuT2EaWQDy6BvOIyI=;
	b=OSK1mnXkRIbsBDePAPBhgUCxa/y6ax+/JZ7DdDrl5e8CeCDCKoEPY89u3i5y/WinVL
	ddTZcaWB0HQgC27xlaAxhNXkSpeuH4BQEIE+TBST43R6fo8iZ5fqHLI4ctDbqoPLjqMJ
	XEcPRsPREqHrk8AYFRJ1qJPyvXL73ol/JtIouJE7F1PhcYwckxDzfhzLRbGF2ac+Xqe1
	4jUMvdlJ5xS7M2avtkqNT5ioL+LMqkKABjZR21jQdpEBQU6aJ/DmzJE4wuXLps7SYS7J
	QPR43uDkjUJlQdr4iuHy4A1mh4FR4ARetTD4MSQl0wIfFbgONiWBbtLKxc34D7JOtbA0
	vuKg==
X-Gm-Message-State: ABuFfohIJv/GrqEYXK4B167iaIp6dgjzRSCMrpOarEOcl31xB0eLodcr
	bGdv+b/vRxQBDap9j8KFzgyj2liP
X-Google-Smtp-Source: ACcGV63lpKouNaH6P5cMlOcxTFkVMXOuwMZRG8lDhseDAVeqQlshETAqRKutqaSMf0AhNv5msdXaMQ==
X-Received: by 2002:a62:41d6:: with SMTP id
	g83-v6mr2265475pfd.44.1539275492851; 
	Thu, 11 Oct 2018 09:31:32 -0700 (PDT)
Received: from mosfet.lan ([2605:e000:1417:4457::493])
	by smtp.gmail.com with ESMTPSA id
	s80-v6sm39253874pfa.114.2018.10.11.09.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 09:31:31 -0700 (PDT)
From: geoffhp@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 09:31:26 -0700
Message-Id: <20181011163126.10434-1-geoffhp@gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2018 16:31:32 -0000
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


