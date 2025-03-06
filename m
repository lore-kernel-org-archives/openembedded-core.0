Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CECC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 15:36:33 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.16544.1741275386317226719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 07:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+4UAhPZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22356471820so12947605ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 07:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741275386; x=1741880186; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ana1lE8O71Tv2SzvGdnkicERGGDA3skCKQdW/tD44VI=;
        b=X+4UAhPZd0+4uRBw/hYNFUe36wA/G3xbZyGfRpP4CHhfeRO0QjautmbqVXZ+wFlgEy
         rfQWwlkJUhRIXNqlJQ6lJrjRBtWIxos9W4EkUYpm/QRsyRo27bL0HqKrpnsy+PEJc+G+
         t0zn4BQtIhWMwPGNip3fNhZT48vq/wDek3i7iRvHQjJuDF8tBixnJFeP33zohvKnpvu1
         j9JCQmVvqO9dQg/jJjBwB+AZ2MGtvZj/Lp1wFjmFHCKXQ5wzNui4oI1z61a7MldEDhNV
         G8F1XWwe6PdcwW5d1fuJX8y6SZgavMe0A59KSzzFeQMYFOsQWpB0X2kRLJRSUtXUGrXw
         FIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275386; x=1741880186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ana1lE8O71Tv2SzvGdnkicERGGDA3skCKQdW/tD44VI=;
        b=irVNQLs3da7ssDwi8oJPXyVBmcY3f+owNAJoCRFUo/DG5PPa8JiYpS1ZWlC+aQ1wt6
         TgLy0PY+OptG9E4RndZt2B51jPyDirRApggzsbuVO6P0lVSKf7rR7sTd75TZxsTQAYIn
         T7Wvf4hOaEoMcMXe31VHNO3eAUQdNBIqsPqlgDmZl0YVXW5tPDfbFzh5pPDU3PKCnL3i
         SLc9oGZjSnKncYx1/bmn96xDQEjHFGAepeEAW6sc7ZKuED32ZRJWqyD+eDgq/S7nl0Mo
         okp94X/vHpE55abysws/rum/K53wjqMtwFCDW9hYEngjMxVrFz5b5laetBONgCYrh01f
         BA+A==
X-Gm-Message-State: AOJu0YxBCL2ds0gLkyVK22v1JLn2sG2MolifV/BrkS6Ykyekt+1aBaGr
	fFlWoNPORjJ1/OGXMR6PdNeZx9Wzn7C5xhtMhbNMmetXocTy6RPKbJ/iTkNqnMIQmP5/DkEZOZ8
	/5wnoDaz8TVrhBuGAAlxwrdAeQ0c=
X-Gm-Gg: ASbGncuv3eclsQn5BJ4VuIPIzY9RNUr2ynC8gTN/ar1Wj1iT1tzDZs5Gitl7xV6x86X
	SaVpKnM5N1mynkThiOFumTSAxh8O3E0p+fCTfVf7f6YOb6hyZgIGO3HkAMAtwb9ELgjoRI7dUR5
	2HoyEGCy1BBJ6ugilP2PockE7vKw==
X-Google-Smtp-Source: AGHT+IEwmeOzT5TnFbtGcMb4iDrmAGocRY4MUB7G/WFu5uo2O90ZhY0dXTaUhVwWHUNB82Ss2U+359cDHfH/3xPssG8=
X-Received: by 2002:aa7:88d0:0:b0:730:79bf:c893 with SMTP id
 d2e1a72fcca58-73682b69d53mr12084299b3a.4.1741275385369; Thu, 06 Mar 2025
 07:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
In-Reply-To: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Mar 2025 10:36:12 -0500
X-Gm-Features: AQ5f1JqDrI0JBjLYOam2XWTiK2yuG15mKTpMPFuXNgCilC5h7B2FN6AXSZkER5o
Message-ID: <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: add QA to check required or
 forbidden kernel configs
To: louis.rannou@syslinbit.com
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com, 
	Louis Rannou <louis.rannou@non.se.com>
Content-Type: multipart/alternative; boundary="000000000000cd1ec6062fae441f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 15:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212395

--000000000000cd1ec6062fae441f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via lists.openembedded=
.org
<louis.rannou=3Dsyslinbit.com@lists.openembedded.org> wrote:

> From: Louis Rannou <louis.rannou@non.se.com>
>
> Add a QARECIPETEST kernel-config to the kernel to check the kernel config
> has
> set (or unset) config listed in variables QA_KERNEL_CONFIGS_REQUIRED (or
> QA_KERNEL_CONFIGS_FORBIDDEN).
>
>
We already have audit tools that can do this, the approach of opening
the .config, iterating and then hard binding ourselves to the very specific
kernel configuration names has been considered and rejected many
times.

What exactly isn't working with the already supported mechanism ?

Bruce



> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 38
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index
> 64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3e99d93=
4c6868b98
> 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy
>
>  # Add using Device Tree support
>  inherit kernel-devicetree
> +
> +
> +# Add QA test to check some required/forbidden kernel configs are set or
> not.
> +QA_KERNEL_CONFIGS_REQUIRED ??=3D ""
> +QA_KERNEL_CONFIGS_FORBIDDEN ??=3D ""
> +
> +WARN_QA:append =3D " kernel-config"
> +
> +QARECIPETEST[kernel-config] =3D "package_qa_check_kernel_config"
> +def package_qa_check_kernel_config(pn, d):
> +    from pathlib import Path
> +    import re
> +
> +    config_path =3D Path(d.getVar("B"), ".config")
> +    if not config_path.exists():
> +        oe.qa.handle_error("kernel-config",
> +                           "Kernel configs have not been checked "\
> +                           "as the kernel .config is not found: "\
> +                           "%s." % config_path)
> +        return
> +
> +    config_list =3D {}
> +    with config_path.open('r') as f_config:
> +        for line in f_config.read().splitlines():
> +            configset =3D re.match(r'# (\w+) is not set|(\w+)=3D([ymn])'=
,
> line)
> +            if configset is not None:
> +                if configset.group(1) is not None:
> +                    config_list[configset.group(1)] =3D "n"
> +                else:
> +                    config_list[configset.group(2)] =3D configset.group(=
3)
> +
> +    for conf in d.getVar("QA_KERNEL_CONFIGS_REQUIRED").split():
> +        if conf not in config_list or config_list[conf] =3D=3D "n":
> +            oe.qa.handle_error("kernel-config", "Kernel config is
> required: %s" % conf, d)
> +
> +    for conf in d.getVar("QA_KERNEL_CONFIGS_FORBIDDEN").split():
> +        if conf in config_list and config_list[conf] in "ym":
> +            oe.qa.handle_error("kernel-config", "Kernel config is
> forbidden: %s" % conf, d)
>
> ---
> base-commit: b72823fc09674f78ad452250f453f6e47d9444de
> change-id: 20250306-qa_kernel-061a37e316c4
>
> Best regards,
> --
> Louis Rannou <louis.rannou@syslinbit.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212394):
> https://lists.openembedded.org/g/openembedded-core/message/212394
> Mute This Topic: https://lists.openembedded.org/mt/111549046/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cd1ec6062fae441f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, 2025 at 10:04=
=E2=80=AFAM Louis Rannou via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;louis.rannou=3D<a href=3D"mailto:syslinbit.com@l=
ists.openembedded.org">syslinbit.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Louis Rann=
ou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_blank">louis.r=
annou@non.se.com</a>&gt;<br>
<br>
Add a QARECIPETEST kernel-config to the kernel to check the kernel config h=
as<br>
set (or unset) config listed in variables QA_KERNEL_CONFIGS_REQUIRED (or<br=
>
QA_KERNEL_CONFIGS_FORBIDDEN).<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">We already have audit tools that can do this, the approach=
 of opening</div><div class=3D"gmail_default" style=3D"font-size:small">the=
 .config, iterating and then hard binding ourselves to the very specific</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">kernel configurat=
ion names has been considered and rejected many</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">times.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">What exactly isn&#39;t working with the already supported me=
chanism ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" =
target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 38 +++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 38 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3e9=
9d934c6868b98 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy<br>
<br>
=C2=A0# Add using Device Tree support<br>
=C2=A0inherit kernel-devicetree<br>
+<br>
+<br>
+# Add QA test to check some required/forbidden kernel configs are set or n=
ot.<br>
+QA_KERNEL_CONFIGS_REQUIRED ??=3D &quot;&quot;<br>
+QA_KERNEL_CONFIGS_FORBIDDEN ??=3D &quot;&quot;<br>
+<br>
+WARN_QA:append =3D &quot; kernel-config&quot;<br>
+<br>
+QARECIPETEST[kernel-config] =3D &quot;package_qa_check_kernel_config&quot;=
<br>
+def package_qa_check_kernel_config(pn, d):<br>
+=C2=A0 =C2=A0 from pathlib import Path<br>
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 config_path =3D Path(d.getVar(&quot;B&quot;), &quot;.config&=
quot;)<br>
+=C2=A0 =C2=A0 if not config_path.exists():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;kernel-config&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;Kernel configs have not been checked &quot;\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;as the kernel .config is not found: &quot;\<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s.&quot; % config_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 config_list =3D {}<br>
+=C2=A0 =C2=A0 with config_path.open(&#39;r&#39;) as f_config:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f_config.read().splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configset =3D re.match(r&#39;# (=
\w+) is not set|(\w+)=3D([ymn])&#39;, line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if configset is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if configset.group=
(1) is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf=
ig_list[configset.group(1)] =3D &quot;n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf=
ig_list[configset.group(2)] =3D configset.group(3)<br>
+<br>
+=C2=A0 =C2=A0 for conf in d.getVar(&quot;QA_KERNEL_CONFIGS_REQUIRED&quot;)=
.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf not in config_list or config_list[conf=
] =3D=3D &quot;n&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;kernel-=
config&quot;, &quot;Kernel config is required: %s&quot; % conf, d)<br>
+<br>
+=C2=A0 =C2=A0 for conf in d.getVar(&quot;QA_KERNEL_CONFIGS_FORBIDDEN&quot;=
).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf in config_list and config_list[conf] i=
n &quot;ym&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;kernel-=
config&quot;, &quot;Kernel config is forbidden: %s&quot; % conf, d)<br>
<br>
---<br>
base-commit: b72823fc09674f78ad452250f453f6e47d9444de<br>
change-id: 20250306-qa_kernel-061a37e316c4<br>
<br>
Best regards,<br>
-- <br>
Louis Rannou &lt;<a href=3D"mailto:louis.rannou@syslinbit.com" target=3D"_b=
lank">louis.rannou@syslinbit.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212394): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212394" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212394</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111549046/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111549046/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000cd1ec6062fae441f--

