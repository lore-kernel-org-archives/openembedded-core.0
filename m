Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.7592.1618977446813170078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 20:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gH+IoUyC;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id o5so13024238ljc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 20:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUkDb5AZgBGFWBXBiMhe/JSzFUqwaD5IERuSqkkyR70=;
        b=gH+IoUyCIpkzfRkydhwMnyxhJnbvLobYS9ZstH/qjnqN31rywKwYWhFPPfQq8Cpxd9
         aJ6HMU0euiynIwxckFymvDdnGPyCCeIdvTFAeZI9SeVxwAYSuJx4fy/NXMsreBCEQ4Ha
         92UnncJ8W93rgthSMPrXrXHYJiakWR23muqbjCGBJ7nyP55AymMRkUhet6c1b0jIQRRY
         SnCYv2bolCRiFGWN+LEUokUEr6/5ASPHnu1/oG5rnPvTqvvq6LOeKsttVPkyKPSQpWR1
         Dd5HQ3ORHqZDHAPTWFQf6QrHv8c0/QdAuZNPpXYzbGo2z+7LxVDAzxo6HnmOIArcotkF
         7tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUkDb5AZgBGFWBXBiMhe/JSzFUqwaD5IERuSqkkyR70=;
        b=ha6c/zR8xeZ0IXd2xogUpT3t5PNInpWuLklNw8oja4Siyd6A7chIUZ8hK9yocdfveX
         F2YZmRRfTDhHI6NlyyBkPw9A8Yfsd8KOIPhKkY+usJqj6gaJXOssDHqtxWb0n/uJ1fnX
         EzPNrr3N9S03q1Hh5Ca0QGDi9/ZYuNp1/5gp4Xvrzm92Ne5pfxZMCA6y9IffPwrbZgtM
         39bxak8jGLEtPSQDPWsuiSMs34xG+JETvoY7t0XCfoRyvDWc3JTO/RO0tiyocXku5Q1z
         3gTxKaDxjgh46uQmgfLgUNW1esnLTeF4My3nLzpdjfYhcXi9CT4IAqvmZZWBNbw1/u6m
         uopQ==
X-Gm-Message-State: AOAM530ULv6HwzhF8urPX+bNyYQuYQWscKY570S9ejmrr5D0bMEH5BK9
	mJHJrqpMSOPnQ+S4JtogUmH9CDolwnJHGTIEeVc=
X-Google-Smtp-Source: ABdhPJxHmwVyz9Cg4dH0hpcKeH7m3tKxBpWsWGu3yosbjXJmLdbN9yVgKc6iZZWiblG+Ie2ZaLYnF9ilOwAguERgJXU=
X-Received: by 2002:a2e:7212:: with SMTP id n18mr12513303ljc.378.1618977444812;
 Tue, 20 Apr 2021 20:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=XGxEyZYc7pH3Me1_Cx+H1+OAjNjo45veLhyPFv+eEWsA@mail.gmail.com>
 <1397.1618951559627472345@lists.openembedded.org>
In-Reply-To: <1397.1618951559627472345@lists.openembedded.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 20 Apr 2021 20:57:13 -0700
Message-ID: <CAJ86T=W1995MMCUqA9pjWf=DVp9ws+Dpq7kPttksfOUNPT2Uyg@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: Shachar Menashe <shachar@vdoo.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 1:46 PM Shachar Menashe <shachar@vdoo.com> wrote:
>
> Last time we talked about this I thought we would need to change something in openssl build settings to make the openssl binary get built just for this solution, and that was what got rejected.
> But actually now I see (or perhaps it got changed) that the openssl binary is built anyways, in any build that already relies on openssl.
> So my suggestion is to enable this feature. Like I said in builds with openssl it will make everything more secure in a transparent manner, and in builds without openssl it will display a warning just like today.
> I wouldn't consider it a hacky solution since this is the official solution for this issue.

It's very clearly a hack. Maybe it's the "official solution" for
supporting https with busybox wget, but OE has a wider scope - we're
not limited to busybox wget if a better overall solution is available.

> This is also exacerbated due to the fact that there are no other alternatives for secure download from CLI (ex. the sato build doesn't contain the "curl" standalone binary)

I don't see an issue with adding curl to any OE reference image which
needs an https client.

> 
>
