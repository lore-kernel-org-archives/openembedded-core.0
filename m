Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91382C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:31:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.56925.1699284691568875616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h71GruIg;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so7858820a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699284689; x=1699889489; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jySDERg8OoLqPmjW6dfCsNFf8KqZiVnzgeedmHP2VE=;
        b=h71GruIgzmTQugHFFDEuTj/303+UzRvcOHUITo9Ily/6g47Hdj+GvAREZC7jMfOyvA
         oueYfLSOm/IlHi3UXuKifnxLAOwJOHrurEh7In1D/yzB60BrLj8sGTz9XGRf588L4lyv
         QbMHRIi3YmARfQkrx4Pi/yDC9opUtCSNgfa4/5DbcvHHH5VCmX/nka20rSCfkB5xnaTR
         +um3D8xjqJKgBVO/hzGHQMH1lE3xXBVx9dGa0EBNj9PLn3lMnWTCy08EX31RmI5zyDJV
         zGjBZwDuLYmHdUhBaN+mnLknJhOJbFemZlJoCvdmvrKd1AM/AoH+ZZmO7KCvtRVJAz6Q
         abag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284689; x=1699889489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jySDERg8OoLqPmjW6dfCsNFf8KqZiVnzgeedmHP2VE=;
        b=d8nAtim0lDJur5AJqAzHwXLMCv347BRUZIpMi20TfdCSAg3GRnJG8ziph2kZRhZ289
         h/Q3b07GrXgtTLAAcBJnMsf1w9kKwuqrAktE1oXsHMlcSZIDruikFve8du3LhCk3/oh2
         0dHvUCsFjF91JXg2A3WBW657fKmdqZ7b3l3+CgsdFj1wHLDuOsfNjRTkwhm9ecYcPn2O
         /DEaM11YpU/4ZiXxxwX9WPSNPZgbYOROCTJZr9yx/Sz0m0UpGYi7UqWdYmRizsceVjVF
         VASB1BzmKcIkMhvu9xj8fwODnEKV0Cumeg/3bkkcOs9KNeU4w/v1Pud50B7mlj9kbekq
         uwww==
X-Gm-Message-State: AOJu0YwG8rXSCVJC49LxIlrHS6KgE+mzrU0eZCBRF+zFWuJ266pHHUy8
	v/SvJttOL83xjwA+/nPqQo4LOU9KAknYxzzJAOXRZQ==
X-Google-Smtp-Source: AGHT+IEEEOwQ27xMk+HiOPL0O9ANR2dcrYLVt+dV3KQMyeB+OaL6LyEbobrzeHvRrNKF+AOZZk39nql0VNJqiei45+w=
X-Received: by 2002:a17:907:7fac:b0:9c1:9b3a:4cd1 with SMTP id
 qk44-20020a1709077fac00b009c19b3a4cd1mr17651971ejc.3.1699284689283; Mon, 06
 Nov 2023 07:31:29 -0800 (PST)
MIME-Version: 1.0
References: <179504CADB8F6451.12603@lists.openembedded.org> <CANQUz1_8SRKv-prdz9QbF3v77hvoqr3yBvP7G+Ddii4fTpUABw@mail.gmail.com>
In-Reply-To: <CANQUz1_8SRKv-prdz9QbF3v77hvoqr3yBvP7G+Ddii4fTpUABw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 6 Nov 2023 05:31:17 -1000
Message-ID: <CAOSpxdYSJ9t=VYo4xK74s7uxjk4geZb2_Fg2YEwrrsJFdWR-WA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xserver-xorg: Fix for CVE-2023-5367
 CVE-2023-5380 and CVE-2023-5574
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190229

On Mon, Nov 6, 2023 at 5:02=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com> =
wrote:
>
> Hi Steve,
>
> Xserver-xorg version is the same for both mickledore and kirkstone. Could=
 you please merge this patch to mickledore along with kirkstone.

I will merge these patches to the stable branches after it hits the
master branch.

Steve

