Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5295CA1002
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 17:02:42 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.2422.1757178158035247036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Sep 2025 10:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZzyIsXw;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ea059954d52so99127276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757178157; x=1757782957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tF44Ig2R487dErsFj334rfnj9soYVLFBCH7JdXBFD4g=;
        b=DZzyIsXw4kzm5eAyEnO07/MivzKTXNsBEGpknlw+QEWGsnA57mUEFPGuP01ECrNFdZ
         asM80L4LL/EbR7waJ9XKXIj3tRa9xjqzaHdXxzxtqm3PFnGq3N/epUfOJmkhXtlxzuEN
         B0MikqN0k3NN9ZBxaoXET3MdU3yMtZg7ZBTXAdhpx3VrqjRtxfIsdeM7xoyqMfowPsiz
         n0ZM9jQYMxP3XvmlV2JSRTixQ3jRNLCun8qfn2mEse1xbLt+o2O7YLXfIVn1uONW98Eq
         6r/YbuK4V68iC0F5eAAGVe5B85069b5TD3O6Z1IOpCTOMolDo2YpjIASAO6d4aFMWys6
         i1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757178157; x=1757782957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF44Ig2R487dErsFj334rfnj9soYVLFBCH7JdXBFD4g=;
        b=pdKGMKkguujvXsVQDHNrM9aS+UmbUWpSkRsKTomAD1nwfbV5ictvmEYvhDEqBe0f6x
         hxxXo1NfMwBwn/z/dnVkNz2cLxRX6ekC78Vl/6/OwOMb//3aFajrkiGzzrnz+JVfJ2s6
         qxmHp5CjPkBSztSnpwgURJTUSu3cHCdY9eRXGRSATt5WmjaGRoqnai1ny8wRLAF9cHMP
         w39o98qS0evbABZzdc1RV+5WXB6mpr7OfB7Qb77Be4t5Kk9YfrKS4oZwFsmsVC94KaC9
         Hvvw7if1fqD4OZ08FYZRxD/vpXxTHM363zduLv0GkVGTAHuvAPhC21/5EpCBvYuqk9eS
         w2pA==
X-Gm-Message-State: AOJu0Yxic9WYBIqWbIrtn2/JU+MSTw5AVwlkJiNKKpqf4BVFQjmEh47H
	wKR8ML4TXPR3zbPH9pcirvS+7J50ZkXRrldoqWWDuCQh/7tW+090truRtCWlD3wNvuO0OilsSkR
	RAHAV7GBWb0ePaWtCnb1q6x8TNXwT1v0=
X-Gm-Gg: ASbGncu3HL9P0nvipcVKcSTQKmNj7vit/GLO5jcUaqTTkUs4x+JKUm3awvnNlqeKBpe
	t38ktgxlqW+Pwyjo8/7pVfe6I5YQS7EO1LEV87kxqau43RRLki/yy5djwLnJuWVaIDs9BNsdlM8
	kUgNvp85ktGSRjwZyd9pE+2xkd6r2GHjyOdU1MwWI1K7ILer722yTSMnuU/h90kkXyf7hu4pCx1
	ThFraOAuqxus0Tx51iyulTC+Hh2hU2Y
X-Google-Smtp-Source: AGHT+IGcO7l4KFqlY1JNktAP2/IaNcLyqzU4rELJI3CVQh1f4NvwZf/Ei6CPvO6nP0KlyxjOHuy7fvBcVrHMS1b75kc=
X-Received: by 2002:a05:690c:6c85:b0:71f:c5f0:339c with SMTP id
 00721157ae682-727f593e79cmr22078797b3.43.1757178156985; Sat, 06 Sep 2025
 10:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 6 Sep 2025 11:02:26 -0600
X-Gm-Features: AS18NWDfVh8vKDVR-inuqVKD4Lnbmb5nQw280S6CvzFY9S0do0cp5QkCkYt_JOU
Message-ID: <CAJdd5GbX8GT+k+YkSkFiB=dk4ChfhFcVeENk-O4-NR+x7EMjqg@mail.gmail.com>
Subject: Re: [PATCH 0/6] backport: SPDX 3.0 support to Scarthgap
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, 
	antonin.godard@bootlin.com, Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: multipart/alternative; boundary="000000000000dab280063e24eb8d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 17:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223046

--000000000000dab280063e24eb8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:11=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
n.com>
wrote:

> Hello,
>
> This series backports SPDX 3.0 support from the upstream Walnascar
> branch to Scarthgap, along with a few additional local fixes to ensure
> correct integration.
>
> The primary motivation for this series is to bring full SPDX 3.0 support
> to the latest Yocto Project LTS release, Scarthgap, which will continue
> to receive maintenance updates until 2028.
>
> This ensures that long-term supported releases can benefit from the
> latest SPDX standard for license and compliance tracking.
>
> These changes are also in line with discussions at the Yocto Project
> Summit in Amsterdam, where the need for up-to-date SPDX support in LTS
> releases was highlighted.
>
> The backport introduces SPDX 3.0 document support, SDK and image
> integration, and related helpers. It also brings over tasks, classes,
> and library code from upstream.
>
> Feedback is particularly welcome on:
>   - The correctness and completeness of the backport
>   - Whether the local fixes should be adjusted or further refined
>

