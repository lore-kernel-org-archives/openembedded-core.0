Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44892CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 22:25:52 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.1958.1758234350611459251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 15:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fcuh1M5O;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ea5cbca279aso1138531276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758234350; x=1758839150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulnAIB85Ps7cu/5UeQ7JqMQc97UZmzP14K0Yk5zw6Fk=;
        b=fcuh1M5OvVs43RWH2Irm6dE4Ao42e5EzxsobbLvdqJjBpl3+IGssyKgr09dRD+Dhmo
         y09dSCsW+imlfCbT+wtRFCI2FACnHclDXR4N1zZFxlvQyZ5xNZi0RdLUMMhR3EUFQQX/
         AsEYFNKHI9MAXuRmSqPVJwJ6abRy7IYxKUBpz80U+pfFe1kuTwazbU7MyeBe0wOu8Lxl
         mCx7LoAFRQE+vPp/W2srkyzYU+JjIZjuh/9SHds5Jvw94DEw4WnTjY/2fMq2YQE2qNqh
         LligQG21T64te6/R6huZkiEBfGJ36tCsPNx61TBZKtpAQ138PmKMHxaPuLkCXryTKh87
         Ya5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758234350; x=1758839150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulnAIB85Ps7cu/5UeQ7JqMQc97UZmzP14K0Yk5zw6Fk=;
        b=pYd6X1yT11tm+1GP4vOJI91oMMGUFL0vpvN820rSQPm/FLYK1r3OELT8d+v1hrmX3t
         etGD+yduK1B+NGKYryq5FxOtYyAt5Uzuqa3OdSXVwljMNCpD4gFvLq6mb/+dO9j8282E
         CvW2nj0sEZkn72gEwumurbkPywmMZe1zZX4aQ0g2jhjRu3KvP10eRYEYEXHL6Jqw8Bby
         wazZiJwXf8J5Ze5I7cWgEJcSfsyFfEIxIwH2VuycYfn8ropdyTbeuOTIbDIohFz5kHkX
         sn+Bnh0ezYcoHObje19pvVOWU/IUIcw+JG5BvMepYY1dpfHrPImFIEgW9ntANg8iw/c9
         SgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgdlRT+88ZNxz5l3Er1dL/Sqj68k38Uil8pNA9bf0GCgnbDKnAt5PlRMFC8/WHfF00jXirW4zX9U3FE0dpEEEqCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMVJlvwtWU5n+SfTiA8JrTkys85l+e765zllz34mNEX/EVgeDj
	21hsP0CWFVaqZ0wPPE7JY72avprc5AGpmjP8jpbKUJ0oLat4RXHisSYF5FYVcUGwd9grResmjTp
	016xGBT/gJ+h9EHjDkwvvuJY3cbr4GQw=
X-Gm-Gg: ASbGncv/4cHXN/nU3704tzzJWOBWa9RbV32tEAnQZc3SXrxUMv0w5VE4xvw/8nzhWfY
	Wbz9Dn3oNXxe3fGu5SMMaghkeODoa6npsg+lCmu35YLNb33cYfOdCrUO/XrMGtwYhxYYakHPvig
	tvoJJAC1fumnO7Qta2hcK2Zt5YO0Am//Lx3kT2zhNhwJzsYSewKvy/jdu3hDsFM1nxY1VjDQoWk
	KDuAwC7c0tBylI5KsE2pg14W+6Eq/AZGhLIqRNf
X-Google-Smtp-Source: AGHT+IHjIQIdE808ick6YjM74/qjzt0EMGjcakAqTS9LnqQ0Apgb7F733KUGbP7YhyQx0nzfsqkUtdO0wu9gTrO/zBs=
X-Received: by 2002:a05:6902:2806:b0:ea7:f61c:a9c8 with SMTP id
 3f1490d57ef6-ea8a8a5624bmr1034777276.38.1758234349636; Thu, 18 Sep 2025
 15:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250918214903.341452-1-rs@ti.com>
In-Reply-To: <20250918214903.341452-1-rs@ti.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 18 Sep 2025 16:25:38 -0600
X-Gm-Features: AS18NWBcAcL_omq_Xqp58Nc-hLilkThKVLHryiUSZ2VW_k_iWOn7i4TI2KpyOgw
Message-ID: <CAJdd5GZFeR4OHG09g8z1RC1PFBzJh72EHUbLx2CPfa5CKK75sA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and wayland
To: rs@ti.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 22:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223703

