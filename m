Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDD2FED2EC
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16527.1773302838994158934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U6xs48W9;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so543215f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773302837; x=1773907637; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrF2SWRmWejEeShJEBhl32dqdFSwEp8Av11tDIfGGTY=;
        b=U6xs48W99Hx66OqSM5UmjoZqWPsg/4HDiik+o6TwiFcj+kiUEctOIY1o9YS6c2SYPM
         bhD1aFHeJfO9pMD09DoBWOFoJDonqIa6cLGkwOPtSblvNs6Qp1Q7eT+FSMU3akpkDkcR
         MDsF0Pi92VSLF3k41LijszbqHcJeGRvtq01YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773302837; x=1773907637;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrF2SWRmWejEeShJEBhl32dqdFSwEp8Av11tDIfGGTY=;
        b=oMb3MxjTY1O4pO9yeQSR5rIbpPu+z4eBkll0m14JsWiyRNK5VHdnTFOXUiH562dULy
         cjnWzZZjfxhJRZaRVSLY0vNT3JmQ+VJq1BFawSeVmSulXybA0vzqmzH+N/j2Oea7n93/
         Jy7f/ECKl+kmEdN6Fp/5IulHgzZW+yDayF8w/EeTvDiFiIXk4qZYj+mDae+PKkw+ckM7
         St2ddZajlksAGvrpAVlHoFmjuvO+gafuKM8SzN5+vGnX3ZRuwgLwL9xmpTJpezCdl37H
         AtGHZX7/r7RvQnkyVHPGmBMgjZsezic6b8x2XMFZQsLT8miWg/o76H7DUxsqB8wns3Kj
         gB9A==
X-Forwarded-Encrypted: i=1; AJvYcCX3JcM115nUUdnyybSCjcPRIuqpzDh1eIqUIcaFd0rJG1p60vWhSbYOeLFO59pFEh+cur4mA9WoXiDTiQGVDn/UYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzciskW2W30Sorj+2n0SsZw3DRLZLZkqUQkn3efh/UF7YqlGsLY
	LJLNusYW4Ub1fOAT9ZnW7ppCxQA/JmN4iSI0FcOVEODig9DlnKKpBBwViegF2l+ksxw=
X-Gm-Gg: ATEYQzw6mTIgBE385I66XxAOba8GzGbvaGvw0txop2CGvsnToCWqmCiZ5VpMqRf2iAT
	D3bedtZc+aHucoqIMj/g8++idWq7/gF6FXD788KzN3sQavzpJY95YEe9ejEPiub9iFbIR3aGE59
	VpdRDyNHrsAOrFuOmkF1qhfLW8ryBT4yKlx3Aj3Bdpj+iYtywNk6OfA3Y13uQoPAfz2HTjt4D4c
	WKZbT7bBtkec9GPCfKWXs12WRMP1ksmvFL7HkxOBEpIRJpOtSA+8CMNfPwNEKMJEMPkC2mkfKoq
	L8uqqVHudwIPbXDWuIghqakh6PzqxdvKbAbmcWKAaQLnFpFBu7UcdaG1OvxM8/jTOL+1Q1ETeYA
	DJkpW1J8AhM4cE1fEIikAkqgcyFzc64iWACLT2ifd3jG680re5w0WooM96UEgPO7fTOHjoNeXri
	gkm8SOHdqvX8xbDbqZtGsKc1XKqZoc4hpgv/irwI5RMJ/fEi8kCNkyMaJlYvyKGDzFPQsZEXVuB
	VS5KOAFfpRCuw/xVOnd1u0VPQ==
X-Received: by 2002:a05:600c:458e:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4854b0ac93fmr79898535e9.1.1773302836950;
        Thu, 12 Mar 2026 01:07:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm241850805e9.7.2026.03.12.01.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 01:07:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 09:07:16 +0100
Message-Id: <DH0NE4LYO0ZU.BEMF190N10G9@smile.fr>
Subject: Re: [OE-core] [PATCH] package/classextend: Extend package variables
 for a multilib variant
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>, "Qi.Chen@windriver.com"
 <Qi.Chen@windriver.com>
