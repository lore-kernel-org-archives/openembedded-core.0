Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C97FF513E5
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 22:20:00 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56398.1772749195097463118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 14:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WruhY6Y3;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4094b31a037so2453441fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772749194; cv=none;
        d=google.com; s=arc-20240605;
        b=Gs/kpQnb24uY8TnvGfow5GfAw87732K8oM+xYL8XYjG3cE60cPk56x4GTLu8p3FYvV
         DstCc8LYUsVR50Zt/d36ABvnwiFlZJUS6QeSfvHuS/bOml1sOyeNUB/qWFw/CcgelZ4X
         8S/TFsqZRZFQvVeXRNoxltNeRBPSkELFjhvPZz+EQCWgJ1FSr6Gwi6vP/Qa1fwEnGr34
         NdacJ04bpZDI4TmBEddnizgAvnHmoXCipu9yl0j87tl+dYIHY1A+Q+JVvKnx+Uir7KiO
         5Sjp0YOlqdm0QZHIZtbdf2ptuohqo45Oztq9P2iYMSDgWXRGwDVVZxu9wGXOZh78o9MU
         fvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u46xt9biJkGhsi6scMNhZGnqArM2DWUyMgNZfwPXyeI=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=G/2179uWCYEGZsltxElZgvO1u9YeI04gxBYyP4kyUc7v8TyLrwiN9/qmReK6Epy1pA
         7orVnk6ViZtlTtFjZN9j7Dvod5YhrS6UhYmRPTHMijBdRiEG8AxGfoXDCEzDmGbPTDlZ
         /7Uc5vNtM+JCCkIj+gvdh2mbVsb6Gnr3cr6pPTp1JiA47YJUfweSjKIuoF2SQvtcNhX/
         Ryl0dtHjHMEzAnbUVqCW4sPz4nBMJ+IWv9uTsvs7v000Jku0q5Fw3MI9lD/o5H8Po/Ul
         gam1Q6DUUQ6IbtyBRkRSzsqmquEl317Yp+/I2a+xcX/2h7t/Xiwyi2lxQ7AMAd2d9yaR
         sZBQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749194; x=1773353994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u46xt9biJkGhsi6scMNhZGnqArM2DWUyMgNZfwPXyeI=;
        b=WruhY6Y3FZ36Nm2DgFXLSA3cscbloZ8mvMA2YLRAm5i6TVN9FoORrAoShj72OICH4w
         SYJcXKngZWVbr8Wi+AoMF2tNboCSSBpnp6eHupnXvAOHaNZ9fYP0OBRdCw3z7zY94lQT
         hCCo2K4BFjZfjYF5tc4eWArVg8/eEELMZ/OO8jGi457stPf9CMKmiypSR/86GStvwbGP
         sEnFAAUMwc2NNpB7JSHPTvbhvxnohu9s7k7+Dbtz+Qk83ScgBw04GMSdoID2oLL3Xj+M
         WjYx7Ksay/+mJWSmB7zGv6Ee955KAztS4dSv8rZ6iHlk+CHCiU2UOyrhVquemHf6u2Eb
         mH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749194; x=1773353994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u46xt9biJkGhsi6scMNhZGnqArM2DWUyMgNZfwPXyeI=;
        b=Fz8/w+EjXt1P/rbb4eEy9U9dWCpXRYgOmsU61l50ZF5UyKR5IHRrwep6R1xrOTaFG9
         elcKLblirT9bE8PG2zqkzPU2LXPZni6eztmLSPhi76YOyBX8B1ZDBbzrXZGmITz2gPQf
         x0P6iyT/A5uQO21nOpkkfOv8COIvi/JbcJW/0P46Q7pIlpZdkUnfpR7WQlSXGqeH5vyR
         gryfteKQqVRaeXQULlHNNUXdUjzTNOP8WAbERlL15t93XuQGURrVNOoaV33Mi+RX/knv
         PgLS+O4Mlt70GjCB4mPclwbNm2APSU7YEZpH5scmLZqqw0mXTBGDrUVackgaAhByax2N
         g8RQ==
X-Gm-Message-State: AOJu0Yy8xORSyvx+JlrVTJsuIo+Mu8FvVZHTvP0CJI0LhgmsKiBfg+nv
	Qzqs2Bvw+P1+dpn6OxKMwRmYuxPzcb/bAnYcWIH0qkA9NWIyA7ibQ8UoFQv0sFp1EjIZMIfT0fk
	RSZQvkSSj7RUeOscS0TMzxv6gjQtKQTQ=
X-Gm-Gg: ATEYQzwRJi+Agbc37EJ0XmByacE/l/kzBrbOywsMPN/bBaz2e1C1FCMpU173glzM1ag
	krBh0sRnQpN81exaJXd7NUEk2DAUtq5QybSoaX5xir1S3+ODqDlMMXTnaXYHNIRuWsPXakKxOY1
	5vbN8isVy/vCHp7o5Hogq6ztH8DuTn1l3KtnLp5sYXv1d5lawkZeRv86sZCVy1Ka6bGr8QsIqLo
	JS5ERPPdYcVvVFjs9ShV8zDfisUkHtnso4WyBz9G8wb8m0lFMT23IVm1/ZNlnbUvu3thW8OSIiz
	3O+SSxA=
X-Received: by 2002:a05:6820:81d0:b0:65f:1012:69c5 with SMTP id
 006d021491bc7-67b9bd8f1f7mr61623eaf.76.1772749194236; Thu, 05 Mar 2026
 14:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20260305191136.1520512-1-peter.marko@siemens.com>
In-Reply-To: <20260305191136.1520512-1-peter.marko@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 6 Mar 2026 11:19:42 +1300
X-Gm-Features: AaiRm50x0hoSlwuAs-_hBT8tPYj7IZb6TSyKsOAVuc-fXMQCFFbl7Mf7WZWsGrI
Message-ID: <CADySD0Hv_A+xywb2UCDiH2-iAAsmO_RHoB7QabJkbsa7Ncr3xA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libpam: set status for CVE-2024-10041
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232524

On Fri, Mar 6, 2026 at 8:11=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This CVE was fixed in v1.6.1 (per [1]).
> NVD tracks it as version-less CVE for RedHat.
>
> [1] https://security-tracker.debian.org/tracker/CVE-2024-10041
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-ext=
ended/pam/libpam_1.7.1.bb
> index 8fb67983ee..713163fdba 100644
> --- a/meta/recipes-extended/pam/libpam_1.7.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
> @@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime +=3D "${sysconfdir}/security/=
limits.conf"
>  GITHUB_BASE_URI =3D "https://github.com/linux-pam/linux-pam/releases"
>
>  CVE_PRODUCT =3D "linux-pam"
> +
> +CVE_STATUS[CVE-2024-10041] =3D "fixed-version: finxes since v1.6.1"

typo "finxes"

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232512): https://lists.openembedded.org/g/openembedde=
d-core/message/232512
> Mute This Topic: https://lists.openembedded.org/mt/118157843/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

