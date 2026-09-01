Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CF4C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:23:04 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2357.1788247375556183290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DmzQMZAc;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96c92c0980so439170a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788247375; x=1788852175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3JvbGRNp8cTyOfup8t7a6RYwNKPk0ndVbwRUBGxq08=;
        b=DmzQMZAcfQSSQpHkHalDXULHO88IMR8ME7tl29qWljLEGRBH5dC2N3qbcoUaK+G3r1
         1Cm+dh6jo2Z/vhBGEduB4LPmlAKiiGmLrxeDddfd6G+9rMgkLyxel2KPwiBYS1aNnyxc
         pqsBngytoJgrXuwWDn2CoCCgdsq94DXletW5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247375; x=1788852175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3JvbGRNp8cTyOfup8t7a6RYwNKPk0ndVbwRUBGxq08=;
        b=iCrALZlqeVXtifEVZtm0NU6VJdN97p531X88h7/WA1jolV/QKvtBotaNKf6m5D4JJO
         iVdb8eFBWIHr/lap8JM6jkb0YcHpmpV4iZwtue2l2R/7aXuI+7FyxgAqn+5RYkDQ+9nD
         4AVoOkaz4VdlSGayOV6Ubp4O8r0b6+8Tw1bVpp5dFrkexOOX3HDHA5yjaiL5/IhCuP/O
         VKSBV5vVOxMxGGU8ClgAR2OVGWRG4/yUaWyOSg0FJoTnwt29zyGa9YIkxe4Lqor/oXX9
         Q4n8mZk7IW4uVr2fqIJ4kFtO96Do1k5GPec/oMKRkZXk0T2u0mYAWGVciq/4qUpQtbkf
         oMvA==
X-Gm-Message-State: AFuF++maZAbLylJhtnhdiiBIQUiX0bIrQLBpqFxqtzZ9HDErjRC89q0Z
	6qEw4s4bkdDYAQdrtHpE8gMNgy0RdMifO+Vn28+C7qAPWnm9wbxHQMtfQHwt2pcr0qAQAFcKQbr
	W/MLO
X-Gm-Gg: AYBFou3ySp3ks5NV6g89yehMjLiF+HzJV1TYaSXBYdYosiA+R5+g2QOOjW9GKqLHbL9
	dUdqsxjQJzLPXPH242afEyhKRyX2yIXXbhDH+TAOXVyg+DqTqdtJbVyRkqm/jCCsM8+NfF3cvfK
	q6aJNtW4b5f3g4DgKJTy2YDsq1RHVJcxzAYj5v4TeUA6MAhPHAOWwTmw4bldLN5jPqT+lNMOCYh
	zFdiHfhjwrt8WYNo09o62eIiHav07FzX/mBBtmw642L9Iuewajzbv+OhdDe/wIV7o7KKzZ4o5Iq
	suBEZMqsEDxgjN8FSZxY3UNw0xoSdzTCSGaW4C6jXedNte0oiLGzokGIdfnJtd0Myy0tgPEI1bh
	+84j9QDvJbvQfCoHLs427yE0CvqsF71kR45n+kit9Lns+Bi9Hqf5/IovniSuy/3WpA5zdB+n/2g
	bnODFFuzTYwjwyAWgOG7DcMMWAdlxdKDIVy3T/vugQd4AdXijSa5ILB//gbwIMaMrqfS+g/9SG4
	bvRc+WlYQFC
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr44602527a91.6.1788247374867;
        Tue, 01 Sep 2026 00:22:54 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54200607c88.4.2026.09.01.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:22:54 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 3/3] vim: Fix for CVE-2026-73074
Date: Tue,  1 Sep 2026 12:51:16 +0530
Message-ID: <20260901072116.30784-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901072116.30784-1-hprajapati@mvista.com>
References: <20260901072116.30784-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244801

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a9336b476fd1a182e3f79b5f83c0ffb04f8a922b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73074

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73074.patch            | 115 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73074.patch b/meta/recipes-support/vim/files/CVE-2026-73074.patch
new file mode 100644
index 0000000000..896298b703
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73074.patch
@@ -0,0 +1,115 @@
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
+ src/version.c                 |  2 ++
+ 5 files changed, 34 insertions(+)
+
+diff --git a/src/errors.h b/src/errors.h
+index 53e5b1dda6..1682c8587c 100644
+--- a/src/errors.h
++++ b/src/errors.h
+@@ -3812,3 +3812,7 @@ EXTERN char e_gethostbyname_in_channel_listen[]
+ EXTERN char e_cannot_create_pipes[]
+ 	INIT(= N_("E1575: Cannot create pipes"));
+ #endif
++#ifdef FEAT_PROP_POPUP
++EXTERN char e_too_many_text_properties_on_a_single_line[]
++	INIT(= N_("E1580: Too many text properties on a single line"));
++#endif
+diff --git a/src/po/vim.pot b/src/po/vim.pot
+index b2e3b0f647..aed7d833cf 100644
+--- a/src/po/vim.pot
++++ b/src/po/vim.pot
+@@ -8859,6 +8859,9 @@ msgstr ""
+ msgid "E1575: Cannot create pipes"
+ msgstr ""
+ 
++msgid "E1580: Too many text properties on a single line"
++msgstr ""
++
+ #. type of cmdline window or 0
+ #. result of cmdline window or 0
+ #. buffer of cmdline window or NULL
+diff --git a/src/testdir/test_textprop.vim b/src/testdir/test_textprop.vim
+index f94acfc97c..a293363a8a 100644
+--- a/src/testdir/test_textprop.vim
++++ b/src/testdir/test_textprop.vim
+@@ -4907,4 +4907,22 @@ func Test_textprop_materialize_list()
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
+index 5959ecc45f..fe453244c1 100644
+--- a/src/textprop.c
++++ b/src/textprop.c
+@@ -758,6 +758,13 @@ prop_add_one(
+ 	proplen = get_text_props(buf, lnum, &props, TRUE);
+ 	textlen = ml_get_buf_len(buf, lnum) + 1;
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
+diff --git a/src/version.c b/src/version.c
+index 26e4e026c3..2a056f9da5 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    841,
+ /**/
+     845,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7ab7a405ff..9dda2c0be5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
+           file://CVE-2026-73074.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


