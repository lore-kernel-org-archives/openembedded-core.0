Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81764C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:38:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.4131.1748605106035463878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f+pYnoS9;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5532f9ac219so2381247e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748605104; x=1749209904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8D9X+QFuY+dHK3UiPK8XjK7HcDMxZHYwDlfzd/O4uBg=;
        b=f+pYnoS9a+cl3N37dpJxHtr3Vf2uRTNB4C2PZfA2Cg9OISkucN6HvrcbCjL/1rbac4
         j4PwzANzesUlL3Fi4Il8tseYerDzK9EwyWZrnIfiLhB7czwEeQewBXcGqW/frKApdOvg
         i7+YVAUCCsNo5S5mtpTIy9WkGVJi8f8uXbZAV6bGSXUpyB6MWasuxqax+MNFUsT7ScJ6
         2Tq55d48hEOwb40gGJpU8Gs38tYYMj6gjYlHtYffBUcrRTerIFH+RvRpcaRO/cNtp3wu
         FmVwrWceyQtJOYujy8UJ3k91b7QXjn8MrCgWU3F6wnYZJ6gFazce+zcIqdJYNBa/9Cpi
         NyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605104; x=1749209904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D9X+QFuY+dHK3UiPK8XjK7HcDMxZHYwDlfzd/O4uBg=;
        b=uf6fePkpyTRE71I95ICwLCe/dzMk9qf1YQJxcQL1FFL/aVx8CKvY1sVRTyf9Wdni02
         Gdte7QMAUKGkrBEqRPV8kBBzZII12MOnTmWL02jsFgCRFcXmDX7NVnCDmSWmgChlZ4dd
         At1PgvvJlZn+Q0FjL+jEBhPw6ZlPMGxMzBFx/jBgagJdVC30jPgC9G+/xEMQXpgfU+DC
         oRF9uXWcLUdqHC2nf8DE3qlWZ8xjKHJ5SBqcqlP4K8WY8zX3svKNnMOb6lZt4EV7jLWH
         QNVUaZwyBk9i1r5xA6DecKhq0sLDjPQEjZniqA+xI/HZFnhCJKHt9clPfPcoX7cqRA0A
         0jqQ==
X-Gm-Message-State: AOJu0YyvIr9uBxPzjw2IeO+6sWp1rODWKwWjp61tbamhD4vpSGR1vuPA
	PHVESxN8OhA3C6YGzwY2WqESPCEmGqnXT7zv0+4VmI1zbnrOoCgJ7hFOCuYHzf6m3b0Lf7Z7zoZ
	4VyJqEIY=
X-Gm-Gg: ASbGncsgFB9QET7AXVZKlJ4YymIwAPVAgK3c8lKldcZKfqOhgKOFyHXRoS2mTMQqqTk
	pwgvkhGqM7vPbDgnHZPGGDMexW55Mf1+ZA2zzKi2KQ5dSFVeDGZe11Q14/ooDlAy14UW2Wy1ePf
	vmoemopJ+RfSL7dtLXS8bcnTEAZwhzb9t9V/PCw+v1MSzAi5/XN1Q3UAQWCA5OuPlEJVgHoRBHC
	9/i3PcTxSiPFq/cIYOf57NVOA+WX98yWMakrffgtAeOSyQ62vnhV6WXo5gihR5L3wxiG418Nt8T
	FJSUWQWa3EtqdKFJehX/h4IjSqJGe8iS0zb097FyAcYtIn2oiXanZofPAYEVolhVCAcmNVNhdci
	kpptdUUwy1qdB3VXWWngANAQVoVGd
X-Google-Smtp-Source: AGHT+IF9sezkrDxRSK0Xrb6RUJqrKU81hztirajDXnlDYYqdTzPQXcXBEvz2xBuuRLP9J14qhmhjKg==
X-Received: by 2002:a05:6512:1328:b0:54e:81ec:2c83 with SMTP id 2adb3069b0e04-5533b8f412cmr1038201e87.18.1748605103871;
        Fri, 30 May 2025 04:38:23 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm676469e87.244.2025.05.30.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:38:23 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 1/5] wic bootimg-efi.py: fail build if no binaries installed
Date: Fri, 30 May 2025 14:37:41 +0300
Message-ID: <20250530113745.778397-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217497

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

v7: replaced "systemd-boot" with "EFI loaders" in debug message
    since files can be from any EFI loader or app

v6: no changes

v5: separated from modular kernel changes, changed from shell "ls" command to
    python glob
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77ad..38da5080fb47 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -367,6 +367,13 @@ class BootimgEFIPlugin(SourcePlugin):
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
+
+            # must have installed at least one EFI bootloader
+            out = glob(os.path.join(hdddir, 'EFI', 'BOOT', 'boot*.efi'))
+            logger.debug("Installed EFI loader files:\n%s" % out)
+            if not out:
+                raise WicError("No EFI loaders installed to ESP partition. Check that grub-efi, systemd-boot or similar is installed.")
+
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-- 
2.43.0


