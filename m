Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.9874.1602065697786488496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e6IT2yRX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 13so1712790wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iV7UeUmjxRDyV4byYtle0I5b/jQTywREykQDMXPkpZo=;
        b=e6IT2yRXUfX4Wwm/E6fvwDg0kmKzUSumn5+IhWRbalGYuT/aX5euGCRUAoMr4b/NPW
         8sYDURZBdjH5NXGzxWAImHo5lGsMPEwKpJtlUAzY9ERaLgcxqvmfoJasvBcxfbAOUoQ7
         XuRuLEl3IBNJDHycnA9MZ/A0IfYySqorL4UTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iV7UeUmjxRDyV4byYtle0I5b/jQTywREykQDMXPkpZo=;
        b=mCaO/+dl5T8rAsa0n0mGXlYOrTbGSQ3hyZFzI8WJByGxwNngN/wEDCorwAv5kRHc8p
         UzA2QazE5xjZikueFsBvcFg495SOjnZGXVu4fZAJBt3QFzZPpU4KRxOtL+uZvEzCUvWs
         Fs6b6X1higiVLbO4w/f47fFkG4BTwNx75iQWqxkcAq0yEqBhxlZfWePOyYwi0zHspL+X
         5vMxw7QZjs8TjEDFRdzJWQu7/3qfBzFcyGKPWyRCx8xQFzFFzdnqdZq4hfcSvmlntVGa
         Mw2OtTZlj1UCldkdN4wR2zz3SEGn3W+TLgLpq/j+o6ZTYySHM1k09LjhwGAcgmLfwlIo
         oDHA==
X-Gm-Message-State: AOAM531V9er8iLMISyQqyZCd/0qxpHthd+Qc3K5/xdU/cce5dWiAvFhV
	LGZYD44s39ldOI6KRdhjSqnHSLVn7yoMOQ==
X-Google-Smtp-Source: ABdhPJxP6BM108F143MAd3k+k9NwsiNeeWS2ARX4qGf+iUZt10zE4ZKlP/vgR7EomN6Edv27+nNgiQ==
X-Received: by 2002:a1c:e919:: with SMTP id q25mr2426265wmc.142.1602065696139;
        Wed, 07 Oct 2020 03:14:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 9/9] wic: Handle new PSEUDO_IGNORE_PATHS variable
Date: Wed,  7 Oct 2020 11:14:49 +0100
Message-Id: <20201007101449.3132127-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust wic to correctly handle the new PSEUDO_IGNORE_PATH variable and avoid
inode corruption issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types_wic.bbclass |  2 +-
 scripts/lib/wic/partition.py         | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b2e5fb43e85..286e0f5d541 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -5,7 +5,7 @@ WICVARS ?= "\
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
-           ASSUME_PROVIDED"
+           ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 85eb15c8b84..ebe250b00d6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,21 +199,23 @@ class Partition():
 
         Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
+
+        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
+                                         self.lineno, self.fstype)
+        if os.path.isfile(rootfs):
+            os.remove(rootfs)
+
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
 
-        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
-                                         self.lineno, self.fstype)
-        if os.path.isfile(rootfs):
-            os.remove(rootfs)
-
         if not self.size and real_rootfs:
             # The rootfs size is not set in .ks file so try to get it
             # from bitbake variable
-- 
2.25.1