Interesting. This backport isn't as bad as I initially thought it might be,
thanks for putting it together! I'll look it over more closely to make sure
it seems alright

We had originally stated that we wouldn't backport this in OE core, and
would prefer to use a mix in layer.... that said, it is probably the number
one request I've gotten any time I talk about SPDX, a lot of people are
pretty interested in having this, and there are a lot of advantages to
doing it in OE core, so perhaps we can discuss that more.

The one thing I can tell right away that you are missing is the test code;
if this does go into OE core, backport of the test cases will be required
also.



>
> Greetings.
>
> Kamel
>
> Joshua Watt (4):
>   classes-global/license: Move functions to library code
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>
> Kamel Bouhara (Schneider Electric) (2):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1348 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  15 files changed, 9028 insertions(+), 207 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>
> --
> 2.43.0
>
>

--000000000000dab280063e24eb8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 5, =
2025 at 11:11=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@=
bootlin.com">kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
This series backports SPDX 3.0 support from the upstream Walnascar<br>
branch to Scarthgap, along with a few additional local fixes to ensure<br>
correct integration.<br>
<br>
The primary motivation for this series is to bring full SPDX 3.0 support<br=
>
to the latest Yocto Project LTS release, Scarthgap, which will continue<br>
to receive maintenance updates until 2028.<br>
<br>
This ensures that long-term supported releases can benefit from the<br>
latest SPDX standard for license and compliance tracking.<br>
<br>
These changes are also in line with discussions at the Yocto Project<br>
Summit in Amsterdam, where the need for up-to-date SPDX support in LTS<br>
releases was highlighted.<br>
<br>
The backport introduces SPDX 3.0 document support, SDK and image<br>
integration, and related helpers. It also brings over tasks, classes,<br>
and library code from upstream.<br>
<br>
Feedback is particularly welcome on:<br>
=C2=A0 - The correctness and completeness of the backport<br>
=C2=A0 - Whether the local fixes should be adjusted or further refined<br><=
/blockquote><div><br></div><div>Interesting. This backport isn&#39;t as bad=
 as I initially thought it might be, thanks for putting it together! I&#39;=
ll look it over more closely to make sure it seems alright</div><div><br></=
div><div>We had originally stated that we wouldn&#39;t backport this in OE =
core, and would prefer to use a mix in layer.... that said, it is probably =
the number one request I&#39;ve gotten any time I talk about SPDX, a lot of=
 people are pretty interested in having this, and there are a lot of advant=
ages to doing it in OE core, so perhaps we can discuss that more.</div><div=
><br></div><div>The one thing I can tell right away that you are missing is=
 the test code; if this does go into OE core, backport of the test cases wi=
ll be required also.</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Greetings.<br>
<br>
Kamel<br>
<br>
Joshua Watt (4):<br>
=C2=A0 classes-global/license: Move functions to library code<br>
=C2=A0 lib/license: Move package license skip to library<br>
=C2=A0 lib: oe: license: Add missing import<br>
=C2=A0 classes-recipe/image: Add image file manifest<br>
<br>
Kamel Bouhara (Schneider Electric) (2):<br>
=C2=A0 backport: SPDX 3.0 fixes and tasks from upstream version Walnascar<b=
r>
=C2=A0 spdx30_tasks: fix FetchData attribute in add_download_files<br>
<br>
=C2=A0meta/classes-global/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A041 +-<br>
=C2=A0meta/classes-global/license.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 165 -<br>
=C2=A0.../create-spdx-image-3.0.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A085 +<br>
=C2=A0.../create-spdx-sdk-3.0.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A074 +<br>
=C2=A0meta/classes-recipe/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A058 +<br>
=C2=A0meta/classes-recipe/license_image.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A014 +-<br>
=C2=A0meta/classes-recipe/nospdx.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A013 +<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 200 +<br>
=C2=A0meta/classes/spdx-common.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A099 +<br>
=C2=A0meta/lib/oe/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/lib/oe/license.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 203 +<br>
=C2=A0meta/lib/oe/sbom30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1096 ++++<br>
=C2=A0meta/lib/oe/spdx30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5593 +++++++++++++++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1348 ++++<br>
=C2=A0meta/lib/oe/spdx_common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 244 +<br>
=C2=A015 files changed, 9028 insertions(+), 207 deletions(-)<br>
=C2=A0create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass<=
br>
=C2=A0create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass<br=
>
=C2=A0create mode 100644 meta/classes-recipe/nospdx.bbclass<br>
=C2=A0create mode 100644 meta/classes/create-spdx-3.0.bbclass<br>
=C2=A0create mode 100644 meta/classes/spdx-common.bbclass<br>
=C2=A0create mode 100644 meta/lib/oe/sbom30.py<br>
=C2=A0create mode 100644 meta/lib/oe/spdx30.py<br>
=C2=A0create mode 100644 meta/lib/oe/spdx30_tasks.py<br>
=C2=A0create mode 100644 meta/lib/oe/spdx_common.py<br>
<br>
--<br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000dab280063e24eb8d--

