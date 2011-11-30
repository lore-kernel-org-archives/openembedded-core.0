Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVsne-0001kZ-Bt
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:38:46 +0100
Received: by lagj5 with SMTP id j5so473086lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=yxbZgsU/Gw/r/6xU/mCEE4QqHBNVQsPPjQ7U6zCJ+T8=;
	b=xSP10VOnDdc5Xln6LoUdpo3/qsFqvbkg7Nz8WKv58oGnd7G0Xa/T5CCGzktbMGMO4z
	EY8IUdNWvifEALSWNOhxekBCiFMliQGSybM1880p7VIE3bndFrqkJpy6KjRnfAG/rRcg
	3W5f7VnJjERR0U0vPLtnVn9KZO2EkfLyHPDIA=
Received: by 10.152.104.20 with SMTP id ga20mr2868373lab.13.1322692322621;
	Wed, 30 Nov 2011 14:32:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:31:30 -0800 (PST)
In-Reply-To: <6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
	<e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:31:30 -0800
Message-ID: <CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 2/4] autotools.bbclass: Report the missing configure path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 22:38:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 1:49 PM, Darren Hart <darren@dvhart.com> wrote:
> From: Darren Hart <dvhart@linux.intel.com>
>
> If the configure script isn't found, report the explicit path tried.
> This can help debug subtle errors where the ${S} sourcedir may not
> be exactly what is expected.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> =C2=A0meta/classes/autotools.bbclass | =C2=A0 =C2=A09 +++++----
> =C2=A01 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbcl=
ass
> index 37e7d4b..7536bac 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -70,11 +70,12 @@ CONFIGUREOPT_DEPTRACK =3D "--disable-dependency-track=
ing"
>
>
> =C2=A0oe_runconf () {
> - =C2=A0 =C2=A0 =C2=A0 if [ -x ${S}/configure ] ; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote "Running ${S}/c=
onfigure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/configure ${CONFI=
GUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
> + =C2=A0 =C2=A0 =C2=A0 cfgscript=3D"${S}/configure"
> + =C2=A0 =C2=A0 =C2=A0 if [ -x "$cfgscript" ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote "Running $cfgsc=
ript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $cfgscript ${CONFIGURE=
OPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal "no configure =
script found"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal "no configure =
script found at $cfgscript"

why not just do one line change something like

bbfatal "configure script ${S}/configure not found"

> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0}
>
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


