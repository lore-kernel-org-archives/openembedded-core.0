Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC9577E7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 16:03:32 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id s62so1528831ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yF0fuon7aG45VmOqMlKHDT96qZH/A3WOmWzWRWkvwgE=;
	b=sGM86XAh5ko4ULBX3FMxgm5fD/YT7LqLKbtduS+Olsxs01arr3L/EGrUwgywPbe9LR
	Rcxyzw7mQ33YdTTeNFjC1yuabkGd8YdzwxbrYaXqalRco9WyK8W4ZWJ54mayyxGWKs4g
	EyysarQFpbyZDROUxbtW9TqmA9s1ASr0XWlJRPhjxIWmgMCtA9YocCa746npOTAEdNdI
	o3vWum7VjlpPhRtcltL2dV+uuXUWTP+nv0pHV/UML5v0+sasFdHvjVhDmFvHrePWGFa0
	jpBbR40+eU18tdMhd5+AubY/XvE7VjWcxOoxwenIc2K8bJ/WuGXa2rH8ytBk+xamBXMA
	6JpQ==
X-Gm-Message-State: AHPjjUgEKg3PM9hTpwxsjQjrjBsYY2/jYNv8iOVD91vWanw2Gu861SnX
	DAoglDkijylOnZFkkTVJ8fpq
X-Google-Smtp-Source: AOwi7QCEHgaX+tbLjG/ePOLDctPgFBVENe+8sOmxNSJtMqd9ci7oFIOUfWuXhmoKcgqwTsCO9IIvKQ==
X-Received: by 10.129.85.88 with SMTP id j85mr4196499ywb.62.1505923413835;
	Wed, 20 Sep 2017 09:03:33 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	n129sm830131ywe.109.2017.09.20.09.03.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 09:03:31 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 12:03:27 -0400
Message-Id: <1505923407-31734-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Wed, 20 Sep 2017 16:03:33 -0000

In the case of non-wic images there is logic today to generate a
startup.nsh file that will be executed by EFI to run the loader that the
image contains.  In the WIC case is currently depends on that file being
generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
present there.  This extends the logic we have today in wic to save the
name of the loader that's being placed and if no startup.nsh is provided
already generate the default kind that grub-efi/systemd-boot.bbclass
generate.

Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4c4f36a32f56..f4643fc233b2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -204,13 +204,15 @@ class BootimgEFIPlugin(SourcePlugin):
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
+                    loader = mod[9:]
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, loader)
                     exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
+                    loader = mod[8:]
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, loader)
                     exec_cmd(cp_cmd, True)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
@@ -222,6 +224,10 @@ class BootimgEFIPlugin(SourcePlugin):
         if os.path.exists(startup):
             cp_cmd = "cp %s %s/" % (startup, hdddir)
             exec_cmd(cp_cmd, True)
+        else:
+            cfg = open("%s/startup.nsh" % hdddir, "w")
+            cfg.write("fs0:EFI\\BOOT\\%s\n" % loader)
+            cfg.close()
 
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
-- 
1.9.1


