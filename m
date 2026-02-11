Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F78E9E300
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:33:17 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17752.1770812514089655687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AJEB7Ve/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.48, mailfrom: jsmoeller@linuxfoundation.org)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d18aac01b6so974687a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 04:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770812513; cv=none;
        d=google.com; s=arc-20240605;
        b=JO/h00vej76vYcYGDoPTfckwgz2p31+4YoZW2SDZeYK8ycM3tzaPENwYAY8YoWC4lC
         d6sKC1hnMSROQexkfZVziznG4QS5GcbBXrUbwkJJu3moFWWV89dV4ZWKQMtYf4fqoFhP
         gjU+gCa7iTWt17rCnp4cQRLbIswngvUN1wx3qJrJTAHpnIw0Vkg6Dw12DFnbnNBK/UjR
         8RRGNKCee70ZGJeStmcBneUNWOyFmvIpSgyioo2wvVo5eQSQRDF3IyKXLz6ZBYipKE/h
         SJptifbNCZO0rQI36/rxQNFGd245T2t78R8JgviB2XsYOsWzTNAzkGteLyBAAUl2t6jJ
         u2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sX9BDJe729BaX04ZiknensPdxEeU6hU9zi/pNntGpYQ=;
        fh=EKbZkiCSVdE3pwnER27qa5vavC3AtraVAApvtSLug8c=;
        b=RIsUMnpUX4t11pYHWz5em1G7VI7asR4l5AXD4WSzWvYg4q04CR6SoB1MAaTWxWpK5/
         3RArwLIznuN44d/xJTztMMIS0eBmLDeH/qcYn9xR524dyFh2FOGOXvWSUJtEgXPLoHw+
         TQrK5ISp3mjhYqPpxLa8i2V0eVEWqUKzKMNIg+e6aP9N2ZDFcicKcDym7RIJyVjKtnmg
         yabF/+10vIgwGuRy4SRKMvPF2cNAGV3Qx5oI6oEDE0DSwlXrtouZ/QLwUf9uIvLHXwDb
         aEGrPVZjgcTBPFmlR5/v7qGa1zqvvWP5ZysiZRsoMk8fCLOMzI6xXrHXzw/8n+LZ0L4M
         HHBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770812513; x=1771417313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sX9BDJe729BaX04ZiknensPdxEeU6hU9zi/pNntGpYQ=;
        b=AJEB7Ve//0UarzmWGOG0YuOj5QfnsTYLwTNXFLPUSoLkxwbF9sGqaU0uK2QfehGHwN
         oIbJ92XZZF4hA8UPLqBsAJSlJzfQGMLbSPf7ikcMd01PVq4PkeESVraWkGJzMLBbb3wZ
         9P0sApLb9gaGq6jH4PQHHCzNzC98Yq2b8PJPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770812513; x=1771417313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX9BDJe729BaX04ZiknensPdxEeU6hU9zi/pNntGpYQ=;
        b=CTWxtkq3PWOmETVTyln7PCda6GMuRPsrj7704dQvVQIMzhikaOFvLgz98zDqeKYrsu
         kjDiLzli9/xtRA+KSITXUAgWoxgFbUIcfnHCzP9V/8ef6WlMr4yJ3tZSiTRVI2ZQ8com
         cHVAk2i8VUbTDL0mslffNA+4BuPI/Gm4CSvQcfoj7RHC568JKnvYsXojUAiwKjpstu/Y
         oQfOiEJKmxoV7b6p+EWVj1JhqHn7awrZz3tmeCyXcRYkQDOHuqeDivg8+BsGTXYvOprD
         tWQMdgGuya1rigl9n1D1Vvx3qXTANUOeF6IwEJLgmN5ELIAyrlvlbgOxVs4rphnrRnFJ
         Yo1g==
X-Forwarded-Encrypted: i=1; AJvYcCVYeJ1mSrWHlPtLuiA3CghPsI1Fyv3bg9FqrlTBjpLvmm+mXDeQMR/OIA+sBFkV7zmFM7W2bzmJDiaLyHI0JYqrqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQkthL4CqnSfVbfmzVPdatIEAWoOBBgHZW84xhFXpzcjl8MSrC
	MpUbO9it2VZ+ig7pVVleb0vFt/lenleXBufvHFDwBYfsRPRjM6f9M6w+oG13YtD101NHYIgRyI1
	H4/dKi0WQj2i03VXPAiMLOXjT8cqhakzij08AuRaRsrQp4MwjmqTA
