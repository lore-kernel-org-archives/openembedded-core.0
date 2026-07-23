Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3382BC531D4
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:49:02 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25303.1784818141271964081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 07:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WGnNg1T1;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66804667af2so700302d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784818140; cv=none;
        d=google.com; s=arc-20260327;
        b=jI3+k457upidRwc8kKLaY/TJh8h42bjsxOP9cWwNIrmzZBSHkAJc0RN1VX4+di1B5R
         9GrQwJAxEPHeNdX8xgUSHyqU9qCDJXTHsLDlD+6utEpYS2lIoowTU9q3b0TFpfF0lXtF
         u0FRv/TmIqKAdUUOE/O7UFLDn4YXvp3FNWCbYaLlArpIFiDPdMVwPVtKF1kJctMTlJCh
         QBywpfO4dpd9ZSZQilhZuLAlQJfcSwrsUgVWAeq0cvOavA++6laYBynPiDvH0BuBbwUy
         4hPMtwmo9W0WZVmeCJEBE09SwC23Zmc+UmFPRfqQTI+aDPdyf8cDU58RtldKmu2AEmOw
         C5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FRC52mBT8HMHMxANYMuwyU8at5M+CpnypdY3umb+XX0=;
        fh=EcDvZkKBjeO+cQP3plb3nJpyne19bKm9ouAyYjMb11I=;
        b=HSZIFm6Tz8rlVRUuwm0w7Qryq3oV06pPpLG1Jo1J9M43iEyLtxalyFmwhwzXqS13W3
         E75Wtj//OBMUVullRwUNQw6Qs4zTceelb+oRWh5Bw6MSw9N7vXeiJ8w62KsnxNDt+fxw
         8gUeHDrHHjtIFrhcZtUW+q/aCriJwzTuRNHRrp0Dxc+wsAatTFdINsijkGENw1ekw4PN
         xHXZlV+SLqkSTmWea6Dmkbjk3x0kjdbGWq0fJ7m0I6Vqul9rYdOeQcQB3vBsyvgALvwE
         bPhfVt0q7OqSfZel38xz4N9UEnWKw1c+n4o4n//u0Fu34xxzc2QhuuXiQ2dnjMNOqDAX
         eQ9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784818140; x=1785422940; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRC52mBT8HMHMxANYMuwyU8at5M+CpnypdY3umb+XX0=;
        b=WGnNg1T1uasDeYD0u96DMmFqydHHiO2Q9/8S34HGuKO8uUHaCCbAFPkJwApqPjJRzg
         +nOM2yM6pQ+DuifYv51rR+LsexiWrNWonppnRRcmX5BG6Cg2sBhpSl6p9VhCQMV6vF/O
         6Xt/7EW3a1JPGmidioO/J3C9PSYU6IFZwXhbGKpgtjM+IVMgHbrI3zV4e8m94fU2Wdmn
         fzBiEWtTDD7h6pIyHgJ+6eSPiba9946VzElXrmtDzEoP95WPhMQJd44W1h8U0JX8PDK1
         YH1bqIbr3I08zS8BFM8A10/kUzKQHsBzKd8lLqb4Kcxh7MEXL5QmmsiOB2KfKi8UGw1a
         vs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818140; x=1785422940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRC52mBT8HMHMxANYMuwyU8at5M+CpnypdY3umb+XX0=;
        b=jd2eFs8+Lmk3IOhJvbS7RysTETqkSshGdPeALd7ll39LK13aaDhuDacLbr6/q3oGAf
         JJiZkTNMr4LWpfHKvH4nExnsXVTJFSTlOQeao6C4sCy7yGs6HiVyXuF9+NCmitkkwzJU
         +y6dY3izO0PTnGpj7+JYcW37z0J0xeaNL0l19EUGiRtm2nuLYWubOhHBiC/a1ndHOrBJ
         augVsl+xKqJKywSsNz+tu/4PDhvrIOKRvEXfVa1QsCEAn7nN3OO+MWCeVc7K3+4rLe/u
         rpWI0Gcnj3bbEmqMslFU8y0nO9ND46VXo1RvQUuF1cE4hXf1xsNshgUWtsFic1/qtE2b
         e4Dw==
X-Gm-Message-State: AOJu0YzIePR0yiwR/4p2jh9Fv2mlhMXC9+VBU98ZUz47CDNZdpGCvgrf
	LpSz1ep2ty8ssR+39zwNP3dx+q2+FyvWXJEdvcpCM1kbgL9bqqnpgG7UBSdKD1bzZ0/Tl9gomxL
	1heRSk985m5DxGXk9T20FHvvKfhVrO4c=
