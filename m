Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA146C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 17:07:43 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3157.1788541658184990768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 10:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EI5kUuuL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1601043a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788541656; x=1789146456; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GkyvYMDsaxMg2VmjLwZzBTPZfXFqnHquJDaRcZh5wRA=;
        b=EI5kUuuLMm/zEjv4VS+Bl5rZqb2Cto4AKATwafqb7CbcjpIaLbmrWrV1k7w9aPiLDu
         82pz7jUPhiRJzI6UdHvlzGI3O8hcF8LSTnd1lSBiy0DF/PNkSc6Qp8/GxlmRFwEz0Iv2
         NQvLS5Nfcm91hABgdXUsF/QnJ4iQFgajfX/YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541656; x=1789146456;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkyvYMDsaxMg2VmjLwZzBTPZfXFqnHquJDaRcZh5wRA=;
        b=GiUPn1xehleiN6+ljPFmfNwkiNFdXwTcNFET8OUn5dqzvEUdFhhsw3tUVEQGO8fQLR
         2Wpkw4AT+momufVqF5ePwBguqaHjEn48lCJMUcU+A62ZrDOVhllHbSZvuTzKfvUKko7V
         tkwccFJ0j4mwY9FzXaSlGthe/dosAR0BJLtuUT5SaCrzJUmC4Z7GbCSvE68G+eO1/r+W
         Js30AOvEuyLZrgc2YBTQV6Ce3PUmACPJmGXZYeGRm1+JtD4et4izAq/W3jqtAfo7L38P
         2qviC9C8EaS6cDBvkC/tI9Azkhrx5J/eOHbalFBXeRHDw4OK1vxYELFqtsTIBGZJRYlv
         qFMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSJtDv/zlgqNOhAkwJ//ijdBYbhntzW/xeCmiC5CijI86DRHOzS3X9EiHNToj34mmkSwkJ8oLy5WvX6ZeMbgm1VA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lRFQ0WfEJhDE4khJj4rR/XeOEBh4oH1dpEjUlY2iDGTaBmmPHh
	xkUtoSgcgX7WN50C2UKRzCewgU62vcVDYudr4Mp6JQBywzluo7SqBl+QjbTDzRBMSQw=
X-Gm-Gg: AYBFou0jZyPLybdYeDTPgMk7cqfwoHxsdW+RR6+fEyj2E+IR1GIA+Ro9yR4Kh3bgLEb
	w/EFVEyVvhpJxNMW7KdtDQVzjLWBCV+AhtyAkjnhaQJ7m/VlMGWzmi3pT3LK1sNGgYnHLNEcoAa
	X9/in1VTISnwvCRPllxvHAx2jKvoz3tnWiBzdKV3e7LpAtrxeYxbsdH06Xzmvw6abktgX1N1LOq
	HyjFjqmDZGU6Y5bM0EPlRPQVXkCkvEqgb1sjxVgc+MZBVbBLXrIofGD3LNUglE0+/F/JVEFZG1t
	YaZkzLx7/72sD7Ukk8IJf4EYT5NxcH60fe1ccmyuW+MQlvJRZOISTuJowAtcoIE7mWpV6qnu+aa
	eK//vo6qBy7Tcct4rR5br4qHGV+8X1l2x1oVNbFSxCLwjiIQXsYgLZRLPEybbLSxirvpTTVQkNn
	IgnNHSWSEKdlrQYNId8LyfkiFTNqgOniWtTpdN3wXmeco9p8hR+vGKQDGMU3DjTNnsq40ysQW03
	4kAa3caZQ5rZxPiqfQxlr7K7pTMMKPd+U/113LGv+8Pi8Ke/76WKimDflMuBik9
X-Received: by 2002:a05:6402:194d:b0:6a7:ee55:dcd3 with SMTP id 4fb4d7f45d1cf-6a7ee55dd9amr1811111a12.34.1788541655973;
        Fri, 04 Sep 2026 10:07:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4? ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e0esm1470909a12.9.2026.09.04.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:07:34 -0700 (PDT)
Message-ID: <122ee46d60d45c5a014a8cd40158a008ecd29744.camel@linuxfoundation.org>
Subject: Re: A walkthrough of some of the challenges with auto generated
 changelogs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Date: Fri, 04 Sep 2026 18:07:32 +0100
In-Reply-To: <PA3PR07MB107211B0D283D9025D46DDED68AB62@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
	<e13a77790d4c9bb55bd61aa59ff433c703b6f3d8.camel@linuxfoundation.org>
	 <PA3PR07MB107211B0D283D9025D46DDED68AB62@PA3PR07MB10721.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 17:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245127

On Thu, 2026-09-03 at 07:55 +0000, Daniel Turull wrote:
> Thanks for the input.
>=20
> On Wed, 2026-09-02 at 12:47 +0100, Richard Purdie wrote:
> > Everyone keeps telling me how great these auto generated change logs
> > are and yes, they can be helpful but they are also piling pressure on
> > me as everyone has their own preferences and personal "triggers" for
> > issues. I keep getting told how XXX shouldn't have merged without YYY
> > being tweaked but the tweaks/triggers vary per person. I also get told
> > a changelog is better than none and that we shouldn't be spending time
> > on it. I can't win.
>=20
> Maybe I should write a proposal on what to include in the commit messages
> regarding the changelog changes?
>=20
> My opinion is also the latter. A changelog is better than none and that w=
e
> shouldn't be spending time on it. There is always the original changelog =
if
> people is interested in all changes.
>=20
> The original intent was for the stable releases, where is more important =
to know
> what has changed.

Agreed, it definitely is useful but I did want to make sure people
could see the other side of this too. None of this was meant as
critisism, more just open feedback on how it 'feels' having used it for
a while. Some of the implications are not quite what I'd foreseen.

> > I'm feeling bad that I haven't written down the things that are causing
> > issues so I'm now trying to do that here.
> >=20
> > One general issue is that we can often delete the "Source: ZZZ" lines.
> > They're good to explain where the data came from, we don't need to keep
> > them in the final commit message in most cases (unless they're urls?).
>=20
> I'll create a patch for it for the AUH to truncate it, so we have both. T=
hat
> should be simpler.

Ok.

> > So in summary:
> > =C2=A0- could/should the Source: be after the scissors if non-url?
> > =C2=A0- can we strip out the github urls for pull requests?
> > =C2=A0- can we linewrap the data better?
> > =C2=A0- can we drop commit hash refrerences?
> > =C2=A0- should the truncation limit be slightly higher?
>=20
> The last one should be easy. It is a configuration parameter in the AUH. =
For the
> rest, I will look at all the issues that you listed next week, together w=
ith
> what Ross reported a few days ago. I hope I can come up with small patche=
s
> getting it better. I will probably need to add some heuristics to disting=
uish
> between the different cases and hope not break things.
>=20
> If more people has feedback, please send it to me.
>=20
> The original intent was to be a help when doing recipe updates and not a =
burden
> for you.

No problem, as I said, this isn't meant as critism and I am trying to
give some hints on where/how it could be improved. I appreciate some of
the suggestions aren't easy (and hopefully some are). Thanks for
working on it and looking at the tweaks!

Cheers,

Richard


