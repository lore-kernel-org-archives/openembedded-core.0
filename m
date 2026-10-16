Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4403BCCF2CA
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5940.1792189487381220245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=URpVIqeR;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so186885f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189486; x=1792794286; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e2g6WU7J6G4HsgVi/axOovkgFrSDGaEQ1xSZhEB2Qo=;
        b=URpVIqeRgIqVmmDP9GaHk6bi/at2+LJ42x+a7TJ2VVOM7RFgv4lMN6Wo93C42Gvvsq
         YHdrwxyp7GlvLEYMDXXBe8z0bBgC/oLUm1NPoOkkbKffKJ8seeqHteh6AAPi1oXEFMIR
         T7joGP1VhDIC88XXCq6VW1TO2EkRJSsiivWBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189486; x=1792794286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e2g6WU7J6G4HsgVi/axOovkgFrSDGaEQ1xSZhEB2Qo=;
        b=xqL92vIUHjADXeQ/mAM7gim8/JEwnylh7G3ZpowQ9V5soXPVu+9ns8p/H/CftX22RH
         3zPM72JJa2SoxLPfyU8szNoRiKXDk74nhsTD9Db8XgshJpNRQPlFxsoz9XJghmg40F07
         NKQnBpAxPsH2jBbmmVjCaD25WZ5CV0+x5Imw62+AYvjvf9kJR4gbTQ/T15b9kDAUrEmk
         pj+vpV0BXiJAOJLJ+6icT7ojdKHMvwkkkXveims5j554mYtJRYwA/htqIxg2+rR6tVxu
         X3kjx1eQRo6UhJdhDNqKMjbtJbO8y0OhXIAoHZ2eUeTWiEZi/hFZR0HfdDKnzgyR/q2P
         Emlg==
X-Gm-Message-State: AFq9FYIioaQVcHc7Xic4+6CmeBJQXk8esn4nF0OoyIsy+boslAru2bV+
	hzkS853rJF1abKbRHx3sD0B00jrw6+u24jGKUiV9HvGkbrOrwL3YmX0VzlpqciRRdtO7dzyXG5I
	mhGD8aJo=
X-Gm-Gg: AYBFou2cYkhLtgOjC5wGNVDoo4/lRfvIEqu1e9HhQcWnHnl/Oahft2OOPgur+Qhed84
	9bYVN53Z9zZopAsYqsu0o30V4nGKeDBAzc+VOd8TDQ5HcmgebbyL+K6jFw58l4l2biLuMAMP6Vc
	p5Lt+0Mh12i6uSFQTMl800P7SGMPYOKB9ii1gMQPsPbbUjukofj2eZ4ocq18Ka37ZJnYkecdPzf
	lEmSrhYplAjOteKkRnNtwGjA9nglnYVJNmVWQj4jc2Owqf8E3SHqwqWsD7b3ky0YMGBqtiMGOF9
	7GjbUqWPKzlKN7O3oiJfVycv+xmher2YiTGX3xXHh7A2CMuklxX6SmBPELj3Xj1x31hzP8BzMpm
	kSWx8tMBpxv1vd6GmPde4wSwS6Tlofwgkiocj4wi6yPDGLvRqey60mkuNcIfmYhU06ckwvnUNvn
	9hkqfIHbFDQnCuSPmIrqhTluWH51JG7bhlVIVzuXQzKXSegsUcsYu53B0SF9D8q0vG2c2pWZRRX
	SDLY3dSFgGciQ7EJEsQLahlp1EWb9ppWMDAkjQEdWn65zccN501JWO1ZBe8YdQiNyude0oKMw==
X-Received: by 2002:adf:e852:0:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e07fbc344mr1187685f8f.26.1792189485521;
        Fri, 16 Oct 2026 15:24:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 09/17] gcc: Fix for CVE-2026-102010
Date: Sat, 17 Oct 2026 00:24:11 +0200
Message-ID: <9ab7d27d71fb345ca1b9cf9760ee12ee023f8a4a.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248059

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

PR 127656 use-after-free in libstdc++ pbds binary heap erase_if

After reallocating the storage the m_a_entries pointer is left dangling
and the new storage is leaked. Update m_a_entries after reallocation

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-102010
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127656
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: afc275bd17dea41c2ea6a5c73c697052c2df4e38)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |  1 +
 .../gcc/gcc/0026-CVE-2026-102010.patch        | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 818dea8ac5a..3497493619e 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
+	   file://0026-CVE-2026-102010.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch b/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
new file mode 100644
index 00000000000..407119c0765
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
@@ -0,0 +1,71 @@
+From aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: [PATCH] libstdc++: Fix use-after-free in pbds binary heap
+ (CVE-2026-102010) [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+        PR libstdc++/127656
+        * include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+        (erase_if): Update m_a_entries after reallocation.
+        * testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+        New test.
+
+CVE: CVE-2026-102010
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+
+Reviewed-by: Tomasz Kamiński <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ .../detail/binary_heap_/erase_fn_imps.hpp     |  1 +
+ .../regression/priority_queues_erase_if.cc    | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+index 2e70ed5c663..80d2cccbbf0 100644
+--- a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
++++ b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+@@ -121,6 +121,7 @@ erase_if(Pred pred)
+       entry_pointer new_entries = s_entry_allocator.allocate(new_size);
+       std::copy(m_a_entries, m_a_entries + left, new_entries);
+       s_entry_allocator.deallocate(m_a_entries, m_actual_size);
++      m_a_entries = new_entries;
+       m_actual_size = new_size;
+       resize_policy::notify_arbitrary(m_actual_size);
+     }
+diff --git a/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+new file mode 100644
+index 00000000000..30b8452eff9
+--- /dev/null
++++ b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+@@ -0,0 +1,19 @@
++// { dg-do run }
++
++// CVE-2026-201020 use-after-free in binary heap erase_if
++
++#include <ext/pb_ds/priority_queue.hpp>
++
++bool is_odd(int v) { return v & 1; }
++
++int main()
++{
++  using __gnu_pbds::priority_queue;
++  using __gnu_pbds::binary_heap_tag;
++  priority_queue<int, std::less<int>, binary_heap_tag> q;
++  q.push(1);
++  q.push(2);
++  q.push(3);
++  q.erase_if(&is_odd);
++  q.clear();
++}
+-- 
+2.49.0

