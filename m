Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606CFC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:48:24 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.322.1745938095391030695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dylcaw+H;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af590aea813so6802088a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 07:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745938095; x=1746542895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gP9VBunji9U0bk2Bp/C0DsudV6yH4Dg4C4F2pCQfKQ=;
        b=dylcaw+H4EVS2U6UOLNUzYNnvneRXwvQOrcDd2V1Je8v64oK7kQtZoyePixu1PRZaY
         36Qge8cSNsP0WNW4KVEphEMYGD/c58jEs+PnVqX+tecrrVVJ1CSCEu13QKz6paUQJi2h
         I9zesAhT3RmUIy4gODqV6g1vMt9ckSaWKBt8Yrp/UokVlOyPeSw8TcsR4wOOAAkisfVL
         6ojUJkR8LEpBFM4RrpnEpk5TUXNYVSSsCobzzg17doWWLY9iQGuz2kFZSdxHympbvJP+
         zFzSSRWAC1CeyvadIDb0LNd6uapef2LrDDT+V1zCncRL9V7ECrd/taqQ2Z4TeFdVtcX9
         6iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938095; x=1746542895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gP9VBunji9U0bk2Bp/C0DsudV6yH4Dg4C4F2pCQfKQ=;
        b=bY5VVySusAUABvOjHLPi1jI/RMI/Ah58i6rjkSVCTWhltZgopNcnelMUzo5rJN8X2L
         gCs6bo5QiXbL+n3H/E1vOuJtyQbAuJBbxYMmHAaG3NPDHVWYqqDGngNotdFSWXiL4jY1
         NS140GeNoDa3wgWMqsFL07rS2dgEII9qzjxV8grcbd38i6cxw7oQ3nlAMMoEigEjcrJ0
         XZS/O0cgrv7oMxSAu2TCS6MbCP0I4zA+IH1Y0ocF7bSmeos8t/Ze73n+VjF68AMMkgBS
         4m2gHFXSoOyD2TgVxk9olRW1ksSDJat3ThfMv50ri6K1ffvTbqaTlpotku/RLRFmgVvd
         Ff3Q==
X-Gm-Message-State: AOJu0YwFMVbcDsrPF96y4ldpoMbEDCz2lETZgBF+Uv1mGhN1pYhHhlNd
	jgWWIB42evm0mW1XWgPK+A6YMHw9jP0LrEdxXl0mlFt+5yLiwXqVwQ9M4xDQs2/nm+ONKeOxuKh
	U/FOvA8W6nj1U/WiYbyyHI9YswLc=
X-Gm-Gg: ASbGncu2YbLZBM7mPYtqEWx80UIyPEzdAFogmE5dvhAvtsRXJwMojDFqw8GX1hC06aX
	FayVfAWbj1Cy+rLT5ZXNE3bXyNcp+mfdH2w+XBqViVQulOyIzUJ414kgd8Ty97bzBOPjyUHan5p
	72dd7SRJevjPbsGK2qYp3vPA7kDyWOxCZelA==
X-Google-Smtp-Source: AGHT+IEKbm+94Ip1fWc74Izz4CGAHzdUKyrfL37wsHE7ohjwvZhBx+ZyxuuSxxh6OxMFT6ARUSz01+Wl4pWIxY3M5as=
X-Received: by 2002:a17:90b:264b:b0:2fe:b907:5e5a with SMTP id
 98e67ed59e1d1-30a22467d74mr4648888a91.10.1745938094400; Tue, 29 Apr 2025
 07:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250429143904.634082-1-daniel.turull@ericsson.com> <20250429143904.634082-2-daniel.turull@ericsson.com>
In-Reply-To: <20250429143904.634082-2-daniel.turull@ericsson.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 29 Apr 2025 16:48:02 +0200
X-Gm-Features: ATxdqUG0USK2-hOv-PoYekWrkdGjpPLdWv0IOSLZiGW8ZAvjobm5jc7XTDb_DVQ
Message-ID: <CAApg2=T7+hrOyfYAYHgy7OBOXL_s2UVPV8RkuBFgQ8vuKaYHpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, Peter.Marko@siemens.com
Content-Type: multipart/alternative; boundary="000000000000eaa8690633ebe3c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215678

--000000000000eaa8690633ebe3c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for providing this work Daniel.

Are you able to obtain the same result with the raw CVE database? This
patchset works for the Linux kernel only.

Also, have you tested if it works with the world build for multiple kernel
images (i.e. different configs) from the same source tree?

I would be rather going for a post-processing with a given config after
generating the json files instead of modifying the processing.

My 0.02.

Kind regards,
Marta

