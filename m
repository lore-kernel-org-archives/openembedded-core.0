Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E54C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 09:03:42 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.18027.1739955820950868172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 01:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXUgTHHF;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e65baef2edso49195396d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739955820; x=1740560620; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqomNv4HTDZO8Vj122fPgx95MO7BwwlY5BSkrM3Oc5g=;
        b=AXUgTHHFyW7VQ26281xkKUhUmdr6VO95TB0ok+62zp9KcRooZqzeXP15r3rJt0hegQ
         4svxJlE3KVGHqewHLoq42jdQIuKBi3Br/6VMa25reW01pK/mShd1tea3HZCfvFaa+rxy
         etrvA2AcTTymWOgHOMKcRAlm6BmjWaabk4HRZ7ICSrlIdU7EbjbjbSFlDmTA+u2OhZ3u
         jdhhwF7D/BuOFCs7cRERMYFZks6JDlke4fCN4Qw35xMnjtRuEIMM+d8Gjef8QIbbQv3u
         wBcHwUgYGiJcoHnXYByWOhYJSRwHpFlChg0hayZSAxHgMqqK7T5ekYmb6xOtka74crvY
         i9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955820; x=1740560620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqomNv4HTDZO8Vj122fPgx95MO7BwwlY5BSkrM3Oc5g=;
        b=ot4IUIlSjZTKTxJSZvol27FQZtWKejzZ6HneKZ2eBnXWu59nmIM5rFxj9zOTFnwmGY
         xk3UVK7FJXI3XqW6/iseyy5sqbV784B+XKnq8erUr4K+ldnv9coJF5nze+yj+L6rESJR
         TsONxdUSBp3Y0FVS8xOqly/XqY2XKJFR8D0q9yeMyRkJnvBfwzEvJkfGIL29fDNXUZbs
         XEBd6zGyqAraIk7HsKC5hsyokO+ucwssDVnAflpXaob96x3HuCZbW/hH8Hf8pK3OsGgJ
         4QLkAcIJ0sLNkuWzx0CwjM34U8OXqYp5Dtp3bODnTQUpotkR6YTvDTyh+wE5BWXtq3o+
         2Yug==
X-Forwarded-Encrypted: i=1; AJvYcCWXevFX758oVZRBX3wnvBgzsZ3C70ALZ/b2gaDdU/hObkdjhMoLBPSU2/VtqddTBocW51ivUggA+l6IIqsxk5L7cg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5KUVRP29LdGGVgkhNjnKdtZD8ycy6sk5OEItzRfzeKriwDCvt
	612i9BAQzha0CyzzuzPATwkXuLaCAnSCIknY7yYXez4t3jNeL5oN+X85V0mR+/VCgAFMpasd735
	etr8w5qN5KR56Gaist+YAXrIkhE4=
X-Gm-Gg: ASbGnct9zQ2b+oxfuEjk4XG60RInD/T/tFBdcLgZDneDQKHwK1t1NJmVU8IUz1ado75
	vGFNcJGRLHToj1ck9n2fA5xb4RgyugkRZRlfIp164uQA/b8y+fb6NwjMSvptBksbi9VfVr0bP2t
	MFITAY/q3dnE1g/x/EG2T25GAWtXBz29c=
X-Google-Smtp-Source: AGHT+IEmHklWTJpKZHyp1lv+R+8hRK7dqPbMhJq34p+B3+iNcf9jvRXycq39piH7ogzgI1yC0uJtmgEBOGwFw7BTEEk=
X-Received: by 2002:a05:6214:5085:b0:6d8:ada3:26c9 with SMTP id
 6a1803df08f44-6e66cca5592mr262781606d6.10.1739955819977; Wed, 19 Feb 2025
 01:03:39 -0800 (PST)
MIME-Version: 1.0
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
 <1739864375-21394-15-git-send-email-wangmy@fujitsu.com> <D7VQPBSVP6PJ.2CIYIN5Y67FR0@bootlin.com>
 <TYWPR01MB11861340480955F17E5309959DCC52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861340480955F17E5309959DCC52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2025 10:03:29 +0100
X-Gm-Features: AWEUYZmzgM1zpQ09DW10FZ7PYDn6nS5PgEs3lclLO13FSHfVKkbOJnI6-suXCOk
Message-ID: <CANNYZj8dmPrSJgtK4LH-MjjT7tG36_9XW=KD_nuBQ8DWP-NYUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
To: wangmy@fujitsu.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211691

You can see it here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n871

Probably DISTRO_FEATURES:append =3D ' api-documentation' will reproduce the=
 fail.

Alex

On Wed, 19 Feb 2025 at 03:06, wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> Could you please let me know the build options? I have selected machine x=
86-64 and bitbake panggo, but this issue did not occur.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> > Sent: Wednesday, February 19, 2025 1:16 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
> >
> > On Tue Feb 18, 2025 at 8:39 AM CET, wangmy via lists.openembedded.org
> > wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > - Avoid criticals when there are no fonts
> > > - fontconfig: Handle lack of FC_FONT_WRAPPER in font cache
> > > - fontconfig: Prefer application fonts even if they are older
> > > - Support setting font features in font descriptions
> > > - serialization: Document the tab array format
> > > - serialization: Accept attributes without range
> > > - win32: Improve the pango_font_map_reload_implementation
> > > - win32: Take variations into account for caching
> > > - layout: Fix measuring ellipsis runs with shapes
> > > - build: Require C11
> > > - build: Require GLib 2.80
> > > - build: Require cairo 1.18
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> >
> > Hi,
> >
> > This does fail on qemux86-world-alt:
> >
> > ERROR: pango-1.56.1-r0 do_configure: Execution of
> > '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/cor=
e2-6
> > 4-poky-linux/pango/1.56.1/temp/run.do_configure.1676834' failed with ex=
it
> > code 1 ...
> > | Program rst2man rst2man.py found: NO
> > | Program rst2html5 rst2html5.py found: NO
> > |
> > | ../pango-1.56.1/docs/meson.build:222:12: ERROR: Program 'rst2html5
> > | rst2html5.py' not found or not executable
> > |
> > | A full log can be found at
> > | /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/co=
r
> > | e2-64-poky-linux/pango/1.56.1/build/meson-logs/meson-log.txt
> > | ERROR: meson failed
> > | WARNING: exit code 1 from a shell command
> >
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/17/builds/955=
/steps/1
> > 1/logs/stdio
> >
> > Can you have a look at this failure please?
> >
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211660): https://lists.openembedded.org/g/openembedde=
d-core/message/211660
> Mute This Topic: https://lists.openembedded.org/mt/111247369/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

