Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D53C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:59:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.7534.1748944742792756111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nw6Oq69/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442f9043f56so32478355e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748944741; x=1749549541; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqVJAX25MNPYJmrBxe/N7K6qR3HzMsrbrMcByXe9Hjs=;
        b=Nw6Oq69/kOnt42HgYJJlVfaG5lbONUwAoHbrVgnY+fnIiRVJA64fquW34fhZoDeGEb
         3NKoM8Ky4qTo9t1M+xyEUThcFC34RRTkktBtuzKPQ2NPHZKVVG3ONp/CVkXkUSS/3fru
         txt4B604ThnDk7Z9NhUMBjpMpKQ+6Vna5R1y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944741; x=1749549541;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqVJAX25MNPYJmrBxe/N7K6qR3HzMsrbrMcByXe9Hjs=;
        b=bT3AHia/q3MhjI9TZIsrGh44dqW5YtJfRfLEDqrcpqV6wcckXlZJlkgiVBARjLK8ka
         jyDFcHCwBOEzaN06r2z295XsXMctRhe+GaT7m98J6AD/zgjbxUW9aKXR9498P1XUkIe9
         aUVzRN7CiOGiocV5xz8fdMoBf8TYh5sJ0qm49czG/yumN+NTfk6wtTyHPPKG7Sa0YXu3
         H3uXgfrNBzwB8ErAr3zJXqduBkozZ4jUmE6emKiobudtLMddqfUnTRD8F+y6HXdjpdxd
         ktr+2im64tuHJC4m3FGgj0CmckDO6rHGBVQTwarKwAhVsX6it3VB2OKIZTKEqnGRprbh
         hPOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoTzmklJFSyxHGEIgyckPzjNFgueok7TzWJvx4JOc1XesheMj3AH5NOVYJ/FE4PHIXPBT5I7+QbJdpO79yOEYXpQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgFltI8VoOLvtzB0t0GCZTaRCMMe7lHlIu0R3ef9OR5hfwAlAL
	3zO0loXwu9aWemDN5E2oiDAUaOsgsqgKduFAN2mQyTfXa1D8VY3+JtnY0MIQDWUiTUU=
X-Gm-Gg: ASbGnctoCoymmmNwrpZiSIzhgR9aVheidJCCPBpM3maaARqQ7283ZOwUS8yOZxQN4zj
	MLvvN3gBM424EhKmO9SsDTA+jM66l3Oj3C0GSx+3bSfthFRiqTKUIzIiXzEgW8cFHBcAgxCBDOr
	bI0lJTCT4kCzR2a8mN9uEL3pVadQ3ne7hk8o3UmLpZLW2IuRF5swSb3avb4vfkocK2Iu70JEoKI
	YBdYGO+spiogCUSu7u0MjoAsjeyhy2NBWbpWWlZhZ7dux/VuNUT+V3qdJXGZZ+gcfjlKfxblxrj
	II39Jt/cbUu/iUnmwc5CKpBwyG1s4RVYS5/nUbvTD49AymHaRfrp1DcsG/jt6SDS867EBHzdHcE
	MD17w8TRJTuTZcRkww2Jyv2w/QEAkRgXewg3Dfw1b
X-Google-Smtp-Source: AGHT+IHnC1uI1EJvOPrXGovBMcBKVjVotxuERrkFmhzwQy2A6QQ2PwiYQEiSgcNeCykpejwe/+Ylgw==
X-Received: by 2002:a05:600c:1986:b0:44a:775d:b5e8 with SMTP id 5b1f17b1804b1-451191fd3b0mr89522455e9.1.1748944741079;
        Tue, 03 Jun 2025 02:59:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3864:8101:3606:8242? ([2001:8b0:aba:5f3c:3864:8101:3606:8242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm156430705e9.1.2025.06.03.02.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 02:59:00 -0700 (PDT)
Message-ID: <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.suti@streamunlimited.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Jun 2025 10:58:59 +0100
In-Reply-To: <18457EF875184E76.9693@lists.openembedded.org>
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
	 <18457EF875184E76.9693@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217796

On Tue, 2025-06-03 at 10:40 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2025-06-03 at 10:58 +0200, Peter Suti via lists.openembedded.org =
wrote:
> > Starting with Yocto Mickledore the PN and BPN variables are set to "no-=
pn"
> > at this point in the `use_icecc()` function, so instead we need to
> > re-parse them from the file again as a workaround otherwise icecc is br=
oken.
> >=20
> > Fixes: 3be00ad9052de ("bitbake.conf: Add BB_HASH_CODEPARSER_VALS")
> > Where "PN=3Dnopn" is set to optimise the codeparser cache's size.
> >=20
> > [0] https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/1=
03429714
> >=20
> > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > ---
> > =C2=A0meta/classes/icecc.bbclass | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index 8a48f2ad63..e3b07028b8 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -143,8 +143,8 @@ def use_icecc(bb,d):
> > =C2=A0=C2=A0=C2=A0=C2=A0 if icecc_is_cross_canadian(bb, d):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "no"
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> > -=C2=A0=C2=A0=C2=A0 bpn =3D d.getVar('BPN')
> > +=C2=A0=C2=A0=C2=A0 pn =3D bb.parse.vars_from_file(d.getVar('FILE', Fal=
se),d)[0] or 'defaultpkgname'
> > +=C2=A0=C2=A0=C2=A0 bpn =3D oe.utils.prune_suffix(pn, d.getVar('SPECIAL=
_PKGSUFFIX').split(), d)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 # Enable/disable checks are made against BPN, =
because there is a good
> > =C2=A0=C2=A0=C2=A0=C2=A0 # chance that if icecc should be skipped for a=
 recipe, it should be skipped
>=20
> Unfortunately PN could be set differently to that, or set through class
> extensions so I don't think this is a good way to fix the issue. It
> does highlight that icecc probably just worked through luck anyway. It
> would get it approximately right most of the time but I'm not sure we
> want to rely on that.
>=20
> To be honest, I'm more tempted to simply remove icecc since it would
> seem not a lot of people are using it if it takes this long for fixes
> to get sent :/.

Just to clarify, this would then let someone maintain this in a
separate layer as it is self contained. I appreciate we'd need to find
that maintainer someone needs to fill that role to keep this working...

Cheers,

Richard

