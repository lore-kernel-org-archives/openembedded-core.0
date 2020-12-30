Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.3416.1609309026662977765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Dec 2020 22:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: LEHJFbnf36VUvQC589ge9rcEfs22lN7abgADqJ8uthujAIoihADA+VF2iOl0+DEZQ1ofkLQu0H
 eTsFTI/q9jVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="195070664"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="195070664"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 22:17:05 -0800
IronPort-SDR: EubGc8kKe9dLWBghZevurv43kFIyl2LCWgvhL8X8rQoeFuN0yhHg8In1YDccQtJIMZv9+8lLDQ
 Yq5TJBqUDD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="567943928"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 29 Dec 2020 22:17:04 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/direct/ksparser: ensure fsuuid for vfat and msdos align with format
Date: Wed, 30 Dec 2020 14:17:03 +0800
Message-Id: <20201230061703.84078-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

vfat/msdos filesystem should have fsuuid in format 0xYYYYYYYY where "0x"
in front follow with 8 hexadecimal number in uppercase. In wic, when using
custom fsuuid for vfat/msdos partition in wks, it is able to set the value
in any length, with or without leading "0x". This can cause fsuuid
missaligned when fstab updates, fstab expect exactly 10 character
fsuuid for vfat/msdos partition and all in uppercase.

if custom fsuuid for vfat/msdos is set, check the length and format,
error if it exceed the format size. Amend it so it is align with format
0xYYYYYYYY. This is done before image create and fstab update to ensure the
fsuuid are same in all followup process. if custom fsuuid length less than
expected, fill in "0".

[yocto #14161]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 scripts/lib/wic/ksparser.py              | 16 ++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 913e3283dc..884c1f9f8b 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -229,6 +229,22 @@ class KickStart():
                                 err = "%s:%d: SquashFS does not support LABEL" \
                                        % (confpath, lineno)
                                 raise KickStartError(err)
+                        if parsed.fstype == 'msdos' or parsed.fstype == 'vfat':
+                            if parsed.fsuuid.upper().startswith('0X'):
+                                if len(parsed.fsuuid) > 10:
+                                    err = "%s:%d: fsuuid %s given in wks kickstart file " \
+                                          "exceeds the length limit for %s filesystem. " \
+                                          "It should be in the form of a 32 bit hexadecimal" \
+                                          "number (for example, 0xABCD1234)." \
+                                          % (confpath, lineno, parsed.fsuuid, parsed.fstype)
+                                    raise KickStartError(err)
+                            elif len(parsed.fsuuid) > 8:
+                                err = "%s:%d: fsuuid %s given in wks kickstart file " \
+                                      "exceeds the length limit for %s filesystem. " \
+                                      "It should be in the form of a 32 bit hexadecimal" \
+                                      "number (for example, 0xABCD1234)." \
+                                      % (confpath, lineno, parsed.fsuuid, parsed.fstype)
+                                raise KickStartError(err)
                         if parsed.use_label and not parsed.label:
                             err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 55db826e93..0ca67b77d5 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -343,6 +343,13 @@ class PartitionedImage():
                     part.fsuuid = '0x' + str(uuid.uuid4())[:8].upper()
                 else:
                     part.fsuuid = str(uuid.uuid4())
+            else:
+                #make sure the fsuuid for vfat/msdos align with format 0xYYYYYYYY
+                if part.fstype == 'vfat' or part.fstype == 'msdos':
+                    if part.fsuuid.upper().startswith("0X"):
+                        part.fsuuid = '0x' + part.fsuuid.upper()[2:].rjust(8,"0")
+                    else:
+                        part.fsuuid = '0x' + part.fsuuid.upper().rjust(8,"0")
 
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
-- 
2.17.1

