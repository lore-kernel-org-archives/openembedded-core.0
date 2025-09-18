Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55150CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 22:35:22 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web11.2135.1758234916071883005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 15:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dvra9WpK;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-633a2be31daso1018543d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758234915; x=1758839715; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=118kPrx5hn9yyvzthA+xK3wYHqYXCb5dUXmc0Fv7AbY=;
        b=Dvra9WpKHueJMa/zdnSd4xQpMxIra0uyemaJR8fxlEp7yXw0r9eklcj7I+rGLVX/qb
         1DYwjNVCef6OCTPFEaxNvaD+M7GsAcCUGDXuPIeoA71eVaiDzFpOHwzv8GCtctrUkZLX
         kJ6ScGf85CiiswJjUNgiKyHgt5TzpKS+70H7qfSgM42yLLwxfUGvtNXJ/ZCG564+CdUs
         vvrvv9AXtykuVgiUD+JtWIFlqpgJeE18AvaRGw574+rZv60IStYlBzu3H3egBN7bo8BW
         SF2KMJ9zzCMhiG38MMcXiQPCoOVqJmMfq3/Osnm9U+elyDsXN9GNoc3HvhP4t5zMsnH9
         rUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758234915; x=1758839715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=118kPrx5hn9yyvzthA+xK3wYHqYXCb5dUXmc0Fv7AbY=;
        b=sC33ZvyhTkZmctCFRrz8V5qlNH16qMVCDlugFsA4BHj6X8vxkSuG9v0y5YshrwuxMl
         tWGyy6Dx/k1XypB/hpPHp2gHrRuqpb9XrJEdr3vDbCiY384YJYUUceo5B4k7K2g1aWPm
         T78jEEyY8otZoBHzajlS7FEx6y8uyAFxU6H1qU8V4pF3kZSoLXzvWzGJD2YXa1IBbAoc
         DGjIvC+TcU7m6XpYMJ4BYmACwxZMGPsajJT4I52aiXYLDnpvBcAuOqut2F/fNF2Cb4ao
         RZp0f3/U2Em9mHSsQVwaMLuZ0W/p9Km1sKA1MmFtmFaCYHgk0Dg/bCDnYLKGAVUKUY1G
         cPqA==
X-Forwarded-Encrypted: i=1; AJvYcCXhBGyesJOgNtFEX0ZMIO6ARpe817nEAQRs66efbjkA0vc+IqTC3UuGUPpsI9NNZZWV3v/aycHuTZiFcqZ77C6VLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwCkrNf/xb4IhyutV4/SBp7dMxs8L6b3jKuH4UkcRN25PSYGLl
	BzechnIbmxnLhQUbD2og2h5eWpPZ8k0Kjq/kzDq/tN2HRclu/iGzbTPqoJH50xNhxUY6cGw02ua
	S8b3R+2RVUOSk1gOgc+R/5XukkIqAIiw=
X-Gm-Gg: ASbGncsc7U4xRZ89T0lBFWCqeBh2LCiRPWQMIttdngYoY9fSTlQowl4U9KnTeKBUfWH
	l/EBLS+0dTXGY7Dvm7mAPBOQXdbLBfj8oFpWHweMOgLyYwqPrSSoMQyaMsIkyjgd5S4IIucUYFQ
	O2UcHqQ9zZKdUe3qIOIzvhx4Z/PA2VoCaEGMBSRAQjKfxT2+l0UJtoln+FGvxHpAz0op1/oaik/
	aNHKwEcEQiPi2S5PDo7JEiOFVWpTz8+zvWVGeuH
X-Google-Smtp-Source: AGHT+IH36cl7Cag2rzoO6tbcoj/8Upz3E4uwhjLuaBe2/PVphltBTrnwepb62pVFflYWDOsUcMLBywcTL+tAtclJa68=
X-Received: by 2002:a53:e3cf:0:b0:633:b128:ea64 with SMTP id
 956f58d0204a3-634778c317emr920232d50.0.1758234914849; Thu, 18 Sep 2025
 15:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250918214903.341452-1-rs@ti.com> <CAJdd5GZFeR4OHG09g8z1RC1PFBzJh72EHUbLx2CPfa5CKK75sA@mail.gmail.com>
 <DCWA6GFPV2UX.3777W4JSPK51A@ti.com>
