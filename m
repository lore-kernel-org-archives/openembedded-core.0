Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96602C28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6416.1741212696657803010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aBqMYeoZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224019ad9edso21561195ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212696; x=1741817496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIKHo1sQoxAz+9Uu7TU29bnW0F57Zpf+hPjdtDmPvtY=;
        b=aBqMYeoZ8GD8llfHXTtLFO/Sc2lVBruA1TUJSZ4lGZY1DtOqfdG0cdL21c7BmmjyUv
         djrmiTRmXXczecB5qc76QbLIRnw0WIMTQ+JoXWSpnpP8gJJd5x+nnKWoEYB7hL0Nvt99
         uMI1o/q3HJzYdI+Ep/wo+Ny9KLmpovLLGUXDzpk9kgMa5WcfNEoEgcZzHnz2+TuSXsB4
         SPnfF/yXcFSu/E8XM4bocfQzv2+lNU5cQaRJfMsFdHQBE47UTm0NPm/jUwjx0BOGH749
         JabX2MW3pXjoIo7VRQ7GgET4f0PGrtScDkQ5yeCwB57OkmSFo79QyppZ78f0MRQ2Hck+
         9CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212696; x=1741817496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIKHo1sQoxAz+9Uu7TU29bnW0F57Zpf+hPjdtDmPvtY=;
        b=OMJi/snKGLKYO+JYlAsVEw6yFKL73NNDDDmtUrZVTunlsRMPTUE5Fq9PwH3VoPLF26
         ZRyoZqsfp3JSYUfz4xPLbpFvdRiKHRz/5Gpixaw38WZ9/zC1RHQ4cmfZVh0yBVVtJz2A
         FdpVKfz27EmEpiEN/GgumSHOrCIj/JkR+M8+QEDQnMgKMPLh9wsdJ3e1V8pFry2L7CBp
         VshBGWgbOnY6Z4bmHfuHcfZyt3C1zClykY/+8E8GgVKstK34E1XKPhPPNLKj9npJFDGj
         W7DjCA0rxtzLNa5vatzbvn0UegFzJrsQlyr73nky2xIKZBuYgDsbFTGN7nw+GJokblxC
         NUtQ==
X-Gm-Message-State: AOJu0YwDTTeGXUoBqTGPaAbc4B40vdIgV60e8/3KIFNKQQuWljJ/mfA2
	pradYjqSZx+IhU/X2S7CquxssNvrhd5twFAPpn5fRk+lsl4+YvBJRUvvcSSd/M5cYvXJOn36QUE
	i
X-Gm-Gg: ASbGncu1nYNVFyL2dA/IxJMazWKVVz+JsfpTkJIhBxZuzJAAVu1WtIUhHFNd62gzpsZ
	ktxwuQtfwDtn567Dn82SczzFFuesTv6UDBEk2Ggs3dnPFDudRtQOiTWgnBEAHNayt0t6tAFwksS
	If2GJdZh96ocvlAlJ8Q/xoYGsrt08ba1M+HUyfDQi4pDhTbSp756KrEZ345t9LSZsj9o6HGNRN/
	rxM/gcZknmePyLxu170BUZxPY3u8vMfiEP5fpSztRgAdJm/h3iN85k05u5LGruK3DDF5MOZ7KcM
	nutK3OsK9on5h6ChyCIcv0qMSlNVoc+m7gY=
X-Google-Smtp-Source: AGHT+IE48uwPwd81vE1TqiY/NDCbSskhCdeqTIROmNvnI92aqHyX8eUOa1/QaZRhkumfsjhZYb7WGQ==
X-Received: by 2002:a05:6a00:3d14:b0:736:6202:3530 with SMTP id d2e1a72fcca58-73682caa185mr7165766b3a.22.1741212695944;
        Wed, 05 Mar 2025 14:11:35 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/16] xwayland: Fix CVE-2025-26597
Date: Wed,  5 Mar 2025 14:11:06 -0800
Message-ID: <6e19f26f4f152316badf3668b74cfc50d8d12528.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212357

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26597.patch    | 46 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
@@ -0,0 +1,46 @@
+From 0e4ed94952b255c04fe910f6a1d9c852878dcd64 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949]
+CVE: CVE-2025-26597
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index abbfed90eb..fd180fad2c 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 63803a7a44..7f94c5e2e2 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


