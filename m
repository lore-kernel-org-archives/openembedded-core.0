Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C723FF886C
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 08:50:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8511.1777366207343675891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tno/Rloq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d77f60944so8039944f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777366206; x=1777971006; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ba+mxm4Z79kCfpYDwHUtLyCn+KDA6ZmQdJKvL13ub5U=;
        b=Tno/RloqB+h78dmorkdq7MsL/D9eZ2mMZiwM/tIeb3ndmQu7mNvpq+kI1/lmp5J/Dq
         YUp76Cv2rYewfusRxILFIuiQNSayceJ7hFwXghvD9ObzgtySjrSUFI6O8m4y1XkBrHxY
         Hx+uEW943wGKFa0thF/792C2WsvBgkC7SLzho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366206; x=1777971006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba+mxm4Z79kCfpYDwHUtLyCn+KDA6ZmQdJKvL13ub5U=;
        b=LIECmRuuqkH50Z3XyIGiUKcDxctikTjHNvc1yULljmeSCDC2taJ3vZa4lVh0OT6f8l
         XrXK7FavGSW2PEjPsGjt53COnKoAAU9alWbq5e1yyOmnIsCtDi7TqrToT0lY0sluWWEQ
         88XYUGsIYVtZBaXIi8+4eAuMUucLrJEiAVal7zDNZ4Wyh4yI3GqeIARQhm2EYs1ti6rd
         UtdmV7fTQIw1mfUvCaM7tTg9QzGqnzvtuetV09eNGn3cYbkehw/d7GPPYlx2w9kMSWHm
         RvRY4ZYqqsaGeZMRaVLZgEyzKs7NNPnmk2Rge8Z91qG7hyb1eqits6BYa6yXrdnUTna4
         3/Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/JHAXeRDK4uvnLG7MOy5H+q1N0aHv0bhPkcAAdPbrj23lq6psP4XXTippM3YySKLh77UvHoiy+9RASnc+/F3St1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWp9fC7yUNIwnk5ZWKpwlSF0QhDgAN+KS6kDRoFhPDgeekfXy2
	yU5kVUAjoabHMIij3sg0V05iCWN61Pdlh/5jGkvywnqZjoEVLFd+2Ffz6p6thw18g8o=
X-Gm-Gg: AeBDietFMq4OGrk8C2o3WEYwgaQ4sZOx1cSPVoV2Jk3M0f+O4X9M8J8ltq1631wTA0X
	cNr1h++qkUksOVaiUkgjrwlrvVhlbHSVk2VGLjL8i4qyvq6fORlvfxltkUgDZodHFaXAAsDFC/c
	CMubtjV/JTQG1pQchzQyVvfJcR5PwCtEonojJpRzBsaMtTTBHGzdx3WpufjmbC+0rGGC0KRpdbQ
	fw28/F+qMzO+aJkEiE0c4AuOyg/hrfq5L/FOU6tJ8nqUS4x2m45ZY4HwfvJCOeh5Jp5CGVuIl5J
	2geNibRzlkUnBA3Nya5sEL1Kcv1OMrKEBEZJEPdxYTIthLLifHND7+Nxe7gnW8FG9l6Kq9EJsXx
	FwUskWTEMCoyLccHJZl58BoyYLqE4/CaCUs8tstY+G/t0pQfY+eX48XQ5QbCSABna2DLamksZhj
	OsDC0mmFg8qa7zHM+S9MjbzS2s3c/hJ4AtR7Ae4p4KbL7RHcdwuJhuQJqr0EQYUevWQtbPUMw4w
	VgnI4JDxG9Kn+ZJPz07g5qhgsg=
