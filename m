Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD50C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 21:16:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.6577.1752787006598968429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 14:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3lu9zmc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74b56b1d301so1068154b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752787005; x=1753391805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4jdYi5IhoD/G3JUG2unCQvn0M7KBqalXhwHiNPd5/8=;
        b=Y3lu9zmcKEHWuNUxYuhdtot6DjvdEWeqI3mAA2Kz59X1iE+FEKqdO00ntF7bN0ErV5
         Ql3tl5yX49nfim4NUk/jChOCDsgMlvn9FA7FO2uFKIBiu8gITYiPrion+SvYgo9Jk31F
         DELrDVGW3gkBq+aza59iG7Uq+xHilvIcRvEZa1TYFX4t1FLOJQ23KqZK2Y5tqFDP3TnJ
         YkRn/+vhDAeVVywCIJDzCX3hXSCvEiISglUTxtjlSt8oXcXA/lZJPWjMh7sHXEVRnxlF
         +IKyhq+uVkN6KIePtRpXmcLTcXb+LEKHGHSzuqeFPMIm2GAKcbCPxn0myjGkinOJPBiW
         qaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752787005; x=1753391805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4jdYi5IhoD/G3JUG2unCQvn0M7KBqalXhwHiNPd5/8=;
        b=mAQBLZ83Zb1WGetp8CWOVCsjO4EJGbRv1iVhLjFRe8XTsfAus9n2DnbXUXZYw5LrPM
         li8cEwYxBF51vO5JXe4kXN9iwXlHhGpRVYcnEg0JGswJQ7pT/Wi7Dlkp5sPxGktfYFvx
         33DfJcC20xdpK4rXD6x1cjTO7tRu5sssyoiMO6jjk0GEfMgiVDJMf/nQhDRAcos2hVzu
         YEsITXBtC/qp91KQiEtsb6QmhcsXh43MK5f3A2b672O4M4exoJYCFGc2KCV+qgiWP6lG
         yapOohj9y8abp3WmimWGH72FngioSPePJKTi3S7TjuaUbrDGh0FlrBCMok4dwTRdxlpi
         Z4Ow==
X-Gm-Message-State: AOJu0Yw44HgRBeWXdEzorIrwfIUCHif9Cm3B4dxeqyLItHV6ZznBCqdI
	/pxyHdtMk2oV2zeF64wiMM3pxtzaOtEPLY/XfwTQdD8GparTfL5SJRlXySqunQ9v
X-Gm-Gg: ASbGncuE59gAjmE/bzb4mX3LJf96wLOPiw3A9EHXazuHZegzs3Dj+5yb5UjuzZ464yy
	MVosAKWorRpp9IIq31+JWpcmzYLQULqdUeu6fJrL/j8QOBzlYNgcRn6rEgBrK6HSoR0P5EWJn+i
	2R+J++H5ve1It0X7BIRjgw596gGbodSgRuzgCrQnCo0muCeyTAv40lzlXJRXMKaxA6+61Y8YaoB
	rC2zbMR6vquh/rzMsqNiesGcABkLNLUVz3mq97O2gmvh8ZgZCGcS8JWxEwhNN1o170spFbl+1d/
	BBiLR3yt0uQQox19OTpab04/o8/dYmsgVL+T0pa93i+gdhVPxtZ85Nf0XkQID6YE+1eUTvGSSAm
	vyNQ/3lW3tLn8e1BtGwQmWCOVtDzUaZ7uveu1nQ==
X-Google-Smtp-Source: AGHT+IHgG76NLCxP1xJcOYfMrvGfRp6HyCV3G9Hmw9Tw3Gn4ywzsj/XOBRg4C6y10H1vMWjjzDxLtA==
X-Received: by 2002:a05:6a00:bd84:b0:748:f74f:6d27 with SMTP id d2e1a72fcca58-75725480a1bmr12440125b3a.24.1752787005257;
        Thu, 17 Jul 2025 14:16:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffb69b8sm97678a12.71.2025.07.17.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 14:16:44 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 2/2] systemd: add libblkid and libfdisk PACKAGECONFIG options
Date: Thu, 17 Jul 2025 18:16:21 -0300
Message-Id: <20250717211621.7122-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717211621.7122-1-hiagofranco@gmail.com>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220565

From: Hiago De Franco <hiago.franco@toradex.com>

Introduce new PACKAGECONFIG options in systemd for both libblkid and
libfdisk [1][2].

Set blkid as enabled by default because the bootctl command depends
on it to be built. For example, images like core-image-sato-sdk rely on
bootctl and have specific tests for it.

Previously this worked implicitly because the upstream Meson option
defaulted to auto, which enabled the dependency if libblkid was present.
Now, without explicitly enabling it via PACKAGECONFIG, the feature would
be disabled, which triggers testimage errors.

[1] https://github.com/systemd/systemd/blob/main/README#L219
[2] https://github.com/systemd/systemd/blob/main/README#L228

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v1->2:
- blkid set as default PACKAGECONFIG to fix an error where bootctl is
  not built anymore.
- commit description updated with blkid information.
---
 meta/recipes-core/systemd/systemd_257.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index d73c0cfe0d8b..0f358ea88f38 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -76,6 +76,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'link-udev-shared', d)} \
     backlight \
     binfmt \
+    blkid \
     gshadow \
     hibernate \
     hostnamed \
@@ -137,6 +138,7 @@ PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
 PACKAGECONFIG[apparmor] = "-Dapparmor=enabled,-Dapparmor=disabled,apparmor"
 PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
 PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
+PACKAGECONFIG[blkid] = "-Dblkid=enabled,-Dblkid=disabled,util-linux,util-linux-libblkid util-linux-blkid"
 PACKAGECONFIG[bpf-framework] = "-Dbpf-framework=enabled,-Dbpf-framework=disabled,clang-native bpftool-native libbpf,libbpf"
 PACKAGECONFIG[bzip2] = "-Dbzip2=enabled,-Dbzip2=disabled,bzip2"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
@@ -152,6 +154,7 @@ PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zst
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
+PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled,util-linux,util-linux-libfdisk util-linux-fdisk"
 PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
-- 
2.39.5