>
> Thanks & Regards,
> Vijay
>
> On Mon, Nov 6, 2023 at 4:51=E2=80=AFPM Vijay Anusuri via lists.openembedd=
ed.org <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Upstream-Status: Backport
>> [https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689=
e71855d93e492bc554719a
>> &
>> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456=
102727acb8b0256b7bbd7
>> &
>> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0=
fcce70f6ad3310b713d5f
>> &
>> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e3=
11673511ce61aa2f7a81f
>> &
>> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19=
c7829b06bdba8a88bd586]
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++
>>  .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++
>>  .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
>>  .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
>>  .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
>>  .../xorg-xserver/xserver-xorg_21.1.8.bb       |   5 +
>>  6 files changed, 400 insertions(+)
>>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-=
2023-5367.patch
>>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-=
2023-5380.patch
>>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-=
2023-5574-1.patch
>>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-=
2023-5574-2.patch
>>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-=
2023-5574-3.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-53=
67.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.pa=
tch
>> new file mode 100644
>> index 0000000000..508588481e
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patc=
h
>> @@ -0,0 +1,84 @@
>> +From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
>> +From: Peter Hutterer <peter.hutterer@who-t.net>
>> +Date: Tue, 3 Oct 2023 11:53:05 +1000
>> +Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
>> +
>> +The handling of appending/prepending properties was incorrect, with at
>> +least two bugs: the property length was set to the length of the new
>> +part only, i.e. appending or prepending N elements to a property with P
>> +existing elements always resulted in the property having N elements
>> +instead of N + P.
>> +
>> +Second, when pre-pending a value to a property, the offset for the old
>> +values was incorrect, leaving the new property with potentially
>> +uninitalized values and/or resulting in OOB memory writes.
>> +For example, prepending a 3 element value to a 5 element property would
>> +result in this 8 value array:
>> +  [N, N, N, ?, ?, P, P, P ] P, P
>> +                            ^OOB write
>> +
>> +The XI2 code is a copy/paste of the RandR code, so the bug exists in
>> +both.
>> +
>> +CVE-2023-5367, ZDI-CAN-22153
>> +
>> +This vulnerability was discovered by:
>> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
>> +
>> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>> +
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/=
-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a]
>> +CVE: CVE-2023-5367
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + Xi/xiproperty.c    | 4 ++--
>> + randr/rrproperty.c | 4 ++--
>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
>> +index 066ba21fba..d315f04d0e 100644
>> +--- a/Xi/xiproperty.c
>> ++++ b/Xi/xiproperty.c
>> +@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom prope=
rty, Atom type,
>> +                 XIDestroyDeviceProperty(prop);
>> +             return BadAlloc;
>> +         }
>> +-        new_value.size =3D len;
>> ++        new_value.size =3D total_len;
>> +         new_value.type =3D type;
>> +         new_value.format =3D format;
>> +
>> +@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom prope=
rty, Atom type,
>> +         case PropModePrepend:
>> +             new_data =3D new_value.data;
>> +             old_data =3D (void *) (((char *) new_value.data) +
>> +-                                  (prop_value->size * size_in_bytes));
>> ++                                  (len * size_in_bytes));
>> +             break;
>> +         }
>> +         if (new_data)
>> +diff --git a/randr/rrproperty.c b/randr/rrproperty.c
>> +index c2fb9585c6..25469f57b2 100644
>> +--- a/randr/rrproperty.c
>> ++++ b/randr/rrproperty.c
>> +@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom pro=
perty, Atom type,
>> +                 RRDestroyOutputProperty(prop);
>> +             return BadAlloc;
>> +         }
>> +-        new_value.size =3D len;
>> ++        new_value.size =3D total_len;
>> +         new_value.type =3D type;
>> +         new_value.format =3D format;
>> +
>> +@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom pro=
perty, Atom type,
>> +         case PropModePrepend:
>> +             new_data =3D new_value.data;
>> +             old_data =3D (void *) (((char *) new_value.data) +
>> +-                                  (prop_value->size * size_in_bytes));
>> ++                                  (len * size_in_bytes));
>> +             break;
>> +         }
>> +         if (new_data)
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-53=
80.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.pa=
tch
>> new file mode 100644
>> index 0000000000..57e2a5abdf
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patc=
h
>> @@ -0,0 +1,102 @@
>> +From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
>> +From: Peter Hutterer <peter.hutterer@who-t.net>
>> +Date: Thu, 5 Oct 2023 12:19:45 +1000
>> +Subject: [PATCH] mi: reset the PointerWindows reference on screen switc=
h
>> +
>> +PointerWindows[] keeps a reference to the last window our sprite
>> +entered - changes are usually handled by CheckMotion().
>> +
>> +If we switch between screens via XWarpPointer our
>> +dev->spriteInfo->sprite->win is set to the new screen's root window.
>> +If there's another window at the cursor location CheckMotion() will
>> +trigger the right enter/leave events later. If there is not, it skips
>> +that process and we never trigger LeaveWindow() - PointerWindows[] for
>> +the device still refers to the previous window.
>> +
>> +If that window is destroyed we have a dangling reference that will
>> +eventually cause a use-after-free bug when checking the window hierarch=
y
>> +later.
>> +
>> +To trigger this, we require:
>> +- two protocol screens
>> +- XWarpPointer to the other screen's root window
>> +- XDestroyWindow before entering any other window
>> +
>> +This is a niche bug so we hack around it by making sure we reset the
>> +PointerWindows[] entry so we cannot have a dangling pointer. This
>> +doesn't handle Enter/Leave events correctly but the previous code didn'=
t
>> +either.
>> +
>> +CVE-2023-5380, ZDI-CAN-21608
>> +
>> +This vulnerability was discovered by:
>> +Sri working with Trend Micro Zero Day Initiative
>> +
>> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>> +Reviewed-by: Adam Jackson <ajax@redhat.com>
>> +
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/=
-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]
>> +CVE: CVE-2023-5380
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + dix/enterleave.h   |  2 --
>> + include/eventstr.h |  3 +++
>> + mi/mipointer.c     | 17 +++++++++++++++--
>> + 3 files changed, 18 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/dix/enterleave.h b/dix/enterleave.h
>> +index 4b833d8a3b..e8af924c68 100644
>> +--- a/dix/enterleave.h
>> ++++ b/dix/enterleave.h
>> +@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
>> +
>> + extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
>> +
>> +-extern void LeaveWindow(DeviceIntPtr dev);
>> +-
>> + extern void CoreFocusEvent(DeviceIntPtr kbd,
>> +                            int type, int mode, int detail, WindowPtr p=
Win);
>> +
>> +diff --git a/include/eventstr.h b/include/eventstr.h
>> +index 93308f9b24..a9926eaeef 100644
>> +--- a/include/eventstr.h
>> ++++ b/include/eventstr.h
>> +@@ -335,4 +335,7 @@ union _InternalEvent {
>> +     GestureEvent gesture_event;
>> + };
>> +
>> ++extern void
>> ++LeaveWindow(DeviceIntPtr dev);
>> ++
>> + #endif
>> +diff --git a/mi/mipointer.c b/mi/mipointer.c
>> +index a638f25d4a..8cf0035140 100644
>> +--- a/mi/mipointer.c
>> ++++ b/mi/mipointer.c
>> +@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr p=
Screen, int x, int y)
>> + #ifdef PANORAMIX
>> +         && noPanoramiXExtension
>> + #endif
>> +-        )
>> +-        UpdateSpriteForScreen(pDev, pScreen);
>> ++        ) {
>> ++            DeviceIntPtr master =3D GetMaster(pDev, MASTER_POINTER);
>> ++            /* Hack for CVE-2023-5380: if we're moving
>> ++             * screens PointerWindows[] keeps referring to the
>> ++             * old window. If that gets destroyed we have a UAF
>> ++             * bug later. Only happens when jumping from a window
>> ++             * to the root window on the other screen.
>> ++             * Enter/Leave events are incorrect for that case but
>> ++             * too niche to fix.
>> ++             */
>> ++            LeaveWindow(pDev);
>> ++            if (master)
>> ++                LeaveWindow(master);
>> ++            UpdateSpriteForScreen(pDev, pScreen);
>> ++    }
>> + }
>> +
>> + /**
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-55=
74-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
1.patch
>> new file mode 100644
>> index 0000000000..9a8e583e78
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.pa=
tch
>> @@ -0,0 +1,113 @@
>> +From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
>> +From: Peter Hutterer <peter.hutterer@who-t.net>
>> +Date: Thu, 12 Oct 2023 12:44:13 +1000
>> +Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
>> +
>> +fbCloseScreen assumes that it overrides miCloseScreen (which just
>> +calls FreePixmap(screen->devPrivates)) and emulates that instead of
>> +wrapping it.
>> +
>> +This is a wrong assumption, we may have ShmCloseScreen in the mix too,
>> +resulting in leaks (see below). Fix this by properly setting up the
>> +CloseScreen wrapper.
>> +
>> +This means we no longer need the manual DestroyPixmap call in
>> +vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
>> +
>> +CVE-2023-5574, ZDI-CAN-21213
>> +
>> +This vulnerability was discovered by:
>> +Sri working with Trend Micro Zero Day Initiative
>> +
>> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>> +Reviewed-by: Adam Jackson <ajax@redhat.com>
>> +
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/=
-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f]
>> +CVE: CVE-2023-5574
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + fb/fb.h             |  1 +
>> + fb/fbscreen.c       | 14 ++++++++++----
>> + hw/vfb/InitOutput.c |  7 -------
>> + 3 files changed, 11 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/fb/fb.h b/fb/fb.h
>> +index d157b6956d..cd7bd05d21 100644
>> +--- a/fb/fb.h
>> ++++ b/fb/fb.h
>> +@@ -410,6 +410,7 @@ typedef struct {
>> + #endif
>> +     DevPrivateKeyRec    gcPrivateKeyRec;
>> +     DevPrivateKeyRec    winPrivateKeyRec;
>> ++    CloseScreenProcPtr  CloseScreen;
>> + } FbScreenPrivRec, *FbScreenPrivPtr;
>> +
>> + #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
>> +diff --git a/fb/fbscreen.c b/fb/fbscreen.c
>> +index 4ab807ab50..c481033f98 100644
>> +--- a/fb/fbscreen.c
>> ++++ b/fb/fbscreen.c
>> +@@ -29,6 +29,7 @@
>> + Bool
>> + fbCloseScreen(ScreenPtr pScreen)
>> + {
>> ++    FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen);
>> +     int d;
>> +     DepthPtr depths =3D pScreen->allowedDepths;
>> +
>> +@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
>> +         free(depths[d].vids);
>> +     free(depths);
>> +     free(pScreen->visuals);
>> +-    if (pScreen->devPrivate)
>> +-        FreePixmap((PixmapPtr)pScreen->devPrivate);
>> +-    return TRUE;
>> ++
>> ++    pScreen->CloseScreen =3D screen_priv->CloseScreen;
>> ++
>> ++    return pScreen->CloseScreen(pScreen);
>> + }
>> +
>> + Bool
>> +@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, =
int xsize, int ysize,
>> +                    int dpix, int dpiy, int width, int bpp)
>> + #endif
>> + {
>> ++    FbScreenPrivPtr screen_priv;
>> +     VisualPtr visuals;
>> +     DepthPtr depths;
>> +     int nvisuals;
>> +@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits,=
 int xsize, int ysize,
>> +                       rootdepth, ndepths, depths,
>> +                       defaultVisual, nvisuals, visuals))
>> +         return FALSE;
>> +-    /* overwrite miCloseScreen with our own */
>> ++
>> ++    screen_priv =3D fbGetScreenPrivate(pScreen);
>> ++    screen_priv->CloseScreen =3D pScreen->CloseScreen;
>> +     pScreen->CloseScreen =3D fbCloseScreen;
>> ++
>> +     return TRUE;
>> + }
>> +
>> +diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
>> +index 48efb61b2f..076fb7defa 100644
>> +--- a/hw/vfb/InitOutput.c
>> ++++ b/hw/vfb/InitOutput.c
>> +@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
>> +
>> +     pScreen->CloseScreen =3D pvfb->closeScreen;
>> +
>> +-    /*
>> +-     * fb overwrites miCloseScreen, so do this here
>> +-     */
>> +-    if (pScreen->devPrivate)
>> +-        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
>> +-    pScreen->devPrivate =3D NULL;
>> +-
>> +     return pScreen->CloseScreen(pScreen);
>> + }
>> +
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-55=
74-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
2.patch
>> new file mode 100644
>> index 0000000000..2cdef752c7
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.pa=
tch
>> @@ -0,0 +1,42 @@
>> +From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
>> +From: Peter Hutterer <peter.hutterer@who-t.net>
>> +Date: Thu, 12 Oct 2023 12:42:06 +1000
>> +Subject: [PATCH] mi: fix CloseScreen initialization order
>> +
>> +If SHM is enabled it will set the CloseScreen pointer, only to be
>> +overridden by the hardcoded miCloseScreen pointer. Do this the other wa=
y
>> +round, miCloseScreen is the bottom of our stack.
>> +
>> +Direct leak of 48 byte(s) in 2 object(s) allocated from:
>> +  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId: d=
8f3addefe29e892d775c30eb364afd3c2484ca5))
>> +  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
>> +
>> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>> +Reviewed-by: Adam Jackson <ajax@redhat.com>
>> +
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/=
-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f]
>> +CVE: CVE-2023-5574
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + mi/miscrinit.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/mi/miscrinit.c b/mi/miscrinit.c
>> +index 3bb52b1bc6..b88938c9ae 100644
>> +--- a/mi/miscrinit.c
>> ++++ b/mi/miscrinit.c
>> +@@ -249,10 +249,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /* =
pointer to screen bits */
>> +     pScreen->numVisuals =3D numVisuals;
>> +     pScreen->visuals =3D visuals;
>> +     if (width) {
>> ++        pScreen->CloseScreen =3D miCloseScreen;
>> + #ifdef MITSHM
>> +         ShmRegisterFbFuncs(pScreen);
>> + #endif
>> +-        pScreen->CloseScreen =3D miCloseScreen;
>> +     }
>> +     /* else CloseScreen */
>> +     /* QueryBestSize */
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-55=
74-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
3.patch
>> new file mode 100644
>> index 0000000000..47c247ef0c
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.pa=
tch
>> @@ -0,0 +1,54 @@
>> +From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
>> +From: Peter Hutterer <peter.hutterer@who-t.net>
>> +Date: Tue, 24 Oct 2023 12:09:36 +1000
>> +Subject: [PATCH] dix: always initialize pScreen->CloseScreen
>> +
>> +CloseScreen is wrapped by the various modules, many of which do not
>> +check if they're the last ones unwrapping. This is fine if the order of
>> +those modules never changes but when it does we might get a NULL-pointe=
r
>> +dereference by some naive code doing a
>> +
>> +   pScreen->CloseScreen =3D priv->CloseScreen;
>> +   free(priv);
>> +   return (*pScreen->CloseScreen)(pScreen);
>> +
>> +To avoid this set it to a default function that just returns TRUE that'=
s
>> +guaranteed to be the last one.
>> +
>> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/=
-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]
>> +CVE: CVE-2023-5574
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + dix/dispatch.c | 9 +++++++++
>> + 1 file changed, 9 insertions(+)
>> +
>> +diff --git a/dix/dispatch.c b/dix/dispatch.c
>> +index eaac39b7c9..cd092fd409 100644
>> +--- a/dix/dispatch.c
>> ++++ b/dix/dispatch.c
>> +@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {
>> +     3                           /* 64 bits per scanline pad unit */
>> + };
>> +
>> ++static Bool
>> ++DefaultCloseScreen(ScreenPtr screen)
>> ++{
>> ++    return TRUE;
>> ++}
>> ++
>> + /*
>> +       grow the array of screenRecs if necessary.
>> +       call the device-supplied initialization procedure
>> +@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i, =
Bool gpu)
>> +             PixmapWidthPaddingInfo[depth].notPower2 =3D 0;
>> +         }
>> +     }
>> ++
>> ++    pScreen->CloseScreen =3D DefaultCloseScreen;
>> ++
>> +     return 0;
>> + }
>> +
>> +--
>> +GitLab
>> +
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
>> index 19db7ea434..a0f905f83b 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
>> @@ -2,6 +2,11 @@ require xserver-xorg.inc
>>
>>  SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-=
hardwar.patch \
>>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
>> +           file://CVE-2023-5367.patch \
>> +           file://CVE-2023-5380.patch \
>> +           file://CVE-2023-5574-1.patch \
>> +           file://CVE-2023-5574-2.patch \
>> +           file://CVE-2023-5574-3.patch \
>>             "
>>  SRC_URI[sha256sum] =3D "38aadb735650c8024ee25211c190bf8aad844c5f5963276=
1ab1ef4c4d5aeb152"
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190205): https://lists.openembedded.org/g/openembedd=
ed-core/message/190205
>> Mute This Topic: https://lists.openembedded.org/mt/102417729/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [v=
anusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

