Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id F165A6078E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 14:01:59 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l1so5126153wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hKCRVv4szbg6O7WiKzohofphdIiNvMNm7UGtp/PP2Ds=;
	b=Ze8MQOoc434x4UnYbvi6C5i5Ahy87B8YoiJZJBWFmysJ4Lqfy3NaI2jECiwRY3pOwQ
	BJDjYiD8WDusEdWYSs+I4VQCTWJHqVJmbIbKzlh1R92x0gwkd+NxEp/OoLNgu5vQ08QW
	vQMCdOq+t1yskMsQE9lsOpRhSRt0Qlhsqpg7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hKCRVv4szbg6O7WiKzohofphdIiNvMNm7UGtp/PP2Ds=;
	b=iIUx9+fHwjtQ1ZjZos97p7ePgnP7II+yz7No67PE2Si2WBouq6196iEc66OJg2cAX7
	0l9yr/E82+kXWgxJm6E7HE9K0nOFt9P+ZWpNGFXoDr3mjWE/YE9ia+x57X32zhFe29+1
	64I/xH6AcoQFFYxxT0iKRJGoSUxVEOTRjSu5JauF7h0SXMQV5kCZQbU6g16N9ExgV9Sf
	3AwFXw7XazxQD7Mt2o+6hRedhks85nCacUuXgQyRphRD+cXkmSWXFj2Do7NJz1OQygRC
	xkS6CHGT2GQV/zA8FhqYK/W3EtK5J7ieWwfGnQJBrH5CIi0xKYW1ehTTW5Kwiwzgn/v6
	vvAQ==
X-Gm-Message-State: AMCzsaUd8bgxrocd5sanHChogh0GiC4crUDwWFdO2AJdPUNvTl44BKDB
	UP5wbh8Y9ni/LV310SBpmnfb47LALew=
X-Google-Smtp-Source: ABhQp+QAFLW1g2CwFgBSZ9b42D0P8TlsIGw0AeVKKpY6Fct2K4wyWIJkmS3SGskMarWIyNS/dWnn+A==
X-Received: by 10.223.158.129 with SMTP id a1mr2972561wrf.179.1509631320601;
	Thu, 02 Nov 2017 07:02:00 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	u57sm2537729wrf.43.2017.11.02.07.01.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Nov 2017 07:01:59 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Nov 2017 15:01:32 +0100
Message-Id: <20171102140132.2301-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Thu, 02 Nov 2017 14:02:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artur Mądrzak <artur@madrzak.eu>

The WIC's 'part' can now give a name for GPT partition in WKS file.
It's similar to '--label', but is naming partintions instead file systems.
It's required by some bootloaders to partitions have specified names.

Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/lib/wic/help.py                  |  2 ++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
 4 files changed, 15 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bd9c62e2e8..2ac45e052e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -970,6 +970,8 @@ DESCRIPTION
                             This option cannot be used with --fixed-size
                             option.
 
+         --part-name: This option is specific to wic. It specifies name for GPT partitions.
+
          --part-type: This option is specific to wic. It specifies partition
                       type GUID for GPT partitions.
                       List of partition type GUIDS can be found here:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 99b66eebc5..7850e81d2f 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -144,6 +144,7 @@ class KickStart():
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
         part.add_argument("--overhead-factor", type=overheadtype)
+        part.add_argument('--part-name')
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..66e61ba70c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -51,6 +51,7 @@ class Partition():
         self.no_table = args.no_table
         self.num = None
         self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 60317eed22..bdb8385620 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -366,6 +366,10 @@ class PartitionedImage():
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
+            if self.ptable_format == 'msdos' and part.part_name:
+                raise WicError("setting custom partition name is not " \
+                               "implemented for msdos partitions")
+
             if self.ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
@@ -519,6 +523,13 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
+            if part.part_name:
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.part_name)
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part.num, part.part_name,
+                                          self.path), self.native_sysroot)
+
             if part.part_type:
                 logger.debug("partition %d: set type UID to %s",
                              part.num, part.part_type)
-- 
2.11.0


