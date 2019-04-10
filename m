Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34ACF7D925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y13so2917885wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DhKN8oTNwbLo2vLF4V7c2BoTMr+cnyz+esJ7rkwoAhs=;
	b=SwlUY9o3viFkNi94amG0Tmg0MFv9HNVQafCa/uG483Y+DWY1KKmMC2tEC1elztbWWb
	F1uAeC/tHvD7VqVKn2xtf8W/K+0s1rsrDUV69SrrN3RyfULjO3U3grEjLmd5kUheYQRd
	Ne54HRwhI/2/G01m66IC/Hte69HdAYUpHmnTxZ9lsoEL8QWTH25xL57mRJvqv3R86i4l
	gGLHW4tLG/eZL8pznwoJPA0+/85aB0YyYdcvqfQZcDHApZNQr0bE4g/ka2+oqCJv5tZM
	6uVQSxiigpzJ3SpxS8dyAQAkakcSF7TDilAPMbLiGaZnqyqpa7cjj2PIEISsdlO/nyr7
	iuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DhKN8oTNwbLo2vLF4V7c2BoTMr+cnyz+esJ7rkwoAhs=;
	b=jxHsmn8TSgV3fHIl/hBnNWs1Yr6aUku2Hl229K2UIAvYTt91eSfTYZhu0DL5wqjdtp
	8N+GQfSyuESfN1lA8u/Robxq+PL9KkrBkGyjxNve2pOlwMXp3cJt9VNFlIpAGuhMhn4F
	pEhPOd7tcaSRmd5A0M814/jHGcydNxc08df+xqhcepJKcljgCS/T9A38peFQyDTlPlC9
	geepYZCqKb5hoMqV1iEPH3d4A0hLWeX2k6S4pTZ2Ml4Wssijg3AGjfXMDxMmFJN7wTdl
	WhsBS6AlPHKqep60uClV0P5Lli3A/V+bUsnhFGq/4q7vppYxkuir1pE9MhsDscXSnhQc
	TkfQ==
X-Gm-Message-State: APjAAAW4HC24pMlRDeBPCg46ElBRSA16a853X8SqwnIYmhaxZ+44r5jy
	w7tRS73aTaAkFVVAUnsX7IHzYMVpKN8=
X-Google-Smtp-Source: APXvYqxcNJcKDUECt3Mbt3O3iGYE7auFRNLZ+nA2Kh+D2z1mEfduSJz0uuOIY4vxrO+LybWsgSmA+Q==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr3015791wrj.118.1554901949673; 
	Wed, 10 Apr 2019 06:12:29 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:42 +0530
Message-Id: <6b5681533eed4e6c00e1cc7ee442c93076f1c976.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 23/33] wic: make engine.py:get_partitions() resilient to parted/dmidecode stderr output
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:29 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4996bff..4eefc94 100644
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
2.7.4


