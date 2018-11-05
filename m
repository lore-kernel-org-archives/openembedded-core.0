Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E36A79EB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 11:23:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y3-v6so8760698wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=To426eYdVOSKVMGcHF4fjf9WpjptKaN+e5vD9mifpMc=;
	b=sCHDDDlLyv38BQMQy9F/tznVohr50i6aNnCH/CPLWWLmOond7KGNGCaYM0mbQ+4p3E
	WgKuyIO+RZwRtOyRj7f3xmZghUfbmP+dkqw27ZGFLyhkh6GrAiLMVPEHHF0W2H/Cfc0K
	dZpoVJAG8/nwAyK3IuZk4w/aodmaOQpY+RQgH4S2Ob11eAvCMxWT6qHNx6GaWdJWdzSL
	j/Sctc1Ej7UC5/14WxBEqSOFooSGBV1yhq2iCJoZd/wRNNMJh8xn21YW3Ql9vXQI60j8
	mh4AB+Ok6FL/EyXaYQHKb/d6810il0WJriGC7cVxo+4/d4VG2+aPozFAvKZWqlXQCuEj
	Y0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=To426eYdVOSKVMGcHF4fjf9WpjptKaN+e5vD9mifpMc=;
	b=k3XC3LlbfMb9GGfjLveAcwul/mn9yOVMo2PjJGWGKUo00vZ0bRxX9h8kKW67BXnVPa
	AFmeu64jfBXDsHDkq4WooNAHrucFl16op+9k7h9d27iYajlOWpvlLZkIie01ahTPBFIf
	c5lrFcOdjr8URKCNSmNH61aWTGmYJSHDzTlF7IBxiJPHLAED1GFhlsnpq5yH+o2TjpSS
	rCA++UX1/NRcJl5+E2TD561K60pt4ie7DamokQIKRuyQPY4JVMKU3zdocjzoqTZlvuQ3
	d0KpoTLxyu49jcR1ckfEMOGiTKvaYjbyj6xs5RtJKEt1iqfS5S1EF0r+vmfZ/V+I5Rw2
	Q3oA==
X-Gm-Message-State: AGRZ1gJOb61WiF+ekZwoS9T/4b8Ayhd9NUKbRlMaLzXJDmD+6bqjWJ11
	1k7+J/vm/onHfq1xXm8tnHQRgoG4pLo=
X-Google-Smtp-Source: AJdET5crHcO0kAH+vyVbEJ9hpqhAbcNmazZBHaJYgv0q7ehQlep6MusmNPnSUT8H0zlRxULaY8YwPA==
X-Received: by 2002:a5d:4a91:: with SMTP id
	o17-v6mr6225218wrq.132.1541416985808; 
	Mon, 05 Nov 2018 03:23:05 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	125-v6sm33352869wmy.32.2018.11.05.03.23.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 03:23:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 11:23:03 +0000
Message-Id: <20181105112303.9212-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] wic: use explicit errno import
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
X-List-Received-Date: Mon, 05 Nov 2018 11:23:05 -0000

os.errno doesn't work in Python 3.7 and shouldn't have ever worked, so use
import errno explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/wic/filemap.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index a72fa09ef55..abbf958b8c8 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -22,6 +22,7 @@ and returns an instance of the class.
 #   * Too many instance attributes (R0902)
 # pylint: disable=R0902
 
+import errno
 import os
 import struct
 import array
@@ -189,9 +190,9 @@ def _lseek(file_obj, offset, whence):
     except OSError as err:
         # The 'lseek' system call returns the ENXIO if there is no data or
         # hole starting from the specified offset.
-        if err.errno == os.errno.ENXIO:
+        if err.errno == errno.ENXIO:
             return -1
-        elif err.errno == os.errno.EINVAL:
+        elif err.errno == errno.EINVAL:
             raise ErrorNotSupp("the kernel or file-system does not support "
                                "\"SEEK_HOLE\" and \"SEEK_DATA\"")
         else:
@@ -394,12 +395,12 @@ class FilemapFiemap(_FilemapBase):
         except IOError as err:
             # Note, the FIEMAP ioctl is supported by the Linux kernel starting
             # from version 2.6.28 (year 2008).
-            if err.errno == os.errno.EOPNOTSUPP:
+            if err.errno == errno.EOPNOTSUPP:
                 errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
                          "by the file-system"
                 self._log.debug(errstr)
                 raise ErrorNotSupp(errstr)
-            if err.errno == os.errno.ENOTTY:
+            if err.errno == errno.ENOTTY:
                 errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
                          "by the kernel"
                 self._log.debug(errstr)
-- 
2.11.0


