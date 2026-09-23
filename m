Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D35C98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2821.1790154692353928319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BQ8W+/6Q;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so3332585e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154690; x=1790759490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZURdTqaiH31JJNQ3B1BJACWdGR5CK9q+Ow/qXswR/Q=;
        b=BQ8W+/6QCYDuI0NXdfdBtszSuL4/LCIV//d8jjRueRLDnNNg8ggJmCK7MzbbP04ZGf
         swQPjPU+RhTmqz75HwYqGaUliMip622o9HYD1XyhC1QXEbBKddRa7Q8AB0b47glTVikw
         L0GKgkP50ztNmG5RQ7of8TOBLYbg2A42W6GUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154690; x=1790759490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YZURdTqaiH31JJNQ3B1BJACWdGR5CK9q+Ow/qXswR/Q=;
        b=YDrTQ0JhTo+ZL6qVKM/62kLImdxVYI14xdGgXqo56glAn6QR1cd/bfcrgf7rn+H/27
         ROmbXYcRAlcY+tDpfeK1y/umDkCGPRnSp3FQj6yQeLzLH7qXRC6DPkHkOwGHPqpocXcL
         J+RRBZeoT877YJjbokyd8zTmsIDvb5TJSctVB+XVVoJQvADacwZ50YwXrmy5QKGCb/4g
         RQUaO7SOvWjwIh2clAsJweTlAmkbcB+ASG+V7/cEC61e/8shhLf7cB64y9WY8aGAICL3
         PLLfZKd3IB1dPQhFUBsFajcA2B7vMrPO1CHpmy96kdR//T2CqIFw66MGST0rqcxyesJV
         2/IQ==
X-Gm-Message-State: AFuF++kxiaPH37omdyvfuClBWR5NRDUEB+S9jSu7+W5EmcSbM0oOtlRx
	0quL7hsQ2pYuOfPaCwwNcdqB4R5vpP1zrhl8VAKTTLHdXrKLJmKnhahqvUw3SY27w792gHinK6D
	bvBo98Nw=
X-Gm-Gg: AYBFou3kXoohidXP2UTdwlEOmGF0OJR8cx81IbwMQgnD75ndALAfIwoQHUI3OcMQyOY
	pIMr2arJWGlhfPIVeptGF43iKN7EgOIWSDHBF8TYpyqfeKev9G411n5qKSGnVcCCzLo5kW9K6z/
	Dd6CA2kaLppkr6PgMO8qqmYYHGVw9LHvnMO7Mh8VkHSEFA40KXfYjsT1x934erPPqOuuKhZyqyN
	h5G2EZC2PjbR3PfDwIAqOypn1zoLbvw4K+Kp+7hWtBmjfTzF6tQRnWGaeBt/U/Fv8R4BPVEaXZ2
	b3vTDm3CaVP8bpvxhi1spSue53lCXeZlkaQ9tf3YBiJaACBxjKvxH91IUYjj7JPKb3++TWri3FO
	J60knhsR5PIff5MZ40xmoNqMoch/FYpj5aUzjF5CfaXla3xsrn3evL5E0mxOE15C3niXUxgIUZv
	2NUTW8GAq2mlgYV0lTgF3m715tNUeMOm54wd9f7cSwdpMeTx+aQfQYhiF2Y6RlrIy39f16dd+wu
	gp/Y1gUk3McL/EpHxKeZPdVzB6KN5EEN7rOvhkNHW6kWC5/1b9KFIcqSQKULK1JYLQW2w5tWckS
	EgztHk0=
X-Received: by 2002:a05:600c:3e07:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49fdf250b4fmr22831225e9.32.1790154690513;
        Wed, 23 Sep 2026 02:11:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/48] vim: Fix for CVE-2026-73072
Date: Wed, 23 Sep 2026 11:10:13 +0200
Message-ID: <d43821fae26ba24c51ee8502259b781d06b320f4.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246473

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73072

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73072.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73072.patch b/meta/recipes-support/vim/files/CVE-2026-73072.patch
new file mode 100644
index 00000000000..0ae3b2b49e6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73072.patch
@@ -0,0 +1,64 @@
+From 05c41c922309c7a11b6ec2f124be66551c90d66a Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Fri, 24 Jul 2026 00:58:37 +0900
+Subject: [PATCH] patch 9.2.0846: [security]: heap buffer overflow in
+ set_sofo()
+
+Problem:  [security]: heap buffer overflow in set_sofo()
+          (Yazan Balawneh)
+Solution: Reset sl_sal_first (Yasuhiro Matsumoto).
+
+A crafted spell file with an empty SN_SAL section before an SN_SOFO
+section reaches set_sofo() with sl_sal_first[] already set to -1 by
+set_sal_first(). The counting loop then under-counts colliding
+multi-byte "from" characters, allocates an undersized list and writes
+past its end.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9jqx-hgpr-6v64
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73072
+Upstream-Status: Backport [https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/spellfile.c                | 4 +++-
+ src/testdir/test_spellfile.vim | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index b3ee9c0d63..a9f7e83752 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -1433,7 +1433,9 @@ set_sofo(slang_T *lp, char_u *from, char_u *to)
+ 	gap->ga_len = 256;
+ 
+ 	// First count the number of items for each list.  Temporarily use
+-	// sl_sal_first[] for this.
++	// sl_sal_first[] for this.  Reset it first: a preceding SN_SAL section
++	// may have set the entries to -1 via set_sal_first().
++	vim_memset(lp->sl_sal_first, 0, sizeof(salfirst_T) * 256);
+ 	for (p = from, s = to; *p != NUL && *s != NUL; )
+ 	{
+ 	    c = mb_cptr2char_adv(&p);
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 3a93883b4d..0b0cf42066 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -319,6 +319,11 @@ func Test_spellfile_format_error()
+   " SN_SOFO: multi-byte characters in sofofrom and sofoto
+   call Spellfile_Test(0z0600000000080002CF810002CF82FF000000000000000000000000, '')
+ 
++  " SN_SAL (empty) followed by SN_SOFO with two multi-byte 'from' characters
++  " sharing the same low byte.  A preceding SN_SAL poisons sl_sal_first[], so
++  " without a reset set_sofo() under-counts and writes out of bounds.
++  call Spellfile_Test(0z05000000000300000006000000000A0004CAABCEAB00024142FF000000000000000000000000, '')
++
+   " SN_COMPOUND: compmax is less than 2
+   call Spellfile_Test(0z08000000000101, 'E759:')
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a4f8162d31c..10f4ce15999 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
            file://CVE-2026-57456.patch \
+           file://CVE-2026-73072.patch \
            "
 
 PV .= ".1683"

