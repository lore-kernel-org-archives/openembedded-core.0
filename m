Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05098C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46870.1784723651552148401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L0jcsax9;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2995417a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723651; x=1785328451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl5kDnmptWSvW3cGszFh1bofuhs3I6n528+31ILh8cE=;
        b=L0jcsax9Op2A5AfYanwAXnEFZKeDqhUHxdJUS4Mq2fpKoRAFxJHkJd7fVLNj7VBmFe
         eB2/o0yPi37rDSUvvze4kpX+hgYDcYoVoQYncXcdwVmcuiiZN9pR2wsIGiUqNzP1rjHf
         1dHjxNB94mwSY9Sf+bQ5nIU0gy4LgZlgsmuSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723651; x=1785328451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl5kDnmptWSvW3cGszFh1bofuhs3I6n528+31ILh8cE=;
        b=hBDgMHJcFeItcbnB5zGEPFQYYN1Vdi1nSNV4JBs803T13ll5gegqbXApzM4ULq0hct
         0hIvWrALjM9SJJM76sWf/JqQh7G+ymtb+TDrhDVqN53w9eh+5nwynY/OfwWn57WF/1rC
         OHF8/5w7NhOLclIQsqzajZZ0fqjLrNn6c7OIxvchDk7ImLxNmZNDDjVsgkGjrmr5i2Rd
         WZH2H3udrsIVvtIbbeJEYxd2DSQRGkW9wbrlw5siBzc9QddOI+fv5k/XQRpmwnvGllG9
         Q35Pa+SD/q9fMditVSkmxYU2JODPpN5yb8G1X+02G3iwRVs/qH0vYFhzJtwJ8W9Bs1gH
         8HlQ==
X-Gm-Message-State: AOJu0YyLXX6u8+T2arHMKGopq2nl11pn+USalO65XHuKLQcveTyPgr9q
	QzBT06CBN7+1ktarvJYBtrlMN8i0BtsBX/9BmTdkZSkjpQXvvnAnUN7a+S2om5pnY34HS6pwT/D
	FVAGdsZM=
X-Gm-Gg: AR+sD11w+WsPaFDnPiLZAuPSnXR7NiOB3BfrGVLJ7wjypCdmEQNadi+6I9MLZPbtcua
	VqqPhgqctBfY1dTS3yivIWERiKs8vn5QEjf7FCBflgQtIn/4atCD2Mr0rS4JddUlkSdr5YIpVr5
	84ffgfyrXhFujBlGJ9Ehsg/lJIwNeqy+aOsYQePdRNcJNEGrIf7bKlOazaYl7Jx50FvGGZhxCrM
	u/FY8TMa1OXy+9Iv6kAPNamR0ouPxNVkNW+bdZHtU6UDrGqTJ4C3Req0qCUQNXaxwKqDLLWb0B7
	s9Gzu3O/5yvtTWZEyI+tnUv359fIRMu1+MI0hXVBiF32ByB7Ak2ofFR47xkQy4krj3K3TZq2anA
	/UyuDoCpETnvuRNF4tTGdFtWonuG4EmvbObWwlJ2JWp5L8w38bJVqw7Ozi67hFirEXeOKpnAXPP
	r6UGK40NR3qS89XSv406bBA4DZ5vA=
X-Received: by 2002:a17:90b:3b48:b0:38e:a555:8fc3 with SMTP id 98e67ed59e1d1-38ea5558fffmr3165660a91.41.1784723650730;
        Wed, 22 Jul 2026 05:34:10 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:09 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 05/10] vim: Fix CVE-2026-57454
Date: Wed, 22 Jul 2026 18:03:31 +0530
Message-ID: <20260722123336.587556-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241673

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57454
[2] https://security-tracker.debian.org/tracker/CVE-2026-57454

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-57454.patch            | 188 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57454.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57454.patch b/meta/recipes-support/vim/files/CVE-2026-57454.patch
new file mode 100644
index 0000000000..579ffbf11b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57454.patch
@@ -0,0 +1,188 @@
+From b3faeecc976d3031d7c0675623516ec60c30f949 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/proto/textprop.pro         |  1 +
+ src/testdir/test_textprop2.vim | 60 ++++++++++++++++++++++++++++++----
+ src/textprop.c                 | 36 ++++++++++++++++++++
+ 3 files changed, 90 insertions(+), 7 deletions(-)
+
+diff --git a/src/proto/textprop.pro b/src/proto/textprop.pro
+index a01c2f3b2d..4e6fcc89a4 100644
+--- a/src/proto/textprop.pro
++++ b/src/proto/textprop.pro
+@@ -36,4 +36,5 @@ int adjust_prop_columns(linenr_T lnum, colnr_T col, int bytes_added, int flags);
+ void adjust_props_for_split(linenr_T lnum_props, linenr_T lnum_top, int kept, int deleted, int at_eol);
+ void prepend_joined_props(unpacked_memline_T *um, linenr_T lnum, int last_line, long col, int removed);
+ bool text_prop_count_valid(int prop_count, size_t propdata_len);
++bool text_prop_vtext_valid(char_u *props, int prop_count, size_t propdata_len);
+ /* vim: set ft=c : */
+diff --git a/src/testdir/test_textprop2.vim b/src/testdir/test_textprop2.vim
+index 48387d1c04..689096209c 100644
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
++    \ + repeat(0z00, 32))
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
+index 931fb78d25..463a477e4d 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -118,6 +118,13 @@ um_goto_line(unpacked_memline_T *um, linenr_T lnum, int extra_props)
+     proplen = (int)prop_count;
+     props_start = count_ptr + PROP_COUNT_SIZE;
+ 
++    if (!text_prop_vtext_valid(props_start, proplen, propdata_len))
++    {
++    emsg(e_text_property_info_corrupted);
++    um->buf = NULL;
++    return false;
++    }
++
+     um->props = ALLOC_MULT(textprop_T, proplen + extra_props);
+     if (um->props == NULL)
+     {
+@@ -1246,6 +1253,12 @@ get_text_props(buf_T *buf, linenr_T lnum, char_u **props, int will_change)
+     iemsg(e_text_property_info_corrupted);
+     return 0;
+     }
++    if (!text_prop_vtext_valid(text + textlen + PROP_COUNT_SIZE,
++		       (int)prop_count, propdata_len))
++    {
++    emsg(e_text_property_info_corrupted);
++    return 0;
++    }
+     *props = text + textlen + PROP_COUNT_SIZE;
+     return (int)prop_count;
+ }
+@@ -3239,4 +3252,27 @@ text_prop_count_valid(int prop_count, size_t propdata_len)
+ 	    <= propdata_len - PROP_COUNT_SIZE;
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
++    textprop_T  prop;
++
++    mch_memmove(&prop, props + (size_t)i * sizeof(textprop_T),
++			      sizeof(textprop_T));
++    if (prop.tp_id >= 0 || prop.u.tp_text_offset <= 0)
++	continue;
++    if (prop.tp_len < 0 || (size_t)prop.u.tp_text_offset
++		+ (size_t)prop.tp_len + 1 > propdata_len)
++	return false;
++    }
++    return true;
++}
++
+ #endif // FEAT_PROP_POPUP
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b9acb4665a..82f63f6067 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55895.patch \
            file://CVE-2026-57453.patch \
            file://CVE-2026-57451.patch \
+           file://CVE-2026-57454.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


