Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 29C1965CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 12:37:19 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so2414882qcr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 04:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qnAv9ymK654qyQCK0rtGvmm9gydPd6gpDpsdNB+i24A=;
	b=B7sauJIPylLZaQpkpsrOWGMLXBRSSfnth3cfh+/Lews07U4hVKq4ObClG92R/CcygT
	Oh7xySG/ZqzW0ObIxtrqEehER/tDosLw17FcWYvw9U+U2pZWZ204+xOQIyMzDdzPB4n8
	Jofvc/pb/SaWfK8GDrDg4iGE7pjGiRio7dx6HFRZc24esoMCxYyS/xgGNePqKSaps5ap
	LGko/UTZf6qhTxt01ujw049vIsIUH2BEtc3NYoJBCcfRQZznKN5GWE2ffrTLsywBTptb
	5JraawYcX1hTF2BP94NygXrBOECUiq4Fe0ICK5WxdEXWK5gBp0m8bn6ffqMCFa+KNjfU
	ppRA==
X-Gm-Message-State: ALoCoQmj/8WJ78x/9+oLSUxAiH8Ds6Lw2I2FmgHd+a/wf9l93ucne29cSAsZdIDW2CsS+F80Snqv
X-Received: by 10.140.49.5 with SMTP id p5mr50258368qga.15.1423571840770; Tue,
	10 Feb 2015 04:37:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 04:37:00 -0800 (PST)
In-Reply-To: <9a96f78fbc6562ff7813121cab49a6ee8e1bd34a.1423559596.git.Qi.Chen@windriver.com>
References: <cover.1423559596.git.Qi.Chen@windriver.com>
	<9a96f78fbc6562ff7813121cab49a6ee8e1bd34a.1423559596.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 12:37:00 +0000
Message-ID: <CAJTo0Lagm4DoEGnSHuXLJ-e7Khz+ciH0c17rGtxJH+rq6xAGnw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix do_install failure in case of multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Feb 2015 12:37:31 -0000
Content-Type: multipart/alternative; boundary=001a11351944e1bd86050ebb2588

--001a11351944e1bd86050ebb2588
Content-Type: text/plain; charset=UTF-8

On 10 February 2015 at 09:14, Chen Qi <Qi.Chen@windriver.com> wrote:

> -       ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e
> "\$ad /run/systemd/netif/links 0755 root root -"
> ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
> +       ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e
> "\$ad /run/systemd/netif/links 0755 root root -"
> ${D}${prefix}${nonarch_base_libdir}/tmpfiles.d/systemd.conf', d)}
>

systemd.bb has a few variables that mirror the variabes used in the systemd
build system, rootprefix/rootlibdir/rootlibexecdir.  Would using one of
those match the variables used in the makefile to install these files to
avoid this sort of thing happening again?

Ross

--001a11351944e1bd86050ebb2588
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2015 at 09:14, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":24c" class=3D"a3=
s" style=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contai=
ns(&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;&#39;, &#39;sed -i -e =
&quot;\$ad /run/systemd/netif/links 0755 root root -&quot; ${D}${libdir}/tm=
pfiles.d/systemd.conf&#39;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;networkd&#39;, &#39;&#39;, &#39;sed -i -e &quot;\$ad /run/systemd/netif=
/links 0755 root root -&quot; ${D}${prefix}${nonarch_base_libdir}/tmpfiles.=
d/systemd.conf&#39;, d)}</div></blockquote></div><br><a href=3D"http://syst=
emd.bb">systemd.bb</a> has a few variables that mirror the variabes used in=
 the systemd build system, rootprefix/rootlibdir/rootlibexecdir.=C2=A0 Woul=
d using one of those match the variables used in the makefile to install th=
ese files to avoid this sort of thing happening again?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11351944e1bd86050ebb2588--
