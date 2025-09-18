Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB10CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:04:12 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.2607.1758236644602143913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lnWHwLb/;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60150590so10346837b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 16:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758236644; x=1758841444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dUdWYSf7QJ1WAtIgF2KzM5hbChE4NbVSuIbL8kWR3E=;
        b=lnWHwLb/yHgx66nvfv42NrBxawEB9Oso5vf99s0S0aXCLPu9a55DYD4BvZ/zQ27MKb
         B/zUHgtaIqdml+555gYQyY2MzNmEk2NM/u5kTJc7366P6W9+9lxF/z/HxbbCjhJFuUGv
         s5gMUarfPL/aGlCS59hfT2b16fN6sFSiubAXNGpr7nSEQOLowoSob1bxVYIpwCM1BiRo
         F0a1b65DcwCdSVmdfwqGrDo6A8WQuQh9jEN8jcwZmW1Vp24TXae7PemcTU/BrJ4BA+iE
         hIiw8+QvYVIIpOucM8LR1hxEjGzGtX+Z3hTCbwYgdz9nhV7PILhxZYPCq8Pk7wgAnx9M
         D7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758236644; x=1758841444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dUdWYSf7QJ1WAtIgF2KzM5hbChE4NbVSuIbL8kWR3E=;
        b=xNvBssQBo1dYOWUikmn3kgbS4ex0wNQk8s43R9ROuJkAnoLFww+OqRmlAiHkk/ePdA
         tGwW96Mj99A0ng8C/QhbnB93rlL1u6BILtfKfAIr81e+1+nufls6LR0uGw4LISxXxnVP
         b9nWOWmFwP/7v58Vl5Y/rHSEF6TOAMlFJK2qVEsgWy0Gn7YTP9ohTBwKNp2qEYwtJwCq
         /zM+Mk7dPu+kOfE3sJAMRXGCT4nhN9Y1ch76MFIFtnLph0ygaUE6oY9xjco16udnMpyt
         koPlKkUuA5GrHiEaupwiI2xayyMI9DZUXrCHNJX322eJMXk95Cl2FWx6cEj/jY9ax4Dy
         X4uA==
X-Forwarded-Encrypted: i=1; AJvYcCXtk/luhbEuOhXFfw0njJNAYTaK6at7+40K7RqnGmU0CkNgupBUx44jsxqMuQLJBcmIggm6gYrNm0TSfAjnitP40Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUs5pelQQz08m7A2yEK5AgxMM4OHF/hHOfCPP1/52NOQvD2PIe
	7IpQV3cIUs5vsvdUijV3g4C4kiISMqksVlhEpvTfIiGjmrziCUMc0R1Rp95mtpUkk2B77e6hX90
	d4X5+QCNG14JH4BvNeFM5iN5agWTiJ6w=
X-Gm-Gg: ASbGncvHOCrhyhfsvxaq6nwbgmzeZYho87gsPd7Pizv78FqUbmkz56F5cKgU4zPipsu
	Hz/2yld8ifTYlkGs+jAXu2wcJjQYqD3MUXUXvqZbo5AEzf+lVeXDD+m9RYivZt5fz44j1cefDc4
	nScIqWvDelCvR9aHH/ATccz4i8f+dlU1rcn5v5KB/gVRpIFqg0eBZ7tih5CxmzRuuA79uAZCeOK
	MpTXEROpdUmJM8J6AJVDMvV9vZRenEoIVfCA/Do
X-Google-Smtp-Source: AGHT+IHb+IZy/QY5xHKUbBvGBXO6faV0OSwyQpsxymeHOmZJZGW0+uXv0rnEFPmEVmyJinZVu0MUGv8slcNXFYXo07o=
X-Received: by 2002:a05:690c:4c08:b0:721:2390:e9d1 with SMTP id
 00721157ae682-73d40a08e69mr11835187b3.49.1758236643543; Thu, 18 Sep 2025
 16:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250918214903.341452-1-rs@ti.com> <CAJdd5GZFeR4OHG09g8z1RC1PFBzJh72EHUbLx2CPfa5CKK75sA@mail.gmail.com>
 <DCWA6GFPV2UX.3777W4JSPK51A@ti.com> <CAJdd5GZFK_1eoHLWSZ2_gf69Mp7Q2er6Q=KAoBHiMAGQpgjTDA@mail.gmail.com>
 <186681957172BF4C.23626@lists.openembedded.org> <DCWAEPXOFEE4.Q4F6GTPJ7TTZ@ti.com>
