Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6563CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:16:51 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20162.1792153006016975440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 05:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pJ251sfq;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6768403e9bbso5618519d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792153005; cv=none;
        d=google.com; s=arc-20260327;
        b=QDXWShCNdgb0hP+HTzyEgbHb7j5BLKRx5ZEEIaIdtQLn/c720+izHN5cD79nwksjtX
         teaU6L27h7P2SnRXeMbUpcRQuKGkduibRhdt4eVGK+Frn4Uc4TeVsurhVfQcnAc1ubGs
         5LPW8/Sj7xs6F619XUzcx5lvWz0FCv1HDuq/bUlERfKqCKvCsl2fijMrah1kJXV8SGuU
         utcbaUF+ViC2xgb3lThbqT7MYOtdT6JexCZ9FzoKTvG2KnnrrGYf51pPzgeY04vw0Ctc
         8Q3kid09WOX6GKpB+eQ8ORBm4xp00MigQrpNsTMrewBC9lVUd45QYykEqH2hILrWXfp7
         2dgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QbxnOKGXxuTpEAF4BK8UtSmCPaGYTyMgLm+d2Em84IA=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=bJJWdfNZUsENJcPRdjFFCFtG3LisAAIIIvc9rMmLRCOkR9bdQsLHnalG8x8EXM7FgH
         Lp6Zw1nJ4UVBcYKU/wF45BnU32JMvcDkVfd2a6TKLY1vPJaZRX6WJI1CaQZrpLAgPev4
         LPx8vOaCe0iQ9kn1C893yBQFy1aSskWLBz6lOOBzsl/qIf/ZNMY8csR7fKAyA5l9Lt7+
         fJT1+gmhgdjkHjpt1G4OVCQBsSmlYlJa0yuxCSY3vd6jaXnm3h3YTfaPMqCnmjo1RI4j
         WeCqOeGy58FcmWVUd5KKarJB0FGzBZ7bsV2gdjcnZN19mcusjcTZHppvdfmSRwhRx32C
         MldA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153005; x=1792757805; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QbxnOKGXxuTpEAF4BK8UtSmCPaGYTyMgLm+d2Em84IA=;
        b=pJ251sfqF3ZagMDl/xYuwULSk34EKWiOwLchFOzAuHyHFs8lG4dn2759EYg7Z6O2FJ
         14nNYeZoYhnqOz/d+iVN88rPztLUfb/Uzpr2J9Zxc22vyR/aQhzHI+7xHmE2zwoC34Nj
         h5MVBaMveqaLaAByB7yCb7TZjaqMQ5lWZD6AYZhmI4/TWRkgPxutIP/i0X4Lisldtoju
         R4kmdJSxESb2DvByllZnOpeQ5IG58B+MlYo5t+xMgmNHlLw6QIn8tyfBmGxIQ8m3CEK8
         k9WobJUZdYmikpdzblrgyFav2bnKl6wCEw/EuElDXjjkKVlSdrI0cuALE9N2F0uwb4Tz
         T8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153005; x=1792757805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbxnOKGXxuTpEAF4BK8UtSmCPaGYTyMgLm+d2Em84IA=;
        b=B56XhHn4EF+/MJ6BptamkYE1OJJUG6vr3OwL/7q32xCQDUPlxUvymsxBQSywCpCA8v
         MEfbO3/IaAT32YwBtw+FZklW6HT8NMDhB0a8R/HT56OVKJn/M3h+nAV3Y9MDtF5qQjgB
         X0xwR5Jq6Vah13dLZp9WlVQ6fgkb/5W9UJeN8PEeKqPNlN64MLDf8wxMox25KJzx3UUq
         1XSzBuXjS2EpxSaJd+LhN6DruryacQJ5wEQZUqnIB1mbvW4rLkbgIWj4d7Hj1Emos1mU
         UeMTjSmaFlpFmytQr0EdO5SSj+opE12CLH3REc+tfdkOaskCesS3RAXlJs0pHyGfa2Qc
         dn5A==
