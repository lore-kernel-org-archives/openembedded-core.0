Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1675CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 09:08:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.4555.1761124073630519264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdSy98Ur;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36836615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761124072; x=1761728872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzsIGIDEtLDGDwAx+cHLWz55iH8ASDU7TgHR6VAH3fM=;
        b=hdSy98UrX9BRMGMTzs8ud2IzLNzHNzYbxUJ+PqOeDn1gLuqL9cN+jiodc1JMCO79GI
         pNhA5tEtwNy9eOhbqQX96BhB2zSXT/VqOU2s7hZwweNND0tm/veBG2xL7l5H70dLnwnr
         usNQBDyOM/lNqB2vA2q6KwaF41hbV2SbWyWZ5S/APjzsnrM+yym+N6dwTo1gUtCIwR9W
         tRHQUVI7pk48w+POeC7EaJW88fOcpvrWvUnU6c2UyS5ZUqeyKxXmMjPyB/UHJMDIh4tt
         intHhISV4hf4z6kDrNsbRRCyImW1Yeaooy9AiQ213fqHDdSrebB7OT0y9DJufzXgLtjD
         lnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124072; x=1761728872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzsIGIDEtLDGDwAx+cHLWz55iH8ASDU7TgHR6VAH3fM=;
        b=L9SwOWnIvl9gCz/g+8zhFOw/0re8ao/9LoVfpfZj60SbGkOyhc5CutJYNBA6OdkPMP
         68q+HEfbvHj0c94HxrF+D92fzDlHSjgFTd4bMm5dZ+j1MqZNtav+k7LHa3h9/Zo+jsMB
         9hNLVfyR9DWS3hxH+gbWzhyj5piCLglBmhUquzp/fIm37oekL53Ainhk7zPIhRxddbP6
         UPTFJsPLJ8TKqL2vhXwMptNofGxPH0Bd7kHr9v/kV0BKOJzlKI1QdNcDyj8da7VnA6+p
         JHqk2lJdb7O3QFOppHoOeRf6QzziL6D1yi1p85t7ByLVj7rtiu6CZAtM7FrBGS2s8v82
         ZGWg==
X-Gm-Message-State: AOJu0Yy40sLCOkhi3A5r5piF6vZzTyBk4p9MLKFaosu+GpE0J6efaXle
	2OVn0wx0OheksoXGVt4n5eGpMDY1JFcnpauY16+fYSZPLJorwqUJw2pa8zOERYjy
X-Gm-Gg: ASbGncv1mfWLiGlrj4+yekoC2KO07l3nPWIhuCmKl8+phRhNepEzkj0tqffI9mEijBI
	6RWGvgUYu6rTSIPfJvgvVZ3eZt51+Fy8GKgMNXOdxaZAtMR/1t0Qmy4Qb2l22QBq2b4I/SR2OlW
	/Ck3u8cAIDNI8NGh0gLiJBENO3sM1JGPhy2g+D/4tEURPecFR6QmKXoSdCEfXkoTb069/YFXk63
	YzCUejunH/uSBKgtK0RasnLc+NOk9QpenpZG7hdZjnWsx9solY8y2PDj9JYQIdWpzLUHT2bYrhY
	ZLwzTVhv4yocn4gaW+CtlwGFA8cCpCrxqtLvWwJ+gfJ/NsmTfZ1SHbbKWioLzii6VQhC00ZBQLn
	66PvBHGJucXmchhfvdBbXS3ekIlOvnUI0sjcTtjU0YftQhMNYuiIJNImsgO9GlrFaPaRRa/NrYs
	0=
X-Google-Smtp-Source: AGHT+IEKhUmRrvlIewDTEhVwrKJSd8PE4RbM2tt3XG3JgXXCCsRPn+XmlmVsHxsmc8SlSxgvSSgqzA==
X-Received: by 2002:a05:600c:1f93:b0:46f:b42e:e367 with SMTP id 5b1f17b1804b1-4711792a527mr141673585e9.41.1761124071427;
        Wed, 22 Oct 2025 02:07:51 -0700 (PDT)
Received: from fio ([185.228.162.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494b365adsm34165275e9.6.2025.10.22.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:07:51 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v2 2/2] create-spdx-3.0: add SPDX_LICENSES to SPDX3_DEP_FILES
Date: Wed, 22 Oct 2025 10:06:49 +0100
Message-ID: <20251022090647.419543-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251022090647.419543-2-jose.quaresma@foundries.io>
References: <20251022090647.419543-2-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225180

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

If we have changes on SPDX_LICENSES content we ended up building invalid sstate-cache archives.
The default value for the SPDX_LICENSES is the file meta/files/spdx-licenses.json but this file
don't use the bitbake fetcher and because of this their checksum is not validated.
So we need to add this file to the build dependency chain of the SPDX.

For example, currently we have bump from 3.24.0 to 3.27.0 on master-next for the file
meta/files/spdx-licenses.json. Since the file content is not taken into account, we end
up creating invalid sstate-cache artifacts on the autobuilder on master-next builds.
This created sstate-cache artifacts will also be available to master branch users
that are using the upstream sstate-cache mirror.

If someone is using the public mirror but still following the master branch
they will encounter something like the following error which this change aims to resolve.

| ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx: http://spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zlib not found in /work/build/tmp/deploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a8bf25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc.spdx.json

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/classes/create-spdx-3.0.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 3a8a97eca4..a6d2d44e34 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -136,6 +136,7 @@ oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCH
 SPDX3_DEP_FILES = "\
     ${COREBASE}/meta/lib/oe/sbom30.py:True \
     ${COREBASE}/meta/lib/oe/spdx30.py:True \
+    ${SPDX_LICENSES}:True \
     "
 
 python do_create_spdx() {
-- 
2.51.1