To: <jaeyoon.jung@lge.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <18937C686E7FBEA2.4089548@lists.openembedded.org>
 <PU4P216MB113351272682AF1DFF5F8EFA9A44A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB113351272682AF1DFF5F8EFA9A44A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232926

On Thu Mar 12, 2026 at 1:51 AM CET, Jaeyoon Jung (LGE) via lists.openembedd=
ed.org wrote:
> Hi,
>
> I noticed that this hasn't been accepted yet, nor marked as needing impro=
vement.
> Should I resend it rebased to the latest HEAD?

Yes, I guess it got lost somewhere.
The simplest solution is for you to rebase/resend.

Thanks!

>
>
> Best regards,
> ---
> Jaeyoon Jung
> Software Platform Lab. / Corporate R&D / LG Electronics Inc.
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Jaeyoon Jung (LGE) via lists.openembedded.org=
 <jaeyoon.jung=3Dlge.com@lists.openembedded.org>
> Sent: Thursday, February 12, 2026 20:30
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>; Qi.Chen@windriver.com <Qi.Chen@windriver.com>; =EC=A0=95=EC=9E=AC=EC=9C=
=A4/Task Leader/SW Platform(=EC=97=B0)=EC=84=A0=ED=96=89Platform=EA=B0=9C=
=EB=B0=9C=EC=8B=A4 Lightweight System Task <jaeyoon.jung@lge.com>
> Subject: [OE-core] [PATCH] package/classextend: Extend package variables =
for a multilib variant
>
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> It extends package variables in case missing for a dynamic package added
> during do_split_packages. It's needed for a multilib build where some
> per-package variables should be treated as multilib variants.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  meta/classes-global/package.bbclass | 11 +++++++++++
>  meta/lib/oe/classextend.py          |  5 +++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index bd32a6ede5..1d779f714b 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
>
>      for o in sorted(objs):
>          import re, stat
> +        import oe.package
>          if match_path:
>              m =3D re.match(file_regex, o)
>          else:
> @@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_pa=
ttern, description, postinst
>              hook(f, pkg, file_regex, output_pattern, m.group(1))
>
>      d.setVar('PACKAGES', ' '.join(packages))
> +
> +    variant =3D d.getVar("BBEXTENDVARIANT")
> +    prefixes =3D (d.getVar("MULTILIB_VARIANTS") or "").split()
> +    if variant and prefixes:
> +        import oe.classextend
> +
> +        # Extend package variables for the given variant if unset
> +        clsextend =3D oe.classextend.ClassExtender(variant, prefixes, d)
> +        clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "=
").split(), overwrite=3DFalse)
> +
>      return list(split_packages)
>
>  PACKAGE_DEPENDS +=3D "file-native"
> diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
> index ddca10dee5..8b9602e316 100644
> --- a/meta/lib/oe/classextend.py
> +++ b/meta/lib/oe/classextend.py
> @@ -128,7 +128,7 @@ class ClassExtender(object):
>          self.set_filter("RCONFLICTS", deps=3DTrue)
>          self.set_filter("PKG", deps=3DTrue)
>
> -    def rename_package_variables(self, variables):
> +    def rename_package_variables(self, variables, overwrite=3DTrue):
>          pkgs_mapping =3D get_package_mappings(self.d.getVar('PACKAGES'),=
 self.extname)
>          self.d.setVarFilter('PACKAGES', "package_suffix_filter(val, '" +=
 self.extname + "')")
>          self.d.setVarFilter('PACKAGES_DYNAMIC', "suffix_filter_regex(val=
, '" + self.extname + "', " + str(self.prefixes) + ")")
> @@ -137,4 +137,5 @@ class ClassExtender(object):
>              if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswi=
th("}"):
>                  continue
>              for subs in variables:
> -                self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%=
s" % (subs, pkg_mapping[1]))
> +                if overwrite or not self.d.getVar("%s:%s" % (subs, pkg_m=
apping[1])):
> +                    self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "=
%s:%s" % (subs, pkg_mapping[1]))
> --
> 2.47.2


--=20
Yoann Congal
Smile ECS


