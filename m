Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C54AC44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 06:27:28 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17929.1784788046808793221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 23:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RV2j5R2D;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c21495722so1773901cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784788046; cv=none;
        d=google.com; s=arc-20260327;
        b=jSrfUtZXWNyNXGtVyudpON9BB0veZD4lc4ulJG8t5bdj7RnQbHnfTrqVvRMZsdkIVx
         RVSXhvlc/xbpYwib4KtgDukCfjhyFWR5CeTZKdmN6dB+e+g0ND4g5GkSlEhXYrqWN7u2
         uKcDDchPnRUjzXa0YJgugy8iTKSx7ngTmPQqUsZze028linwnd9lbQ8V/BmHVeWJehTI
         5gexe1zM/fl9f4yTvPhmR8pIHAxY7tUTA51gWzMns3e5Gosskndl+ygwyM9e7NnU5Sli
         Hi517cxgiiH7HLOmBwaphRuL8eLWuu03UtoaH2t6Sm7qNZ+I33pSF8TZrx2wBJMpCKf4
         s7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4vE12GjRlYCyalkEoVSI8FwEuIcVtCQch0+/OEcXDyg=;
        fh=ZzZB0OAk+mRvMjR/A2qEH8IiEKQFnjgkyISR2CIDlxk=;
        b=q68hvLgsbWYnkc/V5Me9Zzuum2DxnJQgr5V2Ggw2U3/N7IPyd6Y18lyqCC6hJ7i+4K
         u3uLqxRuWPBpC0n5iSk99OX8SJYdpC9D7HtuN/i6M7LCLMy71RdrHLG1H/Xa4Fs3Bt2a
         hpDC0JrAPii17fa2YoBRLzfX0mni7ZXCLEstjIdPpyeX1eGWpAcyTFupdOoKGJMKCvqy
         7Wmgm4OXA1YeFNzyBsZAqsuDUYi4Nn/hn5vIozUzUGUEIxr3mvXEuZXenXredpWHIvXh
         IW6ZItVT7Yd4nVTEkBdGDK3J3Nl3yoNvmhkNu8EjwrTd67G/H583RJ9QETKMZGOzcVZt
         semQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784788046; x=1785392846; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vE12GjRlYCyalkEoVSI8FwEuIcVtCQch0+/OEcXDyg=;
        b=RV2j5R2D98+uwadOYphDuliqqIQhlrYaa5QcTZAS5MaMBZXOaAX3XW4aO11el+UgWD
         2BgUXykuAGEheg4CTOPT5cCZhhIq6Urc0oOEKQbpybVvsUMbKdAc5fvrNQAApg+679DH
         7VKZwIVfAQ03J8JIzN+nVWdOWELhNcjXdlzMY4Dp1Qj77NmxBvG31OBtibYc2v6RRaOT
         GYcPZk9z/ml9wbLjroPMVOQSIq7c6Y+Ypt2lG8LLv7Q3yK2kroljt1xREzSo9cWL3xI7
         MR49JqsDetBptQOX7R7VCuFTaMAjYiuGDeLCYR1CBX++9jeOha7xLAddu5wwSuNl09tt
         AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788046; x=1785392846;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4vE12GjRlYCyalkEoVSI8FwEuIcVtCQch0+/OEcXDyg=;
        b=jdbN8aZWk2UgI2/ljrQdMW0Rbdz2lUF33wdK7xrQxIWt+lLQSbBMig3yIxlLn77Pa7
         fIUMfDAqNw3bgn9iuux/9+6oSdaF78178YKVZi9zbwpt29oVM6bXzB3NcE7qQSfPKTKN
         6LyZ+Kvf6LXBnWtg/QgGKOy7YsucXlRXq2Pkik/yBSlfnRW3L5koteSjl9RGLXGarAjF
         ak3FE2bZum/kTqJYpEjVgGhbKOEao1+g6pGgve/9BuvhLIb6l5jXLUD7YyzwoB3AWT3J
         5DAmj8KwpSLEdmkbnLVoSJSvpR5hmDv56U6JCnpgKYV+aNr1gaqv55PIO3Rj0A7G/sQ5
         bmkg==