In-Reply-To: <DCWA6GFPV2UX.3777W4JSPK51A@ti.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 18 Sep 2025 16:35:04 -0600
X-Gm-Features: AS18NWC720_pDgnOqGiq8y-ZBVMJ20Tor2ZexlZ5kdyo8BRhZiAYQ320Dyu3GtY
Message-ID: <CAJdd5GZFK_1eoHLWSZ2_gf69Mp7Q2er6Q=KAoBHiMAGQpgjTDA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and wayland
To: Randolph Sapp <rs@ti.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 22:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223705

On Thu, Sep 18, 2025 at 4:31=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On Thu Sep 18, 2025 at 5:25 PM CDT, Joshua Watt wrote:
> > On Thu, Sep 18, 2025 at 3:49=E2=80=AFPM Randolph Sapp via
> > lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
> >>
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> We've recently run into some issues with weston-init attempting to sta=
rt Weston
> >> prior to all drm devices being registered. There's not really a good, =
scriptable
> >> mechanism to listen in to device registration events that works with t=
he
> >> existing weston-init package. Well, at least one that doesn't involve =
polling
> >> files or introducing more dependency on the init system being used.
> >
> > It's not clear how switching to emptty actually solves that problem; I
> > don't see anything in my (brief) look at the emptty code that would
> > lead me to believe it actually cares about any drm devices being
> > present or handles devices showing up dynamically. Can you maybe
> > elaborate more on this?
>
> It doesn't currently have any tests to wait for the DRM device. I still n=
eed to
> look into adding that, but what it currently does is add a retry event co=
unter
> and a small delay between retries that is better than the current console
> implementations. Especially considering authentication is handled separat=
ely
> from this retry process.
>
> By centralizing display manager specific code, common checks and fallback=
 logic
> can be more easily implemented in the future. I'm hoping this lays the
> groundwork to let me address some other issues I've seen in multi-card
> environments as well.

For the systemd parts, is it also possible to solve this with e.g.

Requires=3Ddev-dri-card0.device
After=3Ddev-dri-card0.device

(or similar) ? Seems like anything emptty would be doing would be a
reimplementation of the logic that already exists in systemd to do
that.



>
> >> I also see there is also a lot of scripting around starting X11,
> >> xserver-nodm-init, that (from my limited review) should experience the=
 same
