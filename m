Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF68C61DE6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2979.1787945894363432110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fPwVzShH;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso8716815e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945892; x=1788550692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QujumhdyaP5hIyVb92hRQwEKxzuQ0LCk8yXJlkuagwo=;
        b=fPwVzShHc7R3ESlV8TsJSn2Brn1zkG4aKcGo9SMazp5I22y/1BuKDMqXRvBhu7iRNq
         xv8l1Ej/paZcAAxDtw91uWyO2Me0yBOi8fOyApOKwQn51WeYSskeGcWwFxY5VpcA+VKW
         GSeK3uI4Dn1xmPK7Y+ISjIiYEQv1ie2NHnbLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945892; x=1788550692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QujumhdyaP5hIyVb92hRQwEKxzuQ0LCk8yXJlkuagwo=;
        b=WMskEi+gMkzJq5In3xKXi/x5WiHFRXEndV1ZA+/xrRJsEhgzykIyjvaR0drFQcJP/Q
         WKVbsAWWXSUr9qo+Z6RMK77Z2ysS6VI2TL9VKZRw5EYOwycOJq2OT/xliMiLpk6V2j9N
         hXsZaefNuj84aU4l/fGcgMNOLj3g15sN+Uiu8BsuuHx/T9RboEnYGho1DUoPD91UssV5
         F1hSmPrr+YUpad3ullVIXZSqoLeeWn8GrU30Sz6y+8Qz3f0JAssTDMaIT+au/Tw+wWzr
         aKusdGFlZqyzaCV7icPmHLyw21CStu5n8ZGllu9l7Nzx66KmPEjghYBw5BtB/1t+wR/S
         FIKA==
X-Gm-Message-State: AFuF++mzn1/h0e5StrgpLj9fc6DFXR0eitPvX2NeAah0IruUeXmzwzCa
	xBGKieYqarxEk4Ut79g76d4XDUaOFl+ZjUnd84HFoFYnwuq1xzMIpZ6ne0vtvDLAnEBZxPwWlbr
	Uhv5sYYk=
X-Gm-Gg: AR+sD10DIQ23w8TScTHpYGdnZ48yPXCKypBmEOV1WvxFFDiFbExTSUonrQdJh0ErELt
	NwIcSXj/Hzm/+a+rSn7kyTk9GaVsE9E87KvcTWdPD8qrOeOmWko/BTpTDtT5zqG0wMDO1tVKXa9
	zZ4CrQmAhFZxv7jebEcbnTAYA7zBpAMjepzR+wg+88dAKaxQyK/eAiJj6IgikZ7z2NYmD5odqCc
	sn5GD/4GInJDCf28SBjesyhXsDFjtLLFZ4A+j8eLHP56wBz4JiR0cT8yCTPLb01ZtWLPhz/oE+9
	PlY09RXtyDsbpYmY0p3YuK2MvdIhSLvJclw17OTR92XvoA5G+PVtmfMjcY3/SeiHJzClVsujOBA
	dnL+rS0ozWM0q6PN29k9bTli2YneBtECRq2BMt68qyn/g6cr3AucbVIKw5YZx7ah1+ROo8w+ChH
	hmyCqbx8113/C0QtJPhHbN9eBcI6R37qQXpvOBQ32ZOM075/t/MMP383xkB3R1p2VOvGn9SC0ss
	NRT6l3yhkKJ0Yvv3n2RBOcIWwuwN9h8l6ivhR7p6ef2l56o+7IhFDJtrot1PevL
X-Received: by 2002:a05:600c:3b21:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49b91c3f643mr139530935e9.8.1787945892515;
        Fri, 28 Aug 2026 12:38:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/56] vim: Fix for CVE-2026-57451
Date: Fri, 28 Aug 2026 21:35:25 +0200
Message-ID: <efc8a0528f280034dc633e0743aba6543c3c712b.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244576

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/b2338ca90643e2f01ecb6547c1172716aaec4f79
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57451

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57451.patch            | 192 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57451.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57451.patch b/meta/recipes-support/vim/files/CVE-2026-57451.patch
new file mode 100644
index 00000000000..415ae0dd6c4
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
index 48edfc694f0..0fc3ae5df08 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57452.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57451.patch \
            "
 
 PV .= ".0340"

