Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.33751.1610369203594619788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 04:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HUCgjSr5;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id z16so9602287vsp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rFNRq2iY077hOZEoeWV5fJMFEEWUONBtOvXqZe80MB4=;
        b=HUCgjSr5/CYSZxQQhATqpQ+R48rs/JLYB2pS0pvCi+33Gbs3KV9/yi4TjZN7H9LJvj
         MaT7rjmjwx7apmRt/RX5di+dP+oB9QTJW1eYTQ2YxwXZzK5QAw3O48Tlc0xGietbNlJf
         VF+hgUId+06OTp1djr8ePttzFntPv3hhLGySZqZlRM/0tr7RWZgLnkwAdaqJw6pmqFTs
         zBPEqjLiWm/eAd+F0UtzPkOECDQylqY19984AGPQ18bwgu1H1eTP9dWZWVtMGWKCl25d
         ZG+mYOtp88TGh3gwEPQRDZgdiEqsSfOpga+60FcOkIJbFj9y+AbM/QEkwFCdmfGtrctR
         eeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rFNRq2iY077hOZEoeWV5fJMFEEWUONBtOvXqZe80MB4=;
        b=qe23rAq6NtvBDDVXnWlGBzR2vcxNU57DnKmgAGJzqIjUHyo1aeGhnfdZYFhweTzqB+
         pNpnZYminqVYzc7+MvndfbE9qFk1IcYBgcjyJ7nKRrta6MCg7i0/kmZ3+NKkli+UGVeS
         9mQeQA50sr0YLULXpYqSmbA+QI5dRmm/0b/+wHnrWBP6VnAmnzhXbmZmWtsQCKCxyS4s
         gxpIKjNj1HPN0Wx/M/1Qo5XCWDf5j0CFyw+l5VnBcnUw1PQgxg/OXGrylj2pY5gRjKEM
         dbkqqUSSKClEMvji07p4TLioq1Quf14ZTe76S04E0Tz1Th109ZfnMNbnBGV7a9ZpRCzl
         Tdmw==
X-Gm-Message-State: AOAM532DoVPwYJ2K8re9sCGo1YNLplyaGyU8OT27inzqBubnncTTP6Xh
	NUnEmc4Z1uA36LsWxPphqliA2JtDNhxuI+NqZ1Y=
X-Google-Smtp-Source: ABdhPJySDEnLRSnm9r4ryA7m+91MoYBc1X6KNwS1JfkF1ugzm4gJQD6h0Hk4Q7QyrLPRuKrOL+4lxAdEKYPdLvrMgEI=
X-Received: by 2002:a67:c85:: with SMTP id 127mr7246607vsm.41.1610369202723;
 Mon, 11 Jan 2021 04:46:42 -0800 (PST)
MIME-Version: 1.0
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
In-Reply-To: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 11 Jan 2021 13:46:31 +0100
Message-ID: <CANNYZj994v93KxdpRZrpQ3p2sCTkhk6DJDRGhCPh4uw6fDMo3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
To: Michael Ho <Michael.Ho@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000491dea05b89f4c72"

--000000000000491dea05b89f4c72
Content-Type: text/plain; charset="UTF-8"

Does deb/rpm packaging already have this feature?

Alex

On Mon, 11 Jan 2021 at 13:45, Michael Ho <Michael.Ho@bmw.de> wrote:

