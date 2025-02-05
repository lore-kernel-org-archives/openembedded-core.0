Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E847C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:38:38 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.13317.1738766309567771398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 06:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oy8bt98c;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9c3ec68c7so2956604a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738766309; x=1739371109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fc+NcUVK+rVXBDQR7tJp9BvQpRr8wef9eF0ineC4WRw=;
        b=Oy8bt98cjM1Z+itrcG1B0wxP3Az5qK1Hn+UyP0YxcAsap2q9JCx9EQs7OrLNtzoG2O
         uIILKfXf1mKyXuJ0Bvo3S3F14iMN8LHmBt6MdbJfwc0P84EMMSUazuMzIKMEiUd9chvz
         SCG2eOfW+glAmXPQlhxiT4xki+ikmZ9Bwff12P9F4sD71NQZ+Rmj8CkIU81CqthaQk6t
         J+FJnHDzpNXp9QtGwrAR6t+21iRr+AvQ74mVWmo6CQEid9RvNqOLhSFHdL9018k/jkN0
         S2FN5NOzl/gjYcdaG/U7eZMOOI5n1A2n0wx/WILlTu8F7xpIsZvJVADst/9oFmOGz5ur
         T0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766309; x=1739371109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc+NcUVK+rVXBDQR7tJp9BvQpRr8wef9eF0ineC4WRw=;
        b=fKDksjDlf/NshOos3bQ0LWVchBsAqxmObV4WIgIKOEAxUGBCR9MEY28KS9xpLwc3+Y
         jRY/WEld5B19mUvWPAwqqQa6qFeraZ0nZTPglFOq+L3gYdTrFyt/6Uye4gVsUjt6H/p6
         zPaC8BUXOA51iAe6kyZSgVsv4EWRkIvW6DlXhLKXZvy2sJySHmyNqGO5LRBQCukbi9Ox
         gqEe5XiU0IkC0SkOCvanIvbVANNp/dNkcX7ql50BQ0BHv1eEBIyoviddcZ3O9Si/NnJ9
         oNoNASj4ElpfmmjpvlrmHhSLwgiArISx0Vdn6qaZgz7IFNasp7VdMDQ1gjtI4vCDLxWb
         iR6Q==
X-Gm-Message-State: AOJu0Yya1r1iH5+qbAFj8007CWdRn8U3r7L8oUp5754ROjAr9RqQCf3G
	4svkhKwDk6gzNxhel6Zk6k/Sxtcc22WG6I1l+Vn9RKN42t48SEJ05sZ8OmchMZCozkTNYqv9QSE
	yarvt92MZIT+tkgoCqqjgrXP3OX8tWi1I
X-Gm-Gg: ASbGncvO7I36zrwA/Rdsw3LIkNlSj0Jjx2asscdvwYQBhshDlK6gPCFlUSSf7swsJUP
	gC2JpWu+mSbryPD8YYT5JbX7vZVdUfnQCzBXAgwhQxMAXKXSCt5UotiaY7qbuxodh9KS0sAj7
X-Google-Smtp-Source: AGHT+IEmWl/KYVQXtKC1czClxqLhW8FKQwTrQ8T+ONmyjVia3ynVIjB9jtAId8eEmZwqM2uII2ybiVwXU8S3kIX62l0=
X-Received: by 2002:a17:90a:d604:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2f9e074bccemr5087446a91.2.1738766308924; Wed, 05 Feb 2025
 06:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
 <20241224102557.9300-5-marta.rybczynska@ygreky.com> <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
In-Reply-To: <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 5 Feb 2025 15:38:17 +0100
X-Gm-Features: AWEUYZk004VhTchSlXPZ7RQNnDbnbEp2qmRIiUrbfvBk9FF6QJtb55nLwcKXIds
Message-ID: <CAApg2=TTyMtTkA9TPY=qRJYqKS35a+G1WBGN8jJdjPWfr97HRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="00000000000030e68a062d661486"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210854

--00000000000030e68a062d661486
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've submitted the v3. It fixes the typo, upgrades the warning to
erroronce, but still defaults to NVD2.

One other change is the move to different database file names for each
feed. There might be slight transitional
differences between them depending on the synchronization time. A merge
between sources that are not
in sync could cause strange errors.

Kind regards,
Marta

On Tue, Jan 14, 2025 at 6:54=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Dec 2024, at 10:25, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
>
> There=E2=80=99s an inconsistency:
>
> > Set the NVD_DB_VERSION variable to choose feed:
> > NVD2 (default) - the NVD feed with API version 2
> > NVD1 - the NVD JSON feed (deprecated)
> > FKIE - the FKIE-CAD feed reconstruction
>
> =E2=80=9CNVD1=E2=80=9D
>
> > +# Possible database sources: NVD1, NVD2, FKIE
> > +NVD_DB_VERSION ?=3D "NVD2"
>
> =E2=80=9CNVD1=E2=80=9D
>
> > +    if nvd_database_type not in ("NVD", "NVD2", "FKIE=E2=80=9D):
>
> =E2=80=9CNVD=E2=80=9D
>
> I=E2=80=99m thinking =E2=80=9CNVD1=E2=80=9D should be used everywhere.
>
> If you set it as the documentation says then every recipe throws a
> warning, which is quite the pastebomb.  Might be better to make it
> bb.fatal() and tell the user to fix their typo?
>
> Ross

--00000000000030e68a062d661486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve submitted the v3. It fixes the typo, upgrade=
s the warning to erroronce, but still defaults to NVD2.</div><div><br></div=
><div>One other change is the move to different database file names for eac=
h feed. There might be slight transitional</div><div>differences between th=
em depending on the synchronization time. A merge between sources that are =
not</div><div>in sync could cause strange errors.</div><div><br></div><div>=
Kind regards,</div><div>Marta<br></div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14=
, 2025 at 6:54=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm=
.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 24 Dec 2024, at 10:25, Marta Rybczynska via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br>
<br>
There=E2=80=99s an inconsistency:<br>
<br>
&gt; Set the NVD_DB_VERSION variable to choose feed:<br>
&gt; NVD2 (default) - the NVD feed with API version 2<br>
&gt; NVD1 - the NVD JSON feed (deprecated)<br>
&gt; FKIE - the FKIE-CAD feed reconstruction<br>
<br>
=E2=80=9CNVD1=E2=80=9D<br>
<br>
&gt; +# Possible database sources: NVD1, NVD2, FKIE<br>
&gt; +NVD_DB_VERSION ?=3D &quot;NVD2&quot;<br>
<br>
=E2=80=9CNVD1=E2=80=9D<br>
<br>
&gt; +=C2=A0 =C2=A0 if nvd_database_type not in (&quot;NVD&quot;, &quot;NVD=
2&quot;, &quot;FKIE=E2=80=9D):<br>
<br>
=E2=80=9CNVD=E2=80=9D<br>
<br>
I=E2=80=99m thinking =E2=80=9CNVD1=E2=80=9D should be used everywhere.<br>
<br>
If you set it as the documentation says then every recipe throws a warning,=
 which is quite the pastebomb.=C2=A0 Might be better to make it bb.fatal() =
and tell the user to fix their typo?<br>
<br>
Ross</blockquote></div>

--00000000000030e68a062d661486--

