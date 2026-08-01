Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B62C55174
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:01 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=JRVvG+BZ;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=7811; q=dns/txt;
  s=NAESA-Selector1; t=1785575519; x=1817111519;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7BSZln1+H6e7oezg8JCq95avwM0z+1VabMr+VUHGXM0=;
  b=JRVvG+BZYgW4AWy+zmhQObsoSc0qsx7+FhOdrRHy1t/Zz9GsR4ZbJoqd
   nbGii2/rop7NQL3bLTsJTZ9XzjQkrRLGYWDCbkhTo+62AgczJB/VeAJvl
   Rzgaf4HlSl0fMJECP42h7NLHRfg00vTccGFx8BWF78OUXyb/y9qjjNXwJ
   2PSDOl5orssmjyBJIvzyN2lVl43axIDJON5g692QkikOjp3aNyaqZpb3n
   v7RppKz71tQlGyxgUWmK5CNY4kC03yC/c/xQh4YEFQNQYoGVQrwq18ooP
   1oN50Esa2DjMatpY4Qft6TUGAB2il2xXYt8ofEwqGbTY3GYSGLVacj08z
   A==;
X-CSE-ConnectionGUID: 13qBAOtrSSO89oJDKIn43A==
X-CSE-MsgGUID: C07/KM3zSumZK8Kcnld1wg==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911518"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:11:58 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 03/10] vim: Fix for CVE-2026-57451
Date: Sat,  1 Aug 2026 14:40:20 +0530
Message-ID: <20260801091145.2788751-3-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242481

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/b2338ca90643e2f01ecb6547c1172716aaec4f79
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57451

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57451.patch            | 192 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57451.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57451.patch b/meta/recipes-support/vim/files/CVE-2026-57451.patch
new file mode 100644
index 0000000000..415ae0dd6c
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57451.patch
@@ -0,0 +1,192 @@
+From c3c95d56f5f800484b83aaf200dd393196774198 Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/memline.c                  |  7 ++++
+ src/proto/textprop.pro         |  1 +
+ src/testdir/test_textprop2.vim | 59 ++++++++++++++++++++++++++++++++++
+ src/textprop.c                 | 20 ++++++++++++
+ src/version.c                  |  2 ++
+ 5 files changed, 89 insertions(+)
+
+diff --git a/src/memline.c b/src/memline.c
+index c15946a6e..07c7a07d3 100644
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
+index d3ecf6d14..a01c2f3b2 100644
+--- a/src/proto/textprop.pro
++++ b/src/proto/textprop.pro
+@@ -35,4 +35,5 @@ void clear_buf_prop_types(buf_T *buf);
+ int adjust_prop_columns(linenr_T lnum, colnr_T col, int bytes_added, int flags);
+ void adjust_props_for_split(linenr_T lnum_props, linenr_T lnum_top, int kept, int deleted, int at_eol);
+ void prepend_joined_props(unpacked_memline_T *um, linenr_T lnum, int last_line, long col, int removed);
++bool text_prop_count_valid(int prop_count, size_t propdata_len);
+ /* vim: set ft=c : */
+diff --git a/src/testdir/test_textprop2.vim b/src/testdir/test_textprop2.vim
+index 193a80841..48387d1c0 100644
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
+index 33165a8e4..6b0ce45f2 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -109,6 +109,12 @@ um_goto_line(unpacked_memline_T *um, linenr_T lnum, int extra_props)
+     char_u	    *props_start;
+ 
+     mch_memmove(&prop_count, count_ptr, PROP_COUNT_SIZE);
++    if (!text_prop_count_valid(prop_count, propdata_len))
++    {
++	iemsg(e_text_property_info_corrupted);
++	um->buf = NULL;
++	return false;
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
++	iemsg(e_text_property_info_corrupted);
++	return 0;
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
++	return false;
++    return (size_t)prop_count * sizeof(textprop_T)
++		    <= propdata_len - PROP_COUNT_SIZE;
++}
++
+ #endif // FEAT_PROP_POPUP
+diff --git a/src/version.c b/src/version.c
+index 16a8b140d..a216b9b01 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     671,
++/**/
++    670,
+ /**/
+     663,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 48edfc694f..0fc3ae5df0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57452.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57451.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


