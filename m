Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B48D66B84
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 22:42:05 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.59320.1732660918505562968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 14:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQnCV4eZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f201a932b2so460195eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732660917; x=1733265717; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPLL1rhmQtciBQ+J9gXjrOWskFcgWK29OgyGE5xMUMs=;
        b=hQnCV4eZKXVvczgW6kJtJikLdfJXVfoeRiRvNWT38FeW6Xp0yzBfwdUhEdHo85nGb4
         6iJt9YAwGUSltVualA/Hl5RV0o0XvOwKfw6Uoce173UyyVLtRDE9higYLSMjmSAa+rkZ
         4UEejUQeh8kiH3GewHOZ+wr+FGmSvOfgUWGFOqhjHfBKjT9cidChINnjZUVniTe7RtrW
         tc2jSWwnpEevprCljQjmELrHXIr2mTPy8bD0+tEXURNiJyP8B8rGzyCjlVndpA36tCaF
         YnbPZ9g6VuLWLAe+qX54eO/4fdlcfQjhpelLZrIGI+L1ce0fCAemCCRUzSh/miQnDWL0
         Unow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732660917; x=1733265717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPLL1rhmQtciBQ+J9gXjrOWskFcgWK29OgyGE5xMUMs=;
        b=BUZjJqv5PS+CB39ddcG+Y75nIROQsc40reKoBQHlc7TspeSMQLQVo/JkoUDck2dDHu
         Yyo6LT17vbEsxbmxNvD2akSTAemrDb73TubSg3VTk87DPeFlJ9sf0jN22ZTtkvZspVQi
         x5JXoq9seF1F+HXMeen6X2ua/YmORn3Db1HDYOot0a5nZjE4AgYwV+xO//fXaq08rywG
         B3qHIEJqwrE0uIZ4uFPCYjfRgzwWg8Gp8kzKn1EAIb8AmEtPeKMEwgCaBLdYVYhP+lFB
         qbMjon6mJTESTbsZpvX372v80HJMLqkjWI7cFfi8wBF3e3M3uuNQfHGlOLAY4pG8xlut
         ma3g==
X-Gm-Message-State: AOJu0YzTn/GeYFsnWRIUrfEH2SbbzjwuxcSYBgeKB2UiBpq9NHdKfO5r
	/teB74uT4dWz8wIY5Gx2b7Q43Ji3VoUOrF2DzMqf5kFal0H6ADkwihhVTbTy7A24yu2nn6ed8XN
	Jb/1IviK24UeQcxudhWy9povh84c=
X-Gm-Gg: ASbGncvMprqx0w0nYbsxP/Ri5GCSZIIvyojSNiBwZTfeV9VG0t05cX500KPmftM2FY/
	atRvW+5aOHM6+lrtihqj4BjUR4V49Hw==
X-Google-Smtp-Source: AGHT+IHd2//59mZFVFmqVDBZ5cJ3lWD4ZjZ01JhtwuiVAoYizftL7SnpJgzOpAGs0ogOxSG2LF8p9vJYMm3AmiRDiPg=
X-Received: by 2002:a05:6830:f89:b0:710:f375:a6c9 with SMTP id
 46e09a7af769-71d65c93264mr489761a34.7.1732660917665; Tue, 26 Nov 2024
 14:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20241126214448.2781380-1-JPEWhacker@gmail.com>
In-Reply-To: <20241126214448.2781380-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2024 14:41:31 -0800
Message-ID: <CAMKF1sqnZz6CkeE_LgoioUA8fr+GhsCxAHzrG7WFGt18z83BAQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/go-vendor: Use UNPACKDIR instead of WORKDIR
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 22:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207887

On Tue, Nov 26, 2024 at 1:45=E2=80=AFPM Joshua Watt via lists.openembedded.=
org
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
>
> modules.txt is provided using file:// in SRC_URI, therefore it will be
> found in UNPACKDIR instead of WORKDIR
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/go-vendor.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbcl=
ass
> index 1bbb99ac794..38ea69ab50a 100644
> --- a/meta/classes/go-vendor.bbclass
> +++ b/meta/classes/go-vendor.bbclass
> @@ -156,7 +156,7 @@ python do_go_vendor() {
>                  shutil.copy2(rootdirLicese, subdirLicense)
>
>      # Copy vendor manifest
> -    modules_txt_src =3D os.path.join(d.getVar('WORKDIR'), "modules.txt")
> +    modules_txt_src =3D os.path.join(d.getVar('UNPACKDIR'), "modules.txt=
")

yes, thanks for fixing it.

>      bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
>      shutil.copy2(modules_txt_src, vendor_dir)
>
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207885): https://lists.openembedded.org/g/openembedde=
d-core/message/207885
> Mute This Topic: https://lists.openembedded.org/mt/109797450/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