In-Reply-To: <DCWAEPXOFEE4.Q4F6GTPJ7TTZ@ti.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 18 Sep 2025 17:03:52 -0600
X-Gm-Features: AS18NWAJPXPmH-ZAIntPcqH7A8FowvEX7RbmNfPPUmQ-EC8ipD5oRVjMVkWsN_I
Message-ID: <CAJdd5GbSE6A4B9c-euprk84Y5Qyn_JwyOksFA+nBhaDM8ZVSYw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223708

On Thu, Sep 18, 2025 at 4:42=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On Thu Sep 18, 2025 at 5:39 PM CDT, Randolph Sapp via lists.openembedded.=
org wrote:
> > On Thu Sep 18, 2025 at 5:35 PM CDT, Joshua Watt wrote:
> >> On Thu, Sep 18, 2025 at 4:31=E2=80=AFPM Randolph Sapp <rs@ti.com> wrot=
e:
> >>>
> >>> On Thu Sep 18, 2025 at 5:25 PM CDT, Joshua Watt wrote:
> >>> > On Thu, Sep 18, 2025 at 3:49=E2=80=AFPM Randolph Sapp via
> >>> > lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
> >>> >>
> >>> >> From: Randolph Sapp <rs@ti.com>
> >>> >>
> >>> >> We've recently run into some issues with weston-init attempting to=
 start Weston
> >>> >> prior to all drm devices being registered. There's not really a go=
od, scriptable
> >>> >> mechanism to listen in to device registration events that works wi=
th the
> >>> >> existing weston-init package. Well, at least one that doesn't invo=
lve polling
> >>> >> files or introducing more dependency on the init system being used=
.
> >>> >
> >>> > It's not clear how switching to emptty actually solves that problem=
; I
> >>> > don't see anything in my (brief) look at the emptty code that would
> >>> > lead me to believe it actually cares about any drm devices being
> >>> > present or handles devices showing up dynamically. Can you maybe
> >>> > elaborate more on this?
> >>>
> >>> It doesn't currently have any tests to wait for the DRM device. I sti=
ll need to
> >>> look into adding that, but what it currently does is add a retry even=
t counter
> >>> and a small delay between retries that is better than the current con=
sole
> >>> implementations. Especially considering authentication is handled sep=
arately
> >>> from this retry process.
> >>>
> >>> By centralizing display manager specific code, common checks and fall=
back logic
> >>> can be more easily implemented in the future. I'm hoping this lays th=
e
> >>> groundwork to let me address some other issues I've seen in multi-car=
d
> >>> environments as well.
> >>
> >> For the systemd parts, is it also possible to solve this with e.g.
> >>
> >> Requires=3Ddev-dri-card0.device
> >> After=3Ddev-dri-card0.device
> >>
> >> (or similar) ? Seems like anything emptty would be doing would be a
> >> reimplementation of the logic that already exists in systemd to do
> >> that.
> >
> > It gets messy. A udev rule needs to be made to make systemd track that =
device.

Ya, that's pretty normal.

> > In a multi-card environment a device without an actual display may be p=
icked.
> > Systemd cannot directly solve the issue on it's own.

Sure, but isn't that what udev is for? I don't think adding selection
of a drm device makes sense in emptty. Regardless of init system, it
really feels like selection of the correct device to use for display
should be a udev problem.

>
> Additionally, there are more init systems supported here than just system=
d...
>
> >>> >> I also see there is also a lot of scripting around starting X11,
> >>> >> xserver-nodm-init, that (from my limited review) should experience=
 the same
> >>> >> issue.
> >>> >>
> >>> >> I'd like to introduce the following display manager for oe-core, e=
mptty [1].
> >>> >> This display manager is, as described upstream, a "Dead simple CLI=
 Display
> >>> >> Manager on TTY". It supports both x11 and wayland sessions, with t=
ogglable build
> >>> >> parameters to completely remove x11 and pam dependencies. It's lic=
ensed MIT,
> >>> >> which shouldn't be an issue for any users. (It is written in Go, i=
f you have
> >>> >> opinions about that.)
> >>> >>
> >>> >> With this, both weston-init and the xserver-nodm-init packages can=
 be re-tuned