> >> issue.
> >>
> >> I'd like to introduce the following display manager for oe-core, emptt=
y [1].
> >> This display manager is, as described upstream, a "Dead simple CLI Dis=
play
> >> Manager on TTY". It supports both x11 and wayland sessions, with toggl=
able build
> >> parameters to completely remove x11 and pam dependencies. It's license=
d MIT,
> >> which shouldn't be an issue for any users. (It is written in Go, if yo=
u have
> >> opinions about that.)
> >>
> >> With this, both weston-init and the xserver-nodm-init packages can be =
re-tuned
> >> to leverage this display manager and simply add a user and emptty conf=
ig for an
> >> autologin session. This can resolve the current behavior across init s=
ystems
> >> without additional scripting, and move some development out of this la=
yer.
> >>
> >> This lists myself as a maintainer of emptty as well as xserver-nodm-in=
it and
> >> xuser-account since these are currently unassigned and I've reworked t=
hem
> >> significantly here.
> >>
> >> Sorry for the delay on this series. I found a few bugs in emptty that =
I wanted
> >> to address before submitting this officially.
> >>
> >> [1] https://github.com/tvrzna/emptty
> >>
> >> v2:
> >>         - Address spelling issues in commit messages
> >>         - Attempt to resolve some test related issues with weston
> >>         - Add additional logs to X11 related tests
> >> v3:
> >>         - Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When ru=
nning
> >>           under QEMU the first auth attempt almost always fails.
> >> v4:
> >>         - Add a tmpfile entry for the x11 domain socket directory.
> >>         - Remove some scripts associated with weston-init that were be=
ing
> >>           shipped with weston
> >> v5:
> >>         - Move tmpfile data to individual files
> >>         - Add explicit entries for these in the FILES variable
> >> v6:
> >>         - Do not attempt to ship a tmpfiles.d entry in libx11
> >> v7:
> >>         - Include a backported fix for go/runtime to address segfault =
issues
> >>           reported on x86 platforms in previous revisions
> >> v8:
> >>         - Sign-off backported patch
> >> v9:
> >>         - Resolve merge conflict in maintainers file
> >>
> >> Randolph Sapp (6):
> >>   libx11: create tmpfile dir for x11 domain socket
> >>   go: fix sigaction usage on i386 platforms
> >>   emptty: add version 0.14.0
> >>   weston-init: convert to virtual-emptty-conf
> >>   weston: remove deprecated weston-start scripts
> >>   xserver-nodm-init: convert to virtual-emptty-conf
> >>
> >>  .../conf/distro/include/default-providers.inc |   1 +
> >>  meta/conf/distro/include/maintainers.inc      |   6 +-
> >>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
> >>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
> >>  meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
> >>  ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
> >>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
> >>  meta/recipes-graphics/emptty/emptty.inc       |  26 ++
> >>  .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
> >>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
> >>  meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
> >>  meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
> >>  .../wayland/weston-init/emptty.conf           |  77 ++++
> >>  .../recipes-graphics/wayland/weston-init/init |  54 ---
> >>  .../wayland/weston-init/weston-autologin      |  11 -
> >>  .../wayland/weston-init/weston-socket.sh      |  20 -
> >>  .../wayland/weston-init/weston-start          |  76 ----
> >>  .../wayland/weston-init/weston.env            |   0
> >>  .../wayland/weston-init/weston.service        |  71 ----
> >>  .../wayland/weston-init/weston.socket         |  14 -
> >>  .../weston/systemd-notify.weston-start        |   9 -
> >>  .../wayland/weston/xwayland.weston-start      |   6 -
> >>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
> >>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
> >>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
> >>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
> >>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
> >>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
> >>  .../xserver-nodm-init/capability.conf         |   2 -
> >>  .../xserver-nodm-init/default.desktop         |   5 +
> >>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
> >>  .../xserver-nodm-init/gplv2-license.patch     | 355 -----------------=
-
> >>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
> >>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
> >>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
> >>  .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
> >>  meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
> >>  .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
> >>  .../user-creation/xuser-account_0.1.bb        |   3 +-
> >>  39 files changed, 581 insertions(+), 918 deletions(-)
> >>  create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-usin=
g-cgo-on-386-call-C-sigaction-funct.patch
> >>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
> >>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
> >>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
> >>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.c=
onf
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-a=
utologin
> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-s=
ocket.sh
> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-s=
tart
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.e=
nv
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.s=
ervice
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.s=
ocket
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notif=
y.weston-start
> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.west=
on-start
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/X11/Xsession
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/X11/Xsession.d/13xdgbasedirs.sh
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/X11/Xsession.d/89xdgautostart.sh
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/X11/Xsession.d/90XWindowManager.sh
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/Xserver
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/capability.conf
> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/default.desktop
> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/emptty.conf.in
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/gplv2-license.patch
> >>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init=
/xserver-nodm
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/xserver-nodm.conf.in
> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init=
/xserver-nodm.service.in
> >>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
> >>
> >> --
> >> 2.51.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#223699): https://lists.openembedded.org/g/openembe=
dded-core/message/223699
> >> Mute This Topic: https://lists.openembedded.org/mt/115318655/3616693
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[JPEWhacker@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

