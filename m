Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3157CE88D6A
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:37:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5571.1775252257632395312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dExNMcNT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso2231910f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775252256; x=1775857056; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dhkj0o5ZkfRPxotE7Hoo/T+v4Sqqgg3NAgxmpTB+p3Q=;
        b=dExNMcNT6lOSELpgA/S4OLFTs1yrQZ+kuu2NdeQaIFwV57oAOEbaT6Tk8dJo4+DtGU
         vXmUoNX8cinzReUbHoiJjv1QVihBCXMPvncBfyN5g3d5xL1n38ZG3Csyg56lYAA44kTR
         3oAysWAJCKUu727boKPLzheRtcsd3lN0PPzdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252256; x=1775857056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhkj0o5ZkfRPxotE7Hoo/T+v4Sqqgg3NAgxmpTB+p3Q=;
        b=ew4MKyvOwpwW+RI3a1aIU8uB+qUfzcFBaQ4HFVJJ1cIuNk8fy8/2UPWVFvDqArLFqZ
         s3kaED3shsfRUfaMeQUiX1lg6C1EfejMcOJRLp9/UOk/+RZlbWp3rLlo8XRxm7IvcHBJ
         jqe+UkZ1R51eBqktdpMVXc5Yti8lvVHPINbmOzoZrfVfoEVMiHdtmqY9HDQfLVj+iC6a
         7buH1sbcKOmO328bvpKjuIa1vrmY60MAcJycYA5O1gCdWOMKPTjsdeKNh1yCFxxHad5t
         Zq3cnnHtP7/0HQZ9nGGhepMm3W58/Z5duqUo7vs53dZCtyqCFdB6hZsHo3zHCpRPVO/3
         11Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVOWWTZGIDPQRhxVxS9z+bfuCzPwd2RodmCwGA/U+4aGJfxyW2jO5IHuoSg2iEmTD+rXmJUmXPBZQY7GsBFWgemOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXv+u/LI+Gk3n2pWavyrR9XztDwMFE+b9vQtywm59v9C1+mCRR
	hq7hYdkQuOl+6YaOjfBVvewVpSp4SQCobLeuP7+FCUbQqv8VfwTf/LmqwJAZcQZDnkw=
X-Gm-Gg: AeBDies0YtWkGJBmNfjz+HytjaDoX+4rwGj9zWG1kCz0cmLPVBa+f9aEiOlQVIiqVXR
	U0ohioD/NVEYQDbCDiMoRmiXCWlJOE+mFxJfDEkK9DHTygkP74fAQUbUgIIpMBdl6ISvOdIZU6Y
	Ile33VDk1azMWPcq4cv8CKft2oXe8Q7UGi7ohrzx8M3kbDyKF86nsJY3Bw9sf7J4po32dNm79gi
	CGs86wNtV/PEjGeMZ1AM/SmNfy4zKtZsc/vYAglfJajmp4TdoJAjAm/oyiDgvtcj0fVrgg8iBxl
	A3rrEq+EuRrUpD1Qe1JMjGATA+fobVNTHytF1XRHPy15PKitTO9ZKbbK/n0fTM0RmPAlAEgl6wH
	EyVjeP0h2M6EbDaLn/SHfAlgZ5rGe4QQIOzA3VwbQxaiK0qnJolYNKiHBgIoug12e0yFqWq0yy+
	7YygVX1r2XrUDEcj5FjgowFkruypS/bHQwfOEroaTBiozRrXuiTN7jf7NPSVXyZvHetS25ATQsp
	lCwCb8g5SnuY0bE
X-Received: by 2002:a05:6000:230c:b0:43b:42af:75e with SMTP id ffacd0b85a97d-43d292fed0dmr6813965f8f.44.1775252255853;
        Fri, 03 Apr 2026 14:37:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3136:96a7:2030:b47a? ([2001:8b0:aba:5f3c:3136:96a7:2030:b47a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm20083461f8f.17.2026.04.03.14.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:37:35 -0700 (PDT)
Message-ID: <5bd00b10249abd5b2e7a99cf3a6aa63a9a872d7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Mark Hatle
	 <mark.hatle@kernel.crashing.org>
Date: Fri, 03 Apr 2026 22:37:34 +0100
In-Reply-To: <18A2F52EC877AF22.657799@lists.openembedded.org>
References: <20260403183541.2631883-1-twoerner@gmail.com>
		 <20260403183541.2631883-5-twoerner@gmail.com>
	 <18A2F52EC877AF22.657799@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 21:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234602

On Fri, 2026-04-03 at 22:13 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.=
org wrote:
> > When "wic create ..." is invoked with a bare *wks name (i.e. without th=
e
> > `.wks` extension), wic calls engine.py:find_canned_images() to find the
> > fully qualified *wks file. This function searches every directory forme=
d by:
> > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/wic`
> > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/scripts/lib/wic/ca=
nned-wks`
> > =C2=A0=C2=A0=C2=A0 - checking `<scripts_path>/lib/wic/canned-wks`
> > Where `<scripts_path>` is the directory containing the wic program.
>=20
> It doesn't. I just looked at the code and it uses BBPATH. That can be
> similar to BBLAYERS but it is different and the commit messages really
> should refer to BBPATH.
>=20
> > When wic is part of oe-core, the last search path succeeds in finding
> > the canned *wks files in `<topdir>/scripts/lib/wic/canned-wks` (since
> > the wic program is found in oe-core's `<topdir>/scripts` directory, and
> > `<topdir>/scripts` is not a BBLAYER).
> >=20
> > However, once wic is removed from oe-core, this algorithm will not find
> > these bare *wks files in any of the above-mentioned search paths since
> > the oe-core layer will no longer be the home of the wic program, and th=
e
> > canned *wks files are not located in any directory relative to BBLAYERS=
.
>=20
> I'm a bit confused by this reasoning. Are you saying that wic will no
> longer search BBPATH (or WKS_SEARCH_PATH)?
>=20
> > Since these *wks files are specific to oe-core's meta layer, they shoul=
d
> > stay with this layer. Therefore move the *wks files so they exist in on=
e
> > of the locations searched relative to oe-core/meta's BBLAYERS.
>=20
> I don't understand why these need to move given WKS_SEARCH_PATH remains
> unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?

Looking at this a bit more, the issue is that you're removing the
directory when you separate wic out so the files 'need' to move due to
that?

You could in fact just leave them there if I understand correctly?

Cheers,

Richard


