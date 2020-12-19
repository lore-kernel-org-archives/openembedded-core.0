Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.10503.1608392728581570697
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KI8BB26W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id y23so6391147wmi.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PqqMCBysBqDkb0ITic0S0BlAfD5OX7PXz1vEFhsdOKY=;
        b=KI8BB26WswlJjt0l/nJQJCtNmyyfb3YaOIO/tSDLh4RhqlpetR+wUJ613pODoH0QTY
         zvsAtutNEQerMdLlrd1zsZVmZiW8Clc530fR0puV39bhBgd8SfrAIWilRwO8+F9NbY1/
         6Rr6aEHIh39ptJFZDg2lF6Zd9JbmcpJqKi5os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqqMCBysBqDkb0ITic0S0BlAfD5OX7PXz1vEFhsdOKY=;
        b=DDO5d9lN8oE0ipLSHoZoUOqOBU6nlHDHkWXbgQLAKngVUulqzv/03AroXrLdzJTlrR
         kApO19z3P1mpSOL/ycOHMGHaMqbSOdV/TOxXI6yId8DfOMH98OlHJmEw5aHH0/YwuzML
         jvLM5d8pjsIeGEz7gJTc74NEKXM3b1DTXuustr4iNGTGuxsO0louRnQWcViHJvBhPi3T
         PdoeqrhbXYn0TbbXLOSrDr0LFBek11/26vm/a9zRiogXNvy3KpFnngpxbQ88JZz53UsH
         Ii6U6Feae2cUjfgvcv74gcmZwYGsG6CGMrxrR8p3zVBx/4QabcdZg6aRXIxl8YdUCP2P
         hyLA==
X-Gm-Message-State: AOAM531mdP0OpxpbxcrVzg8D8VSwayQIAVsDT3ayKDbHxF8/Fj+HUccc
	ojvvZav67NtDaHZA8RD77auSho5kxI1WLg==
X-Google-Smtp-Source: ABdhPJyXSjhB6LdjxUdBKMKjWamKMBlrK88n1ClqXawEM/Ocesd7AH3J5uJlaMnY+IEck2nLtxP+Bg==
X-Received: by 2002:a1c:7dd8:: with SMTP id y207mr8704089wmc.181.1608392727067;
        Sat, 19 Dec 2020 07:45:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id z15sm19853015wrv.67.2020.12.19.07.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 07:45:26 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] grub: Fix build reproducibility issue
Date: Sat, 19 Dec 2020 15:45:25 +0000
Message-Id: <20201219154525.3995389-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201219154525.3995389-1-richard.purdie@linuxfoundation.org>
References: <20201219154525.3995389-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're seeing reproducibility issue on the autobuilder due to changing
module dependency ordering. Add some sorting to an awk script to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/files/determinism.patch | 24 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
new file mode 100644
index 00000000000..c4b1d3a2a8d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -0,0 +1,24 @@
+The output in moddep.lst generated from syminfo.lst using genmoddep.awk is
+not deterministic since the order of the dependencies on each line can vary
+depending on how awk sorts the values in the array.
+
+Be deterministic in the output by sorting the dependencies on each line.
+
+Upstream-Status: Pending
+Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: grub-2.04/grub-core/genmoddep.awk
+===================================================================
+--- grub-2.04.orig/grub-core/genmoddep.awk
++++ grub-2.04/grub-core/genmoddep.awk
+@@ -59,7 +59,9 @@ END {
+     }
+     modlist = ""
+     depcount[mod] = 0
+-    for (depmod in uniqmods) {
++    n = asorti(uniqmods, w)
++    for (i = 1; i <= n; i++) {
++      depmod = w[i]
+       modlist = modlist " " depmod;
+       inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
+       depcount[mod]++
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d0201036058..49c869b5dc5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://script-Remove-unused-fields-from-grub_script_functio.patch \
            file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
            file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1

