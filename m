Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC7C9830E
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2916.1790154693925546282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YNHw+zUY;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so4799635e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154692; x=1790759492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sv0q27QkT2mfynJsq6Dy7HtAfJhNKIgeTdRHLn5K6AY=;
        b=YNHw+zUYLAdob9ziwpQO1+FV3Voc2EBK/Gx/GEiE6fCqO4gvHIFzyBsKgi+dKblERI
         eIl+IhRRfRuhuMZzLOBAROHTivhqt7QH9/2UZrIkUmwpgfxqUVS1G+p5fZya/E6e0J4W
         baNatvBOI2+ZprRvBsYN66M9FZBmDNg3hHJQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154692; x=1790759492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sv0q27QkT2mfynJsq6Dy7HtAfJhNKIgeTdRHLn5K6AY=;
        b=0Eu3oMeWtRmSnNkhn8JSKE60nDvkvWOS9vV9VIxtwzLJZI7iCGJhWZC/zt3aJckWlC
         Lse/AGVEOU3oUnXMSXfa+tiEqeenkD5jUc8XfRPuauqrFHHhowUNc9pnCusD1gChdxCH
         j8NnLiBwmK364kvVx/Ok3KXNW8qVVoDVkv9VOd3s1/KML9SUKHGGliHWZZ7omxmqpuNv
         rwnoGFD40F1xXSEkv+KkIyARvsoB5IVEGgJIzgxPRBvI4alKSYkzc/6Zx/OH3+Lbfb21
         KVD3g7qrZT+HooYJT9LpARHPTaPC1oiuMl4tDSH5AmYpKAlDC8pEYNJRzFXtIpeFR0Xi
         8mOQ==
X-Gm-Message-State: AFuF++kly/XdxdQBcAtvA0YabOmwEDhvHNUkWMk6FxXaHE3/T+CBZcgC
	gUMLYSjLWruer1jHem8AmqOt2ghTu+UlwEP3fFFK7ZoaZcIPofqA86OMRTdbhl9l89p+uCw3F72
	kpgNnvUg=
X-Gm-Gg: AYBFou2/V1LRH9qLrYRYEOU1MiOSbxUnIbiSBXl53We+/MTRcD/y/FJWOjBs/YSJC83
	a7pCctZfafkwj0S15mPadFHmxbOxkaSREHVz9WKgyFXvEEv9XbYmpaASNKcH+wkb2Hewer6xlTY
	RX+zIPSx+NegzSwJHGpVOoMGBnmWFFNu6JIVCir8dlvFpqMcAIxzjiHENvRodUSAu/gG8k+KfDh
	23CFrY700c+GbAFBvPSG9fU/pieBc1jBxrOMOD/ayoaKIXIF3AdFnr+OVNK6OHB51jN0KS7I/eD
	ZtPJ772xZNjS0zwuFlIch9StcmUn+lUMEq05Gmp8U1Vqc54oV7DIgHfjE9g4Iop0QfkckHpD3iA
	bnudOjVwbjUPwfsNEAyJc2vkEOfxWiJIr7VVTewaHXvwSf1lkCOhgtuISpkds2cp8ufFqvE8lhy
	9NYiFpAufUFmfFgfOmqGjkIhUoPC7CnYaszivRQI7c7PeDORDh4/Pr/uhWyVmnl2HODW3egk7Uy
	S/3VJX8FipfVVxnoV04llQnBQm/cM4IMjxbJsajANuuCqG3Vxj7JJI17WK1jL1KYrLabM9RSzeQ
	fL2dHm0=
X-Received: by 2002:a05:600c:1d1a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fdec98769mr25087755e9.0.1790154692165;
        Wed, 23 Sep 2026 02:11:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/48] vim: Fix for CVE-2026-73074