> >>> >> to leverage this display manager and simply add a user and emptty =
config for an
> >>> >> autologin session. This can resolve the current behavior across in=
it systems
> >>> >> without additional scripting, and move some development out of thi=
s layer.
> >>> >>
> >>> >> This lists myself as a maintainer of emptty as well as xserver-nod=
m-init and
> >>> >> xuser-account since these are currently unassigned and I've rework=
ed them
> >>> >> significantly here.
> >>> >>
> >>> >> Sorry for the delay on this series. I found a few bugs in emptty t=
hat I wanted
> >>> >> to address before submitting this officially.
> >>> >>
> >>> >> [1] https://github.com/tvrzna/emptty
> >>> >>
> >>> >> v2:
> >>> >>         - Address spelling issues in commit messages
> >>> >>         - Attempt to resolve some test related issues with weston
> >>> >>         - Add additional logs to X11 related tests
> >>> >> v3:
> >>> >>         - Reset AUTOLOGIN_MAX_RETRY to the default value of 2. Whe=
n running
> >>> >>           under QEMU the first auth attempt almost always fails.
> >>> >> v4:
> >>> >>         - Add a tmpfile entry for the x11 domain socket directory.
> >>> >>         - Remove some scripts associated with weston-init that wer=
e being
> >>> >>           shipped with weston
> >>> >> v5:
> >>> >>         - Move tmpfile data to individual files
> >>> >>         - Add explicit entries for these in the FILES variable
> >>> >> v6:
> >>> >>         - Do not attempt to ship a tmpfiles.d entry in libx11
> >>> >> v7:
> >>> >>         - Include a backported fix for go/runtime to address segfa=
ult issues
> >>> >>           reported on x86 platforms in previous revisions
> >>> >> v8:
> >>> >>         - Sign-off backported patch
> >>> >> v9:
> >>> >>         - Resolve merge conflict in maintainers file
> >>> >>
> >>> >> Randolph Sapp (6):
> >>> >>   libx11: create tmpfile dir for x11 domain socket
> >>> >>   go: fix sigaction usage on i386 platforms
> >>> >>   emptty: add version 0.14.0
> >>> >>   weston-init: convert to virtual-emptty-conf
> >>> >>   weston: remove deprecated weston-start scripts
> >>> >>   xserver-nodm-init: convert to virtual-emptty-conf
> >>> >>
> >>> >>  .../conf/distro/include/default-providers.inc |   1 +
> >>> >>  meta/conf/distro/include/maintainers.inc      |   6 +-
> >>> >>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
> >>> >>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
> >>> >>  meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
> >>> >>  ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
> >>> >>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
> >>> >>  meta/recipes-graphics/emptty/emptty.inc       |  26 ++
> >>> >>  .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
> >>> >>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
> >>> >>  meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
> >>> >>  meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
> >>> >>  .../wayland/weston-init/emptty.conf           |  77 ++++
> >>> >>  .../recipes-graphics/wayland/weston-init/init |  54 ---
> >>> >>  .../wayland/weston-init/weston-autologin      |  11 -
> >>> >>  .../wayland/weston-init/weston-socket.sh      |  20 -
> >>> >>  .../wayland/weston-init/weston-start          |  76 ----
> >>> >>  .../wayland/weston-init/weston.env            |   0
> >>> >>  .../wayland/weston-init/weston.service        |  71 ----
> >>> >>  .../wayland/weston-init/weston.socket         |  14 -
> >>> >>  .../weston/systemd-notify.weston-start        |   9 -
> >>> >>  .../wayland/weston/xwayland.weston-start      |   6 -
> >>> >>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
> >>> >>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
> >>> >>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
> >>> >>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
> >>> >>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
> >>> >>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
> >>> >>  .../xserver-nodm-init/capability.conf         |   2 -
> >>> >>  .../xserver-nodm-init/default.desktop         |   5 +
> >>> >>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
> >>> >>  .../xserver-nodm-init/gplv2-license.patch     | 355 -------------=
-----
> >>> >>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
> >>> >>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
> >>> >>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
> >>> >>  .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
> >>> >>  meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
> >>> >>  .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
> >>> >>  .../user-creation/xuser-account_0.1.bb        |   3 +-
> >>> >>  39 files changed, 581 insertions(+), 918 deletions(-)
> >>> >>  create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-=
using-cgo-on-386-call-C-sigaction-funct.patch
> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
> >>> >>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
> >>> >>  create mode 100644 meta/recipes-graphics/wayland/weston-init/empt=
ty.conf
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/west=
on-autologin
> >>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/west=
on-socket.sh
> >>> >>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/west=
on-start
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/west=
on.env
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/west=
on.service
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/west=
on.socket
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-n=
otify.weston-start
> >>> >>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.=
weston-start
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/X11/Xsession
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/X11/Xsession.d/13xdgbasedirs.sh
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/X11/Xsession.d/89xdgautostart.sh
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/X11/Xsession.d/90XWindowManager.sh
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/Xserver
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/capability.conf
> >>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/default.desktop
> >>> >>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/emptty.conf.in
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/gplv2-license.patch
> >>> >>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-=
init/xserver-nodm
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/xserver-nodm.conf.in
> >>> >>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-=
init/xserver-nodm.service.in
> >>> >>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
> >>> >>
> >>> >> --
> >>> >> 2.51.0
> >>> >>
> >>> >>
> >>> >>
> >>> >>
> >>>
>

