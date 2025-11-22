Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FA0CFD306
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2709.1763849688780720841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1kIosgke;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343ff854297so4550723a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849688; x=1764454488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkOJI6Kf+k0PdeCCmm3KWsblQbv96+CTlJqG2k+c2c8=;
        b=1kIosgke/WGNker+KAIq6mzCXSLhrxzsPCxeFGfLOvAicTWzWdE/hxLRPhMz7hz1k2
         KZc3Ro6p70F9UsoRC+j4OMicDPXwo8ysTzpsrXDURQWdmaAvCv77CsDBpsyE6y1N4BT7
         TVjV8nAfm43NEX/1iWV1ohRp+zFkeWjzecDURwl7FXIQhuZNcoikoDtK1SdaQhBoHUcR
         or7FxctrQdMq6FPqpnvDQEEBz/CaT2QKnFPhe2rX6hocfA29zKJoCAEhvFtas3FBAx2+
         MZLZyEIzVbiuapSNB96/G/o72RR0Fxt409UEP4ylfxUXapEhW+pLw7PqmAcog3CJWLg4
         a7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849688; x=1764454488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkOJI6Kf+k0PdeCCmm3KWsblQbv96+CTlJqG2k+c2c8=;
        b=UcD8I9BqMRUrt3vDoMcoxCPrjxX1SmbvPIF4ECt7xzoj0UBtHagDVZRlUjD4pZmE00
         iMwB5hxv8uPvaiC+8i85fAy6vbUHYASA2S2YqjPVO1YBZhVh32fQc7wYxw0MM5CIuEN3
         KKHDBGWowG9ZSOqfsqgfImwLjHNLfzzlzqiirrl/YElAUE3Zn3KtjqugrPgACXhrTLaG
         pS3d2B2ak+sE234NplHq17ySJjs+hOQwCWk6qDrOpvcNcbPzmMaR7dqhSJHHs2IQRCah
         NxtQAlyhRfqZCk9pc5Ybleb4NKlwucJ9MjwDJG4zl17Gy3bFzc0d8GYS4w4b7JQEuZih
         tQpw==
X-Gm-Message-State: AOJu0YzGEPHUd/FpvZwNZ2AJoJSHhQW7z/FTWNNoLIeUFf6FDN7b0j/7
	KCSUiOyEvXVk4RVM7P1acbUU59lCFNyJzvVAXHKr68ctw6pOomrA/y3vVkvygTHKYvBRrHJMkFq
	OBsc1
X-Gm-Gg: ASbGnctu0uRzR/dk7nNhrwfdRaUdIrj3ES4Y4v360qD250ZE/YBJ1zLm616F9cOeH86
	PrE8lQtMQZG+gg7gNqdpHD/m6teobssqRfCUoEvFgYcNe4b3656HzWqu7ubQctYCkjl2F+bvjqs
	bX5WCNC/biYK3QN1X/JxxFxcAGxYfBO6LpIQPeArj1rhsvDnmD2WigzJTyLkkZNUefqahtzgjKZ
	VLK+aGk/48fWvQ+E4IieynF1ear8CpXAI68uWS5z9HzVhmgNmv8OtOii/jaHAm8dNnn1Ho5FHLr
	r3gKvUqXetNbnxdW0QSudMzk8TYBd1M0MaKeGKza/5f+lly4OKfcbq+MT9fDPFSSvYlS3eh6pu2
	lCMxfs/1Mlj0QQzQ/FP+nhoJCex9RP+YGI6nro2jotIWq4aOzchJrOIPHczfyQW5bkcFmCGY1YJ
	fu4w==
X-Google-Smtp-Source: AGHT+IE02vLyQiDbZT+94zFdlnRWOBFVm2Z8CHpe3WXjooqnjZ79ofX8jk8BmWa3n8ZUuxmqFLKrLw==
X-Received: by 2002:a17:90b:3c8e:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-34733f22173mr8145395a91.18.1763849688031;
        Sat, 22 Nov 2025 14:14:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/21] xwayland: fix CVE-2025-62231
Date: Sat, 22 Nov 2025 14:14:14 -0800
Message-ID: <97326be553f3fec8fbda63a8b38d18f656425b2c.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226706

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was identified in the X.Org X serverâ\x80\x99s X Keyboard
(Xkb) extension where improper bounds checking in the XkbSetCompatMap()
function can cause an unsigned short overflow. If an attacker sends
specially crafted input data, the value calculation may overflow,
leading to memory corruption or a crash.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62231

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-62231.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
new file mode 100644
index 0000000000..8095c3d82c
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
@@ -0,0 +1,50 @@
+From 3baad99f9c15028ed8c3e3d8408e5ec35db155aa Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH] xkb: Prevent overflow in XkbSetCompatMap()
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+CVE: CVE-2025-62231
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index b7877f5..4e585d1 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 9bc67f7761..362b110a0b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-0001.patch \
            file://CVE-2025-62230-0002.patch \
+           file://CVE-2025-62231.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


