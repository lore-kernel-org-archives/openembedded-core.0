Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E699FC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 16:52:12 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10549.1740588723461069871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 08:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9/X1WPT;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5461f2ca386so6002950e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 08:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588721; x=1741193521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDiNKL/3fK0eGXHBfRFETmAivNN7cIwckFI0HG5oq2k=;
        b=N9/X1WPT1Z+1BqoifXfKhKn0CeDWlgCjJjHhQN9uSnNR8fgIc5yRFI5HuuMC9mrag6
         J/8l9suTKAw3sEWdoYngR+wjIY3deiR7BcBhp/6BDUWSm2M0f3FDu9trNHtZCD+YkHFh
         moEMa22X5BOMY5jLXhRZQ7bHo8rLb3gi4ToT/n+MLCHo2dKE/ek5ev/rDzImddDRk7lI
         tJH5yhicCHDbr2RcpgvDaDcyIl7+M/d7p4v0skdTVGqGbGNKJtpQAG+ZGhRC3ATatlXf
         rRRSV2yK9DSzciaPSJ5pLN8keit9/CRNx3Kk2SBPvtLfxQTzXnC+f8wL/Iogg/iHFAnr
         1BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588721; x=1741193521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDiNKL/3fK0eGXHBfRFETmAivNN7cIwckFI0HG5oq2k=;
        b=SCpGnhJtGw7AMq0GWK1PegKw2A3j5TXUAAHApqYQrwzU6bjOOUOxg1/Uc0nMj5FLWe
         gdPh8I3+4TNQzWoXeuFTScon/onBELYvSoT0FAIMzdRmT5nLyV6imVe4p0x3/IWrOviQ
         otRukkRN8ShgRe8fSxQOLVto6NHTeUbf0N77EpmEXRib57Xg+jSMy/3Pn31/j2eyic35
         e6fr23JNqf8HFeMmFuA2PBqhioHaPoXMyQlIE09vEgrFleNjlXh6bpLCWKqI9pkdy4/P
         cRh06AGPUXRE7YgU396Mv2ZjGz/6l4ZZiJr9j+AbvZ4qcxSplBnO/9gtCf8cVKn7DHzj
         GShg==
X-Gm-Message-State: AOJu0YzNMoniH4dP8Izc6lqDWzzZzEjwMgfzvtHWizeGxJ3V6xBNplhz
	LOG57bY01wre4RCB978/ehgKpbdzGWBbnNlVh8z1TUfyMpVMD6IvFwdVVNgIpny/eBA2qD+73jd
	Tffys41sx7JpqLlz+jrlgwfNjaB0=
X-Gm-Gg: ASbGncuGkG0uPVdNJ4ayzHd8iixJxsmpGGNVD6U4BK3iei5MO04E3sYIbBqjnCKejct
	t4dQ22zPtZdNrZyREn8wLFJBFhZ8vK2AN7k1ctiyyiEazOR+KwpjD1Cr3VdGB1KLC3xTUCY8YsU
	6+oJ9T4zQ=
X-Google-Smtp-Source: AGHT+IEs+8RsT99rTfnl42K/DK2u0LojiIFG/r0IhOJIH2CNmy+viv6Vs66i1K8mBsEGk3aP7Wl1YHARhYsqIQe9wk0=
X-Received: by 2002:a05:6512:ba8:b0:546:2a27:ec35 with SMTP id
 2adb3069b0e04-548392598c1mr11025950e87.37.1740588721246; Wed, 26 Feb 2025
 08:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20250226150720.143127-1-colinmca242@gmail.com>
In-Reply-To: <20250226150720.143127-1-colinmca242@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 26 Feb 2025 09:51:49 -0700
X-Gm-Features: AQ5f1JoRcqJ9O6hpqmsCOi4QUcDou7ATR3Ly1xSFgtfjfCbqxIV6dLkVBlnfSaQ
Message-ID: <CAJdd5GbNBObLU18H-91BwWxrXNt1YNz=eQpxCqjb-r_hoXLERg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-map: Add accept-risk tag
To: colinmca242@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 16:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211962

On Wed, Feb 26, 2025 at 8:07=E2=80=AFAM Colin McAllister via
lists.openembedded.org <colinmca242=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Adds tag for downstream users of Poky to accept risk for CVEs.
>
> Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
> ---
> Upcoming cybersecurity regulations allow for CVEs to be accepted on a
> risk basis. This tag will allow consumers of Poky to mark CVEs as

s/Poky/end users/

> ignored with this tag, which will help when feeding cve-check output
> into compliance documentation.
>
> This is not intended to be used upstream and the comment tries to
> indicate that. If I need to be more explicit in my comment, I'm happy to
> send up a v2 patch.
>
>  meta/conf/cve-check-map.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
> index ac956379d1..ef3aabe641 100644
> --- a/meta/conf/cve-check-map.conf
> +++ b/meta/conf/cve-check-map.conf
> @@ -32,6 +32,8 @@ CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored=
"
>  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
>  # use when upstream acknowledged the vulnerability but does not plan to =
fix it
>  CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"
> +# for poky consumers to use when adding justification for why they don't=
 plan to fix it

Maybe better as something like:

  "for end users to use when adding justification for why the do not
plan to fix a vulnerability (e.g. in local.conf or similar)"

> +CVE_CHECK_STATUSMAP[accept-risk] =3D "Ignored"
>
>  # use when it is impossible to conclude if the vulnerability is present =
or not
>  CVE_CHECK_STATUSMAP[unknown] =3D "Unknown"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211961): https://lists.openembedded.org/g/openembedde=
d-core/message/211961
> Mute This Topic: https://lists.openembedded.org/mt/111397328/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