X-Gm-Message-State: AFq9FYJtqEXQfcpg4nvb4M1arkZ65YqkoaSpkj7JLY4TPXgCkSxJQNjr
	Le4wRLktMzRairMRnAyDTlykq0Dauq36XC99+eaZmRWf6HzmCV/daFTeiUY3X5KjkcvP+HYrE56
	wIbrOOyrJ0OocLrcRFPd3vb3PcY0pIHzaTA==
X-Gm-Gg: AYBFou2CjorGyPClwsa0CNjAhDpJmCeme7Hv00QIlufgPElcQEF/qm2+ovePcarr9aD
	Mx2Hx3wzfhjXB57HR1H0q7Zfp5JVbCD/15FIrjs9MTLMh0ydx9PwaA692Th90fYhjwWB3y7cJ5f
	JBPKK/3RaQ38kbmJIeXU1xXqSrD9jAryterqhiVU12ugVmnodP7veQkpAlzaVJhrquG2Vb6Ig8Z
	EgCm98MQFudlav+Ge1Tt/HYKspSY2ZdrNl0a8RjUz8UhiBkqT9is38ObgTYu5o8Diktj2RQoL47
	AzqNt7sKbyidIVdV5VxqGWw96ItiKsTa2IGm8nf6V7qz416ka/96m0qGL05cx2p9T2i4lEWWeCr
	KaeiMBf+5
X-Received: by 2002:a05:690e:12cf:b0:677:c92e:eee4 with SMTP id
 956f58d0204a3-67936ac0905mr8630401d50.86.1792153004656; Fri, 16 Oct 2026
 05:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
 <20261015-eudev-3-2-15-v1-2-407ba1a93edb@gmail.com> <DM6454M8AZXW.22GK84O103WXZ@bootlin.com>
In-Reply-To: <DM6454M8AZXW.22GK84O103WXZ@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 16 Oct 2026 13:16:33 +0100
X-Gm-Features: AclHuK9FGI9tL7NqnQePN6qpZf5OQkIIvDe9zpr51tfcai1D7BnIgqcy4VgccRE
Message-ID: <CAO5Uq5QxyG6CgRk=SmtJHR8j6anUgdE3TkBy84tjo7kXfm95Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] eudev: upgrade 3.2.14 -> 3.2.15
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 12:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248016