X-Gm-Message-State: AOJu0Yw4zP1gbDIlBYucCIgMam/WZl+yzHkbCKOqu/IFbkJLjfSMlzcx
	Q2qeglDbpkLHSTDZOnX68naj0XzMlJBu3aCnVbIIsMJdvc1/85mC8DX1QN/IOx2Lcj+20E3+0If
	qwmdZF4n8DN51Z38C0nrkwcRGhRle1eoNDwCRxyM=
X-Gm-Gg: AR+sD13sZ9XL7eRaby5nQLXa2jesn2DQruHckahg92RmHoqN8gGaL9GSKjc+59Qijny
	VZswTQRQNbzccxO7jHXwr4iiZfFwJECEyjHlZXAy9b69GyBV6Sdf+qlAfRqyCZ9Kr2aFfQuMw5M
	/8dMll/iaJzHgja7cBFt4s2+OHRkBlZ9ZuoqKRU/KXfU+hsC7t67uVCUhIXjwgQntNbFwjLJTwx
	ROKDGpWmT2QbLrodeekcxaUgEnGKX3yBN1KQOQOng940hNSJnLfA0lf3Oafd0wR0nMRYFlIyAlk
	KMfBM/XrxSBknvw=
X-Received: by 2002:ac8:7e89:0:b0:51c:e14:87ae with SMTP id
 d75a77b69052e-5283de1e293mr16492121cf.34.1784788045438; Wed, 22 Jul 2026
 23:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260706115516.19878-1-sivakumar.bs@gmail.com> <20260723062240.2516398-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260723062240.2516398-1-sivakumar.bs@gmail.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Thu, 23 Jul 2026 11:56:58 +0530
X-Gm-Features: AUfX_my7FUgRGl2ltzkOoaMpACKj4-v_ey0hF1xrbJkpCc69T_R01VWWRplWlNo
Message-ID: <CACFV95KQAkBwpDWbndAPwOcsmn+M55sSUyscdoq+H+4jjY7PRw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][PATCH v2] util-linux: upgrade 2.41.3 -> 2.41.5
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, Yoann Congal <yoann.congal@smile.fr>, 
	Chen Qi <Qi.Chen@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000072a4220657415915"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241777

--00000000000072a4220657415915
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

You're right, thanks for catching that. wrynose only carried the loopdev
backport; the pam_lastlog2 fix was never backported there, it just comes
in natively with 2.41.5. I've sent a v2 that corrects the commit message
to drop only the loopdev backport and describes the pam_lastlog2 fix as
one of the fixes pulled in by the upgrade. The diff is unchanged.

Regards,
Siva

On Thu, Jul 23, 2026 at 11:52=E2=80=AFAM Siva Balasubramanian <
sivakumar.bs@gmail.com> wrote:

> 2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
> contain only bug fixes and security fixes (no new features, no API/ABI
> breaks), so the upgrade complies with the stable branch policy.
>
> Among the fixes pulled in:
>  - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-2745=
6)
>  - libblkid integer overflow in parse_dos_extended() and a use-after-free
>    in partition probing
>  - pam_lastlog2: fix libpam linking in the autotools build so
>    pam_lastlog2.so links against libpam, fixing the runtime "undefined
>    symbol: pam_syslog" / dlopen failure [YOCTO #16320]
>
> Drop the loopdev symlink-attack backport that is now part of the release:
>  - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
>    (upstream f55f9906, released in 2.41.4)
>
> Full changes:
> https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5
>
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
> v2: Correct the commit message. wrynose only carried the loopdev backport=
,
>     not a pam_lastlog2 backport, so only one backport is dropped. The
>     pam_lastlog2 libpam linking fix comes in natively with 2.41.5. (Paul
>     Barker)
>
>  ...2.41.3.bb =3D> util-linux-libuuid_2.41.5.bb} |   0
>  meta/recipes-core/util-linux/util-linux.inc   |   3 +-
>  ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ------------------
>  ...l-linux_2.41.3.bb =3D> util-linux_2.41.5.bb} |   0
>  4 files changed, 1 insertion(+), 116 deletions(-)
>  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb =3D>
> util-linux-libuuid_2.41.5.bb} (100%)
>  delete mode 100644
> meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOL=
LOW-to-prevent-symlink-a.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb =3D>
> util-linux_2.41.5.bb} (100%)
>
> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
> b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 0235862666..aec8721ca3 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -20,9 +20,8 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>
> file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
>
> file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
>             file://0001-tests-script-Disable-size-option-test.patch \
> -
>  file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
> +SRC_URI[sha256sum] =3D
> "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
>
>  CVE_PRODUCT =3D "util-linux"
> diff --git
> a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOF=
OLLOW-to-prevent-symlink-a.patch
> b/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOF=
OLLOW-to-prevent-symlink-a.patch
> deleted file mode 100644
> index 0951c9f5fb..0000000000
> ---
> a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOF=
OLLOW-to-prevent-symlink-a.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From f55f9906b4f6eeb2b4a4120317df9de935253c10 Mon Sep 17 00:00:00 2001
> -From: Karel Zak <kzak@redhat.com>
> -Date: Thu, 19 Feb 2026 13:59:46 +0100
> -Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink
> attacks
> -
> -Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
> -prevents symlink following in both path canonicalization and file open.
> -
> -When set:
> -- loopcxt_set_backing_file() uses strdup() instead of
> -  ul_canonicalize_path() (which calls realpath() and follows symlinks)
> -- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
> -
> -The flag is set for non-root (restricted) mount operations in
> -libmount's loop device hook. This prevents a TOCTOU race condition
> -where an attacker could replace the backing file (specified in
> -/etc/fstab) with a symlink to an arbitrary root-owned file between
> -path resolution and open().
> -
> -Vulnerable Code Flow:
> -
> -  mount /mnt/point (non-root, SUID)
> -    mount.c: sanitize_paths() on user args (mountpoint only)
> -    mnt_context_mount()
> -      mnt_context_prepare_mount()
> -        mnt_context_apply_fstab()           <-- source path from fstab
> -        hooks run at MNT_STAGE_PREP_SOURCE
> -          hook_loopdev.c: setup_loopdev()
> -            backing_file =3D fstab source path ("/home/user/disk.img")
> -            loopcxt_set_backing_file()       <-- calls realpath() as ROO=
T
> -              ul_canonicalize_path()         <-- follows symlinks!
> -            loopcxt_setup_device()
> -              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
> -
> -Two vulnerabilities in the path:
> -
> -1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
> -   realpath() -- this follows symlinks as euid=3D0. If the attacker swap=
s
> -   the file to a symlink before this call, lc->filename becomes the
> -   resolved target path (e.g., /root/secret.img).
> -
> -2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
> -   if canonicalization happened correctly, the file can be swapped to a
> -   symlink between canonicalize and open.
> -
> -Addresses:
> https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vf=
q4-9h9g
> -Signed-off-by: Karel Zak <kzak@redhat.com>
> -(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
> -
> -CVE: CVE-2026-27456
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - include/loopdev.h           | 3 ++-
> - lib/loopdev.c               | 7 ++++++-
> - libmount/src/hook_loopdev.c | 3 ++-
> - 3 files changed, 10 insertions(+), 3 deletions(-)
> -
> -diff --git a/include/loopdev.h b/include/loopdev.h
> -index e5ec1c98a..6bdb1393a 100644
> ---- a/include/loopdev.h
> -+++ b/include/loopdev.h
> -@@ -140,7 +140,8 @@ enum {
> -       LOOPDEV_FL_NOIOCTL      =3D (1 << 6),
> -       LOOPDEV_FL_DEVSUBDIR    =3D (1 << 7),
> -       LOOPDEV_FL_CONTROL      =3D (1 << 8),     /* system with
> /dev/loop-control */
> --      LOOPDEV_FL_SIZELIMIT    =3D (1 << 9)
> -+      LOOPDEV_FL_SIZELIMIT    =3D (1 << 9),
> -+      LOOPDEV_FL_NOFOLLOW     =3D (1 << 10)     /* O_NOFOLLOW, don't
> follow symlinks */
> - };
> -
> - /*
> -diff --git a/lib/loopdev.c b/lib/loopdev.c
> -index 2359bf781..76685be70 100644
> ---- a/lib/loopdev.c
> -+++ b/lib/loopdev.c
> -@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt
> *lc, const char *filename)
> -       if (!lc)
> -               return -EINVAL;
> -
> --      lc->filename =3D canonicalize_path(filename);
> -+      if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> -+              lc->filename =3D strdup(filename);
> -+      else
> -+              lc->filename =3D canonicalize_path(filename);
> -       if (!lc->filename)
> -               return -errno;
> -
> -@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
> -
> -       if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
> -               flags |=3D O_DIRECT;
> -+      if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> -+              flags |=3D O_NOFOLLOW;
> -
> -       if ((file_fd =3D open(lc->filename, mode | flags)) < 0) {
> -               if (mode !=3D O_RDONLY && (errno =3D=3D EROFS || errno =
=3D=3D
> EACCES))
> -diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
> -index 444d69d6f..34351116c 100644
> ---- a/libmount/src/hook_loopdev.c
> -+++ b/libmount/src/hook_loopdev.c
> -@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
> -       }
> -
> -       DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device")=
);
> --      rc =3D loopcxt_init(&lc, 0);
> -+      rc =3D loopcxt_init(&lc,
> -+                      mnt_context_is_restricted(cxt) ?
> LOOPDEV_FL_NOFOLLOW : 0);
> -       if (rc)
> -               goto done_no_deinit;
> -       if (mnt_opt_has_value(loopopt)) {
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-core/util-linux/util-linux_2.41.3.bb
> b/meta/recipes-core/util-linux/util-linux_2.41.5.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux_2.41.3.bb
> rename to meta/recipes-core/util-linux/util-linux_2.41.5.bb
> --
> 2.34.1
>
>

--=20

Sivakumar B

--00000000000072a4220657415915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Paul,<br>=C2=A0 =C2=A0 =C2=A0=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><span s=
tyle=3D"background-color:transparent">You&#39;re right, thanks for catching=
 that. wrynose only carried the </span>loopdev</div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif">backport; the pam_la=
stlog2 fix was never backported there, it just comes<br>in natively with 2.=
41.5. I&#39;ve sent a v2 that corrects the commit message<br>to drop only t=
he loopdev backport and describes the pam_lastlog2 fix as<br>one of the fix=
es pulled in by the upgrade. The diff is unchanged.<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Regards=
,<br>Siva<br></div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 23, 2026 at 11:52=E2=
=80=AFAM Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs@gmail.com"=
>sivakumar.bs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">2.41.4 and 2.41.5 are point releases in the same 2.4=
1 stable series and<br>
contain only bug fixes and security fixes (no new features, no API/ABI<br>
breaks), so the upgrade complies with the stable branch policy.<br>
<br>
Among the fixes pulled in:<br>
=C2=A0- Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-2=
7456)<br>
=C2=A0- libblkid integer overflow in parse_dos_extended() and a use-after-f=
ree<br>
=C2=A0 =C2=A0in partition probing<br>
=C2=A0- pam_lastlog2: fix libpam linking in the autotools build so<br>
=C2=A0 =C2=A0pam_lastlog2.so links against libpam, fixing the runtime &quot=
;undefined<br>
=C2=A0 =C2=A0symbol: pam_syslog&quot; / dlopen failure [YOCTO #16320]<br>
<br>
Drop the loopdev symlink-attack backport that is now part of the release:<b=
r>
=C2=A0- 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch<br>
=C2=A0 =C2=A0(upstream f55f9906, released in 2.41.4)<br>
<br>
Full changes: <a href=3D"https://github.com/util-linux/util-linux/compare/v=
2.41.3...v2.41.5" rel=3D"noreferrer" target=3D"_blank">https://github.com/u=
til-linux/util-linux/compare/v2.41.3...v2.41.5</a><br>
<br>
Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs@gmai=
l.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
---<br>
v2: Correct the commit message. wrynose only carried the loopdev backport,<=
br>
=C2=A0 =C2=A0 not a pam_lastlog2 backport, so only one backport is dropped.=
 The<br>
=C2=A0 =C2=A0 pam_lastlog2 libpam linking fix comes in natively with 2.41.5=
. (Paul<br>
=C2=A0 =C2=A0 Barker)<br>
<br>
=C2=A0...<a href=3D"http://2.41.3.bb" rel=3D"noreferrer" target=3D"_blank">=
2.41.3.bb</a> =3D&gt; <a href=3D"http://util-linux-libuuid_2.41.5.bb" rel=
=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.41.5.bb</a>} |=C2=A0=
 =C2=A00<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 -----------------=
-<br>
=C2=A0...<a href=3D"http://l-linux_2.41.3.bb" rel=3D"noreferrer" target=3D"=
_blank">l-linux_2.41.3.bb</a> =3D&gt; <a href=3D"http://util-linux_2.41.5.b=
b" rel=3D"noreferrer" target=3D"_blank">util-linux_2.41.5.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A04 files changed, 1 insertion(+), 116 deletions(-)<br>
=C2=A0rename meta/recipes-core/util-linux/{<a href=3D"http://util-linux-lib=
uuid_2.41.3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.4=
1.3.bb</a> =3D&gt; <a href=3D"http://util-linux-libuuid_2.41.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">util-linux-libuuid_2.41.5.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopd=
ev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch<br>
=C2=A0rename meta/recipes-core/util-linux/{<a href=3D"http://util-linux_2.4=
1.3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.41.3.bb</a> =3D&g=
t; <a href=3D"http://util-linux_2.41.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">util-linux_2.41.5.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux-libu=
uid_2.41.3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.41=
.3.bb</a> b/meta/recipes-core/util-linux/<a href=3D"http://util-linux-libuu=
id_2.41.5.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.41.=
5.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/util-linux/<a href=3D"http://util-linux-libuu=
id_2.41.3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.41.=
3.bb</a><br>
rename to meta/recipes-core/util-linux/<a href=3D"http://util-linux-libuuid=
_2.41.5.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.41.5.=
bb</a><br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 0235862666..aec8721ca3 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -20,9 +20,8 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/util-li=
nux/v${MAJOR_VERSION}/util-lin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lsfd-mkfds-foreign-so=
ckets-skip-when-lacking-sock_di.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ts-kill-decode-use-RT=
MIN-from-kill-L-instead-of-hard.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-script-Disable-=
size-option-test.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-loopdev-add-LOOPDEV_F=
L_NOFOLLOW-to-prevent-symlink-a.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;3330d873f0fceb5560b89a7dc14e4f3288bbd880e9690=
3ed9b50ec2b5799e58b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f586e35d320ff537aab3ffeca37e9ecd482ccbe013590=
db4429a414d8aa6a728&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;util-linux&quot;<br>
diff --git a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPD=
EV_FL_NOFOLLOW-to-prevent-symlink-a.patch b/meta/recipes-core/util-linux/ut=
il-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch<br=
>
deleted file mode 100644<br>
index 0951c9f5fb..0000000000<br>
--- a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_N=
OFOLLOW-to-prevent-symlink-a.patch<br>
+++ /dev/null<br>
@@ -1,114 +0,0 @@<br>
-From f55f9906b4f6eeb2b4a4120317df9de935253c10 Mon Sep 17 00:00:00 2001<br>
-From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_blank">k=
zak@redhat.com</a>&gt;<br>
-Date: Thu, 19 Feb 2026 13:59:46 +0100<br>
-Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attac=
ks<br>
-<br>
-Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that<br>
-prevents symlink following in both path canonicalization and file open.<br=
>
-<br>
-When set:<br>
-- loopcxt_set_backing_file() uses strdup() instead of<br>
-=C2=A0 ul_canonicalize_path() (which calls realpath() and follows symlinks=
)<br>
-- loopcxt_setup_device() adds O_NOFOLLOW to open() flags<br>
-<br>
-The flag is set for non-root (restricted) mount operations in<br>
-libmount&#39;s loop device hook. This prevents a TOCTOU race condition<br>
-where an attacker could replace the backing file (specified in<br>
-/etc/fstab) with a symlink to an arbitrary root-owned file between<br>
-path resolution and open().<br>
-<br>
-Vulnerable Code Flow:<br>
-<br>
-=C2=A0 mount /mnt/point (non-root, SUID)<br>
-=C2=A0 =C2=A0 mount.c: sanitize_paths() on user args (mountpoint only)<br>
-=C2=A0 =C2=A0 mnt_context_mount()<br>
-=C2=A0 =C2=A0 =C2=A0 mnt_context_prepare_mount()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mnt_context_apply_fstab()=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&lt;-- source path from fstab<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hooks run at MNT_STAGE_PREP_SOURCE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hook_loopdev.c: setup_loopdev()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backing_file =3D fstab source pa=
th (&quot;/home/user/disk.img&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loopcxt_set_backing_file()=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&lt;-- calls realpath() as ROOT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ul_canonicalize_path()=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;-- follows symlinks!<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loopcxt_setup_device()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 open(lc-&gt;filename, O_R=
DWR|O_CLOEXEC)=C2=A0 &lt;-- no O_NOFOLLOW<br>
-<br>
-Two vulnerabilities in the path:<br>
-<br>
-1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses<br>
-=C2=A0 =C2=A0realpath() -- this follows symlinks as euid=3D0. If the attac=
ker swaps<br>
-=C2=A0 =C2=A0the file to a symlink before this call, lc-&gt;filename becom=
es the<br>
-=C2=A0 =C2=A0resolved target path (e.g., /root/secret.img).<br>
-<br>
-2) loopcxt_setup_device() opens lc-&gt;filename without O_NOFOLLOW. Even<b=
r>
-=C2=A0 =C2=A0if canonicalization happened correctly, the file can be swapp=
ed to a<br>
-=C2=A0 =C2=A0symlink between canonicalize and open.<br>
-<br>
-Addresses: <a href=3D"https://github.com/util-linux/util-linux/security/ad=
visories/GHSA-qq4x-vfq4-9h9g" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g</a=
><br>
-Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"=
_blank">kzak@redhat.com</a>&gt;<br>
-(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)<br>
-<br>
-CVE: CVE-2026-27456<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
----<br>
- include/loopdev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- lib/loopdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +=
+++++-<br>
- libmount/src/hook_loopdev.c | 3 ++-<br>
- 3 files changed, 10 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/include/loopdev.h b/include/loopdev.h<br>
-index e5ec1c98a..6bdb1393a 100644<br>
---- a/include/loopdev.h<br>
-+++ b/include/loopdev.h<br>
-@@ -140,7 +140,8 @@ enum {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LOOPDEV_FL_NOIOCTL=C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 6),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LOOPDEV_FL_DEVSUBDIR=C2=A0 =C2=A0 =3D (1 &lt;&l=
t; 7),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LOOPDEV_FL_CONTROL=C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 8),=C2=A0 =C2=A0 =C2=A0/* system with /dev/loop-control */<br>
--=C2=A0 =C2=A0 =C2=A0 LOOPDEV_FL_SIZELIMIT=C2=A0 =C2=A0 =3D (1 &lt;&lt; 9)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 LOOPDEV_FL_SIZELIMIT=C2=A0 =C2=A0 =3D (1 &lt;&lt; 9)=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 LOOPDEV_FL_NOFOLLOW=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&l=
t; 10)=C2=A0 =C2=A0 =C2=A0/* O_NOFOLLOW, don&#39;t follow symlinks */<br>
- };<br>
- <br>
- /*<br>
-diff --git a/lib/loopdev.c b/lib/loopdev.c<br>
-index 2359bf781..76685be70 100644<br>
---- a/lib/loopdev.c<br>
-+++ b/lib/loopdev.c<br>
-@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc=
, const char *filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 lc-&gt;filename =3D canonicalize_path(filename);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (lc-&gt;flags &amp; LOOPDEV_FL_NOFOLLOW)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lc-&gt;filename =3D strd=
up(filename);<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lc-&gt;filename =3D cano=
nicalize_path(filename);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lc-&gt;filename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
- <br>
-@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lc-&gt;config.info.lo_flags &amp; LO_FLAGS_=
DIRECT_IO)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D O_DIRECT=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (lc-&gt;flags &amp; LOOPDEV_FL_NOFOLLOW)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D O_NOFOLLOW;<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((file_fd =3D open(lc-&gt;filename, mode | f=
lags)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode !=3D O_RDO=
NLY &amp;&amp; (errno =3D=3D EROFS || errno =3D=3D EACCES))<br>
-diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c<br>
-index 444d69d6f..34351116c 100644<br>
---- a/libmount/src/hook_loopdev.c<br>
-+++ b/libmount/src/hook_loopdev.c<br>
-@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DBG(LOOP, ul_debugobj(cxt, &quot;not found; cre=
ate a new loop device&quot;));<br>
--=C2=A0 =C2=A0 =C2=A0 rc =3D loopcxt_init(&amp;lc, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 rc =3D loopcxt_init(&amp;lc,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done_no_deinit=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mnt_opt_has_value(loopopt)) {<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.41=
.3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.41.3.bb</a> b/meta=
/recipes-core/util-linux/<a href=3D"http://util-linux_2.41.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">util-linux_2.41.5.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.41.=
3.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.41.3.bb</a><br>
rename to meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.41.5.=
bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.41.5.bb</a><br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--00000000000072a4220657415915--

