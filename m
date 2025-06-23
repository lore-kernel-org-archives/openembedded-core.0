Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9FAC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 20:48:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5707.1750711708820187567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 13:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fkTYmw2p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a528243636so2827881f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750711707; x=1751316507; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F4/rKEeKEmzzHOHbG1Rc5qQTPZNLzqEHVoXnASXZoJw=;
        b=fkTYmw2peTe98te5Wztdh3mW/F4DDyXo0SW2pW1rKwonpMRrg+VsxxABSYgsJTbPCR
         QTNa5QRLXTx9w4qDTtpn5bZ1h+8lbVl2crb2fYU/7xh67/4mS503Vr8ux/E/T1bnBWyD
         CI196wYif1CaIp7fSCAeDxP3CRdyPzof1Um/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750711707; x=1751316507;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4/rKEeKEmzzHOHbG1Rc5qQTPZNLzqEHVoXnASXZoJw=;
        b=MR7iS5lFbBTxnPEzGdNhnd1wuaGdkbgEq85+MompPJThb9nitG6TWchyoLAuLu9cUb
         m4vKWxTp5FWBt+WDF8Pbxvxsp9bbVFDj5fsLLityYnM8OCrMIeckpjqtkxRo1JrynNOc
         8EyJBkL5s/fEfRjWTlTrFUo0R6P+tMKmNoXUWL9/SD2xf8qyWK7VBXrjpRiPWb66vlJF
         WqvgAYhqG8SbtW1OrbrLwK/efTxZvkTQoKG5TneQEpNjjOzeYUD98CC+r0ByBYWCE1HN
         nZqKTF3fPu1vjcp2vbt1UX0/zP/WPbxpZuTg5xFdv3thLihQyTA8BPWEkTRuQtTl25Rc
         +5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUIqJUxtdtYvTorVq1RKBxlZ7eZ3+TfnH625PgliYTAa8MwtJaPw8zSMc3PYB708Spd7pZ/4RfB/Dx2CvKeQhK/Uw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0dcEjq4AaMs4F2OIXSTG/+z4VTNj3jtCFTllvhKOkXjX7jl9m
	MX3Y5Kjj/UB6nWKfFs6JGJUzGYTSCWOj+E+NDo/TsnU7rxxrVs6qCtMIg//HOM0BNec=
X-Gm-Gg: ASbGnctzTw0qYPHKqQNRGxxDfBZzYTkzaLO4H/YyRur1F1kfJLllOdCqPBthZt/F1Jf
	KpMGN/w1ghkjLguLZndjQxspMV2ZjnwqEM41cVP3P3OYMwx7jT8RmJPQXzxHZj89vwUAbbWx0Y5
	9L292CtY2RA5MiNsXy1ZLR0wf7mTy1GA6Wn90WD2KDhv+cjVqEYAdqayWcoBd2ekciSZD1hnUNp
	YaZBEM4pwC5NkHjkBWypdjN0+evWHzFXJUfMs7R9qNE/LI369kovgDMacbd7MFXaifXi0LvesUw
	apyP6yW8IeG2tt/fHDkxgI9T9uOTSld8PQgvuJLKfQ85mmoZ/HBGctButTTfRpDQC62NeFCnyOg
	gHu9QEGrfzSn1vZBsbZCeXrGx32suTys3/toViDuP6XMpoGA1UgU=
X-Google-Smtp-Source: AGHT+IGLR06NZHv5ipyKAQ3tl9JOjqoYoOeT88XgefqygWB9wPcR1sTAeP+vTDnQGgYoi7zQYo1bww==
X-Received: by 2002:a05:6000:2f83:b0:3a5:8d0b:d0b8 with SMTP id ffacd0b85a97d-3a6d12ec25emr10939695f8f.54.1750711707196;
        Mon, 23 Jun 2025 13:48:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a? ([2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2a4csm84233f8f.65.2025.06.23.13.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 13:48:26 -0700 (PDT)
Message-ID: <089b2ea3388321570537e1f7adef3a24efe3250e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pmi183@gmail.com, openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Date: Mon, 23 Jun 2025 21:48:24 +0100
In-Reply-To: <20250115153149.1827119-1-pmi183@gmail.com>
References: <20250115153149.1827119-1-pmi183@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 20:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219219

On Wed, 2025-01-15 at 15:31 +0000, Pedro Ferreira via lists.openembedded.or=
g wrote:
> From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
>=20
> On each build using sstate-cache, buildhistory will move
> content to a temporary folder named `old`.
> When buildhistory looks for the main dir, it wont find it
> and ends up creating it.
> As a consequence how code is structured wont restore any
> preserved file.
>=20
> Code block moved to ensure if old dir exists, it will
> attempt to restore those files marked to preserve.
>=20
> Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechwor=
ks.com>
> ---
> =C2=A0meta/classes/buildhistory.bbclass | 15 +++++++--------
> =C2=A01 file changed, 7 insertions(+), 8 deletions(-)

I spent a lot of time on Friday looking at this. The BUILDHISTORY_RESET
code path is horrible to understand and basically just hacked into na
don top of the rest of the system. BUILDHISTORY_PRESERVE was never
really intended as a end user API either.

After much consideration, I've sent a patch proposing we remove support
for BUILDHISTORY_RESET. I think the behaviour would be better coded
into the CI integration in different cases.

If we do want in tree support for this "reset" functionality, it needs
to be written in a way where the code can be understood and it needs to
have test cases. It would also need documentation as these code paths
are currently undocumented.

As Ross previously mentioned the interaction with an sstate cache is
also horrible and is another reason I think it is safer for the user to
do what they want/need CI side rather than in the class code. Sorry it
has taken as long to work all this out, the code really is hard to
unravel.

Cheers,

Richard

