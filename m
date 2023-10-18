Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91F6CDB487
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:57 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.284627.1697644134290191306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ud2gXZnu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-564b6276941so5231546a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644133; x=1698248933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXTTH8U2qi1QBzD5T70FdUHBcrQbWboHh7ZJhxxXkyE=;
        b=Ud2gXZnup1j63IcBzLaKQZGgTHOXCL+NoEUL0Vj97R+hukvs2bh3IaOB7ieY24aGae
         wKpTYD64VvZSSLvzDiBI2igWVvz+c40LxDHybjHIMzF1LwB0cT4aoDCydjhJNxtNH3vE
         f5ewOnIjOPfAK1l0UMIVrayLuwf3asPtcK8H/ctPTdmvmc1ldDLK3k2Td1pUcfHeBqXo
         l7/2iwMtY6SGlooDXBlLmgZmh5Oqk+aXFqqBdV4MuW5kFWtJ6/yy2lE4m+MwniOKkaek
         U8IKX9ChyOEj/mBxeC5mgUgx13wGyuYaD/SEoWQHKBgDhmXVMHnQc85zy2BGMrdP9eDp
         /aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644133; x=1698248933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXTTH8U2qi1QBzD5T70FdUHBcrQbWboHh7ZJhxxXkyE=;
        b=VkQxKs8HRG1zHteuaawWwfliE4GCPeOf8d12nWEQGnMENPjBtmsus4fvdPyqtHTZK8
         jaCC6wFhgQLlyoWDZF2tIHTEIPVQxfAzywmKL/4EnDYw3gYubbBr8LMzRAblj6PJMsPf
         gExvuMZfLEmJNAJozefJAhnrEvthlqt1aG4uuCFa2JEOJT4psv8jOaH0+thuKK5QFaA1
         NznaI6EAO141EzbzGBnlX+Hd8aA054x5YpBpJI0We0Cr1yMUcm53hdWFMqZziiPKuLWX
         gKbQ+KNw1ufYyHBu4nL42NXdP8kY4zW8xZ6W90oIv7ztQvFV4wNfNVIS8hJsHqo+05dZ
         JUvA==
X-Gm-Message-State: AOJu0Yx+EAoBTlKMjINakZzcN9C+/7hKFup/6x5MuqJAqTPjrwRS5+3k
	i6YX7WXnAsoKNmO46EL6DbcdHHLHTT1CnSaK5Bo=
X-Google-Smtp-Source: AGHT+IE4DBq8sZVIAEXgCa5ahFAIipt52q8+qhp+lTAOP+jmET8CPjzYQbxNM3AgycOIG1qgppuMiw==
X-Received: by 2002:a17:90b:a0c:b0:27d:5693:7340 with SMTP id gg12-20020a17090b0a0c00b0027d56937340mr5171616pjb.24.1697644133392;
        Wed, 18 Oct 2023 08:48:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] uboot-extlinux-config.bbclass: fix missed override syntax migration
Date: Wed, 18 Oct 2023 05:48:29 -1000
Message-Id: <5570e49791b770271f176a4deeb5f6f1a028cb4a.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189409

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

uboot-extlinux-config allows to specify multiple "labels" (entries in a
menu, à-la grub) and each of them have their own values for some fields.
Each "base" variable, e.g. UBOOT_EXTLINUX_FDT can be overridden for each
label. This is done via the OVERRIDES mechanism based on the label name,
e.g. UBOOT_EXTLINUX_FDT:linux if linux is a label.

However, OVERRIDES doesn't contain the label globally because it's only
necessary in one task. Therefore, the OVERRIDES itself is modified
within the task. This means that the sigdata will not be told the
dependency on UBOOT_EXTLINUX_FDT:linux, because it cannot know about it.

For this reason, we need to explicitly specify which variables this task
depends on via vardeps varflag for the task.

This was done in the past, but we missed updating it during the override
syntax migration so the cache wouldn't get invalidated if someone
modifies UBOOT_EXTLINUX_FDT:linux from a configuration file or a
bbappend for example.

Let's fix this by migrating it to the new syntax.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4dd9d873508128adbbf5ff6cf0a3df3d2ffbcf6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index 5495ba0256..ba7a213ea2 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -152,7 +152,7 @@ python do_create_extlinux_config() {
         bb.fatal('Unable to open %s' % (cfile))
 }
 UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
-do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
+do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
 do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.34.1


