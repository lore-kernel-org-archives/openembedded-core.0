Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5EE75895
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 02:36:42 +0000 (UTC)
Received: by qgg3 with SMTP id 3so1776381qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 19:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mx+PT0xyKxO7zXtHGSkKSBFq0jp+QZqIshbkA2Gt4tU=;
	b=s1rb5Pf3Zsp57XrtGQEP45W1Q5nVngzXbgbUlQA/bta7OYftkewXcLBEgynIE2Qlny
	8BbVVkzUOingor02AUKhrV3b4lecwx52iFObDJqga6U0Mdwbqhd3nlI0lE0fFzVdGWNQ
	LGr3NFQVA+oY4MKWN/Z8kUNj6qlFpp/e3Z5YgteHkgE2joo/btwh+JyeWaxb2IjtA54J
	xLuh3zd8x31qRbatcMerpD7g3jJWbsTNWC8f2mMruLtDYA3q7VgOOp9ebu5GackB2pW6
	PG7Y4HRc9lGQGD3Dg+Xwf5ugMHN9UTS7zG18NsOdorL0ijN6RnRtp3LCNFIUVBWyR1bF
	rvpQ==
X-Received: by 10.140.23.5 with SMTP id 5mr22871773qgo.106.1433817403848; Mon,
	08 Jun 2015 19:36:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Mon, 8 Jun 2015 19:36:23 -0700 (PDT)
In-Reply-To: <1433802492.28975.112.camel@linuxfoundation.org>
References: <1433802492.28975.112.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 8 Jun 2015 21:36:23 -0500
X-Google-Sender-Auth: W9L8AzsL2E-V958oUiYgSgpDBlg
Message-ID: <CABcZANmPrTTK1KCCmmauYDak9tK1mA3xaxt0Kkc31pphe85NgA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add eventhandler which cleans up stale recipe data
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
X-List-Received-Date: Tue, 09 Jun 2015 02:36:43 -0000
Content-Type: multipart/alternative; boundary=001a11c12a96077e8405180ca151

--001a11c12a96077e8405180ca151
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2015 at 5:28 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> +    for a in d.getVar("SSTATE_ARCHS", True).split():
> +        toremove =3D []
> +        i =3D d.expand("${SSTATE_MANIFESTS}/index-" + a)
> +        if not os.path.exists(i):
> +            continue
> +        with open(i, "r") as f:
> +            lines =3D f.readlines()
> +            for l in lines:
> +                (stamp, manifest, workdir) =3D l.split()
> +                if stamp not in stamps:
> +                    toremove.append(l)
> +                    if stamp not in seen:
> +                        bb.note("Stamp %s is not reachable, removing
> related manifests" % stamp)
> +                        seen.append(stamp)
> +        for r in toremove:
> +            (stamp, manifest, workdir) =3D r.split()
> +            for m in glob.glob(manifest + ".*"):
> +                sstate_clean_manifest(m, d)
> +            bb.utils.remove(stamp + "*")
> +            if removeworkdir:
> +                bb.utils.remove(workdir, recurse =3D True)
>

This looks like it=E2=80=99ll solve a lot of headaches for folks.

Should the removal of workdir bit be outside the =E2=80=98for r in toremove=
=E2=80=99 block?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c12a96077e8405180ca151
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 8, 2015 at 5:28 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":vk" class=3D"" style=3D"overflow:hidden">+=C2=A0 =C2=A0 for a in d.get=
Var(&quot;SSTATE_ARCHS&quot;, True).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 toremove =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D d.expand(&quot;${SSTATE_MANIFESTS}/index=
-&quot; + a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(i):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(i, &quot;r&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =3D f.readlines()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (stamp, manifest, =
workdir) =3D l.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if stamp not in st=
amps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tore=
move.append(l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s=
tamp not in seen:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.note(&quot;Stamp %s is not reachable, removing related manife=
sts&quot; % stamp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 seen.append(stamp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in toremove:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (stamp, manifest, workdir) =3D r=
.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in glob.glob(manifest + &q=
uot;.*&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_clean_manif=
est(m, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(stamp + &quot;*&=
quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if removeworkdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(wo=
rkdir, recurse =3D True)<br></div></blockquote><div><br></div><div>This loo=
ks like it=E2=80=99ll solve a lot of headaches for folks.</div><div>=C2=A0<=
/div></div>Should the removal of workdir bit be outside the =E2=80=98for r =
in toremove=E2=80=99 block?</div><div class=3D"gmail_extra">-- <br><div cla=
ss=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c12a96077e8405180ca151--
