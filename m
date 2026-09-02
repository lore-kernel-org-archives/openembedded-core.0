Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324D1C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:14:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6047.1788329672995211526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tWG5w4Gr;
 spf=pass (domain: smile.fr, ip: 209.85.208.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so3226746a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 23:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788329671; x=1788934471; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i9O3wqnksShDoBxvuep6E93qnF41Py8Uz+eP03NOjYE=;
        b=tWG5w4Grwh7yVycEQ74qxsAhGfm1f0cuWwPRBWCBsOLzAcgi3Pvh62wZcnF0QyzvsE
         UEeiRptSHUtnwHHpRY+GrN8Rh4XkUFejI9JDi+nlFsAjd0XE7pCh8x2v8JaTdBEVBBHA
         xyo/Rbp10FSRcfVLXQMeEumI0ZrB2P+qK5R5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329671; x=1788934471;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9O3wqnksShDoBxvuep6E93qnF41Py8Uz+eP03NOjYE=;
        b=EBDx23B6qi4xCK+fUTNQK9ApoMNP13BGulkAvvzxSg1oe7rNwTmHrZb8/up8d2q5MF
         dYtwT2rOCjdAf9ib9odEiuO+w4DvMK8EhhoHNnc40k6y0VEPBOTlmnEEUzyQbJFKigWq
         yl3TvIDTkfS34zc+xjPkV3HoAxHUkmN43T7F9zSNFc/MjUlqvRUc8RgE2hndMDDl3Eif
         4z1kYLN+2zW0iqZQlCWYbjTrQuloRqWkdvQjJVE/eIHIkRCCBc0oO/LoIR5b863KDyG+
         b3MR/X+LBFpW74N3c6REXBKs7J8tvnoj1hxH5U1pz/gN7oOSwsVR6uPoygrpwj0jhXWY
         A97g==
X-Forwarded-Encrypted: i=1; AHgh+RppcP12hxm4iCjTELBvnrIoysKBDqpJZLqAu2Y4nj7lS1IKJzfYQN7S7CAaJvf7G6bmXYuU1uvl0pCq8m1Ui4CyxQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++k/9fkjeX872pgo8l8RVYSQBEPFekFMpmDHwuGzmyDzgxpE2EY4
	uffvAxXx6xun5w3uSu0499vlrSj87TZtxY1+KuIj3wW/Uoxs6ZNwizlItLuqDtvAkGKFHpJmPPS
	vlpKQ89E=
X-Gm-Gg: AR+sD12vP+pQAm8uSuG9BU3APYkFssbboH9eD7WxhRDI7CIs2y1Zs/kezwHtKGHrT6P
	7lg7T+/5Ea+ypkmHhkQIxnHka/iBKTE7byL2kq0BYebpNsTQaVq8L+4FumnxZ7t3aGt/CrtJawr
	quJoYQJkzbykGNNhDjS7iCNiz6e6wH58eSe9OUIoQpoURChXXc1nnbeUA8/PJngjoxWBhGq/gT+
	vLMqmdOzz24DjpOe2m+SFiTa4/Ve5QagkvQxV0iQY/F2bJCUFvEwRmrmdBObh0sMWF89Djmd2F+
	ebsmqMtV7945N2zLfF0g+wUm1gxhY5ANGR2nqJk4X6lFpEEK+VjhLME6/mOkRm6TyfnP6o0BPtR
	dHv39Y+kA7D1GfyB7QkaPNlc9xuczIFCbF8eWv/Av6tFCPEzurRFqce5NtQDQRnmoQOcOR96jsk
	fJ6MRD9F3xTs7hLb/Ci31bkA78OuIioE4oYzkGqzPYendv5XAVoPsoDEgOIJl32XWggUJIzbzkU
	Dxi5rcM/qxCWsdZoUG+zmLpgvIWLnECc6bV2jSaVuqhfVCcTA==
X-Received: by 2002:a17:907:1c92:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c25dca1a9c1mr50162566b.5.1788329670704;
        Tue, 01 Sep 2026 23:14:30 -0700 (PDT)
Received: from localhost (2a02-8440-2607-5ad5-e257-1b9f-da87-0e1f.rev.sfr.net. [2a02:8440:2607:5ad5:e257:1b9f:da87:e1f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5cd9sm74094366b.6.2026.09.01.23.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:14:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 08:14:29 +0200
Message-Id: <DL4LYKDNDBSE.K4SM1TC4D2FA@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] perl: upgrade 5.42.0 -> 5.44.0
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>
To: <abhishek.bachiphale@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260814153052.2863858-1-Abhishek.Bachiphale@windriver.com>
In-Reply-To: <20260814153052.2863858-1-Abhishek.Bachiphale@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244893

On Fri Aug 14, 2026 at 5:30 PM CEST, Abhishek Bachiphale via lists.openembe=
dded.org wrote:
> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>
> Cherry-pick from OE-Core master (5.42.2 -> 5.44.0),
> adapted for wrynose which had 5.42.0
>
> This upgrade fixes the following CVEs:
>   - CVE-2026-42496: Archive::Tar symlink path traversal (CVSS 9.1)
>   - CVE-2026-42497: Archive::Tar hardlink path traversal (CVSS 9.1)
>   - CVE-2026-9538: Archive::Tar memory exhaustion DoS
>   - CVE-2026-8376: Perl regex heap buffer overflow (32-bit)
>   - CVE-2026-13221: Perl regex trie overflow (>65535 branches)
>
> Changes: https://perldoc.perl.org/5.44.0/perldelta
>
> Add perlcross patches to support perl 5.44.0:
> - Patchset symlinks for perl5-5.44.0
> - Configure checks for d_getentropy, i_stdckdint, i_sysrandom
> - Fix checkfield() for C23/GCC 16 compatibility
>
> Verified: ptest passed.
>
> Drop patches already included in this release:
> - CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
> - CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
> - determinism.patch (Encode::Byte sort fix)
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 036700267e816ebfc56c404e872055f93f73c88f)
> Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> ---
>  .../files/0001-patches-for-perl-5.44.0.patch  | 110 ++++++++++++++++++
>  ...Add-configure-checks-for-perl-5.44.0.patch |  47 ++++++++
>  ...Fix-checkfield-for-C23-compatibility.patch |  35 ++++++
>  .../perl-cross/perlcross_1.6.4.bb             |   3 +
>  .../perl/files/CVE-2026-8376-01.patch         |  62 ----------
>  .../perl/files/CVE-2026-8376-02.patch         |  49 --------
>  .../perl/files/determinism.patch              |  51 --------
>  .../perl/{perl_5.42.0.bb =3D> perl_5.44.0.bb}   |   5 +-
>  8 files changed, 196 insertions(+), 166 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-f=
or-perl-5.44.0.patch
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-confi=
gure-checks-for-perl-5.44.0.patch
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-check=
field-for-C23-compatibility.patch
>  delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.pat=
ch
>  delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.pat=
ch
>  delete mode 100644 meta/recipes-devtools/perl/files/determinism.patch
>  rename meta/recipes-devtools/perl/{perl_5.42.0.bb =3D> perl_5.44.0.bb} (=
98%)

Hello,

I merged some CVE fixes since you sent this.
So it does not apply cleanly anymore.

Can you send a rebased v2 version that handle the new patches?

Thanks!
--=20
Yoann Congal
Smile ECS


