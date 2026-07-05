Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE41C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 08:32:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128231.1783240351668953378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 01:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BPxFG7NB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso7255955e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783240350; x=1783845150; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rrwG45gQoPaThfoFe2wcdRkRKKcLXmTPorpFzaZK9Xw=;
        b=BPxFG7NBP+cj9SzUbeG5XpTh9kU56sbvn7olTZXhYniciQ0hr0d6ddP6zQki1n6v50
         JHW4+SSJmkQeKqQ8wmLabI2BW5N9lwJph8stcwtEFS5ELbFqY8kmAOl6ofGNJKrePNck
         PNO7FjiGicVUsCmJ8+VtIGtePY6XQd2B422hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240350; x=1783845150;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrwG45gQoPaThfoFe2wcdRkRKKcLXmTPorpFzaZK9Xw=;
        b=g/5khOM0oiWJKnMOrd3dVVsCxDPUohIYkFCMHOJr0kdSifxety33uxudLj7Ca5giyD
         MM14e2lxmLhA2R8GEOvAaIJc07QZ+J5z/6PU3bX8AJWoBUKu1JEiyhTQ0/kegSMWxw8k
         mRI8z6GzTviGfXBXBQ6P0l6mD9JOrjYseSDR/krkxjNYslC/HTOzGSq+iuhb4n2usSv6
         BteybD7bxK27309dyxOhjFmlsn6Xfk+PNKFpdGX0f+lUWWeLGmEoKX3i92gBLArlFBFK
         gqzVfuU53KNgLmjX7M3WtEUzuGsNiFDrpQ6pyOAej6L2bv4a+j4/NMkRvnFMz2mojCDB
         yodw==
X-Gm-Message-State: AOJu0YwJMjv1gkSeCYktaHLngaMJfMhfcjUhx0QjXx7OyJTMj9XnIhR8
	MVwKX0Jz0VC2qGRWfV7+x+1SFtRGWLZyrzhJMuxQE0OgmjpT8pmJ/MEu43mA+ug2XsU=
X-Gm-Gg: AfdE7clUk/JnfHge/QyRJe7+gycoYma39BprpCGKhXDdMG02yUIXE1CrqMRTEOjhHr+
	mnCklLGRLmNHi3lUxPnnL4x0Wf+w1pIzjbw35g9P2L93jEUVOMmL5+P5738Obqb9oTYFoAfq6aL
	I033vAB6TruoldOh30ZNfwnUO6FOWIXYMf6lXb2SzWjbpICgDnAbHzMAyIolZ3KLnnZqmB/gLJa
	mA94y5INR8ARRk/4z1wjL5Fmx49+dAZASBJCqKe6qKq1LIkl9l6cqkjj5fAi7OtbnCu79c4u+Fa
	/Kg5nHQqXUgsOmIuFyIFjeNTeH7GBNojgDUbZV+mHi4KHYE2C5hhqmrmNq87vGP1Yf289oK66UR
	DQYIOdjH30CgdotD2AFR5BtPlHknoqbOQAVzZ0BWFDMGjpKFZ2qfHso+WFkjEgy6DloA8B9hnTN
	lPTrkRaPwHTAFApaHSC37iRpBE0aP0Vns4dbEA0nCkjfl61u0QIuL701hOJqkhW3c987CU1zn8g
	hY=
X-Received: by 2002:a05:600c:a00d:b0:493:b764:ff98 with SMTP id 5b1f17b1804b1-493d11d66c5mr68651215e9.11.1783240349623;
        Sun, 05 Jul 2026 01:32:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:952e:67c8:1422:6cf? ([2001:8b0:aba:5f3c:952e:67c8:1422:6cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm13115062f8f.31.2026.07.05.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:32:28 -0700 (PDT)
Message-ID: <208d3e13b95e992d4eaf54f8210592c06ce46050.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2
 -> 26.1.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 05 Jul 2026 09:32:28 +0100
In-Reply-To: <DJQHRJ8J3RC1.Q0KLD14LY2ZA@bootlin.com>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
	 <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
	 <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
	 <DJQHRJ8J3RC1.Q0KLD14LY2ZA@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240144

On Sun, 2026-07-05 at 10:23 +0200, Mathieu Dubois-Briand wrote:
> On Fri Jul 3, 2026 at 11:36 PM CEST, Alexander Kanavin via lists.openembe=
dded.org wrote:
> > On Fri, 3 Jul 2026 at 10:30, Richard Purdie via lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > -SRC_URI[sha256sum] =3D "bac2bca9121897a2b8162e79636b50ac998fca799c8e=
6cf914edd85962babdf0"
> > > -PV =3D "26.1.2"
> > > +SRC_URI[sha256sum] =3D "072705caa9adf4740f1489194b13e278ad959166863b=
5271fe423a86353c9ab6"
> > > +PV =3D "26.1.4"
> >=20
> > This will probably fail to build for qemuarmv5, for that I have a patch=
:
> > https://git.openembedded.org/openembedded-core-contrib/tree/meta/recipe=
s-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instruction=
s-if.patch?h=3Dakanavin/package-version-updates
> >=20
> > Alex
>=20
> Just to confirm, we indeed have this error: https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/4097

I've queued my .4 with Alex's patch, thanks.

Cheers,

Richard

