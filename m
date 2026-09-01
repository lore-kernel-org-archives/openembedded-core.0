Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C93C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:45:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2558.1788248726972160284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fq5LiR84;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398e9698a70so714263a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788248726; x=1788853526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgs7m4vC0GjPrMexqfZPrByswlfHGa+nqTNH780ZgSc=;
        b=fq5LiR84RUpXYaUP4JBqSGfqlOwppyWhBcJSYL4YkUI8ZF/r6zbP9FKUcDo5uQBW39
         sM6nVCwRYPYMxRU1mtdVTMzRV3jcJsMRIP+tmchYnKzLLC/rq6orc1BMHRRXxUujCAKa
         KvFRgkxUAFAZckxvYnS4dcPwn6SX4U16NEQQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248726; x=1788853526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgs7m4vC0GjPrMexqfZPrByswlfHGa+nqTNH780ZgSc=;
        b=hEDW82FuJb7DfzeVbJQOOkWlOwlC/8g/wa5Wkg9YAOi1zD3gRIaDRe+GTShBJKpxxr
         jJPuA8Wm0H3KXdSDn/hnWhDN3hEEe9zH/BdtX+IJLJfcQ3z26r6NXctAUZCe6Mdp4bWm
         lI8tfYUd0wLGNYlikZBPLnMynkEH0rAOK2yhXkkBJmemkB0Ax7Lard6hVEaBv/ML6CAj
         UEovu1vF0hpK+HiVkm2M/tWVnPqTEkL9nuENCeHdbYbtyXBxY3exRJUvousdqcIKVpHZ
         7nPi4is94CC24pw5IlDxXNa6m0wo2wszGXVN9HMM/h+5MezXpn3JTRxTVs6VzHf1Rq9k
         sc+A==
X-Gm-Message-State: AFuF++ks8XF61+oQyJnljDbf+l1HtVCqOcg7RJMQ0OZJmQMjSCHR/UOA
	eSIlt3xtUjDQmGWgndYC1ZLsRNxz4AUUQ1wlDQPQfn/zK7bFLUdaz2lbz2x+T5Bb9YzbJuxnAuG
	c+ZXNoN8=
X-Gm-Gg: AYBFou3BEkigoqyFnYpFUSA6ct7jp7r6Fcvod3dRg6XDlqJ1WCxseFhYgFRJUH6GB0e
	oFI9YV2iKcaM/+XBUYw3Ea42Rz228jBGU+xAz55C/ldljNEIpyL9/y2VFK01LTCxvUOSE6xrAKO
	J1UiUvzt/cNT0s4QSS5pnwueYT2eU6gULNFYl1BtyPSXcH3T6P/B9tycOi7M9T4RQqu1FLLmX9m
	cYS3wdmtygMWUktAyWJei9jN7Y+rmrreS4Yr7qCiv4x9PVFl870gwUX/VNWu/vNLnpK/bOcytKr
	t0a2KOSOhMEDar67Q+b4+p6ab1lwdz6m3hEboNXQKVOPUUKqk38PIfSXp6S+MVfyLntWebwVWfH
	f0EMVHQncsD9qBcR2J9gYSuEXO/D9445XOwZT/pYo/rULGewgA23I02NOncNno7JNRAGKsZgIad
	ikOcKV3NVLMTLzivYYGyrgBfdnO68nVnsqGpqkHHrXdESJUxRrYm/z0EbXk0exiJwxu5AvP+a0A
	w==
X-Received: by 2002:a17:90a:b8f:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-398d292ea0emr14127345a91.24.1788248726188;
        Tue, 01 Sep 2026 00:45:26 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm47564414c88.12.2026.09.01.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:45:25 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 3/3] vim: Fix for CVE-2026-73074
Date: Tue,  1 Sep 2026 13:14:44 +0530
Message-ID: <20260901074444.59811-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901074444.59811-1-hprajapati@mvista.com>
References: <20260901074444.59811-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244804

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73074

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73074.patch            | 101 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73074.patch b/meta/recipes-support/vim/files/CVE-2026-73074.patch
new file mode 100644
index 0000000000..3402b72bd2
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
index c000f5b3ab..82697e68ab 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -53,6 +53,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
+           file://CVE-2026-73074.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


