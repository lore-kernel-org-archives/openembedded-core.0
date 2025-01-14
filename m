Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC79E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:57:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.49372.1736870266625553681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdSeGoHj;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso8526434a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736870266; x=1737475066; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sNLE9f8IjZhCEH1GiLZtLg44mh7/jYfXSW4I7LV/Os=;
        b=UdSeGoHjKUjT8k7LX2uMN749bUjvzAy1xt3JWgBMJzXPH5/UAvCPCGvHtqrjZsgLkz
         mcvn/aXz43XX0Q5tvkuZ70NqmvEtoDpHxPidOtTumler7/dU+BbYs3ayjjcHqOiy1V0F
         iuOflvp//+joqBLMBVcTXS14YNEzqZXWk5UbdYjL8CHtmyVQVLhIy73wFYl++Ehb+7Kw
         N0m0BQRr57gnxhyBCnszku8kOXnG6YtgYo1TQ9HCrop2427ZK4WJz/L3RVcSY7SRWb0e
         kGFCpWXdTjonqFDyp01cxyPvu09H9BnFnKSuIwsKgBWgzzm5YzKy1b0YPOScWkLfdz7i
         qPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870266; x=1737475066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sNLE9f8IjZhCEH1GiLZtLg44mh7/jYfXSW4I7LV/Os=;
        b=KK0lbLe07k3PSxOiQQNJbMduz7CLkUsfkwVfkSElO8KOvKn2OAUFPbWRYX8mN3v0Ql
         0HrYeycEgMk30/d3Kq6rBcy4DPN8rpVbm5U7TzM8gKV4RDj53vk9rnjli7wCw2qnm/90
         2Atn+arrCFkZ0bkYlV6l4kjY9PbW8yDojXk9svZM4hOZ1Ly1H20AE/lnnnmlp4QAzEzy
         pp2FI3lgwLf4N4mdlpr6fyG9deBtC75CiMCsnUXwDfP38Ck4EtocXTsTNj0YiGVAkuyd
         80sL4y3KZ9eeGmc6uHSTSwr0eZsedgoCngRty3XC/pNH0hXKv6S5YjG8t4LHStNFy3MB
         iQRw==
X-Gm-Message-State: AOJu0YyxuizMLHc5gYTDHfrBT2OT0rR2HgoiUSYzyOAbeybhTGJ2Y8uL
	+w5+Zy09bmFhGDhdgZzrAjdfcPQkyaJTuZySkZNl9pUTaHkFi70geseE4MLesNqBbB41yR1estl
	NR126melzywj/vtXiFOfF9yJ9MbygjQ==
X-Gm-Gg: ASbGncuCoC6LLBHv5gLn+c/peE/Kd9xNH87x3sn62kxwaAdxh7K6hMxv6t1p+4jzeGN
	ei0xs15LWu9LjNEDzps25QJRIQoABaSHO3py4Z791
X-Google-Smtp-Source: AGHT+IEeUj04kUu0MCvz2V4Umy/J60cSKM+FzSQaRIEq/TAvJDTg2GOsrSbVBkOrZRIjKx9ICF1WFJ4eDmKJtx5Miyo=
X-Received: by 2002:a17:90b:1b47:b0:2ef:949c:6f6b with SMTP id
 98e67ed59e1d1-2f5545de66bmr32827997a91.13.1736870265977; Tue, 14 Jan 2025
 07:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20250114153748.2358116-1-niko.mauno@vaisala.com> <20250114153748.2358116-2-niko.mauno@vaisala.com>
In-Reply-To: <20250114153748.2358116-2-niko.mauno@vaisala.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 14 Jan 2025 16:57:34 +0100
X-Gm-Features: AbW1kvZpTWBD6zq5pTb4oOtqWXgDEcTAWcDTjLfvydJ5MJ0rSDEmOTCWORu4af4
Message-ID: <CAApg2=Sw3-_bLF-ZQB1CW9CqhgsEj9skY_b9-NYCLVau_5pWrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] vex.bbclass: Cease forced symlink creation
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039878e062bac9f33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209809

--00000000000039878e062bac9f33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 4:38=E2=80=AFPM Niko Mauno via lists.openembedded.o=
rg
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:

> Allow the method to work also when the user has overridden
> IMAGE_LINK_NAME value as empty string.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/vex.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
> index c9749d4ceb..3719e5c222 100644
> --- a/meta/classes/vex.bbclass
> +++ b/meta/classes/vex.bbclass
> @@ -211,13 +211,15 @@ python vex_write_rootfs_manifest () {
>
>      d.setVar("PN", save_pn)
>
> -    link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
>      manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
>
>      with open(manifest_name, "w") as f:
>          json.dump(json_data, f, indent=3D2)
>
> -    update_symlinks(manifest_name, link_path)
> +    if link_name:
> +        link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
> +        update_symlinks(manifest_name, link_path)
> +
>      bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
>  }
>
>
What about a common function to use in both cve-check.bbclass and
vex.bbclass?

Also, it would be helpful to document what happens when the variable is
empty.

Kind regards,
Marta

--00000000000039878e062bac9f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14,=
 2025 at 4:38=E2=80=AFPM Niko Mauno via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;niko.mauno=3D<a href=3D"mailto:vaisal=
a.com@lists.openembedded.org">vaisala.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allow the m=
ethod to work also when the user has overridden<br>
IMAGE_LINK_NAME value as empty string.<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/vex.bbclass | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass<br>
index c9749d4ceb..3719e5c222 100644<br>
--- a/meta/classes/vex.bbclass<br>
+++ b/meta/classes/vex.bbclass<br>
@@ -211,13 +211,15 @@ python vex_write_rootfs_manifest () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PN&quot;, save_pn)<br>
<br>
-=C2=A0 =C2=A0 link_path =3D os.path.join(deploy_dir, &quot;%s.json&quot; %=
 link_name)<br>
=C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar(&quot;CVE_CHECK_MANIFEST_JSO=
N&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0with open(manifest_name, &quot;w&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json.dump(json_data, f, indent=3D2)<br>
<br>
-=C2=A0 =C2=A0 update_symlinks(manifest_name, link_path)<br>
+=C2=A0 =C2=A0 if link_name:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_path =3D os.path.join(deploy_dir, &quot;%=
s.json&quot; % link_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_symlinks(manifest_name, link_path)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0bb.plain(&quot;Image VEX JSON report stored in: %s&quot=
; % manifest_name)<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>What about a common function to use in=
 both cve-check.bbclass and vex.bbclass? <br></div><div><br></div><div>Also=
, it would be helpful to document what happens when the variable is empty.<=
/div><div><br></div><div>Kind regards,</div><div>Marta<br></div></div></div=
>

--00000000000039878e062bac9f33--

