Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4DECCF2F6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:45:30 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34028.1768826726587429865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4P1rLSS;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-501506f448bso23537511cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:45:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768826725; cv=none;
        d=google.com; s=arc-20240605;
        b=fmjD94rAWTk+Oo78o2lNj7TGabjCBaoJugsOf1aEp02iLVydCyNgt1sqOtpGMLxm6M
         VmNMoayknrVDckrAtSPq+sH5U9PUCOL440CfQR7UbVh7OFi4u8gDiXHHwIKSpjubCROk
         tIyOWgqMhVZwgyLqqAjgOrXQHY74eBrbYxF12rykSAfmcuDT1AadTk40ViCn4tZu7eSg
         tkQtGAsiPraECZwkDQ2w97UrWiF65AWzzCak6H7/iValYRqkpLj4RyTZkhZrUpnt/3da
         9GBikDGyzDyJR2395P96O0lXQvdWygRts2ws1D5UverJ5UWVDpX674EKV67DYHeoppYr
         gb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E74Obu4mdxFJOJRFqlAbKZUIUUAFTWN6yVW9hk5cv88=;
        fh=dMHrMTeW5wIhRyL8+FFqZyu4AFHQ7Liwr9I2mLdglf8=;
        b=jsq2V1mboOWH0i/b4ULED2cNp2YQcGuEMEnFTsvTIJh6R1YdNuNR3HRnLGJYsbXL5g
         uvkKuTMcGsTX2XYSFFLabnO0owQJXjVKkQQ+P7G1a2PEJqks1Ef5Vct/55bvLKYr5GFT
         GnYgCDvt6PNoKrV/hZEPSsFDjL2EIOFrPQj1UwYuJEedbhpK4R65lBLlRLmipDD7hS/Z
         GgN/7gLN0HfyJ84iPN6KawuM+m1d+gpwNpXAtWoo30slT9qLXVcdZt83rswXG0YHvNgV
         chAUxuiZjm0TB4nY9bJepb4SM7pPHdvSfbvbVtVBY0IeiT7LikGfd/09K63gKnlcWhyL
         fYvQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768826725; x=1769431525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E74Obu4mdxFJOJRFqlAbKZUIUUAFTWN6yVW9hk5cv88=;
        b=L4P1rLSSr0GA91/ACBR1TREpShvSoPYYJanG7natzkbCgSJqqRUr2HZu+vq3xY0p0P
         h65dhCoyh/8Ohy/P/AxEnLEbWSdatgqKji92fTk+58jdQ72DpEghDQfKT/IlRlyDOGCs
         f/9e0xaK5UUsMzxA93AXjXb3VtQ77JjaMlVUA1SqkeeYp+OtKwfRIzjYSHy1AtnIKfn8
         iDpwktTKxCQadP+WQt4dvJkzreWknkM/EOPqqK6PCNBuTc/hLhPpQRcXqnqxdv81LstI
         pKckPcZzvMYf726+4I+n0ekHxBzvpmsVP+0NClS0gVoB2x8xlLiEqUCPZstzhZAjWjzR
         N7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826725; x=1769431525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E74Obu4mdxFJOJRFqlAbKZUIUUAFTWN6yVW9hk5cv88=;
        b=OTUYsIMnrhGkqFyRrGn4bcJAQdZtkhSIJQvIEWf8jPUe1yCpHh9vpYSdiNHztn6drX
         O1Dx4qWMDU3X0FDsz7aGT5BKu2T4PP4wgK7p7nWFi60XO8RJWqV9WeLrpmWpnAvMbM2v
         iPPHs/duJr8yvnHYPvOnmLHa3/U9EZpxGEWh34bazmy85T/ghXa+6dAbPZiiTnwkDF5U
         iI6VC8eSesfoOaDdJ972xA4BMqTlUGD2fYtHmOVHyBQepqIjcRyDUP+p/w6IHDGFBZFH
         3mwutM0KnxchYOm4aJOfmsZOGorptEEa3hvAAonn1hwIY++9ibEjsF7ngByw70SMk4MJ
         jwlg==
X-Gm-Message-State: AOJu0YyiBzb7nvcSH20ivcfPjBQ/35Um4pSotZSLtd0HkG1gKzfDYmZy
	aVE6ro9VWENi+woD4kT0STmcGHPoy7NugeyZbsz6ruIG+KmV/fEFPOVWq6taBWc/WoyyUfwldA4
	VtbWgcyuO5n/xZrq0an0o7LRcefA2dQA=
X-Gm-Gg: AY/fxX50dBapelYiTmFNQnF4nermVrEd9XaLEz3I8S6Y6dvPHychldprouRESAHwOEV
	709jjaMGhgwglcK+8bfap3DWCI+RBxIjtvNLpl6K239tWwF25x0zyguOeJXIjsfGJFBloYufmwZ
	tOJOnqi1NrzaCPvTsxAtgrXJ2MPk8TQSUprPdA1y8jMei95Mq+ysY05ivPhrQ6wjfsFRCZpboY9
	HEwHeEAYpn2iBseE8XI2s3mVfyhdXQdVxfZVXwYKKipj/j2uQvaiQLtj9aciiRXNiDQQfRhn4p9
	igeH7Hfm2Zjec2k8sJ43ZLPohmSNwQ==
X-Received: by 2002:a05:622a:592:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-502a16520admr168151761cf.13.1768826725416; Mon, 19 Jan 2026
 04:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20260113124504.961856-1-hongxu.jia@windriver.com>
 <20260113124504.961856-2-hongxu.jia@windriver.com> <CANNYZj9VBv_G3phFkW_mosnZ5hvzXxP4OJ=nJ3G_oExV+FtNrw@mail.gmail.com>
 <188A774745AD7FE0.3093368@lists.openembedded.org> <c586a89f-3e84-4e74-8e03-6598045fd501@windriver.com>
In-Reply-To: <c586a89f-3e84-4e74-8e03-6598045fd501@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jan 2026 13:45:14 +0100
X-Gm-Features: AZwV_QiilF8Cy9A2vwAebdwyVJmh_NiU8N_-XIGmhVhcRZKvQ7s1yNoS4ubSqwg
Message-ID: <CANNYZj-iQv+CHRantVM=wcssuDKGseuSB-iTBig2FNf_krKZ7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] webkitgtk: upgrade 2.50.0 -> 2.50.4
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229613

On Mon, 19 Jan 2026 at 03:26, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
> >>> +# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
> >>> +# error: cannot tail-call: tail call production failed
> >>> +CXXFLAGS:append:riscv64 = " -DSKCMS_HAS_MUSTTAIL=0"
> >> Thanks for completing the update. Perhaps this last risc-v tweak
> >> should be reported with an upstream ticket?
> >
> > Sure, I will try it later
> >
> File https://bugs.webkit.org/show_bug.cgi?id=305745 for upstream

Can you include this link into the patch and resend please?

Alex