Date: Wed, 23 Sep 2026 11:10:15 +0200
Message-ID: <61f5f1268344dac4696f6390e4a81b6ed324fd34.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246475

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73074

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73074.patch            | 101 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73074.patch b/meta/recipes-support/vim/files/CVE-2026-73074.patch
new file mode 100644
index 00000000000..3402b72bd27
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73074.patch
@@ -0,0 +1,101 @@
+From a9336b476fd1a182e3f79b5f83c0ffb04f8a922b Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Thu, 23 Jul 2026 20:14:13 +0000
+Subject: [PATCH] patch 9.2.0841: [security]: heap overflow when adding > 65535
+ text properties
+
+Problem:  [security]: heap overflow when adding > 65535 text properties
+          (Wang1rrr).
+Solution: Verify that the number of text properties falls within the
+          limit (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-hm4g-pjfx-m27j
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73074
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/errors.h                  |  4 ++++
+ src/po/vim.pot                |  3 +++
+ src/testdir/test_textprop.vim | 18 ++++++++++++++++++
+ src/textprop.c                |  7 +++++++
+ 4 files changed, 32 insertions(+)
+
+diff --git a/src/errors.h b/src/errors.h
+index 01ed16a035..5354e85f25 100644
+--- a/src/errors.h
++++ b/src/errors.h
+@@ -3795,3 +3795,7 @@ EXTERN char e_socket_server_failed_connecting[]
+ EXTERN char e_socket_server_unavailable[]
+ 	INIT(= N_("E1567: Cannot start socket server, socket path is unavailable"));
+ #endif
++#ifdef FEAT_PROP_POPUP
++EXTERN char e_too_many_text_properties_on_a_single_line[]
++	INIT(= N_("E1580: Too many text properties on a single line"));
++#endif
+diff --git a/src/po/vim.pot b/src/po/vim.pot
+index be79cf0dab..100344e270 100644
+--- a/src/po/vim.pot
++++ b/src/po/vim.pot
+@@ -8838,6 +8838,9 @@ msgstr ""
+ msgid "E1567: Cannot start socket server, socket path is unavailable"
+ msgstr ""
+ 
++msgid "E1580: Too many text properties on a single line"
++msgstr ""
++
+ #. type of cmdline window or 0
+ #. result of cmdline window or 0
+ #. buffer of cmdline window or NULL
+diff --git a/src/testdir/test_textprop.vim b/src/testdir/test_textprop.vim
+index b5c9f63f65..5a69ca75e7 100644
+--- a/src/testdir/test_textprop.vim
++++ b/src/testdir/test_textprop.vim
+@@ -4781,4 +4781,22 @@ func Test_textprop_materialize_list()
+ 	call assert_equal([], prop_list(1, #{ids: 3->range()}))
+ endfunc
+ 
++" Adding more than 65535 text properties to one line must be rejected instead
++" of wrapping the uint16_t property count and overflowing the allocation.
++func Test_prop_add_over_uint16_max()
++  CheckNotAsan
++  CheckNotValgrind
++  new
++  call setline(1, 'x')
++  call prop_type_add('overflow', {})
++  for _ in range(0xffff)
++    call prop_add(1, 1, {'type': 'overflow', 'length': 0})
++  endfor
++  call assert_equal(0xffff, prop_list(1)->len())
++  call assert_fails("call prop_add(1, 1, {'type': 'overflow', 'length': 0})", 'E1580:')
++  call assert_equal(0xffff, prop_list(1)->len())
++  call prop_type_delete('overflow')
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/textprop.c b/src/textprop.c
+index a06605d3dd..1f06615dbc 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -240,6 +240,13 @@ prop_add_one(
+ 	proplen = get_text_props(buf, lnum, &props, TRUE);
+ 	textlen = buf->b_ml.ml_line_len - proplen * sizeof(textprop_T);
+ 
++	// prop_count is a uint16_t; stop before proplen + 1 wraps to zero.
++	if (proplen >= 0xffff)
++	{
++	    emsg(_(e_too_many_text_properties_on_a_single_line));
++	    goto theend;
++	}
++
+ 	if (lnum == start_lnum)
+ 	    col = start_col;
+ 	else
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3e90908264a..9ea050650f3 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57456.patch \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
+           file://CVE-2026-73074.patch \
            "
 
 PV .= ".1683"