On Fri, Oct 16, 2026 at 9:18=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Oct 15, 2026 at 3:08 PM CEST, Alex Kiernan via lists.openembedded.=
org wrote:
> > Drop backported commits.
> >
> > Changes:
> >
> ...
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
>
> Hi Alex,
>
> Thanks for the upgrade. But it looks like we can see runtime failures,
> at lease on x86 qemu:
>
> -----------------------
> Central error: [    1.369029] udevd[144]: segfault at 7f9e4cea81c0 ip 000=
07f9e4d5f5643 sp 00007ffcea775058 error 4 in libc.so[3a643,7f9e4d5cd000+6e0=
00] likely on CPU 0 (core 0, socket 0)
> ***********************
> [    1.324424] VFS: Pivoted into new rootfs
> [    1.325948] Freeing unused kernel image (initmem) memory: 3804K
> [    1.327763] Write protecting the kernel read-only data: 30720k
> [    1.329535] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00=
:1d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
> [    1.332703] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mous=
e [QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
> [    1.332741] Freeing unused kernel image (text/rodata gap) memory: 732K
> [    1.337474] Freeing unused kernel image (rodata/data gap) memory: 1588=
K
> [    1.339154] Run /sbin/init as init process
> [    1.340184]   with arguments:
> [    1.340185]     /sbin/init
> [    1.340186]   with environment:
> [    1.340186]     HOME=3D/
> [    1.340187]     TERM=3Dlinux
> [    1.356209] udevd[143]: starting version 3.2.15
> [    1.360803] udevd[144]: starting eudev-3.2.15
> [    1.369029] udevd[144]: segfault at 7f9e4cea81c0 ip 00007f9e4d5f5643 s=
p 00007ffcea775058 error 4 in libc.so[3a643,7f9e4d5cd000+6e000] likely on C=
PU 0 (core 0, socket 0)
> [    1.373539] Code: ca 74 e4 e9 69 ff ff ff 0f 1f 80 00 00 00 00 48 89 f=
8 c3 0f 1f 40 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f b6 17 <=
0f> b6 0e 31 c0 38 ca 74 25 eb 32 0f 1f 80 00 00 00 00 66 66 2e 0f
> [    1.446848] usb 1-2: new high-speed USB device number 3 using ehci-pci
> [    1.579181] input: QEMU QEMU USB Keyboard as /devices/pci0000:00/0000:=
00:1d.7/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input2
> [    1.633000] hid-generic 0003:0627:0001.0002: input: USB HID v1.11 Keyb=
oard [QEMU QEMU USB Keyboard] on usb-0000:00:1d.7-2/input0
> [  121.483345] EXT4-fs (vda): re-mounted 7b4506d6-59d8-4ca9-87c3-880a5a0d=
cf6c.
>
> This did happen a few times in a row on rebuild:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1371
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1372
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1373
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1379
>
> Can you have a look at the issue?
>

Segfaults on musl... will go dig.

> Also, about the commit message: we try to embedded a bit of the
> changelog on upgrades, but this one is definitely too long. There is no
> hard constraint, but a good excerpt is probably between 5 and 30 lines.
> Can you trim it down a bit?
>

I kinda wondered... given it's a 3 year dump of new commits, I suspect
a "go read the commit log" is probably more useful.

> Thanks,
> Mathieu
>
> >  ....c-sync-dev_urandom-implementation-to-sys.patch | 138 -------------=
--------
> >  meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
> >  .../udev/{eudev_3.2.14.bb =3D> eudev_3.2.15.bb}      |   4 +-
> >  3 files changed, 1 insertion(+), 158 deletions(-)
> >
> > diff --git a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_u=
random-implementation-to-sys.patch b/meta/recipes-core/udev/eudev/0001-rand=
om-util.c-sync-dev_urandom-implementation-to-sys.patch
> > deleted file mode 100644
> > index 668aa731aca1..000000000000
> > --- a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-=
implementation-to-sys.patch
> > +++ /dev/null
> > @@ -1,138 +0,0 @@
> > -From 95c871b7b912f39539777ac222ef7f8798bb0225 Mon Sep 17 00:00:00 2001
> > -From: Masahisa Kojima <kojima.masahisa@socionext.com>
> > -Date: Thu, 25 Apr 2024 17:23:10 +0900
> > -Subject: [PATCH] random-util.c: sync dev_urandom implementation to
> > - systemd-udev
> > -
> > -Current dev_urandom() assumes that reading /dev/urandom
> > -will never block regardless if the random pool is fully
> > -initialized or not.
> > -This assumption is no longer applicable since linux kerrnel
> > -enforces the /dev/urandom entropy initialization from
> > -v5.18-rc2 with the commit:
> > -48bff1053c17 ("random: opportunistically initialize on /dev/urandom re=
ads").
> > -
> > -With this, when we use the linux v5.18-rc2 or later,
> > -dev_urandom() will block if enough random pool is not supplied.
> > -It causes the boot delay, typically 1024msec(4msec * 256 =3D 1024msec)
> > -delay to fill the 256 bits entropy for the case CONFIG_HZ=3D250.
> > -
> > -To prevent this boot delay, this commit syncs dev_urandom()
> > -implementation to the systemd-udev.
> > -The systemd-udev implementation of reading /dev/urandom is as follows.
> > - - Try to get random with calling getrandom(GRND_INSECURE)
> > - - If kernel does not support GRND_INSECURE, fallback to GRND_NONBLOCK
> > - - If enough entropy is not supplied, fallback to reading /dev/urandom=
,
> > -   this will block when the kernel version is v5.18-rc2 or later
> > -
> > -With this modification, dev_urandom() tries not to block
> > -as much as possible.
> > -
> > -This modification still keeps the backword compatibility,
> > -dev_random() will never block if the commit(48bff1053c17) is not
> > -applied to the linux kernel, the behavior is same as before
> > -in this case.
> > -
> > -Upstream-Status: Backport [a49a3aaa460add6ae7ea208b4cac630e56fe1180]
> > -Signed-off-by: Masahisa Kojima <kojima.masahisa@socionext.com>
> > ----
> > - src/shared/missing.h     |  4 +++
> > - src/shared/random-util.c | 70 ++++++++++++++++++---------------------=
-
> > - 2 files changed, 35 insertions(+), 39 deletions(-)
> > -
> > -diff --git a/src/shared/missing.h b/src/shared/missing.h
> > -index 1967840cdbf3..1caec0f9207c 100644
> > ---- a/src/shared/missing.h
> > -+++ b/src/shared/missing.h
> > -@@ -79,6 +79,10 @@ static inline int getrandom(void *buffer, size_t co=
unt, unsigned flags) {
> > - #define GRND_RANDOM 0x0002
> > - #endif
> > -
> > -+#ifndef GRND_INSECURE
> > -+#define GRND_INSECURE 0x0004
> > -+#endif
> > -+
> > - #ifndef BTRFS_IOCTL_MAGIC
> > - #define BTRFS_IOCTL_MAGIC 0x94
> > - #endif
> > -diff --git a/src/shared/random-util.c b/src/shared/random-util.c
> > -index 01a28c8ef4e9..852b00e4ce2b 100644
> > ---- a/src/shared/random-util.c
> > -+++ b/src/shared/random-util.c
> > -@@ -31,45 +31,37 @@
> > - #include "util.h"
> > -
> > - int dev_urandom(void *p, size_t n) {
> > --        static int have_syscall =3D -1;
> > --
> > --        _cleanup_close_ int fd =3D -1;
> > --        int r;
> > --
> > --        /* Gathers some randomness from the kernel. This call will
> > --         * never block, and will always return some data from the
> > --         * kernel, regardless if the random pool is fully initialized
> > --         * or not. It thus makes no guarantee for the quality of the
> > --         * returned entropy, but is good enough for or usual usecases
> > --         * of seeding the hash functions for hashtable */
> > --
> > --        /* Use the getrandom() syscall unless we know we don't have
> > --         * it, or when the requested size is too large for it. */
> > --        if (have_syscall !=3D 0 || (size_t) (int) n !=3D n) {
> > --                r =3D getrandom(p, n, GRND_NONBLOCK);
> > --                if (r =3D=3D (int) n) {
> > --                        have_syscall =3D true;
> > --                        return 0;
> > --                }
> > --
> > --                if (r < 0) {
> > --                        if (errno =3D=3D ENOSYS)
> > --                                /* we lack the syscall, continue with
> > --                                 * reading from /dev/urandom */
> > --                                have_syscall =3D false;
> > --                        else if (errno =3D=3D EAGAIN)
> > --                                /* not enough entropy for now. Let's
> > --                                 * remember to use the syscall the
> > --                                 * next time, again, but also read
> > --                                 * from /dev/urandom for now, which
> > --                                 * doesn't care about the current
> > --                                 * amount of entropy.  */
> > --                                have_syscall =3D true;
> > --                        else
> > --                                return -errno;
> > --                } else
> > --                        /* too short read? */
> > --                        return -ENODATA;
> > -+        static bool have_getrandom =3D true, have_grndinsecure =3D tr=
ue;
> > -+        _cleanup_close_ int fd =3D -EBADF;
> > -+
> > -+        if (n =3D=3D 0)
> > -+                return 0;
> > -+
> > -+        for (;;) {
> > -+                ssize_t l;
> > -+
> > -+                if (!have_getrandom)
> > -+                        break;
> > -+
> > -+                l =3D getrandom(p, n, have_grndinsecure ? GRND_INSECU=
RE : GRND_NONBLOCK);
> > -+                if (l > 0) {
> > -+                        if ((size_t) l =3D=3D n)
> > -+                                return 0; /* Done reading, success. *=
/
> > -+                        p =3D (uint8_t *) p + l;
> > -+                        n -=3D l;
> > -+                        continue; /* Interrupted by a signal; keep go=
ing. */
> > -+                } else if (l =3D=3D 0)
> > -+                        break; /* Weird, so fallback to /dev/urandom.=
 */
> > -+                else if (errno =3D=3D ENOSYS) {
> > -+                        have_getrandom =3D false;
> > -+                        break; /* No syscall, so fallback to /dev/ura=
ndom. */
> > -+                } else if (errno =3D=3D EINVAL && have_grndinsecure) =
{
> > -+                        have_grndinsecure =3D false;
> > -+                        continue; /* No GRND_INSECURE; fallback to GR=
ND_NONBLOCK. */
> > -+                } else if (errno =3D=3D EAGAIN && !have_grndinsecure)
> > -+                        break; /* Will block, but no GRND_INSECURE, s=
o fallback to /dev/urandom. */
> > -+
> > -+                break; /* Unexpected, so just give up and fallback to=
 /dev/urandom. */
> > -         }
> > -
> > -         fd =3D open("/dev/urandom", O_RDONLY|O_CLOEXEC|O_NOCTTY);
> > diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recip=
es-core/udev/eudev/netifnames.patch
> > deleted file mode 100644
> > index 4f8e54d12d4a..000000000000
> > --- a/meta/recipes-core/udev/eudev/netifnames.patch
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -eudev: consider ID_NET_NAME_MAC as an interface name
> > -
> > -eudev might not create names based on slot or path.
> > -
> > -Upstream-Status: Backport [github.com/eudev-project/eudev/pull/274]
> > -
> > -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > -
> > ---- a/rules/80-net-name-slot.rules
> > -+++ b/rules/80-net-name-slot.rules
> > -@@ -10,5 +10,6 @@ ENV{net.ifnames}=3D=3D"0", GOTO=3D"net_name_sl
> > - NAME=3D=3D"", ENV{ID_NET_NAME_ONBOARD}!=3D"", NAME=3D"$env{ID_NET_NAM=
E_ONBOARD}"
> > - NAME=3D=3D"", ENV{ID_NET_NAME_SLOT}!=3D"", NAME=3D"$env{ID_NET_NAME_S=
LOT}"
> > - NAME=3D=3D"", ENV{ID_NET_NAME_PATH}!=3D"", NAME=3D"$env{ID_NET_NAME_P=
ATH}"
> > -+NAME=3D=3D"", ENV{ID_NET_NAME_MAC}!=3D"", NAME=3D"$env{ID_NET_NAME_MA=
C}"
> > -
> > - LABEL=3D"net_name_slot_end"
> > diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core=
/udev/eudev_3.2.15.bb
> > similarity index 93%
> > rename from meta/recipes-core/udev/eudev_3.2.14.bb
> > rename to meta/recipes-core/udev/eudev_3.2.15.bb
> > index 3e4972694ac0..2ff2370bcb5e 100644
> > --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> > +++ b/meta/recipes-core/udev/eudev_3.2.15.bb
> > @@ -10,13 +10,11 @@ DEPENDS =3D "gperf-native"
> >  PROVIDES =3D "udev"
> >
> >  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
> > -           file://netifnames.patch \
> >             file://init \
> >             file://local.rules \
> > -           file://0001-random-util.c-sync-dev_urandom-implementation-t=
o-sys.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =3D "8da4319102f24abbf7fff5ce9c416af848df163b29590e=
666d334cc1927f006f"
> > +SRC_URI[sha256sum] =3D "eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14eb=
ea68eae6cb6b4fc1c3"
> >
> >  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releases"
> >
>
>
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Alex Kiernan

