Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ABDC02196
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.28806.1738354715650407670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 12:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGBR1H2U;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: arturkow2000@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab651f1dd36so470165266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 12:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738354713; x=1738959513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqGGY/DOPp6/ynhKVYMlyOKxdsJ+kmsKUPRsXUfRW5s=;
        b=HGBR1H2UKgjC/0mjBFVrOAA+GXCsqeLgL6mcjfOY7j7GMLnJXPCW+D3KVB44F4gwW8
         BtBcIHs0yxIc29H66yJNSpL47P3bI8sNPRvvBVjcgwvdV+N31CSbhFwU4mlZ+3a4St9M
         wAtAIAcxyPsRP63jWxh19VG0dpSsgshtFdxiHA6FdOE/BVaUXn6p63CzUtPXTuyavqh8
         Lz5OPK/fF6Giq2vIVQLk9GGT8J/mjjSRsG85drDzeoqqnkLbxxg5Qle7nIC23J1+5wCZ
         t86VcdyRLNF20Vq4MeBzuk+MATqzPiFnsLm/KOdIcD0TSBz0BC+yiubvpFVfviSd5nee
         w4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354713; x=1738959513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqGGY/DOPp6/ynhKVYMlyOKxdsJ+kmsKUPRsXUfRW5s=;
        b=Kmeeiz54RyVTAKJBsX6mJM1+OW18e6GjlthwGkH1h+RG3Nsge6Q0OCYeYZjVdZ6/zc
         c0auvlmMY9vVpj7LR3EJhlcSM74iYZiAL3EUrZWoMFlPV0mwW1641gBDGHIchyIsc+7i
         ytO3jMsD52UkDt/i7+4hX99/EvC5pJR4V73X7EBvNUe1lc1J67aGzsQqiT7COF4SSnWm
         O822FYlWAVEW+ssL36fVqthhTx6q5LOrLuqXL61VsA/iaQaRXRtkmEZyMxKblG6AYt95
         vzArzCufl3kWmOJyL8hPCZw/Mm3mrh29pVVQNnUqXyHtJEJoxwNisrIkKDnQ2zJiUQBf
         jJKg==
X-Gm-Message-State: AOJu0Yw65l/Awy9nVIsh1/A9TJjdoWFpFlbwV85esyNzdhnSjl1h9o5i
	dSaIvFumzKDgsnO6RGcRTN1ZElWlrnnOKv2WH7g4HuZUMQhahwQx+GBEJQov
X-Gm-Gg: ASbGncsTB+v4o++9m+lcSBE2B/cQB1KMTs62v29MA3ztIi6ox3FxX8ZFfUERil2dBm5
	17gReuxoBusjfcmSJHJPQwD/5oJO+8RqtNbN66yIugbNIbHuzv1MIdtVcwzTWj6LoiuzBH3z7yj
	NwC1n9f0FdWqoI40Vz36+LlPLJa7MxMzRXUQ3m0zAJsSWtK93TH5axmwxn8XqKeT1Up/Hk3xSRn
	q0qvgiAauGn3udkjxT7Hynw0SeiBTxCOQFRyhnYIyfU6GSg9hXo92nDzG0Kw5k3Kjc8sXg/0xw8
	RZUNPhBnCRkWyEIB2y6Bj2Q=
X-Google-Smtp-Source: AGHT+IE0uzseJZtSiIGZ5a6ruv9r5UOAQRGCzDVzYRbNUzsK0Zn7CqzZOw7e/smPuG52xmRF7Zq4Hw==
X-Received: by 2002:a17:907:9455:b0:ab6:fd25:3c72 with SMTP id a640c23a62f3a-ab6fd253f3amr567963666b.10.1738354713031;
        Fri, 31 Jan 2025 12:18:33 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:4f4a:898d:b2d9:200a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf8bfsm341948866b.40.2025.01.31.12.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:18:32 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>,
	Markus Volk <f_l_k@t-online.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] systemd-systemctl: fix handling of instance unit files
Date: Fri, 31 Jan 2025 21:15:59 +0100
Message-ID: <20250131201558.1116719-2-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 23:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210502

This fixes handling of units with instance name in theirs filenames such
as `gnome-shell@wayland.service` or `gnome-shell@x11.service`. Such
files cause template file to be ignored (for the specific instance).

Thanks to Markus Volk <f_l_k@t-online.de> for noticing the breakage when
building images with gnome-shell:

| Error: Systemctl preset_all issue in org.gnome.Shell@wayland.service
| WARNING: /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158 exit 1 from 'systemctl --root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" --global --preset-mode=enable-only preset-all'

The problem manifested after cdc3b3028f6d71788b5fdd99436f69fbf18f613e
because we enabled preset-all for user units -
org.gnome.Shell@wayland.service is a user service, so prior to that
change the file wasn't processed at all.

The error was triggered because there is no org.gnome.Shell@.service
file. With this patch applied systemctl script looks for instance unit
file and falls back to template unit in case of lack thereof, keeping
the same behavior upstream systemctl does.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 .../recipes-core/systemd/systemd-systemctl/systemctl | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 81c246a5b2..65e3157859 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -224,7 +224,17 @@ class SystemdUnit():
             instance = None
             unit = self.unit
 
-        path = self._path_for_unit(unit)
+        if instance_unit_name is not None:
+            try:
+                # Try first with instance unit name. Systemd allows to create instance unit files
+                # e.g. `gnome-shell@wayland.service` which cause template unit file to be ignored
+                # for the instance for which instance unit file is present. In that case, there may
+                # not be any template file at all.
+                path = self._path_for_unit(instance_unit_name)
+            except SystemdUnitNotFoundError:
+                path = self._path_for_unit(unit)
+        else:
+            path = self._path_for_unit(unit)
 
         if path.is_symlink():
             # ignore aliases
-- 
2.47.1


