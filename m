Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7043C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 23:08:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.6781.1632784097910414674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 16:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dtuENKl2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d6so54475035wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 16:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Nt7ihFQcOuhzL/rEW1d0eM7eJlLdBOEXX+Bw4+av3YY=;
        b=dtuENKl2O6+yXM1RLbIQiyr/g4O4ZEpM7q2ojsfyeMwUhYMw8P5rB7R/BKFq0Gkg9s
         1fZ+kgawnFgG+pdfxgKqEqg4X2xxmof+dq5DCywOHYLvSEHbaLpRG3lS/d/nuthyCAZA
         4WQK8QSnIJJEIeI09f/SdhxUDh1PbRpgHZPKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Nt7ihFQcOuhzL/rEW1d0eM7eJlLdBOEXX+Bw4+av3YY=;
        b=p31Qhlrj3c+ceI1MgrEmrOCz5Uo0ZPRXphpl+NAGboT6O2BU9Ubku4xmgfyk50zTpi
         DjfCoCnEzNJN4FZlqpv38m3jT3UOPELoBETAHvSps8x8SFDKV4di9ckQXAiqgtbPf2Xu
         PQUQtyLb8UA2CbyBS9LwfwsBzWIni4sUdoYq5PJ1ISKMOAli52v0t62R4zd/f1Pqvlm0
         vQQBjq0YSAb4OeMzebGqaQDKKqMECpTe8eC75dK4Iv6SW58sQIAEypXWworiHH9/h3yO
         KIJx28EGkoJvbiSJDDmUYksSqpYyTBXVxgx8MbfRb2p4zreDY+89R/bZOy4iC+Taj/Ph
         Q3jA==
X-Gm-Message-State: AOAM530AOw24TRVn/LILwmmwh1c9tvZdSmWJvZ5P15CjDWkmfhSDHJd8
	Sr4HnzH91y0L6hbrSxi9QNNTxQ==
X-Google-Smtp-Source: 
 ABdhPJwYLuHJ1xvnLpeXnvrmIuYa7ULqfBz08/Uv8sXp6JBu/1YqsSWTN3VhSNCCDNRAYyFZFxQjYQ==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr2747266wru.410.1632784096339;
        Mon, 27 Sep 2021 16:08:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a38:b35f:af4c:6fb5?
 ([2001:8b0:aba:5f3c:2a38:b35f:af4c:6fb5])
        by smtp.gmail.com with ESMTPSA id
 c77sm788349wme.46.2021.09.27.16.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:08:15 -0700 (PDT)
Message-ID: 
 <9a22c351a2971e60a080c6a68ed613efbb1901f5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: fix CVE-2021-3778
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Minjae Kim <flowergom@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Sep 2021 00:08:15 +0100
In-Reply-To: <20210927104430.414250-1-flowergom@gmail.com>
References: <20210927104430.414250-1-flowergom@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 23:08:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156403

On Mon, 2021-09-27 at 19:44 +0900, Minjae Kim wrote:
> vim is vulnerable to Heap-based Buffer Overflow
> 
> reference:
> https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f
> ---
>  .../vim/files/CVE-2021-3778.patch             | 49 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
> 
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
> new file mode 100644
> index 0000000000..9cb61a6ac7
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
> @@ -0,0 +1,49 @@
> +From eb41373c8c88b0789e5cf04669d6116f9a199264 Mon Sep 17 00:00:00 2001
> +From: Minjae Kim <flowergom@gmail.com>
> +Date: Sun, 26 Sep 2021 23:48:00 +0000
> +Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
> + character
> +
> +Problem: Reading beyond end of line with invalid utf-8 character.
> +Solution: Check for NUL when advancing.
> +
> +Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
> +CVE: CVE-2021-3778
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + src/regexp_nfa.c                 | 3 ++-
> + src/testdir/test_regexp_utf8.vim | 7 +++++++
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
> +index fb512f961..4d337f1f1 100644
> +--- a/src/regexp_nfa.c
> ++++ b/src/regexp_nfa.c
> +@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
> +               match = FALSE;
> +               break;
> +           }
> +-          len2 += MB_CHAR2LEN(c2);
> ++          len2 += enc_utf8 ? utf_ptr2len(rex.line + col + len2)
> ++                                                           : MB_CHAR2LEN(c2);
> +       }
> +       if (match
> +               // check that no composing char follows
> +diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_utf8.vim
> +index 19ff882be..e0665818b 100644
> +--- a/src/testdir/test_regexp_utf8.vim
> ++++ b/src/testdir/test_regexp_utf8.vim
> +@@ -215,3 +215,10 @@ func Test_optmatch_toolong()
> +   set re=0
> + endfunc
> + 
> ++func Test_match_invalid_byte()
> ++  call writefile(0z630a.765d30aa0a.2e0a.790a.4030, 'Xinvalid')
> ++  new
> ++  source Xinvalid
> ++  bwipe!
> ++  call delete('Xinvalid')
> ++endfunc
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 7e9225fbcb..db1e9caf4d 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git \
>             file://no-path-adjust.patch \
>             file://racefix.patch \
>             file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
> +          file://CVE-2021-3778.patch \
>  "
>  
>  SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"


Thanks for the patch, I'd like to get this CVE fixed for master. Unfortunately
the patch doesn't seem to apply?

ERROR: vim-8.2-r0 do_patch: Command Error: 'quilt --quiltrc /media/build1/poky/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch CVE-2021-3778.patch
patching file src/regexp_nfa.c
Hunk #1 FAILED at 5455.
1 out of 1 hunk FAILED -- rejects in file src/regexp_nfa.c
patching file src/testdir/test_regexp_utf8.vim
Patch CVE-2021-3778.patch does not apply (enforce with -f)

stderr: 
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/temp/log.do_patch.45096
ERROR: Task (/media/build1/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch) failed with exit code '1'

Cheers,

Richard



