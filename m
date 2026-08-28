Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB35CC61DDE
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2980.1787945895514389382
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MoY8++z9;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10878305e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945894; x=1788550694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhM7ew+A8Ci4z0oBHUjWbGqKh7XsvO1UXFOKR/T3Auk=;
        b=MoY8++z9Tpdz1dsiOdMrRq6n2TWU+RrySzBEqWF3jkSuVaBtbZgfgDwd0fk1PV5ddf
         Ou9FlllAG4xExZaTwe1jJCrZ1QoGIt/PQwKw5BpresFxHidfcrsPVdJTntDfR3iJ+dO0
         cukqHf8UWIsa3EWTuvkpKzN5NerX5uo0NNeoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945894; x=1788550694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qhM7ew+A8Ci4z0oBHUjWbGqKh7XsvO1UXFOKR/T3Auk=;
        b=pLekBMUtZT0gLFzByYYFhnwACnBRdiiGO8hpxUAxb5Ukr/P4YUSgfoUsvtb2m6oznV
         01qy5f9BKVgHSxN5OMNxYXJy9yNEhrPAtlUcBzHtcpAvhIuxRtUp1HXaPmWYzeJG/D8e
         phcgmTCQFncvq013odIAhrBw7MCEolCZrUD7cshRd7xAYxaDEeklKzqhAVXPjplOvoSQ
         2Xyaj+rUcdoO+ASoeDZgErxzJwrcXtQBfR+Y10RrwtbTZBFWdUSQhQFRCcGjZYGLD9gQ
         vwnaTst1Mj0IiyhnqvkmyzJfBE8IW0tAW+JAdkboJE4QWv1WTro4mp9zsBPsIkk4xoV5
         jTjQ==
X-Gm-Message-State: AFuF++l1OAy7u3zQYrkz66PbxlbYPoluz9v1Dfc5eVe3QGx9wSgc1asW
	hUtOHr7Oc//2e56CwyRGcMypixqY1uMMZGAxyvGct6QjHaPH3divbq0q/INsLZSvxembkdGblae
	WzevcytY=
X-Gm-Gg: AR+sD12q60NfyPv5bvl35GDk1HggTBFny7ie9X17Vs1+l3yJ582YTLKIYuvEUmRhOIn
	XOE6oAmwdD7LAjQJrjiq0rGSg+i+yUVgSag9d8zvCICX1b7g/tEJWY7iqzfTG7MEVzlgH0V85W+
	AQfY4f1Wq2lWTD6qFTsSwlN5KXMQVunP34ia4CulewXxTm4e4/P95dWTJMdnXhuQE8kymOAytU6
	WfF6Tf5ejuV6D1Sv3+9ROygPKQfIbp5RDaZL4hcjeCDVDXAqmhnjz//09RZCIzQowDbVdVyCNWM
	CVAt/CuvuTo2HwjEvspQmveq1/N9jcoc+82eijM3LD2ugsx75YUeopbSAkBpBL3xyfa6cz8fYrg
	Gm8mpLGO9BjmhIIur2qkC728BizvaUWHtVBc0HLdVat8veaSQa3KM8A1n91e0ZkUIyhbNUT62/L
	QWhsVlexNORkrdxh//994JQ+Q0asWPx70xRWfyQTwSzwEGjMrzj4jPK0Ril4s843GIXVXGUboCT
	DXnohBJ2cs9wqhykDpWBcnjG8e2sahGyasFEzgwq5oWjUJMGgf4cvBV5zMXtWoE6VUv2qIQuoU=
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr154264695e9.9.1787945893577;
        Fri, 28 Aug 2026 12:38:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/56] vim: Fix for CVE-2026-57454
