Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E85DC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 09:29:36 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.206727.1724059770930429278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLrtA0IK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f01613acbso512379e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 02:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059769; x=1724664569; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q/9BplvTjtXUevm+RAYwaPlzm+oOEuDEF+a1kEao/k=;
        b=mLrtA0IKrdpai3dRLtv4lpQYToCwvfQggaYgJhZDXHooNoR6TIeKZRnfkbNZNPTXfe
         sO1dQxLyRY7ntn8yBhptvvObwjUJ+lBq7+ea/IUzomvgO7s3Zpk0xNVDLm0jFIhpOoeP
         cGTli/WdHakBh6KgJQeA5kXb+UHfjtu5FkvA7GC8Ogad4qM2t5WGr+icO3VzkEKUHC+5
         jiV+t/nH/kvQvs0yz57ADewUVYLNheF++2p2moaL74Dn7inq8lTxgzBeAsO1VmW1+XWi
         zquHQLm2pH0e3Qeq3xBmHfZciMvN3XPaY9fi8vuuWjWRahGfGj2qcQdZwyW4N94ZtNLB
         MdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059769; x=1724664569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Q/9BplvTjtXUevm+RAYwaPlzm+oOEuDEF+a1kEao/k=;
        b=SSnUdwoYq0IdtARAccmp+Q2PT8r+W2DvZuaAjt/35Jhf9jRDETS0IAzbFIw0eLTEOu
         1iHD1N5eV7x6204iFAl84PrX+JyPD1UolGq4MX3y+KNqiaEqsu9LacA+rmlZVSpiOrnG
         zR/R2kH1Qr2v4SUwqUNQYy+0nW6681OHuYnVg692nfbFBlTWaM977+g2h4+tVFQaKpQU
         aAuIi2Mmj+EqlswTu92jmBL304vlQ2rXbe07vxyaNq10Qc6OALi+G/9JeXiIEZ5YcoUx
         7rxHdGR86scCrmMVP9ZZWLI2h+z9KT+9RbbJqU2p8aLXjwbcvk5AjBwR8in1WVKXUPol
         f7kQ==
X-Gm-Message-State: AOJu0YwVDbMPTe8lblDY11u8gS0U4BWM9kV8BUnWSKjQhVhMpeivpHrp
	5pMn7xrkXCpTlML2FzRmOZJBcBRY2zuGwnwsRG0Gnux892dHR9wfEmGNsWWi2BcUidt3DZ2JZRy
	vckAavTzLE1h7ku05XQeMay8+zrU=
X-Google-Smtp-Source: AGHT+IFl07lpdSl7gQdQSn/AfW9LK9oNZZL55YPlLKMLtIqWmNtSzL2JUcP3Hq6eixEeQ5Lfx5GtVlILgwU5TYEzgwk=
X-Received: by 2002:a05:6512:114b:b0:52f:31a:4c08 with SMTP id
 2adb3069b0e04-53307f88b72mr4185494e87.11.1724059768361; Mon, 19 Aug 2024
 02:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240819092739.2063887-1-niko.mauno@vaisala.com>
In-Reply-To: <20240819092739.2063887-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 11:29:17 +0200
Message-ID: <CANNYZj_nac30NVKGVkKJVh4p1nOE1dAbeW=4qj9TkGU9aasEKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203495

Thanks, this version lgtm.

Alex

On Mon, 19 Aug 2024 at 11:27, Niko Mauno via lists.openembedded.org
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> The 2.39 version of util-linux took new file descriptors based mount
> kernel API into use. In relation to this change, the upstream release
> notes in
> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/release=
s/v2.39-ReleaseNotes#L14-L21
> mention that
>
>   This change is very aggressive to libmount code, but hopefully, it does=
 not introduce regressions in traditional mount(8) behavior.
>
> After observing following failure when booting a board using a bit
> older 6.1 series kernel together with initramfs rootfs based boot flow
>
>   [FAILED] Failed to start Remount Root and Kernel File Systems.
>   See 'systemctl status systemd-remount-fs.service' for details.
>
> closer inspection revealed:
>
>   demoboard ~ # systemctl status -l systemd-remount-fs.service
>   x systemd-remount-fs.service - Remount Root and Kernel File Systems
>        Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service=
; enabled-runtime; preset: disabled)
>        Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 U=
TC; 1min 22s ago
>          Docs: man:systemd-remount-fs.service(8)
>                https://www.freedesktop.org/wiki/Software/systemd/APIFileS=
ystems
>       Process: 76 ExecStart=3D/usr/lib/systemd/systemd-remount-fs (code=
=3Dexited, status=3D1/FAILURE)
>      Main PID: 76 (code=3Dexited, status=3D1/FAILURE)
>
>   Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / =
exited with exit status 32.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point=
 not mounted or bad option.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may h=
ave more information after failed mount system call.
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main =
process exited, code=3Dexited, status=3D1/FAILURE
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Faile=
d with result 'exit-code'.
>   Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and =
Kernel File Systems.
>
> also consequentially, 'systemctl status' reported:
>
>   State: degraded
>
> When issuing 'strace -ff mount -o remount /' the failure occurred at
>
>   mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=3DMOUNT_ATTR_RDONLY|MOUNT=
_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=3DMOUNT_ATTR_NOSUID|MOUNT_ATT=
R_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_A=
TTR_NOSYMFOLLOW|0x40, propagation=3D0 /* MS_??? */, userns_fd=3D0}, 32) =3D=
 -1 EINVAL (Invalid argument)
>
> After further investigation, The issue was pinpointed to lack of Linux
> kernel commit
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3D95de4ad173ca0e61034f3145d66917970961c210
> ("fs: relax mount_setattr() permission checks") in the kernel version
> that was being used. Above mitigation was discussed in email related to
> then-rejected CVE-2024-26821:
> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b3=
27@gregkh/T/
>
> After testing with qemuarm64 machine different linux-yocto versions,
> it was observed that the issue impacts following versions of currently
> supported LTS kernels:
>  - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>  - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>  - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
>    known working version)
>
> Taking the above findings into consideration, add a new PACKAGECONFIG
> option which allows to conveniently opt-out from prematurely using a
> feature which can cause issues with a bit older kernels.
>
> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
> was not reproduced with those versions - using strace showed that the
> mount_setattr call associated with the new mount API problem was not
> issued with these LTS kernel versions, which seemed to be confirmed
> also by following libmount debug message in these cases:
>
>   415: libmount:     HOOK: [0x7fa115e818]: failed to init new API
>
> Note: In addition to the aforementioned, this change was
> tested also briefly using the current latest kernel versions 6.1.104,
> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
> did not introduce any observable regression to the boot flow.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..e87657cc70 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--w=
ithout-cryptsetup,cryptsetup"
>  PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>  PACKAGECONFIG[lastlog2] =3D "--enable-liblastlog2,--disable-liblastlog2,=
sqlite3"
> +# Using the new file descriptors based mount kernel API can cause rootfs=
 remount failure with some older kernels.
> +# Of currently supported LTS kernels, it seems safe to enable this optio=
n with:
> +# - version 6.6.18 and newer in the 6.6.y series.
> +# - version 6.1.79 and newer in the 6.1.y series.
> +# - with the 5.15.y series, versions till at least 5.15.164 can not use =
it.
> +# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use =
the old API regardless of this option.
> +PACKAGECONFIG[no-new-mount-api] =3D "--disable-libmount-mountfd-support,=
--enable-libmount-mountfd-support"
>
>  EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS=
}'"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203494): https://lists.openembedded.org/g/openembedde=
d-core/message/203494
> Mute This Topic: https://lists.openembedded.org/mt/107977417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