On Thu, Sep 18, 2025 at 3:49=E2=80=AFPM Randolph Sapp via
lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> We've recently run into some issues with weston-init attempting to start =
Weston
> prior to all drm devices being registered. There's not really a good, scr=
iptable
> mechanism to listen in to device registration events that works with the
> existing weston-init package. Well, at least one that doesn't involve pol=
ling
> files or introducing more dependency on the init system being used.

It's not clear how switching to emptty actually solves that problem; I
don't see anything in my (brief) look at the emptty code that would
lead me to believe it actually cares about any drm devices being
present or handles devices showing up dynamically. Can you maybe
elaborate more on this?

>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the sa=
me
> issue.
>
> I'd like to introduce the following display manager for oe-core, emptty [=
1].
> This display manager is, as described upstream, a "Dead simple CLI Displa=
y
> Manager on TTY". It supports both x11 and wayland sessions, with togglabl=
e build
> parameters to completely remove x11 and pam dependencies. It's licensed M=
IT,
> which shouldn't be an issue for any users. (It is written in Go, if you h=
ave
> opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be re-=
tuned
> to leverage this display manager and simply add a user and emptty config =
for an
> autologin session. This can resolve the current behavior across init syst=
ems
> without additional scripting, and move some development out of this layer=
.
>
> This lists myself as a maintainer of emptty as well as xserver-nodm-init =
and
> xuser-account since these are currently unassigned and I've reworked them
> significantly here.
>
> Sorry for the delay on this series. I found a few bugs in emptty that I w=
anted
> to address before submitting this officially.
>
> [1] https://github.com/tvrzna/emptty
>
> v2:
>         - Address spelling issues in commit messages
>         - Attempt to resolve some test related issues with weston
>         - Add additional logs to X11 related tests
> v3:
>         - Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When runni=
ng
>           under QEMU the first auth attempt almost always fails.
> v4:
>         - Add a tmpfile entry for the x11 domain socket directory.
>         - Remove some scripts associated with weston-init that were being
>           shipped with weston
> v5:
>         - Move tmpfile data to individual files
>         - Add explicit entries for these in the FILES variable
> v6:
>         - Do not attempt to ship a tmpfiles.d entry in libx11
> v7:
>         - Include a backported fix for go/runtime to address segfault iss=
ues
>           reported on x86 platforms in previous revisions
> v8:
>         - Sign-off backported patch
> v9:
>         - Resolve merge conflict in maintainers file
>
> Randolph Sapp (6):
>   libx11: create tmpfile dir for x11 domain socket
>   go: fix sigaction usage on i386 platforms
>   emptty: add version 0.14.0
>   weston-init: convert to virtual-emptty-conf
>   weston: remove deprecated weston-start scripts
>   xserver-nodm-init: convert to virtual-emptty-conf
>
>  .../conf/distro/include/default-providers.inc |   1 +
>  meta/conf/distro/include/maintainers.inc      |   6 +-
>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>  meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
>  ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
>  meta/recipes-graphics/emptty/emptty.inc       |  26 ++
>  .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
>  meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
>  meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
>  .../wayland/weston-init/emptty.conf           |  77 ++++
>  .../recipes-graphics/wayland/weston-init/init |  54 ---
>  .../wayland/weston-init/weston-autologin      |  11 -
>  .../wayland/weston-init/weston-socket.sh      |  20 -
>  .../wayland/weston-init/weston-start          |  76 ----
>  .../wayland/weston-init/weston.env            |   0
>  .../wayland/weston-init/weston.service        |  71 ----
>  .../wayland/weston-init/weston.socket         |  14 -
>  .../weston/systemd-notify.weston-start        |   9 -
>  .../wayland/weston/xwayland.weston-start      |   6 -
>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>  .../xserver-nodm-init/capability.conf         |   2 -
>  .../xserver-nodm-init/default.desktop         |   5 +
>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
>  .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
>  .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
>  meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
>  .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
>  .../user-creation/xuser-account_0.1.bb        |   3 +-
>  39 files changed, 581 insertions(+), 918 deletions(-)
>  create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-using-c=
go-on-386-call-C-sigaction-funct.patch
>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
>  create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-auto=
login
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sock=
et.sh
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-star=
t
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.serv=
ice
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.sock=
et
>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.w=
eston-start
>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-=
start
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/13xdgbasedirs.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/89xdgautostart.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/90XWindowManager.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xs=
erver
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/ca=
pability.conf
>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/de=
fault.desktop
>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/em=
ptty.conf.in
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gp=
lv2-license.patch
>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm.conf.in
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm.service.in
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223699): https://lists.openembedded.org/g/openembedde=
d-core/message/223699
> Mute This Topic: https://lists.openembedded.org/mt/115318655/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