> From: Michael Ho <Michael.Ho@bmw.de>
>
> Switch do_populate_sdk for the ipk package manager to use a separate target
> opkg config file and separate the lockfiles restricting do_rootfs and
> do_populate_sdk from running in parallel.
>
> This way if an image recipe includes a dependency to do_populate_sdk by
> default then it will run in parallel to do_rootfs saving time compared to
> the
> sequential execution.
>
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_ipk.bbclass       | 1 +
>  meta/classes/rootfs_ipk.bbclass        | 4 ++--
>  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index 79cb36c..d31dba0 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?= "ipk"
>
>  IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
>  IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
> +IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index f1e0219..245c256 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -14,8 +14,8 @@ do_rootfs[recrdeptask] += "do_package_write_ipk
> do_package_qa"
>  do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS
> PACKAGE_FEED_ARCHS"
>
>  do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
> -do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
> -do_populate_sdk_ext[lockfiles] += "${WORKDIR}/ipk.lock"
> +do_populate_sdk[lockfiles] += "${WORKDIR}/sdk-ipk.lock"
> +do_populate_sdk_ext[lockfiles] += "${WORKDIR}/sdk-ipk.lock"
>
>  OPKG_PREPROCESS_COMMANDS = ""
>
> diff --git a/meta/lib/oe/package_manager/ipk/sdk.py
> b/meta/lib/oe/package_manager/ipk/sdk.py
> index 37af034..e2ca415 100644
> --- a/meta/lib/oe/package_manager/ipk/sdk.py
> +++ b/meta/lib/oe/package_manager/ipk/sdk.py
> @@ -14,6 +14,12 @@ class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
>          super(PkgSdk, self).__init__(d, manifest_dir)
>
> +        # In sdk_list_installed_packages the call to opkg is hardcoded to
> +        # always use IPKGCONF_TARGET and there's no exposed API to change
> this
> +        # so simply override IPKGCONF_TARGET to use this separated config
> file.
> +        ipkgconf_sdk_target = d.getVar("IPKGCONF_SDK_TARGET")
> +        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
> +
>          self.target_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.host_conf = self.d.getVar("IPKGCONF_SDK")
>
> --
> 2.7.4
>
>
> 
>
>

--000000000000491dea05b89f4c72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Does deb/rpm packaging already have this feature?</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Jan 2021 at 13:45, Michael H=
o &lt;<a href=3D"mailto:Michael.Ho@bmw.de">Michael.Ho@bmw.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Michael H=
o &lt;<a href=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw=
.de</a>&gt;<br>
<br>
Switch do_populate_sdk for the ipk package manager to use a separate targe=
t<br>
opkg config file and separate the lockfiles restricting do_rootfs and<br>
do_populate_sdk from running in parallel.<br>
<br>
This way if an image recipe includes a dependency to do_populate_sdk by<br=
>
default then it will run in parallel to do_rootfs saving time compared to =
the<br>
sequential execution.<br>
<br>
Signed-off-by: Michael Ho &lt;<a href=3D"mailto:Michael.Ho@bmw.de" target=
=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta/classes/rootfs_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<=
br>
=C2=A0meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++<br>
=C2=A03 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.b=
bclass<br>
index 79cb36c..d31dba0 100644<br>
--- a/meta/classes/package_ipk.bbclass<br>
+++ b/meta/classes/package_ipk.bbclass<br>
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D &quot;ipk&quot;<br>
<br>
=C2=A0IPKGCONF_TARGET =3D &quot;${WORKDIR}/opkg.conf&quot;<br>
=C2=A0IPKGCONF_SDK =3D=C2=A0 &quot;${WORKDIR}/opkg-sdk.conf&quot;<br>
+IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-target.conf&quot;<br>
<br>
=C2=A0PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
<br>
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbc=
lass<br>
index f1e0219..245c256 100644<br>
--- a/meta/classes/rootfs_ipk.bbclass<br>
+++ b/meta/classes/rootfs_ipk.bbclass<br>
@@ -14,8 +14,8 @@ do_rootfs[recrdeptask] +=3D &quot;do_package_write_ipk d=
o_package_qa&quot;<br>
=C2=A0do_rootfs[vardeps] +=3D &quot;PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PA=
THS PACKAGE_FEED_ARCHS&quot;<br>
<br>
=C2=A0do_rootfs[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
+do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<br>
+do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<b=
r>
<br>
=C2=A0OPKG_PREPROCESS_COMMANDS =3D &quot;&quot;<br>
<br>
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_=
manager/ipk/sdk.py<br>
index 37af034..e2ca415 100644<br>
--- a/meta/lib/oe/package_manager/ipk/sdk.py<br>
+++ b/meta/lib/oe/package_manager/ipk/sdk.py<br>
@@ -14,6 +14,12 @@ class PkgSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(PkgSdk, self).__init__(d, manifest=
_dir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In sdk_list_installed_packages the call to =
opkg is hardcoded to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # always use IPKGCONF_TARGET and there&#39;s =
no exposed API to change this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so simply override IPKGCONF_TARGET to use t=
his separated config file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ipkgconf_sdk_target =3D d.getVar(&quot;IPKGCO=
NF_SDK_TARGET&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;IPKGCONF_TARGET&quot;, ipkgcon=
f_sdk_target)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target_conf =3D self.d.getVar(&quot=
;IPKGCONF_TARGET&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.host_conf =3D self.d.getVar(&quot;I=
PKGCONF_SDK&quot;)<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000491dea05b89f4c72--
