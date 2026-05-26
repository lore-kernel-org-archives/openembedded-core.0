Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0327CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 15:19:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39992.1779808742706532847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 08:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J8vwxBv/;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acae26e564so139301316d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 08:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779808742; cv=none;
        d=google.com; s=arc-20240605;
        b=bgwWqFvQbSgfSGm3VstJBNiKlr+K6ACJmqhqfLlUKX79GMbeGVehbMEYErhdU2FYf5
         vPux/V/fX29+ui9a6SUIA5THIwoxrynN600swCsEGejwxjw2EXaDm+/QTcpxVM/EIGEq
         O9i3zh6kCdw/oF0CffK3MCGPAXJGo/ms58EmO+ye9yvLtGODA+sAGc2kjYgL2NouvbVm
         3galzqxW5BGT/Qw787Y4Ugvj+sk0R/3C1+H5u6yZluJfmSi+ScnW/7iYDRUt7b3OOeYs
         VxDwVOdLMjzi130UzjMLtC8gIiEBeL4rdqDQFHyRx+fkmaw715W73sukC4OPBsdPfmpP
         xn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3h7HTu5SfE3v0LqKEr0sldAbe4O9qSWa/HrbFw8z1os=;
        fh=u0nCqQ/CTFu1WsqGgaZBSwcdin1Ryvb8QYdnpJcC4ZA=;
        b=kvkZ5NrPMs1yBeZHWFR1OpDtyw+uHdGHiXXgIDdOYcN1pM2FXtnfUcfAsVBNyteEeI
         eXp+VFoMlY6bsuFkh2hdMJbVP0eWWV94yxgHjq0df7G7uvglnqiVLM1bRWIMMGf817rC
         e2aTj1GwTqZjxCcqu35v/4/rfETrAfE+5CJ1rHSs7MY+/NXyd5BegDYIbyEMhSsZ12O4
         xqcf5I4xxOF8WwUhakREJZViIDTldn0nk0htxhxRo8k5dSNaA3R7Fi3MzGpfyyB5R/oI
         HzxLlAU6wTPB0MA61biQ0pHBMH6rzmNFuLRVa4nhzaiQkrrURixQU1/ymusbIHWEuk0t
         kkTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779808742; x=1780413542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3h7HTu5SfE3v0LqKEr0sldAbe4O9qSWa/HrbFw8z1os=;
        b=J8vwxBv/PFmk6VlxU6cJd8zo0w0rwfN+6OUHxVVXGDeFbWhKnjccFyJ+X7x3sFeVRO
         TUucZnNME//z13ovXIM4IInq3VOop+NYLw7kFz5l5vaOiMj14q7ajyFuFn6soYMoyvD8
         w12EsqK8fEVqmzj16hRJojql51vc29WPWvUw8Bhcb+N4/IWmTh8lApNODetZnieYf19T
         dN17/JhC0YOlsPRtT1gkbkOWco2fAXMxUl9p8bDWoQydw21RlavXoZ9/KrPxvKOhjWms
         JPhRnaHDDTNrTYpfTiu2hEzD24PuaOKLdj7di2NME7ZQOUniy31Mbcir+gPsrmWopw9O
         f94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808742; x=1780413542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h7HTu5SfE3v0LqKEr0sldAbe4O9qSWa/HrbFw8z1os=;
        b=mSMop049a4+gzheL0jmexKbPwlojnPR1YkjmzARme8YJ/WZhXmBI/TLIneqDH/MVtW
         lX0SJtr1C63ocDaQO/vmeYfwKEmVrnhSRURn/9ZdU8+Z2K0aN3iKW87kXW60lIgXBrCO
         vPt2JoxePZhSsamuHgBjm0xVv2KHda7CmOu8J7ffrrJtmt5DPH1e8lNoMuafYBFGCnft
         tnBvcXoHCxuLDSRf7DebT0P/nZYTmrCY/CL1UbRkV2jAJkueKOTS7WzNSR6sLnUQ9Vjt
         8cxG8BftlIz6bnL39Y2wwQQEMwTpJuFwCk4BxO6hNsQNwFMeIeBY8DG1ZtkssSCr3pev
         uq6A==
X-Gm-Message-State: AOJu0YzQUl33JqOpJg+kvI/JuoCOHHuYfiptqAM8A13MeWpVrecMrws7
	f1TYNZ1m2YHDL5D+W+lcoOmDZY2LzSq/nWb4JxQkx3aotfEW1usb3aTGA4aJGSEroLgCNrbhmrt
	2WFOxSlWhMEXFHMK+3ZoboodH7lYZB/o=
X-Gm-Gg: Acq92OHPbW/lJgs7xDNUkqxov07ZWPMoRDpXfsDTuGic3LMsIey3wuPKAGqUSfUTVSj
	fN2cK3DPoLK8pApqFGQn+N8Kq/tDDYpKZ6OqrEPEGvVaOePAvu/xDCHxDS0GPGDkBVeO4SoOUpL
	RnUt8qPXlV9I9swofjVl95kymoA00gwAky8H8yJPlPYs1B+MNds6NeCp4fETSp838QQ4rI/dKHA
	3TqtNchgYyguNDM3jW4uw/+a80OgJ7MBA8Tax2FwURgYqTOTI0qGaW2y7syVJ+eOSu/6lxo3Qno
	+scGr/TE5XOSqD31Ntu4vKfOK9Jg9SZ37f7pXo1Qlw==
X-Received: by 2002:a05:6214:5a0a:b0:8b5:6654:7556 with SMTP id
 6a1803df08f44-8cc7b69868bmr303302036d6.42.1779808741547; Tue, 26 May 2026
 08:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
In-Reply-To: <20260526112501.15985-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 May 2026 17:18:50 +0200
X-Gm-Features: AVHnY4IoX_GNebdT5kKS1egQfu_XYbsl7WpRRr-7WDMbpqhVC1yo4wC_n2nOjbU
Message-ID: <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of
 tolerating statistical outliers
To: adityags2004@gmail.com
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 15:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237615

On Tue, 26 May 2026 at 15:36, Aditya GS via lists.openembedded.org
<adityags2004=gmail.com@lists.openembedded.org> wrote:
>  test/randtest.sh | 122 +++++++++++++++++++++--------------------------

This is a patch for gawk source code, and so is not applicable to
oe-core. Does it need to be added to gawk recipe?

Alex

