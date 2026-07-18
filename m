Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C94C44527
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2517.1784364802465490676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DTBImyT5;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so29076695e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364801; x=1784969601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FHXSLSozq7ee1jyFlEeH6038VFA/SLQCEsZdx5euPuU=;
        b=DTBImyT5GQX+gHIAHpd5D+6xot/Vcwg+y75lTsQH3CJZAluohXnk9w3DwerSAMRSf2
         oM7EbZB+N7Ye6MSdkCUzPj+owuta22O6W9d2wcwZ8HKaI+pwpSC6lpxAdZKb7mu70ASt
         TbkrAUTKkJQiRrRoOoRmLIyxVjbyRy9WrPF8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364801; x=1784969601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FHXSLSozq7ee1jyFlEeH6038VFA/SLQCEsZdx5euPuU=;
        b=W48UU4QmGDOpkf96nmqYIIxYVus8y+ROshcNJp9ARlGyE6+JfTn0PBkLnJ0afZSWW2
         EW1XVRfYqsGGwsPFLjlBH/JbwzpgzcERcSDmQwVBQltF1rqJA3Zq6cuYRhe5Bs6kHF9r
         QseAJLSay7dkidI5RNcaRg7yx9b35hNBPi0pqU8usuBORvIuk+jhhDGUGg6KESh+xPEf
         P4TXhvoizNchyZugysFhgkxuYuVzRVn3Vmi2eNZLGtnYuC3gmW6Kn0yahm9wZLYAk3U/
         tzBbbWT8DfHWvIx9vkq+rJgDlMtBMygSH2AQ5UIIvVN2YerJY6orHe77qSSnD2BkkcE7
         jh/w==
X-Gm-Message-State: AOJu0YyHuTLEMLKy17UinHXTMxmB9EXKmgxGCI1QQXyeaEhqfWZWifrg
	RgHJ9j/n3k9hn5UvAMNORWPvp0VKbBRA6+2EGMJu7wX/9xG7cIgf5nHjxziPwaWkiE8QMk7u8+5
	C4eAfq3A=
X-Gm-Gg: AfdE7cnl8/b7tELZqGVIFI/TvhCtAaoaTLamhuG65ct0eEkhhTXv08lr+xKuxlkErTx
	alWJo4Z5FVbiOYNc7dxYD+nA0DnYeDLVsbzoy1VWwziks1ZKPakx2Qvj5Kr241o6Ki7oWqmSpJr
	DF1WI7tROp4hG8/SZ+dyw8WgSM6cdLfGXi18LrnvIR0diNfOa5Rga6+DBRq6ovxu1Ht/HbMKs5f
	CYMC/ueVGTRxUJXrpI3oXuUE0wHbRqSkFP4FIIEc1fl/AaAD6HjwScXCuvV65sSpbGIHOL1fhLE
	N1EwLTJe+CSfz4YU6NjnDXpYIUlX6CGwNXeHHMkne1bPvTjo7AfUIkAy987LqV8yo9+IN9yZWBW
	K9BxzHktbukMo7qM0Ie+L9XMiWpX4CEagHW9nv3GH1bhOOeNxQ4ZPjcXV9a7RusCZ5Cqv+wnXp1
	CNl49lta32V72VjAJ7Y0u/7b/aLKVKQQAgKuO80zMTObS9f61SNX0CGmTScvrDL3+rHwnGuP5OE
	gEuzWajpXOj7CE9qw==
X-Received: by 2002:a05:600c:1c04:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4954a3cff64mr71298395e9.1.1784364800693;
        Sat, 18 Jul 2026 01:53:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/17] oe-selftest: fitimage: Do not expect kernel property in DTBO config subnodes
Date: Sat, 18 Jul 2026 10:52:41 +0200
Message-ID: <5f04563b0e57fbf5ce8c0f37fb55db4f3b80a3cc.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241239

From: Adrian Freihofer <adrian.freihofer@siemens.com>

A DTBO overlay together with only a kernel cannot form a bootable result,
so DTBO configuration subnodes should not include the kernel property.
Update _get_req_its_fields() accordingly: skip appending
'kernel = "kernel-1"' for .dtbo files, aligning it with
_get_req_sections() which already handles this correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85e0408a81bdca0411a8625061e5e343c05f92d9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3541c07520a..e8435fb43c1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -659,7 +659,9 @@ class KernelFitImageBase(FitImageTestCase):
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         if dtb_files:
             for dtb in dtb_files:
-                its_field_check.append('kernel = "kernel-1";')
+                # DTBO overlay configs do not include a kernel property
+                if not dtb.endswith('.dtbo'):
+                    its_field_check.append('kernel = "kernel-1";')
                 its_field_check.append('fdt = "fdt-%s";' % dtb)
             for dtb in dtb_symlinks:
                 its_field_check.append('kernel = "kernel-1";')