Date: Fri, 28 Aug 2026 21:35:27 +0200
Message-ID: <57b6271f7941324ea8c617bba025ee4751686b8c.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244578

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/b3faeecc976d3031d7c0675623516ec60c30f949
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57454

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57454.patch            | 203 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57454.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57454.patch b/meta/recipes-support/vim/files/CVE-2026-57454.patch
new file mode 100644
index 00000000000..00af91067bf
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57454.patch
@@ -0,0 +1,203 @@
+From a3eac666d37ccedb32ad3b0a6b86882208eb6b50 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Sat, 20 Jun 2026 16:06:58 +0000
+Subject: [PATCH] patch 9.2.0679: [security]: Out-of-bounds read with text
+ property virtual text
+
+Problem:  [security]: Out-of-bounds read with text property virtual text.
+          A crafted undo file can declare a virtual-text property whose
+          offset points outside the line's property data, so reading the
+          virtual text reads out of bounds.  This completes the count-only
+          check added in 9.2.0670.
+Solution: Validate the virtual-text offset and length of each property
+          against the available property data before turning the offset
+          into a pointer.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-ww8h-47xp-hp4w
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b3faeecc976d3031d7c0675623516ec60c30f949]
+CVE: CVE-2026-57454
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/proto/textprop.pro         |  1 +
+ src/testdir/test_textprop2.vim | 60 ++++++++++++++++++++++++++++++----
+ src/textprop.c                 | 36 ++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 4 files changed, 92 insertions(+), 7 deletions(-)
+
+diff --git a/src/proto/textprop.pro b/src/proto/textprop.pro
+index a01c2f3b2..4e6fcc89a 100644
+--- a/src/proto/textprop.pro
++++ b/src/proto/textprop.pro
+@@ -36,4 +36,5 @@ int adjust_prop_columns(linenr_T lnum, colnr_T col, int bytes_added, int flags);
+ void adjust_props_for_split(linenr_T lnum_props, linenr_T lnum_top, int kept, int deleted, int at_eol);
+ void prepend_joined_props(unpacked_memline_T *um, linenr_T lnum, int last_line, long col, int removed);
+ bool text_prop_count_valid(int prop_count, size_t propdata_len);
++bool text_prop_vtext_valid(char_u *props, int prop_count, size_t propdata_len);
+ /* vim: set ft=c : */
+diff --git a/src/testdir/test_textprop2.vim b/src/testdir/test_textprop2.vim
+index 48387d1c0..5f8f87e29 100644
+--- a/src/testdir/test_textprop2.vim
++++ b/src/testdir/test_textprop2.vim
+@@ -428,14 +428,12 @@ func Test_multiline_prop_delete_penultimate_line()
+   call s:CleanupPropTypes(['1', '2', '3'])
+ endfunc
+ 
+-func s:ManipulateUndoBlob(name)
+-  " Patch the saved old line in the undo file:
+-  "   00 00 00 08 'QQQQQQQQ'  ->  00 00 00 27 'AAAA' NUL count=0xFFFF <32x00>
+-  " i.e. textlen 8 text-only  ->  39-byte blob: text "AAAA", NUL, prop_count
+-  "   0xFFFF, one zeroed textprop_T(32).  propdata_len becomes 34, count 65535.
++func s:ManipulateUndoBlob(name, repl)
++  " Replace the saved old line (00 00 00 08 'QQQQQQQQ') in the undo file with
++  " the crafted "repl" blob, then read it back in.
+   let blob   = readfile(a:name, 'B')
+   let marker = 0z000000085151515151515151
+-  let repl   = 0z000000274141414100FFFF + repeat(0z00, 32)
++  let repl   = a:repl
+   let mlen   = len(marker)
+   let idx    = -1
+   let i      = 0
+@@ -466,7 +464,10 @@ func Test_textprop_undo_bad_prop_count()
+   let &ul = &ul
+   call setline(1, 'BBBB')           " undo step saves old line 1 = "QQQQQQQQ"
+   wundo Xtpundo
+-  call s:ManipulateUndoBlob('Xtpundo')
++  " 39-byte blob: "AAAA" NUL count=0xFFFF, one zeroed textprop_T(32).
++  " propdata_len becomes 34 while the count claims 65535 properties.
++  call s:ManipulateUndoBlob('Xtpundo', 0z000000274141414100FFFF
++	\ + repeat(0z00, 32))
+ 
+   undo
+ 
+@@ -487,4 +488,49 @@ func Test_textprop_undo_bad_prop_count()
+   call delete('Xtpundo')
+ endfunc
+ 
++" A crafted undo file can restore a line whose virtual-text property declares an
++" out-of-range tp_text_offset.  Turning that offset into a pointer and reading
++" the virtual text would read past the line buffer.  Restore such a line and
++" force a consumer; reaching the asserts (no ASan abort / crash) means the
++" offset is bounded.
++func Test_textprop_undo_bad_vtext_offset()
++  CheckFeature persistent_undo
++
++  new
++  call setline(1, ['QQQQQQQQ', 'DECOYLINE'])
++  let &ul = &ul
++  call setline(1, 'BBBB')           " undo step saves old line 1 = "QQQQQQQQ"
++  wundo Xtpundo
++
++  " One textprop_T for a virtual text prop (tp_id < 0) whose tp_text_offset
++  " (0x00100000) points far past the 34-byte property data.  The count (1) is
++  " valid, so only the offset/length check can reject this.
++  let prop  = 0z01000000          " tp_col = 1
++  let prop += 0z04000000          " tp_len = 4
++  let prop += 0zFFFFFFFF          " tp_id = -1 (virtual text)
++  let prop += 0z00000000          " tp_type = 0
++  let prop += 0z00000000          " tp_flags = 0
++  let prop += 0z00000000          " tp_padleft = 0
++  let prop += 0z00001000          " u.tp_text_offset = 0x00100000
++  let prop += 0z00000000          " union upper bytes
++  call s:ManipulateUndoBlob('Xtpundo', 0z000000274141414100 + 0z0100 + prop)
++
++  undo
++
++  " Safety: prove the malicious line was actually restored before the consumer
++  " runs, so the test can't pass vacuously if the patch missed.
++  call assert_equal('AAAA', getline(1))
++
++  call prop_type_add('Xtp', {})
++  call prop_add(2, 1, {'type': 'Xtp', 'length': 1})
++
++  " this caused OOB read, now it is rejected as a corrupted (untrusted) undo
++  " file with a catchable error
++  call assert_fails('call prop_list(1)', 'E967:')
++
++  call prop_type_delete('Xtp')
++  bwipe!
++  call delete('Xtpundo')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/textprop.c b/src/textprop.c
+index 6b0ce45f2..5959ecc45 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -118,6 +118,13 @@ um_goto_line(unpacked_memline_T *um, linenr_T lnum, int extra_props)
+     proplen = (int)prop_count;
+     props_start = count_ptr + PROP_COUNT_SIZE;
+ 
++    if (!text_prop_vtext_valid(props_start, proplen, propdata_len))
++    {
++	emsg(e_text_property_info_corrupted);
++	um->buf = NULL;
++	return false;
++    }
++
+     um->props = ALLOC_MULT(textprop_T, proplen + extra_props);
+     if (um->props == NULL)
+     {
+@@ -1246,6 +1253,12 @@ get_text_props(buf_T *buf, linenr_T lnum, char_u **props, int will_change)
+ 	iemsg(e_text_property_info_corrupted);
+ 	return 0;
+     }
++    if (!text_prop_vtext_valid(text + textlen + PROP_COUNT_SIZE,
++					   (int)prop_count, propdata_len))
++    {
++	emsg(e_text_property_info_corrupted);
++	return 0;
++    }
+     *props = text + textlen + PROP_COUNT_SIZE;
+     return (int)prop_count;
+ }
+@@ -3239,4 +3252,27 @@ text_prop_count_valid(int prop_count, size_t propdata_len)
+ 		    <= propdata_len - PROP_COUNT_SIZE;
+ }
+ 
++/*
++ * Return true when every virtual text property's offset and length stay within
++ * "propdata_len", so tp_text_offset can be safely turned into a pointer.
++ * "props" may be unaligned.
++ */
++    bool
++text_prop_vtext_valid(char_u *props, int prop_count, size_t propdata_len)
++{
++    for (int i = 0; i < prop_count; ++i)
++    {
++	textprop_T  prop;
++
++	mch_memmove(&prop, props + (size_t)i * sizeof(textprop_T),
++							  sizeof(textprop_T));
++	if (prop.tp_id >= 0 || prop.u.tp_text_offset <= 0)
++	    continue;
++	if (prop.tp_len < 0 || (size_t)prop.u.tp_text_offset
++				+ (size_t)prop.tp_len + 1 > propdata_len)
++	    return false;
++    }
++    return true;
++}
++
+ #endif // FEAT_PROP_POPUP
+diff --git a/src/version.c b/src/version.c
+index 4d6908426..80d3cc7f5 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    679,
+ /**/
+     678,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 56a2004899a..93b8ba39700 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55895.patch \
            file://CVE-2026-57451.patch \
            file://CVE-2026-57453.patch \
+           file://CVE-2026-57454.patch \
            "
 
 PV .= ".0340"

