Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BC0C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 13:23:07 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10553.1783948977540487512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 06:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lJPS2fEz;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e855da580so249159185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783948976; cv=none;
        d=google.com; s=arc-20260327;
        b=H+rTW85bmgMJaenXUnQOocmkovEGa/y2nWxf304VaVzS/B27GkRDWEekj/SM/awukO
         6CMCikw4TxsN7aqZB4mT604eBsoWC0+Rsqef6Xgd7AsSTqHcZRr+f65iZZvk6mQt7PXL
         txDrYRuiBZFRMtYiaVggQ4MxGKgvnX5eoUf6XOfJoDr3FUf1YcMMW/cM5rgmiAq26CjS
         g41VWPQMtKmAOCUyWDEgRRmP1B8lV2OHDx6DGlk+sz4+cHkA8y8HDuAxtDE3WNhB2byq
         LRW/Y9ho+2JUKoescQ8v5EbihK+7tylIwGVowrYcc5NMiRzH66vaBOCkKELoyLkR0X8F
         jgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=do362MmgTaU5Q3CwsXzJxtU/2MNFoPLEER3zTh634/w=;
        fh=nwmOibeBxru7YN7c3ioYH9idCQ3mEiy1fJusI7xfID8=;
        b=QC5kZkuF+UB2WyXYRkmkVp331fM5bafZqoM0PIrWPemkCxlCls1pQ3ylWSCwuhbrIs
         nxQChFJpx1NQReVmqDaVKbH/xN7u1gtKT57i3pmMnTQ+Jb7VcTyBexkY2NS1GMoOcwHK
         7JM8gp3nlI5rHGdzS1t2JrT8qmXSCQgpy3crsxNGpRELZ9VcxhkZxGS3c5uBoD3GBHou
         sdcOT61IlQOAHP0z7KDVe4mI9phHAjZjxUkk11D9NHEGm+BKZOdYsg2WKMlM6noo0HB8
         Hj8xRd3i5mgUSNeA6QixpuU4n8+eL0qgqHL6OqCgPaVMNjVn9rqViZK93E8CdD+bDMY/
         +Y7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783948976; x=1784553776; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do362MmgTaU5Q3CwsXzJxtU/2MNFoPLEER3zTh634/w=;
        b=lJPS2fEz0KkrY4d5LfpcxIL90ZF1tkS00U/tEkhHLjwTckU8EpKASCGo1gy7fi+OZX
         TEjLot+eLXVX5V4JKb1IJVyNDZxmh7E6oOT4bPrwecdt1PdjY+oRXTWg02dTMZQDJMEw
         lUFr4OWd2RSWAEp2VuCgyPdTTallFzu5nH2+50E12bJ8FpyU8jgmm7IkcBQJ1/zwd677
         wAvG538qN2nBL86dhw79smlTWkSQBRD8gPw9c1f0pL7YzdUArQr2ZFVMvLrbveorsvS/
         l0rblxUzazJpp9d2lDo9p2t/TOxsCaeqoGY9UK+aVLIHKdAts3jkVQ6HgLOpChaArR1I
         H+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948976; x=1784553776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=do362MmgTaU5Q3CwsXzJxtU/2MNFoPLEER3zTh634/w=;
        b=bHUHG8fa/w3Ri1AUVHFCdUfBI9ROv9hpk5qJnQiTMGpohYfCpZb/L/qCerZbafbTlF
         GIdEOwbPxIxKJkwdI2rYdq6s/1WzSETonxsjVc/0qYzR639A6Xqk9E2HjqyecdLTmdDm
         ESPiPiwydWe4kazQMbQoiCC9Uyxbnmt4gpIYiSa7bnLOJk2sA4CWX81vlmod4w3ETNFK
         rTOt8rLCUnvpjg+u8iL9E2Xl2C77vWKYb3ZXZJnmOPQ7g6Rr10j0snwFxLXck1M180pZ
         aajXHRERQEkFz2PazbfPGyfWltBQvMJhRfOigeM5AbwYQGrckzdhlY+ddh7T0MeBwJ+D
         vERw==
X-Gm-Message-State: AOJu0YwqSsTIo7ACS3NheZByvVjAYUUyf6zAJCI5Gau33AgdU0P1TerP
	5cV19dZLoylY1GWY+16XuOMlqYk3SclDE0HDiaSefcTtSqOe1S8eylEqOgsiI2sknyyKpCkxOpk
	v/3DPnq94MCQzhqNUkg778eYp40mynqk=
X-Gm-Gg: AfdE7cmFyiJEulMg0rdvByfKkKWxy/xfbr1jrt0ZnZ7JQwqsOaA0cLMEJdvQY3D0Wck
	zQiWfMBvDiqw4QSuko9BLBU9SnyfJCB9V2OCkiNmgXTJanhcz8N8Bw73IeY7IsKQ7kres2M69Bx
	ruG7A2vO9ET7QVmhokyEHxbJmCnTi8/hLj20hXMu86fL+KVMqPLr4gbks75GBjH8JqiSkjKzLwU
	z1k84xBnEeNmuZbSmtpaccrRVvXniiwJdGaAHTwqEOYHtDNmdVKprEIJ1GAa6iSH/tX2L4sWgi3
	uJc0M93go/P4e9Mf4QtW59jyxn4neaQRzTckRGuTxQ==
X-Received: by 2002:a05:620a:1712:b0:92e:5612:ba39 with SMTP id
 af79cd13be357-92ef2cb1651mr903589285a.44.1783948976371; Mon, 13 Jul 2026
 06:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260713060444.7-1-bbnpreetsingh@gmail.com> <20260713060444.7-3-bbnpreetsingh@gmail.com>
In-Reply-To: <20260713060444.7-3-bbnpreetsingh@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jul 2026 15:22:45 +0200
X-Gm-Features: AUfX_mxv0qsBQsJCBBNqAYHgu3sWXwrv0tPgj-Yorb_RSYxkfeaRKTWmYkZJmOA
Message-ID: <CANNYZj-i5npSXqmB9S8fnnOeLt5AVr3o5-Pdvs6hBru_x+DwJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/devtool: add test for
 finishing a recipe using AUTOREV
To: bbnpreetsingh@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	Chris Laplante <chris.laplante@agilent.com>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>, Peter Kjellerstedt <pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 13:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240841

On Mon, 13 Jul 2026 at 08:04, Baban via lists.openembedded.org
<bbnpreetsingh=gmail.com@lists.openembedded.org> wrote:
> AI-Generated: Uses Claude (claude-sonnet-5)
> +    def test_devtool_add_git_autorev_finish(self):
> +        # Test that a recipe created by devtool add --autorev can be finished
> +        # into a layer; this used to fail with "fatal: bad revision 'AUTOINC'"
> +        # because the unresolved AUTOREV placeholder was used as the git
> +        # revision to export patches from [YOCTO #16354]

There is no need to add a whole new test that largely copy-pastes
other tests. There is already test_devtool_add_fetch_git(), which adds
a recipe with AUTOREV, but then runs 'reset' instead of 'finish', so
that test should instead be adjusted.

Alex

