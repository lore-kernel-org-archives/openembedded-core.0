Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7542.1628600770279666530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=OdGmPLkt;
 spf=pass (domain: qtec.com, ip: 209.85.218.48, mailfrom: daniel@qtec.com)
Received: by mail-ej1-f48.google.com with SMTP id e19so35285502ejs.9
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 06:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFOn1znmeiwvZJY5sr20w865BcnzJsZiM48zy4aFZwM=;
        b=OdGmPLktcqdMqqgPNGSnIScuI2sedmzF9ebUlabqIBguIaxv3lTQOdbifFd8CcjNh0
         gF20SpOX2I/znoAGyJq0MSfjmCZEptgd2dLc97KpmTD5Yx14QUtQXiLs55Zagieuz1ca
         IRooyPZXMeXDgC15IVTUYufkqGzcY7PoOYbraj1UyZUBl3geerqlC0eZSBgV/LOFlKW4
         eTwqRJV0k5JxdMnm4aEVglspt9BYfy7MlVrBIhEUnxTijeEt/ElVeOo+jGle4IuvJ/mb
         IsTZshptQFCd8ws7UdIchByUNU+1QS3f4xvhT0uwF/CKBLBcNyd9kQvVxGaaySMhPzQj
         ZEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFOn1znmeiwvZJY5sr20w865BcnzJsZiM48zy4aFZwM=;
        b=qySZo+BaTiA56vkpLNlmlzY1tsvHfQLw53ECLR+BHJsWzlUosSpjV7VvnQKR+B5z2M
         m3kEER8I+8jeniA4VxyO9jXsJBwmQK5qGO+EVOvw5zxtgOdOd4fvr1l2HfiHjkUncTsD
         fZWzg/rIC3+RbiaNqIA/59XWRbqp09Ba2za5pF4AsDa9NE3NN6ufpvG/gISkcGm+OdTO
         u0ChulThLty18Tkd88m/eftQqfHMepPioT4mio+8C3TV6iPxBetBsUUTNUVaU+G7SzfL
         dMKwLf+oPER9JuKoQCKEbbjphgKcigdrDQzQxruPtng+3GVYiLV66kxljvhuukHAdcLz
         dPXA==
X-Gm-Message-State: AOAM531PdR1PNKf115mgpjf0TYlyK7cTEVd0FvpZCvToVq81T7/PhUJb
	8iStWQ0YNLtQzM3yY7NNbkiGnsevJ+3hoEfJwjlCV0yJA/pjCqMHgNh7tgWEpKdoUZu3G7NEj1p
	Kxe4EvVoHJnCLqoFmCT6owTIxlWa4E282KzBfT3r0tKl/kbZ8fLE3f2BiAyBS6A9LMP4p9xsozw
	h3ZR8hSZRAGgW7n8o=
X-Google-Smtp-Source: ABdhPJw24lCV6kFPl5N19duBPYDkVeFZi1RsyCbbITxz2iuY5jMRTH9NH8etW1PTihyanHTWW530Ug==
X-Received: by 2002:a17:906:1d43:: with SMTP id o3mr9359597ejh.44.1628600768305;
        Tue, 10 Aug 2021 06:06:08 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id fi23sm6759220ejc.83.2021.08.10.06.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 06:06:08 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] 1/2] wic: Add --no-fstab-update part option
Date: Tue, 10 Aug 2021 15:06:02 +0200
Message-Id: <20210810130603.245475-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1698BAA2EADEB7F4.20643@lists.openembedded.org>
References: <1698BAA2EADEB7F4.20643@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When embedding a rootfs image (e.g. 'rootfs-dir') as a partition we might
want to keep the stock fstab for that image. In such case, use
this option to not update the fstab and use the stock one instead.

This option allows to specify which partitions get the fstab updated
and which get the stock fstab.

The option matches the argument you can pass to wic itself where the
same action is performed but for all the partitions.

Example:
    part /export --source rootfs --rootfs-dir=hockeycam-image --fstype=ext4
--label export --align 1024 --no-fstab-update

    part / --source rootfs --fstype=ext4 --label rootfs --align 1024

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 scripts/lib/wic/help.py      | 3 +++
 scripts/lib/wic/ksparser.py  | 1 +
 scripts/lib/wic/partition.py | 5 +++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991e5094bb..5c3d278d4e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -991,6 +991,9 @@ DESCRIPTION
                              multiple partitions and we want to keep the right
                              permissions and usernames in all the partitions.
 
+         --no-fstab-update: This option is specific to wic. It does not update the
+                            '/etc/fstab' stock file for the given partition.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7a4cc83af5..0df9eb0d05 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -185,6 +185,7 @@ class KickStart():
         part.add_argument('--use-uuid', action='store_true')
         part.add_argument('--uuid')
         part.add_argument('--fsuuid')
+        part.add_argument('--no-fstab-update', action='store_true')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e0b2c5bdf2..ab304f1b2a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.uuid = args.uuid
         self.fsuuid = args.fsuuid
         self.type = args.type
+        self.no_fstab_update = args.no_fstab_update
         self.updated_fstab_path = None
         self.has_fstab = False
         self.update_fstab_in_rootfs = False
@@ -286,7 +287,7 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-        if self.updated_fstab_path and self.has_fstab:
+        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
             debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
             with open(debugfs_script_path, "w") as f:
                 f.write("cd etc\n")
@@ -350,7 +351,7 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
-        if self.updated_fstab_path and self.has_fstab:
+        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
             mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
             exec_native_cmd(mcopy_cmd, native_sysroot)
 
-- 
2.30.2

