Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7840ED78307
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:43:08 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.170520.1733136181175166348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2oVA9Bj;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b66812a653so299660785a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 02:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733136180; x=1733740980; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjt7sRfsA7dWU6goZE1bn7hmyJlPTdIlgrz/GjDoNyg=;
        b=m2oVA9Bj7zIvKTw6xz9TlY23RQTIksAcMO/x0OztV2AzsYZZ227Tam4638/lLj5t6W
         7rOUkJlc4cJobYaYkZQlyRAa/ULP1A3aWnAWEUYuEitLEz4QKuy+CHgAaJ3og7JihTpG
         9y3nadklKv/9eHc4OTYsZWCZQeERu7+dsxVMAm3MulnLoZ1CnbUoikS/I4Q69dGHy+7l
         hsN1uJnTO+bXXm1E+b/mjsfTmjzyqZEqvPZrNV44K95klIZ/6JhcBHoz+B/n+tXfW7k0
         HWRcPjeVWXwgIF2lTwFGxiu72cncFfjA/kEbfNtSpgyRbVE5ogIkORI+x2Z/xrUDeg4f
         jNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136180; x=1733740980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjt7sRfsA7dWU6goZE1bn7hmyJlPTdIlgrz/GjDoNyg=;
        b=EusuYTuMZaXjfAsRu11piQMiCTJamn6m7WlfqAf1mlCxXPvIAvAKAIuEryXybYlO68
         HVh+Rt0jL+NmUGYZ6HeREVWMDQ0GSbjjfPxWL1S6L2P8N7lDPO9h7KFDN9pZS6B5Ic5g
         L6IDw0sB4oLNH4jluI7bZqo+SECCaIGjDOYxGcLASndTgkbqPPuyLDtu7Arrop3Uz56h
         mfvadZ6DlXGTso95dCp7HVirWeriM6ota9IKoMxaIW5uxVlpkZTARhT5wF5TVgltn5J5
         iRMoFDDaygEsXsT/dzjCdX6J7kvFpNt/77fR9sF63Gq2mrtB0ch81Zk24r9sndhnGfBE
         eoIw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMZvm0xhJxW6vRzgiOKxR5LaHCVUWckKnOIczSDlzc+SAbbIdcbJwilGEKBkOqwKbDbOLgeirU3kK2mPZNy6rZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySlh2wb6feIeA78kkH0BdI3dtTtdiZt1nq3Ssiblqo9ivvCixu
	qfgqJ2jlkC0FQs2vodUg1RTpRYZC5WMInTLPqDOjCcrfBG+/PnvjL5na+aVT8iPPZYVvqdgtg6A
	9yiYjP4NKYxfcJwQ3G+Bb1GWatJg=
X-Gm-Gg: ASbGncss7sJarAb6QIFUu3uxmnMGrcNHUMu3In88CfIklXFcNqWN3fTp5cv4IS4I5xS
	BtKvutKB72ZPPuR+z1UCGBll98OtmqYvbHJZNO5oULELxboXFt+m160ifNwv+Ma5UOg==
X-Google-Smtp-Source: AGHT+IGEYCTDER9Itv3PdtTJNKQyhf6/+A8DlYEne9Dz6e/KpR8MnmLYv3f0odnh1oT8VDT766bhN+tbpKi/WdajNeI=
X-Received: by 2002:a05:6214:c67:b0:6d4:1a42:8f06 with SMTP id
 6a1803df08f44-6d864bebfa5mr348555806d6.0.1733136180176; Mon, 02 Dec 2024
 02:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20241130085222.17448-1-f_l_k@t-online.de> <Z013Th944PYfoHa-@bootlin-mathieu>
 <T54VNS.XA4ZGCLO7PS3@t-online.de>
In-Reply-To: <T54VNS.XA4ZGCLO7PS3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2024 11:42:49 +0100
Message-ID: <CANNYZj9Wdb8S15C99c79_eiVJvoacsMbv4nasb_w0ZZqcjfq8Q@mail.gmail.com>
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
To: f_l_k@t-online.de
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208136

On Mon, 2 Dec 2024 at 11:37, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> One file is still packed into libpam-modules. This should be moved to the=
 appropriate module, but I'm not sure what the /run/sepermit directory is n=
eeded for. There is also a patch added that fixes a problem in meson when c=
hecking for keyring. But when I wanted to send it upstream, I saw that the =
problem was already solved and submitted nicer by Alexander Kanavin
>
> The ptest part is also still missing. When xtests is enabled, the tests c=
ompile without errors, but by default they are neither built nor installed.=
 So I wanted to ask first, what of this is still needed? I will therefore s=
end the patch as RFC for review

I'm testing the 1.7.0 update without all the other parts. I've simply
disabled ptests altogether, as they're not actually run on the
autobuilder, and are thus defenseless against regressions anyway. I'd
suggest we get that update in first, and then you can work on the
remaining pieces.

Alex