On Tue, Apr 29, 2025 at 4:39=E2=80=AFPM Daniel Turull via lists.openembedde=
d.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Add CVE data source for kernel.org.
>
> It includes more information than the one provided by NVD.
> Use similar mechanism and same variables as cve-check to define
> when to update.
>
> To use without internet access, change variable VULNS_URL to a local
> copy or mirror.
>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/conf/distro/include/maintainers.inc  |  1 +
>  meta/recipes-core/meta/linux-vulns_git.bb | 76 +++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 8065287c17..ec427fe6a4 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-firmware =3D "Otavio Salvador <
> otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> +RECIPE_MAINTAINER:pn-linux-vulns =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> diff --git a/meta/recipes-core/meta/linux-vulns_git.bb
> b/meta/recipes-core/meta/linux-vulns_git.bb
> new file mode 100644
> index 0000000000..fc48558eb8
> --- /dev/null
> +++ b/meta/recipes-core/meta/linux-vulns_git.bb
> @@ -0,0 +1,76 @@
> +SUMMARY =3D "CVE information from kernel.org"
> +DESCRIPTION =3D "Repo for tracking and maintaining the CVE identifiers
> reserved \
> +and assigned to the Linux kernel project."
> +HOMEPAGE =3D "
> https://git.kernel.org/pub/scm/linux/security/vulns.git/about/"
> +LICENSE =3D "GPL-2.0-only & cve-tou"
> +SECTION =3D "base"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit native
> +inherit nopackages
> +
> +VULNS_URL ?=3D "https://git.kernel.org/pub/scm/linux/security/vulns"
> +CVE_CHECK_KERNEL_DB_DIR ??=3D "${DL_DIR}/CVE_CHECK/vulns"
> +
> +# Use same intervals as cve-update-db-native. By default: once a day
> (24*60*60).
> +# Use 0 to force the update
> +# Use a negative value to skip the update
> +
> +CVE_DB_UPDATE_INTERVAL ??=3D "86400"
> +
> +python do_fetch(){
> +    import os
> +    import bb.utils
> +
> +    bb.utils.export_proxies(d)
> +    db_file =3D d.getVar("CVE_CHECK_KERNEL_DB_DIR")
> +    repo_url =3D d.getVar("VULNS_URL")
> +
> +    try:
> +        import time
> +        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
> +
> +        if update_interval < 0:
> +            bb.note("Kernel CVE database update skipped")
> +            return
> +        if time.time() - os.path.getmtime(db_file) < update_interval:
> +            bb.debug(2,"Kernel CVE database, recently updated, skipping"=
)
> +            return
> +
> +    except OSError:
> +        pass
> +
> +    bb.utils.mkdirhier(os.path.dirname(db_file))
> +    # Configure cmd
> +    if not os.path.exists(db_file):
> +        cmd =3D f"git clone {repo_url} {db_file}"
> +    else:
> +        cmd =3D f"git -C {db_file} pull"
> +    try:
> +        bb.fetch2.runfetchcmd(cmd, d)
> +    except bb.fetch2.FetchError as e:
> +        bb.warn(f"Kernel vulns repo url not accessible. {repo_url}")
> +        bb.warn("Set VULNS_URL in local.conf to point to a local copy or
> mirror")
> +}
> +
> +do_clean() {
> +    rm -rf ${CVE_CHECK_KERNEL_DB_DIR}
> +}
> +
> +deltask do_patch
> +deltask do_unpack
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +deltask do_runtime_spdx
> +deltask do_create_spdx
> +deltask do_populate_lic
> +deltask do_cve_check
> +
> +do_fetch[nostamp] =3D "1"
> +do_fetch[file-checksums] =3D ""
> +do_fetch[vardeps] =3D ""
> +
> +EXCLUDE_FROM_WORLD =3D "1"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215667):
> https://lists.openembedded.org/g/openembedded-core/message/215667
> Mute This Topic: https://lists.openembedded.org/mt/112521333/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eaa8690633ebe3c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for providing this work Daniel.</div><div><=
br></div><div>Are you able to obtain the same result with the raw CVE datab=
ase? This patchset works for the Linux kernel only.</div><div><br></div><di=
v>Also, have you tested if it works with the world build for multiple kerne=
l images (i.e. different configs) from the same source tree?</div><div><br>=
</div><div>I would be rather going for a post-processing with a given confi=
g after generating the json files instead of modifying the processing.</div=
><div><br></div><div>My 0.02.<br></div><div><br></div><div>Kind regards,</d=
iv><div>Marta<br></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 29, 2025 at 4:39=E2=80=
=AFPM Daniel Turull via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.=
openembedded.org">ericsson.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Daniel Turull &l=
t;<a href=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">daniel.tu=
rull@ericsson.com</a>&gt;<br>
<br>
Add CVE data source for <a href=3D"http://kernel.org" rel=3D"noreferrer" ta=
rget=3D"_blank">kernel.org</a>.<br>
<br>
It includes more information than the one provided by NVD.<br>
Use similar mechanism and same variables as cve-check to define<br>
when to update.<br>
<br>
To use without internet access, change variable VULNS_URL to a local<br>
copy or mirror.<br>
<br>
CC: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_b=
lank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-vulns_git.bb</a> | 76 ++++++++++++++++++=
+++++<br>
=C2=A02 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/meta/<a href=3D"http://linux-vul=
ns_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-vulns_git.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 8065287c17..ec427fe6a4 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D &quot;Unassigned &lt;=
<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned=
@yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-dummy =3D &quot;Unassigned &lt;<a href=3D"=
mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproje=
ct.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-firmware =3D &quot;Otavio Salvador &lt;<a =
href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.s=
alvador@ossystems.com.br</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-libc-headers =3D &quot;Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-linux-vulns =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto =3D &quot;Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto-dev =3D &quot;Bruce Ashfield &lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto-rt =3D &quot;Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gm=
ail.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-vulns_git.bb</a> b/meta/recipes-c=
ore/meta/<a href=3D"http://linux-vulns_git.bb" rel=3D"noreferrer" target=3D=
"_blank">linux-vulns_git.bb</a><br>
new file mode 100644<br>
index 0000000000..fc48558eb8<br>
--- /dev/null<br>
+++ b/meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-vulns_git.bb</a><br>
@@ -0,0 +1,76 @@<br>
+SUMMARY =3D &quot;CVE information from <a href=3D"http://kernel.org" rel=
=3D"noreferrer" target=3D"_blank">kernel.org</a>&quot;<br>
+DESCRIPTION =3D &quot;Repo for tracking and maintaining the CVE identifier=
s reserved \<br>
+and assigned to the Linux kernel project.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/pub/scm/linux/securit=
y/vulns.git/about/" rel=3D"noreferrer" target=3D"_blank">https://git.kernel=
.org/pub/scm/linux/security/vulns.git/about/</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only &amp; cve-tou&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+inherit native<br>
+inherit nopackages<br>
+<br>
+VULNS_URL ?=3D &quot;<a href=3D"https://git.kernel.org/pub/scm/linux/secur=
ity/vulns" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/=
scm/linux/security/vulns</a>&quot;<br>
+CVE_CHECK_KERNEL_DB_DIR ??=3D &quot;${DL_DIR}/CVE_CHECK/vulns&quot;<br>
+<br>
+# Use same intervals as cve-update-db-native. By default: once a day (24*6=
0*60).<br>
+# Use 0 to force the update<br>
+# Use a negative value to skip the update<br>
+<br>
+CVE_DB_UPDATE_INTERVAL ??=3D &quot;86400&quot;<br>
+<br>
+python do_fetch(){<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import bb.utils<br>
+<br>
+=C2=A0 =C2=A0 bb.utils.export_proxies(d)<br>
+=C2=A0 =C2=A0 db_file =3D d.getVar(&quot;CVE_CHECK_KERNEL_DB_DIR&quot;)<br=
>
+=C2=A0 =C2=A0 repo_url =3D d.getVar(&quot;VULNS_URL&quot;)<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import time<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_interval =3D int(d.getVar(&quot;CVE_DB_=
UPDATE_INTERVAL&quot;))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if update_interval &lt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Kernel CVE databas=
e update skipped&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if time.time() - os.path.getmtime(db_file) &lt=
; update_interval:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2,&quot;Kernel CVE data=
base, recently updated, skipping&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(db_file))<br>
+=C2=A0 =C2=A0 # Configure cmd<br>
+=C2=A0 =C2=A0 if not os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D f&quot;git clone {repo_url} {db_file}&=
quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D f&quot;git -C {db_file} pull&quot;<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fetch2.runfetchcmd(cmd, d)<br>
+=C2=A0 =C2=A0 except bb.fetch2.FetchError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(f&quot;Kernel vulns repo url not acces=
sible. {repo_url}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Set VULNS_URL in local.conf to p=
oint to a local copy or mirror&quot;)<br>
+}<br>
+<br>
+do_clean() {<br>
+=C2=A0 =C2=A0 rm -rf ${CVE_CHECK_KERNEL_DB_DIR}<br>
+}<br>
+<br>
+deltask do_patch<br>
+deltask do_unpack<br>
+deltask do_configure<br>
+deltask do_compile<br>
+deltask do_install<br>
+deltask do_populate_sysroot<br>
+deltask do_runtime_spdx<br>
+deltask do_create_spdx<br>
+deltask do_populate_lic<br>
+deltask do_cve_check<br>
+<br>
+do_fetch[nostamp] =3D &quot;1&quot;<br>
+do_fetch[file-checksums] =3D &quot;&quot;<br>
+do_fetch[vardeps] =3D &quot;&quot;<br>
+<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215667): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215667" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215667</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112521333/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112521333/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000eaa8690633ebe3c1--