X-Gm-Gg: AZuq6aIfkNGVN4wWbyRuzr0RfQbgCO8xa+0BJuMTkd+Hz0dQ9eUYHJk2cFCfA2UFJiK
	62YId5dDU0IceH3qKwgiZICG+va9yE6h7tvx1D5POpXxkuUgSNHnlOqLksDyYsa3qX7HPd1kcRQ
	xT4Vlmwv7L29SyO4uo23Mr0iCzh/3Zs8Ys1MPUiZhEKD68zO92TVkOo8vAxMW4Jn9D/5rrxd/sz
	MS1qB4ZgUNlaVBAY7Ona2IiM3PZF+ruuFLJNICNv2Wz8N9z3RjF5wnv7D8lMXgH5r6NKne8HvB9
	S66xw3EYOneIqvynftpK2Jedc3nlb6PGzZnJ1Eg=
X-Received: by 2002:a05:622a:5:b0:506:1c3c:9dfc with SMTP id
 d75a77b69052e-506838e6d14mr17202591cf.3.1770812157238; Wed, 11 Feb 2026
 04:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20260209080214.1738300-1-Qi.Chen@windriver.com> <DGC433PUWA1C.2BFX9T2ECNBRH@bootlin.com>
In-Reply-To: <DGC433PUWA1C.2BFX9T2ECNBRH@bootlin.com>
From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Date: Wed, 11 Feb 2026 13:15:44 +0100
X-Gm-Features: AZwV_Qg-2vBcb3F1TtGN-UM6jyx1H0CzE9SoXdeKRDdcGYVweUnoGC3p9Og2PGc
Message-ID: <CADja47M4gJNqpvD3sr+6C0gBNVj7jpF7hDchnPker2Joeo3rZQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: upgrade from 258.1 to 259.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000098b201064a8b55fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230985

--00000000000098b201064a8b55fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No blocker. We can/will adapt.


Best regards,
Jan-Simon

------
Jan-Simon M=C3=B6ller
AGL Release Manager
The Linux Foundation

Visit us at:
www.automotivegradelinux.org
lists.automotivelinux.org
www.linuxfoundation.org

Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> schrieb am Mi.,
11. Feb. 2026, 12:55:

> On Mon Feb 9, 2026 at 9:02 AM CET, Chen Qi via lists.openembedded.org
> wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > Changes with v259:
> > https://github.com/systemd/systemd/releases/tag/v259
> >
> > The 'iptc' PACKAGECONFIG is dropped, because:
> > """
> > systemd-networkd and systemd-nspawn no longer support creating NAT
> > rules via iptables/libiptc APIs; only nftables is now supported.
> > """
> >
> > Add 'empower' group for systemd. See commit below:
> >
> https://github.com/systemd/systemd/commit/3150c342705f4ac27f2b3299ac0961e=
7a70e4451
> >
> > This new version has big change on musl support.
> > """
> > Incomplete support for musl libc is now available by setting the
> > "libc" meson option to "musl".
> > ...
> > This support for musl is provided without a promise of continued
> > support in future releases.
> > """
> > See https://github.com/systemd/systemd/blob/main/NEWS#L562 for more
> details.
> >
> > Here are some examples:
> > - The musl specific '-D_LARGEFILE64_SOURCE' could be dropped because:
> >
> https://github.com/systemd/systemd/commit/fb33d20c072f2e7c3d500f00f8c04c9=
9271f34c1
> > - The 0017-Always-include-netinet-if_ether.h-first.patch and
> '-D__UAPI_DEF_ETHHDR=3D0
> >   could be dropped because:
> >
> https://github.com/systemd/systemd/commit/8324ef421373c84b5034bf47b84fe42=
d84b1032f
> > - The 0015-Avoid-sequence-point-error.patch could be dropped because:
> >
> https://github.com/systemd/systemd/commit/ebbc0ea7fd764c870bb8689111138b4=
f73854d42
> >
> > With the above musl support, here are the changes for this 259.1 recipe=
:
> > - Add '-Dlibc=3D${TCLIBC}' configure option.
> > - The musl warning, do_warn_musl, is removed.
> > - *ALL* musl specific patches are dropped.
> >   Any further fix for musl should be sent to systemd upstream.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
>
> Hi Jan-Simon,
>
> Please note this commit will break meta-agl, as iptc PACKAGECONFIG is
> being dropped:
>
> ERROR: systemd-1_259.1-r0 do_recipe_qa: QA Issue: systemd: invalid
> PACKAGECONFIG(s): iptc [invalid-packageconfig]
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2997
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000098b201064a8b55fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div>No blocker. We can/will adapt.</div><div dir=3D=
"auto"><br></div><div><br></div><div data-smartmail=3D"gmail_signature">Bes=
t regards,<br>Jan-Simon<br><br>------<br>Jan-Simon M=C3=B6ller<br>AGL Relea=
se Manager<br>The Linux Foundation<br><br>Visit us at:<br><a href=3D"http:/=
/www.automotivegradelinux.org" target=3D"_blank">www.automotivegradelinux.o=
rg</a><br><a href=3D"http://lists.automotivelinux.org" target=3D"_blank">li=
sts.automotivelinux.org</a><br><a href=3D"http://www.linuxfoundation.org" t=
arget=3D"_blank">www.linuxfoundation.org</a></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Mathieu D=
ubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathi=
eu.dubois-briand@bootlin.com</a>&gt; schrieb am Mi., 11. Feb. 2026, 12:55:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Feb 9, 20=
26 at 9:02 AM CET, Chen Qi via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Changes with v259:<br>
&gt; <a href=3D"https://github.com/systemd/systemd/releases/tag/v259" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/systemd/sys=
temd/releases/tag/v259</a><br>
&gt;<br>
&gt; The &#39;iptc&#39; PACKAGECONFIG is dropped, because:<br>
&gt; &quot;&quot;&quot;<br>
&gt; systemd-networkd and systemd-nspawn no longer support creating NAT<br>
&gt; rules via iptables/libiptc APIs; only nftables is now supported.<br>
&gt; &quot;&quot;&quot;<br>
&gt;<br>
&gt; Add &#39;empower&#39; group for systemd. See commit below:<br>
&gt; <a href=3D"https://github.com/systemd/systemd/commit/3150c342705f4ac27=
f2b3299ac0961e7a70e4451" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/systemd/systemd/commit/3150c342705f4ac27f2b3299ac0961e7a70=
e4451</a><br>
&gt;<br>
&gt; This new version has big change on musl support.<br>
&gt; &quot;&quot;&quot;<br>
&gt; Incomplete support for musl libc is now available by setting the<br>
&gt; &quot;libc&quot; meson option to &quot;musl&quot;.<br>
&gt; ...<br>
&gt; This support for musl is provided without a promise of continued<br>
&gt; support in future releases.<br>
&gt; &quot;&quot;&quot;<br>
&gt; See <a href=3D"https://github.com/systemd/systemd/blob/main/NEWS#L562"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/systemd=
/systemd/blob/main/NEWS#L562</a> for more details.<br>
&gt;<br>
&gt; Here are some examples:<br>
&gt; - The musl specific &#39;-D_LARGEFILE64_SOURCE&#39; could be dropped b=
ecause:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/systemd/systemd/commit/fb33d=
20c072f2e7c3d500f00f8c04c99271f34c1" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/fb33d20c072f2e7c3d500=
f00f8c04c99271f34c1</a><br>
&gt; - The 0017-Always-include-netinet-if_ether.h-first.patch and &#39;-D__=
UAPI_DEF_ETHHDR=3D0<br>
&gt;=C2=A0 =C2=A0could be dropped because:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/systemd/systemd/commit/8324e=
f421373c84b5034bf47b84fe42d84b1032f" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/8324ef421373c84b5034b=
f47b84fe42d84b1032f</a><br>
&gt; - The 0015-Avoid-sequence-point-error.patch could be dropped because:<=
br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/systemd/systemd/commit/ebbc0=
ea7fd764c870bb8689111138b4f73854d42" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/ebbc0ea7fd764c870bb86=
89111138b4f73854d42</a><br>
&gt;<br>
&gt; With the above musl support, here are the changes for this 259.1 recip=
e:<br>
&gt; - Add &#39;-Dlibc=3D${TCLIBC}&#39; configure option.<br>
&gt; - The musl warning, do_warn_musl, is removed.<br>
&gt; - *ALL* musl specific patches are dropped.<br>
&gt;=C2=A0 =C2=A0Any further fix for musl should be sent to systemd upstrea=
m.<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Jan-Simon,<br>
<br>
Please note this commit will break meta-agl, as iptc PACKAGECONFIG is<br>
being dropped:<br>
<br>
ERROR: systemd-1_259.1-r0 do_recipe_qa: QA Issue: systemd: invalid PACKAGEC=
ONFIG(s): iptc [invalid-packageconfig]<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/buil=
ds/2997" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/55/builds/2997</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div></div></div>

--00000000000098b201064a8b55fc--

