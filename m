Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43E2C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 02:00:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.4168.1686621634703229530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 19:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=j7GMF2zg;
 spf=pass (domain: foundries.io, ip: 209.85.208.175, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1a4250b07so60989591fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 19:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686621633; x=1689213633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5gU80V3f095nesBzozaEZxf54Iy9/xtE+xqpaD2aXc=;
        b=j7GMF2zgN5LdIKMf4Du6upwly5X7y2m5pe8j+ogr5kKx0hqBGxT5ERDDMuVFpSKZlC
         08WHlbY95NN0CuiI5IDkNqNTTy7v8OULR/1Ecc0TKfMm1E4BIom4Z3oG4Xptz/FuEDwE
         9zsEEy+69MrBtViEbaPsdVHJf2EPHdUzcgpVlhJVDm2TVmRxBk3X6ox18hjXEA3bWOzn
         gs8rg3m0ApEuOYlLEsddaEMNxOhSN2IJ7ry4gPQk+/fMzpIEalZ6VdMS4KhMyFgiToed
         Q/Ga7jTg+xHUB/RZWH/BGTvuN/uGx82nsbSHcROvsU1wiNLzh9Yrs5TQ/epAIYkly5xk
         1XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686621633; x=1689213633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5gU80V3f095nesBzozaEZxf54Iy9/xtE+xqpaD2aXc=;
        b=J+5iy+bNaJPGF95K/db0Nao71thJN1mPUKOpsv9FE8oK7c96gl8STxPmIi7dqAkR6T
         zsCf6+kcKh/8Q2KjriuJxhp8nxmdL2Aw29IvWvP0qTNW/eCmpS7Rd0sxRhPojLzyBj8o
         tf6rWjxEKfDDPQIMRqCQDTbOjK2J+wbjjDU3RxvCwpQz6bQELXBcfgGotSKebAhYORiP
         34pUvBZzvF86VngCwfjZ4XXcfGJ6omjSxsI1Z9c+reIDxYg4f4Ic6sz9y2ya80fSw6nG
         dS3vVPrZ9CXtQJOHas+EZTj2DcT6J80WZ+WbT5xECxJHCJZYZS/7ZNH8Kg2NTHErQ45x
         P5iQ==
X-Gm-Message-State: AC+VfDwJIoNlO8aO0KEjRgWYY7aCDCjLKpP1wYVw0+Skir3M1ccrL4p2
	vqK6/h95w67RGOqV14Bkzbu/f6mPgwYjF1PvGN5Z
X-Google-Smtp-Source: ACHHUZ5jqASQOq/Z0hq42plnnz23lqe9ZhfvpEZ24YIWRQTCsPXDKPl1RJwubOeTet5Y0kTY0lw5veNwS12ViXP2lbY=
X-Received: by 2002:a2e:8894:0:b0:2b2:246:520 with SMTP id k20-20020a2e8894000000b002b202460520mr3620230lji.47.1686621632581;
 Mon, 12 Jun 2023 19:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230328084141.49802-1-Qi.Chen@windriver.com>
In-Reply-To: <20230328084141.49802-1-Qi.Chen@windriver.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Mon, 12 Jun 2023 22:59:56 -0300
Message-ID: <CAAaKDhEE0PDexvfPYDcn27Sxzs78Db=Br9GNb+DbQ7MVH8oizw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssh: fix CVE-2023-28531
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 02:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182689

Hi,

Was looking if CVE-2023-28531 was backported to kirkstone already and
noticed this patch was already proposed before, but not
merged/accepted.

Since it showed up once in the metrics report, was it decided to be
ignored in the end (but then I wasn't able to find it defined in
CVE_CHECK_IGNORE)?

Thanks,

Ricardo

On Tue, Mar 28, 2023 at 5:42=E2=80=AFAM Chen Qi <Qi.Chen@windriver.com> wro=
te:
>
> Backport patch to fix CVE-2023-28531.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-destination-constraints-for-smartca.patch | 35 +++++++++++++++++++
>  .../openssh/openssh_8.9p1.bb                  |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstre=
am-include-destination-constraints-for-smartca.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-incl=
ude-destination-constraints-for-smartca.patch b/meta/recipes-connectivity/o=
penssh/openssh/0001-upstream-include-destination-constraints-for-smartca.pa=
tch
> new file mode 100644
> index 0000000000..b4e7ce7ef6
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-des=
tination-constraints-for-smartca.patch
> @@ -0,0 +1,35 @@
> +From 91889b5a3e7554af474a21ce8e1ffd3eb1542f06 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Thu, 9 Mar 2023 06:58:26 +0000
> +Subject: [PATCH] upstream: include destination constraints for smartcard=
 keys
> + too.
> +
> +Spotted by Luci Stanescu; ok deraadt@ markus@
> +
> +OpenBSD-Commit-ID: add879fac6903a1cb1d1e42c4309e5359c3d870f
> +
> +CVE: CVE-2023-28531
> +
> +Upstream-Status: Backport [54ac4ab2b53ce9fcb66b8250dee91c070e4167ed]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + authfd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/authfd.c b/authfd.c
> +index 76e48aab..dca8e55b 100644
> +--- a/authfd.c
> ++++ b/authfd.c
> +@@ -665,7 +665,7 @@ ssh_update_card(int sock, int add, const char *reade=
r_id, const char *pin,
> +     struct dest_constraint **dest_constraints, size_t ndest_constraints=
)
> + {
> +       struct sshbuf *msg;
> +-      int r, constrained =3D (life || confirm);
> ++      int r, constrained =3D (life || confirm || dest_constraints);
> +       u_char type;
> +
> +       if (add) {
> +--
> +2.37.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_8.9p1.bb
> index 6057d055f4..d81072537c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://add-test-support-for-busybox.patch \
>             file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
>             file://0001-Default-to-not-using-sandbox-when-cross-compiling=
.patch \
> +           file://0001-upstream-include-destination-constraints-for-smar=
tca.patch \
>             "
>  SRC_URI[sha256sum] =3D "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd=
262380ae58bec5e7"
>
> --
> 2.37.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179213): https://lists.openembedded.org/g/openembedde=
d-core/message/179213
> Mute This Topic: https://lists.openembedded.org/mt/97901027/3616986
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
cardo@foundries.io]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Ricardo Salveti

