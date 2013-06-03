Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8616661EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 21:51:43 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i10so1385765oag.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ElSjex51OSWeN9Cw9amKHT0SCs8wjh4cDmiKvorFyWY=;
	b=BNXJfTd+ZqRxWNCvmc2mZf5ttFi0JJketoHji+vUWebZDkzJY+Q2ZHLy4SeLaPbBQy
	7+BlsPi4JBczU15BMeZj+dgcW4wOKP7LVbZbT6NMsgNKg2MjbZ9kang0LKahVGkNC4xW
	/nQGuz4yUghqiZr9ezakKuLztGcoplgnjUKjkY41Vh2HRL1ULEIKpBmR6cQNetUSyrFr
	AJqK8y3W50X+NN+2TK4lEnwChItc4K3D9+/ct4+U+7BuoMGMtiKrcIrEu1lNNf8rgKnC
	KmiU5B36X/dDRQkawUE2f0F90kNaqe3iM9rCeHKL/eE7Scq3yTP1zU3deZQ7eJZN1/v5
	tQzg==
MIME-Version: 1.0
X-Received: by 10.60.94.70 with SMTP id da6mr10917200oeb.63.1370296303583;
	Mon, 03 Jun 2013 14:51:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 3 Jun 2013 14:51:43 -0700 (PDT)
In-Reply-To: <51AD0820.8030302@juszkiewicz.com.pl>
References: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
	<51AD0820.8030302@juszkiewicz.com.pl>
Date: Mon, 3 Jun 2013 18:51:43 -0300
X-Google-Sender-Auth: pBrA4Xgvq44DEdNl3jMiSbgG5JM
Message-ID: <CAP9ODKouzXgg7xu8yfOGHGgD-FZeEHgDjjgKB47b2v6R5QMhqA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
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
X-List-Received-Date: Mon, 03 Jun 2013 21:51:44 -0000
Content-Type: multipart/alternative; boundary=089e012287c069d60204de46f8dc

--089e012287c069d60204de46f8dc
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 3, 2013 at 6:18 PM, Marcin Juszkiewicz <
marcin@juszkiewicz.com.pl> wrote:

> W dniu 03.06.2013 18:40, Andy Voltz pisze:
> > Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> > ---
> >  meta/conf/machine/include/tune-cortexa5.inc |   36
> +++++++++++++++++++++++++++
>
> I think that it is time to create simple tune-cortex.inc which would be
> used by cores tunes to set all of it.
>
> So tune-cortexa5.inc would be:
>
> ----
> CORTEX_ID   = "a5"
> CORTEX_NAME = "A5"
>
> require conf/machine/include/arm/tune-cortex.inc
> ----
>
> and tune-cortex.inc will have things like:
>
> ----
> DEFAULTTUNE ?= "armv7a-neon"
>
> require conf/machine/include/arm/arch-armv7a.inc
>
> TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
> processor optimizations"
> TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
> "cortex${CORTEX_ID}", " -mtune=cortex-${CORTEX_ID}", "", d)}"
>
> # Little Endian base configs
> AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t
> cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
> ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a}
> cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at}
> cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =
> "${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =
> "${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}t2-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}-vfp-neon"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp
> cortex${CORTEX_ID}t2-vfp-neon"
>
> [..]
> -----
>
> What do you think?


I fully agree :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e012287c069d60204de46f8dc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 3, 2013 at 6:18 PM, Marcin Juszkiewicz <span dir=3D"ltr=
">&lt;<a href=3D"mailto:marcin@juszkiewicz.com.pl" target=3D"_blank">marcin=
@juszkiewicz.com.pl</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">W dniu 03.06.2013 18:40, Andy Voltz pisze:<b=
r>
<div class=3D"im">&gt; Signed-off-by: Andy Voltz &lt;<a href=3D"mailto:andy=
.voltz@timesys.com">andy.voltz@timesys.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/conf/machine/include/tune-cortexa5.inc | =A0 36 ++++++++++++++=
+++++++++++++<br>
<br>
</div>I think that it is time to create simple tune-cortex.inc which would =
be<br>
used by cores tunes to set all of it.<br>
<br>
So tune-cortexa5.inc would be:<br>
<br>
----<br>
CORTEX_ID =A0 =3D &quot;a5&quot;<br>
CORTEX_NAME =3D &quot;A5&quot;<br>
<br>
require conf/machine/include/arm/tune-cortex.inc<br>
----<br>
<br>
and tune-cortex.inc will have things like:<br>
<br>
----<br>
DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br>
<br>
require conf/machine/include/arm/arch-armv7a.inc<br>
<br>
TUNEVALID[cortex${CORTEX_ID}] =3D &quot;Enable Cortex-${CORTEX_NAME} specif=
ic<br>
processor optimizations&quot;<br>
<div class=3D"im">TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FE=
ATURES&quot;,<br>
</div>&quot;cortex${CORTEX_ID}&quot;, &quot; -mtune=3Dcortex-${CORTEX_ID}&q=
uot;, &quot;&quot;, d)}&quot;<br>
<br>
# Little Endian base configs<br>
AVAILTUNES +=3D &quot;cortex${CORTEX_ID} cortex${CORTEX_ID}t<br>
cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon&quot;<br>
ARMPKGARCH_tune-cortex${CORTEX_ID} =3D &quot;cortex${CORTEX_ID}&quot;<br>
ARMPKGARCH_tune-cortex${CORTEX_ID}t =3D &quot;cortex${CORTEX_ID}&quot;<br>
ARMPKGARCH_tune-cortex${CORTEX_ID}-neon =3D &quot;cortex${CORTEX_ID}&quot;<=
br>
ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon =3D &quot;cortex${CORTEX_ID}&quot;=
<br>
TUNE_FEATURES_tune-cortex${CORTEX_ID} =3D &quot;${TUNE_FEATURES_tune-armv7a=
}<br>
cortex${CORTEX_ID}&quot;<br>
TUNE_FEATURES_tune-cortex${CORTEX_ID}t =3D &quot;${TUNE_FEATURES_tune-armv7=
at}<br>
cortex${CORTEX_ID}&quot;<br>
TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =3D<br>
&quot;${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}&quot;<br>
TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =3D<br>
&quot;${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}&quot;<br>
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =3D<br>
&quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp&quot;<br>
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =3D<br>
&quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp<br>
cortex${CORTEX_ID}t2-vfp&quot;<br>
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =3D<br>
&quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp<br>
cortex${CORTEX_ID}-vfp-neon&quot;<br>
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =3D<br>
&quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp<br>
cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp<br>
cortex${CORTEX_ID}t2-vfp-neon&quot;<br>
<br>
[..]<br>
-----<br>
<br>
What do you think?</blockquote><div><br></div><div style>I fully agree :-)<=
/div><div>=A0</div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystem=
s.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0=
<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://proje=
tos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e012287c069d60204de46f8dc--
