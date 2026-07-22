Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DC7C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:14 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46867.1784723647363264026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eXj0DD6E;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381216921aaso11712805a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723647; x=1785328447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Veno6ShKG5PMVdxdCu21m7iEmq4QTTViKU1RCtzXME=;
        b=eXj0DD6Ec3vxsPWGMeDCKbNj1JRGCbxxhZtfvK4NlRj9tENe9InY6hsu0WT1yRkgsW
         hz+dZb8fTAaZn2DcYmd5uVvH+kwpX0S6A518YI9lIKPIEOHOTnS01z1G3yVru4vBlcSn
         3+geUGe2y4nOZeWmqUQaj5/T3t5zFV7Ip39UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723647; x=1785328447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Veno6ShKG5PMVdxdCu21m7iEmq4QTTViKU1RCtzXME=;
        b=N9VzaBfv+ho5egDBOHGwHQJJpd4ViZAnT8UMQcZageNpd/p8BI/bvKbo6PQqE+3QAy
         CwIw8bGBL4XX1VVMaFbiLtnj+0RKOL3fyDfvpCPJI72pkUMIsmKPMTf3Of5rNHlolb2y
         8i98kmPlWxH+eDygHuNPT21R3ISNRrW6coP2Qh1Yy+hLlZ2qoEJGVyFAuB3haq56dhEC
         F4W9xt7lVOwfxLoXqzvH7feZvblUSXUtnP3JqGOdnR/Na+2vxSWNJyBhh7gXNLcH/2v1
         IDnCOjkObaU5VO1bm74+GI+EhjwTksqhfYp/Pa2vd4HkMWvz/1YW3yPewcEj9LltJh/E
         Ac7w==
X-Gm-Message-State: AOJu0Yw+oHbi9x9mRP2bT7k18vV7UF2RjA+p0b4Ktvfvjp/9Fq5RSikV
	Md4gf0A6Fx6sUTqp8t2kJKwxr11rPcDAyiIp6u1Wj/qO+8o5Wp30YdabcvXCtlrAGM6HfVQdrx5
	FtF0k7EA=
X-Gm-Gg: AR+sD11ql9SYj6WjPSo03YqhcaC0MH7RtAwEF7llMyP/o8AYXv0qCCKovnABkdJ56Fo
	m03Oy9FF9zO4qMKBj4nv2bhMu9I7w6K2Pww+8njK8DYMmgCo6+N33uiNVGEuMfN+LCzuoq6wWOZ
	A/AxYFLezqal5bSMYX61ccbn1pqiTb1942dWM8H5u0NE2kN8RODapdzDZeDk0ZbE8V858fROIWA
	wvWGP4cqdFRxxhJ4M7OWN13mJ6EGZObXYoKQ1OhzDzmy5TsDaZnXcVGt001XzCX0suxTNcgyuro
	fpIZ9kuawud9LdzbHDXLKlL5Oc7xByMovEu0L19KXskW3oKQKZlGryRJfYZ68TWIZxNSafyO0yO
	fkGNAaJQkx0spL/1wYkJYvHzuMprfWLM2GDGCi3Qa9w76CJCco40BCKulPFAX2zFTtoNVgOfNsp
	DrGEItyToChW6bsKtS
X-Received: by 2002:a17:90b:2407:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38e57a3f788mr14681178a91.13.1784723646619;
        Wed, 22 Jul 2026 05:34:06 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 04/10] vim: Fix CVE-2026-57451
