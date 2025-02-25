Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F79C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:43:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1352.1740523406288195606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 14:43:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=We4D0a+2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so1685105e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740523405; x=1741128205; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OSxOwDUoI54AEpqG+qgk0IOkdFLSUnB5evNU6jkGo8I=;
        b=We4D0a+2xyLimQq/x7+0wd3IuSrNlPZe7JiQpvlsZuiz7ISwysKlBklqdnTydW9zUf
         dxLwDtKEhnmbofO/1vaPu13EayJDAu+NiOiYMkHRMX1NmBo+NrKe51bql3xXMLyVD1iw
         W4yeMKmbIcK/xNuyZcpaeLj9Kj5YdxPlPB5GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523405; x=1741128205;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSxOwDUoI54AEpqG+qgk0IOkdFLSUnB5evNU6jkGo8I=;
        b=vqgi48/Shsvek4AFrpDOi8XDP/eIDzoZD1PdzbQIfrdLxEwxxOFy/dpa8Q1C/EA/w4
         BrbWEchN1gnIeZJBkBH3raV5Szwtx25nllqL0TShAqDq3Wk8XKcrxrKhJqtDPX97SHKq
         86RYdh9Z5qTcEvlEEU7h5O/0m0ilOCBK/IWedAogs31KkogjSxJcY+DCDT7dYAihuNLC
         790ztBOov+2OLmuNvfcAZBa7UyI3QKzQpkK4hsCk/F4PEY3JFobWwsLjxjQHhXACNqIq
         wijzrNcnKtjTNDSFccWnkgLmRCaR0sYO1MGgnmvLzXHFXlC0esLfYGFpeUiwbGaCfhDw
         WcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQm48A/UouZ82sg+CCjecn5sGWU5EOLEaedLG0rDG2jyXbQVIg/ddAfzAMX4bj2MXZoA049Vpm4WCyRnLn3q0QrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0NosziWAWAiPCDNygDSfI8kd1HzRIHwQa9aPxcNyWbSPBilYu
	BLrAfFAFhJBw2NNiptzxbBYPkhwuEj9eV2Hen+Ll/p2Mwf4scI2Zy09DQSqgR9E=
X-Gm-Gg: ASbGncvUDxhovovReL1lInbvijjtpeLiBxzkVSVYscMD+x5dnc1L2widyWPCzNhLLYh
	HVkZMktT7sDapx0ENW14+45OVesIubkz0v40w5Vy8LPiEKM52OLgxP8gD73pW5MhMuztOoyMPmT
	4Z6YnBZVwtR/r4xEyK8KCJ8j0xoPBdzAP9xaRf2yHrnthIfW5JrroBCFRKkES6rj23qbSt8odwa
	3Mql4JVLFSV0g+n20tpkc3Oq9kNjpckxc56cjI/g5H8Y1txCnMPVvGeeq9Mzn6SiJvkVEWcYI+i
	1J2BdpA2WBT8DkezkCzwxoWCOB3r4MuYVSPTKvrp+AW2XgXgM4HYhagmSqxdrfoSq7NdrBUtaAn
	GAJ321gC9Wj32oZA=
X-Google-Smtp-Source: AGHT+IEiWGchPm8EUZEz0k5UfR7lqgQBJKEHySnHem0trVIe1OHBrn/B9SieAOeZwBtHdDNB6G1OcQ==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439a2eb09f6mr189376605e9.3.1740523404565;
        Tue, 25 Feb 2025 14:43:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22f0:312b:471e:e7f1? ([2001:8b0:aba:5f3c:22f0:312b:471e:e7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba549d87sm1726265e9.40.2025.02.25.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:43:22 -0800 (PST)
Message-ID: <e92b157ab767476436eeba55deddfc8f2b1489e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: check variable GO_IMPORT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, Christos Gavros <gavrosc@yahoo.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2025 22:43:20 +0000
In-Reply-To: <aa7f692a-ec61-4053-9524-7f0bc24c4e53@windriver.com>
References: <20250225180939.21341-1-gavrosc.ref@yahoo.com>
	 <20250225180939.21341-1-gavrosc@yahoo.com>
	 <aa7f692a-ec61-4053-9524-7f0bc24c4e53@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211936

On Tue, 2025-02-25 at 15:33 -0500, Randy MacLeod via lists.openembedded.org=
 wrote:
> =C2=A0On 2025-02-25 1:09 p.m., Christos Gavros wrote:
> =C2=A0Check if the variable GO_IMPORT is
> > assigned with a value. If not generate an error.
> > Fixes [YOCTO #15763]
> >=20
> > CC: Yoann Congal <yoann.congal@smile.fr>
> > CC: Randy MacLeod <randy.macleod@windriver.com>
> > CC: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> > ---
> > =C2=A0meta/classes-global/sanity.bbclass | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/s=
anity.bbclass
> > index 1bae998f74..01e48b4347 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -1010,6 +1010,10 @@ def check_sanity_everybuild(status, d):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if '/dash' not in=
 real_sh and '/bash' not in real_sh:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0status.addresult("Error, /bin/sh links to %s, must be dash or bash=
\n" % real_sh)
> > =C2=A0
> > +    # Check if a value is assigned to GO_IMPORT variable
> > +    if not d.getVar('GO_IMPORT'):
> > +        status.addresult("GO_IMPORT variable is not assigned with a va=
lue")
> > +
> > =C2=A0def check_sanity(sanity_data):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0class SanityStatus(object):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def __init__(self=
):
> > =C2=A0
> =C2=A0
> Thanks Christos,
> =C2=A0
> I know I suggested that you try sending this to see what people say and t=
o get some guidance but
> =C2=A0this break all the builds so clearly we can't merge it. I did expec=
t you to do a build though... ;-)
> =C2=A0=C2=A0
> =E2=9D=AF bitbake busybox
> =C2=A0...
> =C2=A0ERROR:=C2=A0 OE-core's config sanity checker detected a potential m=
isconfiguration.
> =C2=A0=C2=A0=C2=A0=C2=A0 Either fix the cause of this error or at your ow=
n risk disable the checker (see sanity.conf).
> =C2=A0=C2=A0=C2=A0=C2=A0 Following is the list of potential problems / ad=
visories:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 GO_IMPORT variable is not assigned with a value
> =C2=A0
> We need a sanity check at the recipe level for go-based recipes only.
> =C2=A0I'm not sure how to do that.
> =C2=A0
> I may do a bit of digging and reply to my own email with a suggestion of =
a better approach=C2=A0unless someone beats me to it!

The code is close, the location is wrong as "sanity test" is misleading
you.

The place this is used is in go.bbclass so I'd suggest we need a check
in that class alongside where it is used. It could be as simple as the
code above but in the form:

python () {
=C2=A0 =C2=A0 # Check if a value is assigned to GO_IMPORT variable
=C2=A0 =C2=A0 if not d.getVar('GO_IMPORT'):
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal("GO_IMPORT variable needs to be set to=
 use the go bbclass but has no value")
}

Cheers,

Richard



