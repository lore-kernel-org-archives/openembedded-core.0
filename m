Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31677C3ABA2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 14:51:35 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.10443.1726498292020457028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 07:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n0qvyMup;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ddca648c26so6986437b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726498291; x=1727103091; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXWcNN4qk8W/oMoU5e6IhzDwENFcgppBWTBXx+2vlZY=;
        b=n0qvyMupFyvPTHjMBODtqHg2dh5AdgX5zmVJL9Lz01okdOvCrjWs6y4BAeXRLwBAHJ
         kzxm9LzumYT5IlcK2qh+xhkPNKYyaX4Y9jw/WlWLeBnJ0Gtln01ktJdJDFLC9roCOBbT
         DRHch1lhyBuTcQ5+MFF+Uqf0uupYkga4ZzUunL8kU9DwBQpJzdehvjXC40+DbDNN7q9i
         khkwmUcM4mJlUGIJNqlrUdepViKejl5EHyrgI/u7Zwm3JKpfBrxvc+AnmT0vLwT1Ky0N
         nk2sfZP1WIOqFuhJhj1rdyj4lAJ/rgE506UWtoSdHlNbdJ1q1LP4uQCrGD0hnyCwMZrb
         XOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498291; x=1727103091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXWcNN4qk8W/oMoU5e6IhzDwENFcgppBWTBXx+2vlZY=;
        b=euK2CBQnBGSy5mxVzKr8T31Pdv+pTDygJTJ1CmKG397KpRQSzolxNI6ROE8EfNvqqF
         H7mXTgn0D3RodLz+O4e1phN/UiEUNfBbCgVPAQhj8HnswcebuvEmshTIgvHpsGk0QNbe
         HTGoVFN0I4YQRok7JlmE9H4agEqX+a3Z0bWzkTmK8GB23MpRae+fiO8q8xGgPckcw7pn
         Ky1ja2/mnCa7q4tYkqQKxWQxO6edOmKU1T5Tp1wnagj8MF15pfQ8oGRbtltIVOWURxIx
         DgTORISJElXThiwVIQ3ZY7Cl8+vqKrL6v67M0SSEttKCh/ABKNmw3eFGfHn7GcO68jIO
         IXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWNi8MA7iAVrd6zcFvZZ8KJl5TbUZFcNeiYghvEjGNn66EvEnhspPLQRWflmWXLHyOegPUbchNdQxMXndJeW45bzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx31eRL+HI1K+cxDlF8dR6SfTAynlHLMz4gIt+GLrA3tqFmModB
	/WS4hkqOL68Gwxmfc7FHSlxBwdyVwfP9nNi2oITLSX/LHFejyQreACskmwyTziEgSX+s3OPZ8IZ
	h7ltXc/EwxzJa9Hpf9kHcgAs1gEf+gtqTutMLFA==
X-Google-Smtp-Source: AGHT+IET/ooa332iTuYRjr55x8vshfWzYFdrD09J8skHOGsOHU3nuEFXxlTRViFaV4JVQzNs3p5zO8He88FmFbyDvBA=
X-Received: by 2002:a05:690c:4b0e:b0:6d4:72b7:177e with SMTP id
 00721157ae682-6db95312363mr171421197b3.5.1726498291102; Mon, 16 Sep 2024
 07:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240912131711.243389-1-vanusuri@mvista.com> <CA+chaQe+jAerWU7PvouvyuQP8nd-qcw2C-9Y=ZA3Pt19mAG0rQ@mail.gmail.com>
 <CANQUz1-FoAzSKxKC+eqnLHcjbHn2XBKgZZoO8MBXZG-OKfKkFg@mail.gmail.com>
In-Reply-To: <CANQUz1-FoAzSKxKC+eqnLHcjbHn2XBKgZZoO8MBXZG-OKfKkFg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Sep 2024 07:51:20 -0700
Message-ID: <CAOSpxdZ4q-GavheajB0PJSACpf7cn8=eKxp5hf2yBEwUvS3zLw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libpcap: upgrade 1.10.1 -> 1.10.5
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 14:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204608

On Sat, Sep 14, 2024 at 3:14=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Thanks Martin for letting me know.
>
> Hi Steve,
> Could you please ignore this upgrade patch. I will send another patch wit=
h security fixes.

I've dropped it, thanks!

Steve

> On Sat, Sep 14, 2024 at 12:12=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>>
>> This update seems to break nmap build from meta-oe:
>>
>> nse_nsock.cc:36:3: error: expected identifier before 'int'
>>    36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable =
*/
>>       |   ^~~~~~~~~~~
>> nse_nsock.cc:36:3: error: expected '}' before 'int'
>> nse_nsock.cc:33:6: note: to match this '{'
>>    33 | enum {
>>       |      ^
>> nse_nsock.cc:36:15: error: expected unqualified-id before '=3D' token
>>    36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable =
*/
>>       |               ^
>> nse_nsock.cc:40:1: error: expected declaration before '}' token
>>    40 | };
>>       | ^
>> nse_nsock.cc: In function 'int socket_lock(lua_State*, int)':
>> nse_nsock.cc:181:17: error: 'THREAD_SOCKETS' was not declared in this
>> scope; did you mean 'MAX_SOCKETS'?
>>   181 |   lua_rawget(L, THREAD_SOCKETS);
>>       |                 ^~~~~~~~~~~~~~
>>       |                 MAX_SOCKETS
>> nse_nsock.cc:203:19: error: 'CONNECT_WAITING' was not declared in this s=
cope
>>   203 |     lua_rawset(L, CONNECT_WAITING);
>>       |                   ^~~~~~~~~~~~~~~
>>
>> I don't think this upgrade from
>> 470 Wednesday, June 9, 2021:
>> 471 Summary for 1.10.1 libpcap release:
>> to
>> 70 Friday, August 30, 2024 / The Tcpdump Group
>> 71 Summary for 1.10.5 libpcap release
>>
>> is suitable for stable branch, please cherry-pick just the security fixe=
s.
>>
>> On Thu, Sep 12, 2024 at 3:17=E2=80=AFPM Vijay Anusuri via
>> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Changelog:
>> > https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES
>> >
>> > Includes Security fixes
>> > CVE-2023-7256, CVE-2024-8006
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>> >  .../libpcap/{libpcap_1.10.1.bb =3D> libpcap_1.10.5.bb}          | 4 +=
+--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta/recipes-connectivity/libpcap/{libpcap_1.10.1.bb =3D> libp=
cap_1.10.5.bb} (92%)
>> >
>> > diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/met=
a/recipes-connectivity/libpcap/libpcap_1.10.5.bb
>> > similarity index 92%
>> > rename from meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> > rename to meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
>> > index dbe2fd8157..94b6466722 100644
>> > --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> > +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
>> > @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217=
c160e2920d2e35bddc36453 \
>> >                      file://pcap.h;beginline=3D1;endline=3D32;md5=3D39=
af3510e011f34b8872f120b1dc31d2"
>> >  DEPENDS =3D "flex-native bison-native"
>> >
>> > -SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz"
>> > -SRC_URI[sha256sum] =3D "ed285f4accaf05344f90975757b3dbfe772ba41d1c401=
c2648b7fa45b711bdd4"
>> > +SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
>> > +SRC_URI[sha256sum] =3D "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb=
1a34ff0aa9ceece3925"
>> >
>> >  inherit autotools binconfig-disabled pkgconfig
>> >
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#204443): https://lists.openembedded.org/g/openembe=
dded-core/message/204443
>> > Mute This Topic: https://lists.openembedded.org/mt/108412577/3617156
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

