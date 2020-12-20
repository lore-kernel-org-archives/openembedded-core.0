Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.24344.1608475871736204620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TVoB0hDp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q18so8145877wrn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g82/m5EiBgeMUgtA9gbwlFfpeCuyW0Yk7lNCSZj+dgw=;
        b=TVoB0hDp8DJnCIq+TDL0f0CB2Se44aQZ0tlWiRMimrIrcr4mg6lti5zHk5uPd/CWJ5
         6PnNOLFDWC1Lue4LfKxz27DZlmUWqoOdAUcWoFIvXbo57WnNk1wKcstaR8Hz/tRnt6p/
         F8JFaRgSTWiQf9C/utMya1iEdGzDRf7DPC1eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g82/m5EiBgeMUgtA9gbwlFfpeCuyW0Yk7lNCSZj+dgw=;
        b=Rr7mFVkGCTlmUdqEHy5wJQtanty3RwpBIpQDIDTnrl+phTx8U0RXwf7RTl/VqoTAbf
         NS2u+nNLpH9+v7XBfMjYv7QwA0AJ7crgtaQqNUqB4fTNVaoHyYAUcBZ5W/K/9eCPcrJ1
         LDmZ7cvSI4ZzxHvI7MIVCRZqLPuiFDXhcXKSKFYNNW18XFEO3HvEnGKH/OQ145hyyslP
         jytrKe6g4BapR+xM04/QBuRv3+T1bey0EdSsebPS5IuJyavbbNJ4Ypoh1nCYjNgJkGFC
         WJCQvjFheOwKAqrjwV5pJLQxOKQfauKzxFYCEZAEycs6vAa/ytBQtjCagDRwfez12WqP
         GLPw==
X-Gm-Message-State: AOAM531RvWwvIerFKK5xrgdK6ijwbbPKTiJO84wn2P2mok/w6VIVZ9wD
	MrSpUAAqNg7TtBIJT/kxCfWGQ4BaaygqLg==
X-Google-Smtp-Source: ABdhPJzAbP4NTopLNFWTKFpYzTEDO87FoklgBF0yTMiMRpwq6pDDLsoc/SA0ECOtW01zAoMtY8JCzg==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr14400919wrs.106.1608475870086;
        Sun, 20 Dec 2020 06:51:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (6.6.5.9.1.e.9.f.7.4.3.6.0.6.1.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:e160:6347:f9e1:9566])
        by smtp.gmail.com with ESMTPSA id b10sm20012603wmj.5.2020.12.20.06.51.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 06:51:09 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub: Add second fix for determinism issue
Date: Sun, 20 Dec 2020 14:51:09 +0000
Message-Id: <20201220145109.13887-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a second list sorting problem in a generator script within grub,
add a sort() of a list to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index c4b1d3a2a8d..fac80e7b544 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -4,6 +4,10 @@ depending on how awk sorts the values in the array.
 
 Be deterministic in the output by sorting the dependencies on each line.
 
+Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
+from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
+missing sorting of the list used to generate it. Add such a sort.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -22,3 +26,15 @@ Index: grub-2.04/grub-core/genmoddep.awk
        modlist = modlist " " depmod;
        inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
        depcount[mod]++
+Index: grub-2.04/gentpl.py
+===================================================================
+--- grub-2.04.orig/gentpl.py
++++ grub-2.04/gentpl.py
+@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor
+     for group in RMAP[platform]:
+         for value in defn.find_all(group + suffix):
+             r.append(closure(value))
++    r.sort()
+     return ''.join(r)
+ 
+ def platform_conditional(platform, closure):
-- 
2.25.1