X-Received: by 2002:a05:6000:3109:b0:43f:e938:1e67 with SMTP id ffacd0b85a97d-44649c990f5mr3984757f8f.38.1777366205564;
        Tue, 28 Apr 2026 01:50:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9? ([2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4831062f8f.20.2026.04.28.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:50:04 -0700 (PDT)
Message-ID: <6286ba4533dda960c651558e60121a880accb98e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package/classextend: Extend package variables
 for a multilib variant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaeyoon.jung@lge.com, openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 28 Apr 2026 09:50:04 +0100
In-Reply-To: <20260427092912.960716-1-jaeyoon.jung@lge.com>
References: <20260427092912.960716-1-jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 08:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236045

On Mon, 2026-04-27 at 18:29 +0900, Jaeyoon Jung (LGE) via lists.openembedde=
d.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>=20
> It extends package variables in case missing for a dynamic package added
> during do_split_packages. It's needed for a multilib build where some
> per-package variables should be treated as multilib variants.
>=20
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> =C2=A0meta/classes-global/package.bbclass | 11 +++++++++++
> =C2=A0meta/lib/oe/classextend.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 5 +++--
> =C2=A02 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index 67148fc1ac..cfadd36c16 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for o in sorted(objs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import re, stat
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.package
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if match_path:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
m =3D re.match(file_regex, o)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> @@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_pa=
ttern, description, postinst
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
hook(f, pkg, file_regex, output_pattern, m.group(1))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('PACKAGES', ' '.join(packages))
> +
> +=C2=A0=C2=A0=C2=A0 variant =3D d.getVar("BBEXTENDVARIANT")
> +=C2=A0=C2=A0=C2=A0 prefixes =3D (d.getVar("MULTILIB_VARIANTS") or "").sp=
lit()
> +=C2=A0=C2=A0=C2=A0 if variant and prefixes:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.classextend
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Extend package variables fo=
r the given variant if unset
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clsextend =3D oe.classextend.=
ClassExtender(variant, prefixes, d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clsextend.rename_package_vari=
ables((d.getVar("PACKAGEVARS") or "").split(), overwrite=3DFalse)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 return list(split_packages)
> =C2=A0
> =C2=A0PACKAGE_DEPENDS +=3D "file-native"
> diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
> index ddca10dee5..8b9602e316 100644
> --- a/meta/lib/oe/classextend.py
> +++ b/meta/lib/oe/classextend.py
> @@ -128,7 +128,7 @@ class ClassExtender(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.set_filter("RCONFLI=
CTS", deps=3DTrue)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.set_filter("PKG", d=
eps=3DTrue)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 def rename_package_variables(self, variables):
> +=C2=A0=C2=A0=C2=A0 def rename_package_variables(self, variables, overwri=
te=3DTrue):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs_mapping =3D get_pac=
kage_mappings(self.d.getVar('PACKAGES'), self.extname)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.d.setVarFilter('PAC=
KAGES', "package_suffix_filter(val, '" + self.extname + "')")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.d.setVarFilter('PAC=
KAGES_DYNAMIC', "suffix_filter_regex(val, '" + self.extname + "', " + str(s=
elf.prefixes) + ")")
> @@ -137,4 +137,5 @@ class ClassExtender(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 continue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for subs in variables:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%=
s" % (subs, pkg_mapping[1]))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if overwrite or not self.d.getVar("%s:%s" % (subs, pkg_m=
apping[1])):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.d.renameVar("%s:%s" % (subs=
, pkg_mapping[0]), "%s:%s" % (subs, pkg_mapping[1]))
>=20

Sorry about the delay in responding to this one. I'm very very nervous
about adding this level of complexity to the code and I'm not convinced
this is the right direction.

The original issue was something around:

-LICENSE:libsystemd =3D "LGPL-2.1-or-later"
+LICENSE:${MLPREFIX}libsystemd =3D "LGPL-2.1-or-later"

Qi then commented:

> I checked the related codes with PACKAGES_DYNAMIC in multilib.bbclass and=
 package.bbclass.
> I suspect that it's the do_split_packages function in package.bbclass tha=
t needs to be fixed.
> This function may also need to use rename_package_variables on the dynami=
cally generated packages.
> You can refer to the multilib_virtclass_handler_postkeyexp function in mu=
ltilib.bbclass. Note that LICENSE is already in "PACKAGEVARS".
> Could you please check if the above method works?

then you mentioned a second problem with FILES.

I think Qi meant that the function may be needed *only* on the
dynamically generated packages. By calling it unconditionally, you have
the overwrite problem and we really need to avoid doing things twice.

I therefore don't think this is right yet. It would help to have some
clear test cases about the corner cases which aren't working so we can
see this in public code, rather than whatever your layer is doing too.

Cheers,

Richard