Date: Wed, 22 Jul 2026 18:03:30 +0530
Message-ID: <20260722123336.587556-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241672

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57451
[2] https://github.com/vim/vim/security/advisories/GHSA-f36c-2qcp-7gpw

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-57451.patch            | 177 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57451.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57451.patch b/meta/recipes-support/vim/files/CVE-2026-57451.patch
new file mode 100644
index 0000000000..22a0cfc03e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57451.patch
@@ -0,0 +1,177 @@
+From b2338ca90643e2f01ecb6547c1172716aaec4f79 Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Wed, 17 Jun 2026 21:06:59 +0000
+Subject: [PATCH] patch 9.2.0670: [security]: Out-of-bounds read with text
+ properties
+
+Problem:  [security]: Out-of-bounds read with text properties
+          (cipher-creator)
+Solution: Add out-of-bound checks (Yasuhiro Matsumoto)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-f36c-2qcp-7gpw
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b2338ca90643e2f01ecb6547c1172716aaec4f79]
+CVE: CVE-2026-57451
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/memline.c                  |  7 ++++
+ src/proto/textprop.pro         |  1 +
+ src/testdir/test_textprop2.vim | 59 ++++++++++++++++++++++++++++++++++
+ src/textprop.c                 | 20 ++++++++++++
+ 4 files changed, 87 insertions(+)
+
+diff --git a/src/memline.c b/src/memline.c
+index c15946a6eb..07c7a07d38 100644
+--- a/src/memline.c
++++ b/src/memline.c
+@@ -3796,6 +3796,11 @@ adjust_text_props_for_delete(
+ 		uint16_t pc;
+ 
+ 		mch_memmove(&pc, text + textlen, PROP_COUNT_SIZE);
++		if (!text_prop_count_valid(pc, (size_t)(line_size - (long)textlen)))
++		{
++		    internal_error("text property count too large");
++		    return;
++		}
+ 		this_props_len = pc * (int)sizeof(textprop_T);
+ 	    }
+ 
+@@ -4034,6 +4039,8 @@ theend:
+ 	mch_memmove(&pc, textprop_save, PROP_COUNT_SIZE);
+ 	props_data = textprop_save + PROP_COUNT_SIZE;
+ 	props_bytes = pc * (int)sizeof(textprop_T);
++	if (!text_prop_count_valid(pc, (size_t)textprop_len))
++	    props_bytes = 0;
+ 
+ 	// Adjust text properties in the line above and below.
+ 	if (lnum > 1)
+diff --git a/src/proto/textprop.pro b/src/proto/textprop.pro
+index d3ecf6d14c..a01c2f3b2d 100644
+--- a/src/proto/textprop.pro
++++ b/src/proto/textprop.pro
+@@ -35,4 +35,5 @@ void clear_buf_prop_types(buf_T *buf);
+ int adjust_prop_columns(linenr_T lnum, colnr_T col, int bytes_added, int flags);
+ void adjust_props_for_split(linenr_T lnum_props, linenr_T lnum_top, int kept, int deleted, int at_eol);
+ void prepend_joined_props(unpacked_memline_T *um, linenr_T lnum, int last_line, long col, int removed);
++bool text_prop_count_valid(int prop_count, size_t propdata_len);
+ /* vim: set ft=c : */
+diff --git a/src/testdir/test_textprop2.vim b/src/testdir/test_textprop2.vim
+index 193a808415..48387d1c04 100644
+--- a/src/testdir/test_textprop2.vim
++++ b/src/testdir/test_textprop2.vim
+@@ -428,4 +428,63 @@ func Test_multiline_prop_delete_penultimate_line()
+   call s:CleanupPropTypes(['1', '2', '3'])
+ endfunc
+ 
++func s:ManipulateUndoBlob(name)
++  " Patch the saved old line in the undo file:
++  "   00 00 00 08 'QQQQQQQQ'  ->  00 00 00 27 'AAAA' NUL count=0xFFFF <32x00>
++  " i.e. textlen 8 text-only  ->  39-byte blob: text "AAAA", NUL, prop_count
++  "   0xFFFF, one zeroed textprop_T(32).  propdata_len becomes 34, count 65535.
++  let blob   = readfile(a:name, 'B')
++  let marker = 0z000000085151515151515151
++  let repl   = 0z000000274141414100FFFF + repeat(0z00, 32)
++  let mlen   = len(marker)
++  let idx    = -1
++  let i      = 0
++  while i <= len(blob) - mlen
++    if blob[i : i + mlen - 1] ==# marker
++      let idx = i
++      break
++    endif
++    let i += 1
++  endwhile
++  call assert_true(idx >= 0, 'saved-line marker not found in undo file')
++
++  let head = idx > 0 ? blob[0 : idx - 1] : 0z
++  call writefile(head + repl + blob[idx + mlen :], a:name)
++
++  exe "rundo" a:name
++endfunc
++
++" A crafted undo file can restore a line whose declared text-property count is
++" far larger than the data, making get_text_props() / consumers read past the
++" line buffer.  Restore such a line and force a consumer; reaching the asserts
++" (no ASan abort / crash) means the count is bounded.
++func Test_textprop_undo_bad_prop_count()
++  CheckFeature persistent_undo
++
++  new
++  call setline(1, ['QQQQQQQQ', 'DECOYLINE'])
++  let &ul = &ul
++  call setline(1, 'BBBB')           " undo step saves old line 1 = "QQQQQQQQ"
++  wundo Xtpundo
++  call s:ManipulateUndoBlob('Xtpundo')
++
++  undo
++
++  " Safety: prove the malicious line was actually restored before the consumer
++  " runs, so the test can't pass vacuously if the patch missed.
++  call assert_equal('AAAA', getline(1))
++
++  " Adding a property anywhere sets b_has_textprop, so get_text_props() will
++  " actually inspect line 1 instead of returning early.
++  call prop_type_add('Xtp', {})
++  call prop_add(2, 1, {'type': 'Xtp', 'length': 1})
++
++  " this caused OOB read, now it triggers internal error
++  call assert_fails('call prop_list(1)', ['E340:', 'corrupted'])
++
++  call prop_type_delete('Xtp')
++  bwipe!
++  call delete('Xtpundo')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/textprop.c b/src/textprop.c
+index 33165a8e43..931fb78d25 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -109,6 +109,12 @@ um_goto_line(unpacked_memline_T *um, linenr_T lnum, int extra_props)
+     char_u	    *props_start;
+ 
+     mch_memmove(&prop_count, count_ptr, PROP_COUNT_SIZE);
++    if (!text_prop_count_valid(prop_count, propdata_len))
++    {
++    iemsg(e_text_property_info_corrupted);
++    um->buf = NULL;
++    return false;
++    }
+     proplen = (int)prop_count;
+     props_start = count_ptr + PROP_COUNT_SIZE;
+ 
+@@ -1235,6 +1241,11 @@ get_text_props(buf_T *buf, linenr_T lnum, char_u **props, int will_change)
+ 	return 0;
+     }
+     mch_memmove(&prop_count, text + textlen, PROP_COUNT_SIZE);
++    if (!text_prop_count_valid(prop_count, propdata_len))
++    {
++    iemsg(e_text_property_info_corrupted);
++    return 0;
++    }
+     *props = text + textlen + PROP_COUNT_SIZE;
+     return (int)prop_count;
+ }
+@@ -3219,4 +3230,13 @@ prepend_joined_props(
+     um_abort(&r_um);
+ }
+ 
++    bool
++text_prop_count_valid(int prop_count, size_t propdata_len)
++{
++    if (propdata_len < PROP_COUNT_SIZE)
++    return false;
++    return (size_t)prop_count * sizeof(textprop_T)
++	    <= propdata_len - PROP_COUNT_SIZE;
++}
++
+ #endif // FEAT_PROP_POPUP
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ecdf7cb5b9..b9acb4665a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55693.patch \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57453.patch \
+           file://CVE-2026-57451.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


