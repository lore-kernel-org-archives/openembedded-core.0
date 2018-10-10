Return-Path: <geoffhp@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0278D79A6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 18:31:51 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id q39-v6so4728336lfi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=260VsI/FIJxyEzHTjdM75oDrLu9U749ojwKnqeCkbpY=;
	b=WvNo8lsA+e/nbNVPuGdn4RrlQ/PXDvQrdN/RAqNwu8wmWMKdNkk9OztZ/XjPvCaSG+
	Gp3ZFQsGJaCS2cgtcmo/jAhNAHttoDAEYPhIDZnqYJ55u81HzNfbVq8i5MfkoM5EhxDZ
	F/YMqGtoda6j7yjlM1bTwde9W101IiKhtTNLGgnBEPwuJVX5K8YsiZ1Dvn4z+wj/YBnn
	ij6WSsJxn2Lrr9uMd6OgB8aLdn5qCQXZFlRNHWl8DcRhtlTYD+jWaQ0xe9MMHto/ipoO
	e3FhFQIfpHZymYZcWOMS2r42VL6aGLE8+4GPwvYjAAcKXMCoLucpURwM+so78BK9CTl8
	fgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=260VsI/FIJxyEzHTjdM75oDrLu9U749ojwKnqeCkbpY=;
	b=RnAwyH+bNGqm+OQb815kVagEchemMYn348KrncWd9njtsHVrqehYCzHlCVuW//WrpX
	87wJt/jXnmCJm5CALJkPM/ZTXbO11dl1DcakXeBXqVcbG+Kx7djjQrUr8to+LEJArIdV
	Avhjwj8brgwQqdfyhFvymb5wXtSJ8BpX6gjnm0aG1c/5lfR4VAHSiA4PjyFjtQQy+aCy
	ZgFO+DpHV/cicmexoVxZPVkVxVfkDvQHyea76a3WVHPifVR6eeRrQmxIGzK4eSolrCjq
	gcd2D+VB1K1mDb4Wkd3eADRF2weLNWq/X/umHpSprrezZUPJLIjs2NwNioK2kPnLfyS3
	jtmw==
X-Gm-Message-State: ABuFfogd3oKS0J87Sx6L3PnkGpo25o/5ncxEvJG9519q1wP7MdaGn3nf
	ALzwlER3VSLHoF2a7Tp7Jh+K/GwlULVnAqrD44I/PrTi
X-Google-Smtp-Source: ACcGV60Ygoole1RV19p1RfmptQ6ddi4U/2HOLKj6t5D9qvefdHPLRAxHAGtZh/sTDmEADLl3EyLELtbpHPcFp3rf2LE=
X-Received: by 2002:ac2:434d:: with SMTP id
	o13-v6mr1895124lfl.129.1539196311836; 
	Wed, 10 Oct 2018 11:31:51 -0700 (PDT)
MIME-Version: 1.0
From: Geoff Parker <geoffhp@gmail.com>
Date: Wed, 10 Oct 2018 11:31:40 -0700
Message-ID: <CAHNuFG+9Z8SHuhE51pWPZvqBG8+5N5GxAX3RBXKv+Lb+N9ukZA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: make engine.py:get_partitions() resilient to parted/dmidecode stderr output
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
X-List-Received-Date: Wed, 10 Oct 2018 18:31:52 -0000
Content-Type: text/plain; charset="UTF-8"

Running wic commands on Debian 10 systems fail in
scripts/lib/wic/engine.py:get_partitions() due to new stderr output captured
when trying to parse the output from /sbin/parted as a non-root user.

The parted command calls the dmidecode utility, which produces this error
as a non-root user:
  /sys/firmware/dmi/tables/smbios_entry_point: Permission denied
  /dev/mem: Permission denied

scripts/lib/wic/engine.py:get_partitions()
calls misc.py:exec_cmd(), a subprocess wrapper which returns a
combined stderr and sdtdout.
These messages to stderr confuse the partition table parser in get_partitions().

This patch has the partition table parser ignore lines before the
expected "BYT;"
header string.

Running wic in Debian 9 does not have this issue.
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index f0c5ff0aaf..52c9592b33 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -266,10 +266,15 @@ class Disk:
             out = exec_cmd("%s -sm %s unit B print" % (self.parted,
self.imagepath))
             parttype = namedtuple("Part", "pnum start end size fstype")
             splitted = out.splitlines()
-            lsector_size, psector_size, self._ptable_format =
splitted[1].split(":")[3:6]
+            # skip over possible errors in exec_cmd output
+            try:
+                idx =splitted.index("BYT;")
+            except ValueError:
+                raise WicError("Error getting partition information
from %s" % (self.parted))
+            lsector_size, psector_size, self._ptable_format =
splitted[idx + 1].split(":")[3:6]
             self._lsector_size = int(lsector_size)
             self._psector_size = int(psector_size)
-            for line in splitted[2:]:
+            for line in splitted[idx + 2:]:
                 pnum, start, end, size, fstype = line.split(':')[:5]
                 partition = parttype(int(pnum), int(start[:-1]), int(end[:-1]),
                                      int(size[:-1]), fstype)
-- 
2.19.1

