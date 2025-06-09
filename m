Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D06C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:38:07 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.64098.1749487078798612071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vT/1e8e5;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4289982276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749487078; x=1750091878; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8g7tJTomMDvXEE9tgCD824EWJUJgQxutUySszt6E/Fk=;
        b=vT/1e8e5La4o4GASik/4zFO6tMw4asud7pfdvG8Wef+OmPOaicsv/aYu7G+SxgNpEc
         6MyNRHvXXNmdGXoFXg8AAbLnSwRAaKicvxjCMMGK+Gt5qgMMY3dyQhZRd5q2W4F9mc0R
         LTw+1zFTy+3G5IPcjhBSvd/8+bio0w6VI6U2vLxn+t1GDPB+XV1b8t06qExgHNe+DoJv
         NCaaUustz+5Gud05R55/q87rWdhC1DZBbL0UxKSLJsn1JY2U57zQ1xpSXYkq8KffIswb
         n/SxlGoErlxN8bxFQa3uiFlessVgIYzPAYSporCkx2wGxs3W7OdbjcH+ceA/RnBQAdaO
         vEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487078; x=1750091878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g7tJTomMDvXEE9tgCD824EWJUJgQxutUySszt6E/Fk=;
        b=Fwm7lpquwCY2G6USDmcFbuazw93bdIKuKhxcMQyWZY/ttpuMPFjbiYZ3t9uhAnTHO3
         BNAwpXxkaM7SJoDhmcX1vHmUPoQU80mwz2EV7DVPDREh9+kAFFhSgjgRzBJRsnCbcYVQ
         SWu6yHKo431oL1wYXNGUY2UiUEWc+3bZzLCYcNJuan3ADpEx5EV/XaeUA4+qx0WKt8oe
         YFyyZ6mGlt6XZtw8Z8bw8OuKW6ZIibPAVH9w7MS/A8CK+OT0evoQ55RgsGODkH09eSVJ
         5dQVbS0m/7hIULMAjBwvx/uuLZ8MLyz/JgurLfjFjQyjp9EZeAWmXdxa941FcsIoxWE5
         zKCA==
X-Gm-Message-State: AOJu0YwBiggDOOQMgBbM8H541x4cZ0I6oZIL7Zb5AeKPPEh/Pv9roOPA
	FHZMDCF95pLTmOlR98fVWJRX6pCu+JP82P/7764Xz+NQWn3GFyeptW8H4xbvSrsFJRDacTDZhIi
	1VJfZvlrBtHr0v16IctQsNgs+1Fmm/RMxYRmrV59l9zjKnshkD0MI
X-Gm-Gg: ASbGnctEiM3FPHiK0Tn3zW7ndpow8S2GxZMNwwI74PvjqAluWWS/FMSO6Sq9VXNUU6z
	+n0jh1NFQOlmQW/bSkbALR0H6UZ3jPi88DaBnjrg5KPc3wCHN6539hrOU1HJgTc4qpbeMqXHqnK
	/6h160c+bnRPSFGVWcxwCoUbZcubPz5jwIlyv4u9d3LAtGJs3y2puxFuuqPa+JvLBU
X-Google-Smtp-Source: AGHT+IEZOYe0/eSxR7jtaFudoQs4s325Ux45pAwKs8rYzxjogNdNthmlZdMV6M17BlW6QIxxx5JEx8zzw9z1vxKRm50=
X-Received: by 2002:a05:6902:450b:b0:e81:b1d6:c00 with SMTP id
 3f1490d57ef6-e81f03fdeeamr263808276.0.1749487077889; Mon, 09 Jun 2025
 09:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250604053655.96207-1-vanusuri@mvista.com> <CANQUz18y87HfvcgbAUFb6nRkhP_gxrhAEd9BdMAcFT3qUxde6Q@mail.gmail.com>
In-Reply-To: <CANQUz18y87HfvcgbAUFb6nRkhP_gxrhAEd9BdMAcFT3qUxde6Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 9 Jun 2025 09:37:46 -0700
X-Gm-Features: AX0GCFvexhEzYtbWMlV6k6VLs25yBXKaMjZFWD8tFhmeZVjIIPRpXtoam9-0YSI
Message-ID: <CAOSpxdYYL3QKBc0CAo5FjpWkvKqr3h+ZFsKt6jGLr=ics=k2qw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] kea: upgrade 2.4.1 -> 2.4.2
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218299

On Sun, Jun 8, 2025 at 7:38=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com> =
wrote:

> Any update on this ?

It should be in the next batch of patches sent out for review (within
the next or so)

Steve

> On Wed, Jun 4, 2025 at 11:07=E2=80=AFAM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Changelog
>> https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt
>>
>> License-Update: Update copyright year
>>
>> Includes security fixes for CVE-2025-32801, CVE-2025-32802 and CVE-2025-=
32803
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb} (=
94%)
>>
>> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-c=
onnectivity/kea/kea_2.4.2.bb
>> similarity index 94%
>> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
>> rename to meta/recipes-connectivity/kea/kea_2.4.2.bb
>> index fcdb4889d9..6bb7cb9164 100644
>> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
>> +++ b/meta/recipes-connectivity/kea/kea_2.4.2.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Kea is the next generation of DHCP soft=
ware developed by ISC. It
>>  HOMEPAGE =3D "http://kea.isc.org"
>>  SECTION =3D "connectivity"
>>  LICENSE =3D "MPL-2.0"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea061fa0188838072c4248c1318e=
c131"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dee16e7280a6cf2a1487717faf331=
90dc"
>>
>>  DEPENDS =3D "boost log4cplus openssl"
>>
>> @@ -18,7 +18,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.ta=
r.gz \
>>             file://fix_pid_keactrl.patch \
>>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-wr=
ite-.patch \
>>             "
>> -SRC_URI[sha256sum] =3D "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f=
7c8581408e180131a"
>> +SRC_URI[sha256sum] =3D "6e82fb319d3b871c0d39bbd504f2cda0c66fa1262865872=
985fb4fb91b4eaafc"
>>
>>  inherit autotools systemd update-rc.d upstream-version-is-even
>>
>> --
>> 2.25.1
>>