X-Gm-Gg: AR+sD11+7PbfYa2EqdDVyqr2w6FjtE/VjfLZ7smSAZXl5y17HFuZCbfyczjiGxtpzv2
	wU1BGQjHMl33hshzUVbDIxV/tGLAk0palSGMRwWK200+bc6wVzOPZjkuov4w09LEr97oBXluxSB
	w7eiAegbwJHwqDCR7oljjdyGngbxhqtpLqL27VwjY+2ojgfI2B07tviKnuFc5AF3dq+KuWucrv8
	2TjYKwj/ZAnqEuCllueLoIkGg9sE1a1Mfe9JYNjseExNwF7RIUbFlAD8rEQX/9rN1eXNatXfR6E
	KQY8Et14wHXvMFh/LDQfGk2VXtLfrJaYB3SHQl44m5ypvv6Xzogqoh3PDl0MQou8jwYE1+0bY/K
	yeHTvejXGjkTT3wdko7pqqk8fRNl5n+s5y0VRLvmFCZ8oZmQgoKdQ6b+0n6nwxJC13yl4
X-Received: by 2002:a05:690e:4384:b0:667:ca27:479f with SMTP id
 956f58d0204a3-668a4bd50fcmr651445d50.6.1784818140124; Thu, 23 Jul 2026
 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260723134101.864910-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260723134101.864910-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jul 2026 07:48:47 -0700
X-Gm-Features: AUfX_mzb-2n16JH58T8Xdc-m31Dp3bsKM47SxGnWXGnZZnrnRq_BWcjYNV4ElaM
Message-ID: <CAMKF1spi9oaw3fWW290ryPd2ae-dbBHA3OvbGEE1_H5xYwgLJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] default-distrovars: Enable minidebuginfo
 DISTRO_FEATURE by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000003b1e540657485b59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241850

--0000000000003b1e540657485b59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Since default policies are generally used by derived distros, changing this
default may have broader impacts. I wonder if the Yocto autobuilder issues
you mentioned are commonly seen by OE users, as this change will embed
symbols into binaries that some users may not expect.

Additionally, there are alternatives that people might have already
deployed. I would suggest seeking user feedback before enabling this by
default in OE-core.

Best regards,

Khem Raj

On Thu, Jul 23, 2026, 6:41=E2=80=AFAM Richard Purdie via lists.openembedded=
.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Enable the "minidebuginfo" DISTRO_FEATURE in builds so that all
> binaries have just enough debuginfo in them to get a useful stack trace.
>
> This aids with debugging occasional failures that hit the autobuilder,
> at minimal cost.  For example, core-image-sato with systemd:
>
>    core-image-sato: IMAGESIZE changed from 481532 to 486044 (+1%)
>    glibc: PKGSIZE changed from 3715743 to 3805871 (+2%)
>    sqlite3: PKGSIZE changed from 462840 to 469056 (+1%)
>
> [Idea taken from a poky patch from Ross Burton]
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> index 69c6db589b7..aea458d28c4 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D " \
>      acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
>      wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
>      gobject-introspection-data ldconfig opengl ptest multiarch wayland
> vulkan \
> +    minidebuginfo \
>      "
>  IMAGE_FEATURES ?=3D ""
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241840):
> https://lists.openembedded.org/g/openembedded-core/message/241840
> Mute This Topic: https://lists.openembedded.org/mt/120410504/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003b1e540657485b59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Richard,<br><br>Since default policies are generally u=
sed by derived distros, changing this default may have broader impacts. I w=
onder if the Yocto autobuilder issues you mentioned are commonly seen by OE=
 users, as this change will embed symbols into binaries that some users may=
 not expect.<br><br>Additionally, there are alternatives that people might =
have already deployed. I would suggest seeking user feedback before enablin=
g this by default in OE-core.<br><br>Best regards,<br><br>Khem Raj<div><br>=
</div><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jul 23, 2026, 6:41=E2=80=AFAM Richard Purdie via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ri=
chard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org=
">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Enable the &quot;minidebuginfo&=
quot; DISTRO_FEATURE in builds so that all<br>
binaries have just enough debuginfo in them to get a useful stack trace.<br=
>
<br>
This aids with debugging occasional failures that hit the autobuilder,<br>
at minimal cost.=C2=A0 For example, core-image-sato with systemd:<br>
<br>
=C2=A0 =C2=A0core-image-sato: IMAGESIZE changed from 481532 to 486044 (+1%)=
<br>
=C2=A0 =C2=A0glibc: PKGSIZE changed from 3715743 to 3805871 (+2%)<br>
=C2=A0 =C2=A0sqlite3: PKGSIZE changed from 462840 to 469056 (+1%)<br>
<br>
[Idea taken from a poky patch from Ross Burton]<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfound=
ation.org</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/default-distrovars.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc<br>
index 69c6db589b7..aea458d28c4 100644<br>
--- a/meta/conf/distro/include/default-distrovars.inc<br>
+++ b/meta/conf/distro/include/default-distrovars.inc<br>
@@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \<br>
=C2=A0 =C2=A0 =C2=A0wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pul=
seaudio \<br>
=C2=A0 =C2=A0 =C2=A0gobject-introspection-data ldconfig opengl ptest multia=
rch wayland vulkan \<br>
+=C2=A0 =C2=A0 minidebuginfo \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241840): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241840" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/241840</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120410504/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120410504/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003b1e540657485b59--

