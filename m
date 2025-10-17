Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4BFCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 09:12:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.11328.1760692362808103754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQMmP8x2;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4736e043f9so270650566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760692361; x=1761297161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYWJ3+HfpN3N+SyWxUfQr3I7SlVwUYaRUooB2IqfQY0=;
        b=KQMmP8x2Kw3RhTo8Viblp+KZD3ghlo0Kt1r8DhWjpdWUyFaSTDzn9urHe6QC/iPTSx
         5gAgmcp/+6/D7DhvsBcZxvw2GV0teHgVt0mS9dBkL/OQrLcaxATWbuCkvQLeojFlRbhP
         7heRVVy5DkUst4EJc7AK0Zl1xiWM1Q+CDsYCenqp87rBo62raSHypRk4/BT89LtOJA1F
         UFRJcaNn+crN/kaADyWi6hxQN1oVnm3ihGWfmCwxOc/rOPXp+iyidoJ29qg84P5WCMS/
         ze8rIeoGHV5tvYk03UlVILowpAuRPziVimbbGrCf5iMsBiNQPSLFHXgbZr7mVtRouuMv
         CgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692361; x=1761297161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYWJ3+HfpN3N+SyWxUfQr3I7SlVwUYaRUooB2IqfQY0=;
        b=rktue8yzpvSkvnaPFp/B2OIkhT14T17BxEaxR7EXjtsWoC889CAQ1gx0G5NNora74g
         SYdMt6dPk3PpXARzXXr9JtPnPZ5VcDiRmMiwygwzZYtfXu4WMclTBA79LpCuw/sWV8mT
         s883Vvp/pu/6EKmqj18AJnrAxDCUbj440t0xgMwfjtlXm9+yy6BfDebVAAlictlV0IQB
         TuceZMauVP6/KAw5hpKU9AFdYnweyMqJsUtgPtOEjFmLlwdqgCJfnwFDHiI62vzu581f
         POre/OYH8hGOX0t4O8IKlvXbxoVbtvK6JsQxSaF/vCN3MrRv9MGmulT6myuWFYXp695I
         2mvA==
X-Gm-Message-State: AOJu0YyvNZJs5P5XnFMBUHnzW7IZwExiPVUFTAxEytshVXQ9Fcvyjeyo
	Dn/FHEenIgo/a36dbXYgibjSfdnfV5gbvO8PNXrRPijPuTK338kT6Iusr4g5BWr2
X-Gm-Gg: ASbGnctlXJG/hocImuyIdD41NUtMXVoOjesVaX13P8i1I+vhDYeCBscmudo9oCpOO51
	Fv2Tdv5QTQWOS+itQ+kaRXXk52rTTFjuWtXNmpN60+8HccmBEUbCpLDdkSr2t1ig3JNkMSv85IB
	U6JjgO+ELf3eKLIpPD8426+HWhyWKSJsDyQ0KON/0i0WD35/CJ9JzFECzGcQLeDpHx6qgkWRMQo
	tIkEE5nBvPpjMPc72aubxmt/IaeX+I3ull7hWWZy+c5H0nLLVZl3Hr7wwgoF69KaZ5xHyBlVB+C
	DjxbZu6Uly/AtgbtcZ5BjXHnJu55mKkPb3F6JNxbIQFneSVx9F6dahQzJQ1mEDrRcMRx8jfeneh
	6m3fALEmnp6naqtnIDx+HLp80ioJNhA/ybo08Cgzqv7ob9fMWyfRcjq9jO4Mn7bB9Jg81TiithQ
	Gy1RFMpmIPJwNRbwUfwDXe8vKxS582ikEp4H3IGOSjvYw=
X-Google-Smtp-Source: AGHT+IElGEIYhwcRXF4pVTA/Frw2EUHxljfuHvTpheVzJx+XbT/W4dB9GW1d4In83HTls2xInl+6OQ==
X-Received: by 2002:a17:907:3dac:b0:b45:8370:ef10 with SMTP id a640c23a62f3a-b647245845bmr331530266b.22.1760692360653;
        Fri, 17 Oct 2025 02:12:40 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06c187sm746466466b.31.2025.10.17.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:12:40 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 1/2] linux-firmware: Fix removing unlicensed firmware if compression is used
Date: Fri, 17 Oct 2025 11:12:37 +0200
Message-ID: <20251017091238.1459237-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 09:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225002

If FIRMWARE_COMPRESSION is set, the newly added code to remove
unlicensed firmware fails with:

| Remove unlicensed firmware: acenic/tg1.bin
| rm: cannot remove '.../work/all-oe-linux/linux-firmware/20250917/image/usr/lib/firmware/acenic/tg1.bin': No such file or directory

This is because the code does not consider that the file may be
compressed.

Fix it by factoring out the code to construct the compressed file
name suffix from do_install:append() into a python function and
also use it for the actual file names listed in REMOVE_UNLICENSED.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../linux-firmware/linux-firmware_20251011.bb    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
index a9e8935f93..bb40c68670 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
@@ -472,6 +472,14 @@ def fw_compr_suffix(d):
         compr = 'zst'
     return '-' + compr
 
+def fw_compr_file_suffix(d):
+    compr = d.getVar('FIRMWARE_COMPRESSION')
+    if compr == '':
+        return ''
+    if compr == 'zstd':
+        compr = 'zst'
+    return '.' + compr
+
 do_compile() {
 	:
 }
@@ -489,7 +497,7 @@ do_install() {
         # Remove all unlicensed firmware
         for file in ${REMOVE_UNLICENSED}; do
                 echo "Remove unlicensed firmware: $file"
-                rm ${D}${nonarch_base_libdir}/firmware/$file
+                rm ${D}${nonarch_base_libdir}/firmware/$file${@fw_compr_file_suffix(d)}
                 path_to_file=$(dirname $file)
                 while [ "${path_to_file}" != "." ]; do
                         num_files=$(ls -A1 ${D}${nonarch_base_libdir}/firmware/$path_to_file | wc -l)
@@ -1386,11 +1394,7 @@ FILES:${PN}-sd8897 = " \
 do_install:append() {
     # The kernel 5.6.x driver still uses the old name, provide a symlink for
     # older kernels
-    COMPR=$(echo ${@fw_compr_suffix(d)} | tr -d '-')
-    if [ -n "$COMPR" ]; then
-        COMPR=".$COMPR"
-    fi
-    ln -fs sdsd8997_combo_v4.bin$COMPR ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin$COMPR
+    ln -fs sdsd8997_combo_v4.bin${@fw_compr_file_suffix(d)} ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin${@fw_compr_file_suffix(d)}
 }
 FILES:${PN}-sd8997 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin* \
-- 
2.51.0


