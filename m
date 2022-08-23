Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33B1C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:55:48 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.5299.1661298945179683076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=VGc+CThX;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6846832007BE;
	Tue, 23 Aug 2022 19:55:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 23 Aug 2022 19:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661298943; x=1661385343; bh=GFOEA58oxlCs50qAZkzVb+1Ot
	PdxY1eT4ghGCgJ0VKo=; b=VGc+CThX1Li55RYiSTMGR4pB4e9s5B3AlBLJZbB9a
	NpAwbpM7FPhYB1wRSLy+vSzbMixCHAMSSaHkpVMcw7I2ttyi11Z3pt1bbVBiLNQz
	cdB62f9sKvrvPiibM1wSM6/m53WQPm2iuLM1oFW+cCxFxPvi5ybo9JzWpL79PhVP
	it7jh9tbfzXzZazzC3tnbFoFGMB7KG87wtWefRycVUFDkYpa2PLDraXF+W0jMNqG
	aqSCbC9n6fwKwFqwhEe6+WuJqvn6OJ/kptiXE3fXq0HsiA0ign1sjfNnl+VDw+ed
	MAdS85osFeL8pakz7FtVvb6wX/ZqSu54Hwz7dvUXLlGWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661298943; x=1661385343; bh=GFOEA58oxlCs50qAZkzVb+1OtPdxY1eT4gh
	GCgJ0VKo=; b=O6M49xtbCTjiR93kD2wZCMMj5EzN1x90EcT5jfSrMFb5YM4s0Qn
	Z3zq3meTGh2JYelLSBV6Ij5eCekWR7in/ci/N4XajbpeMAbc2G+k0yQhMm3iXRUg
	sLsHbgLCMluoyA3GCgc3/A/vGscnT+3lqPZV/hNnbFSVvh2u28jPJH4VMhSILRGk
	mW54FELho33yo9jO1QvMtyCVlIFdgZh+APQagJdahqeufSdc1xKKif5HrmRT2Fq4
	0M52QN0EIVmFk31LoNGNuVb2ekUfQ0xHRWEiN7HU8ayiTl6Yuo2GBNvupvP/4R7u
	PIwkgyrRlg29DHGJxWAJySkrtnWvZ4T591A==
X-ME-Sender: <xms:_mgFY9iaL2FfP6olNAIfE-8mfZMezYNwjGsFrfs5YLitbA6TF8grmw>
    <xme:_mgFYyAaeX1Qk8tbOJvJqhnP-JnM8ZaAXXZ91nCZRP9ZfcnMr5XL33N8MdqxKdehq
    wIl38Caz4v2aIfqMcQ>
X-ME-Received: 
 <xmr:_mgFY9E36QZ9Xr6m_vXiok5Nlt8QenDHpT2lfMU-_Y38ygaOj6v0g7XAs3nTK1nviSOeJJ_q9PEa6AyC00MvbEl0xAVEGzB0ku-CIPgfKwaPinUULjbVj6Nn>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:_mgFYyT2AXFM-Wf3XuDE80No9vYrQt354-D9iF8jjJhK123aBZAhoQ>
    <xmx:_mgFY6zpbT4NYA0g3h4wun8mgdonC388Zy1wtlN_gWbFd5LpO-X6xA>
    <xmx:_mgFY46iM2iU8kgcI9nTQiKgytgTCrAlyZusrGp0Si6ZtHe_V5amiw>
    <xmx:_2gFY_ohrNNSfTBNa_H2LTyFbd2JjmOPmfzl4yIe9wubYBVTzoNkVg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 19:55:42 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 2/6] rootfspostcommands.py: Restructure sort_passwd and
 related functions
Date: Wed, 24 Aug 2022 01:55:26 +0200
Message-Id: <20220823235530.2487410-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169763

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This change proposes a restructure of the functions in
rootfspostcommandstests.py to clarify the purpose of each function and
also, make it scalable for other use cases (for example adding support
for removing subid backup files).

The main function of interest here is 'tidy_shadowutils_files' which
brings in the functionality of the old 'sort_passwd' making it clear
that it doesn't only sort the passwd file:
- delete backup files
- it sorts passwd, group and the associated shadow files

The other functions are also renamed for consistency and clarity and
more documentation was added.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/lib/rootfspostcommands.py | 60 ++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
index b5a51295e2..e344ae2efc 100644
--- a/meta/lib/rootfspostcommands.py
+++ b/meta/lib/rootfspostcommands.py
@@ -6,13 +6,14 @@
 
 import os
 
-def sort_file(filename, mapping):
+def sort_shadowutils_file(filename, mapping):
     """
     Sorts a passwd or group file based on the numeric ID in the third column.
     If a mapping is given, the name from the first column is mapped via that
     dictionary instead (necessary for /etc/shadow and /etc/gshadow). If not,
     a new mapping is created on the fly and returned.
     """
+
     new_mapping = {}
     with open(filename, 'rb+') as f:
         lines = f.readlines()
@@ -33,30 +34,55 @@ def sort_file(filename, mapping):
         # We overwrite the entire file, i.e. no truncate() necessary.
         f.seek(0)
         f.write(b''.join(lines))
+
     return new_mapping
 
-def remove_backup(filename):
+def sort_shadowutils_files(sysconfdir):
     """
-    Removes the backup file for files like /etc/passwd.
+    Sorts shadow-utils 'passwd' and 'group' files in a rootfs' /etc directory
+    by ID.
     """
-    backup_filename = filename + '-'
-    if os.path.exists(backup_filename):
-        os.unlink(backup_filename)
 
-def sort_passwd(sysconfdir):
-    """
-    Sorts passwd and group files in a rootfs /etc directory by ID.
-    Backup files are sometimes are inconsistent and then cannot be
-    sorted (YOCTO #11043), and more importantly, are not needed in
-    the initial rootfs, so they get deleted.
-    """
     for main, shadow in (('passwd', 'shadow'),
                          ('group', 'gshadow')):
         filename = os.path.join(sysconfdir, main)
-        remove_backup(filename)
         if os.path.exists(filename):
-            mapping = sort_file(filename, None)
+            mapping = sort_shadowutils_file(filename, None)
             filename = os.path.join(sysconfdir, shadow)
-            remove_backup(filename)
             if os.path.exists(filename):
-                 sort_file(filename, mapping)
+                 sort_shadowutils_file(filename, mapping)
+
+def remove_shadowutils_backup_file(filename):
+    """
+    Remove shadow-utils backup file for files like /etc/passwd.
+    """
+
+    backup_filename = filename + '-'
+    if os.path.exists(backup_filename):
+        os.unlink(backup_filename)
+
+def remove_shadowutils_backup_files(sysconfdir):
+    """
+    Remove shadow-utils backup files in a rootfs /etc directory. They are not
+    needed in the initial root filesystem and sorting them can be inconsistent
+    (YOCTO #11043).
+    """
+
+    for filename in (
+            'group',
+            'gshadow',
+            'passwd',
+            'shadow',
+        ):
+        filepath = os.path.join(sysconfdir, filename)
+        remove_shadowutils_backup_file(filepath)
+
+def tidy_shadowutils_files(sysconfdir):
+    """
+    Tidy up shadow-utils files.
+    """
+
+    remove_shadowutils_backup_files(sysconfdir)
+    sort_shadowutils_files(sysconfdir)
+
+    return True
-- 
2.25.1


