Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B12C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 17:40:28 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.web10.27088.1748540418535247660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 10:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=iBdtN7Bx;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=nPZ2zjPJ;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.154, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B162925400C8
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:40:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 29 May 2025 13:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748540417; x=1748626817; bh=mo1w8cnNz8
	8dRzb2GSZQVXnPWpRXPGK0vcrfjAOhkzQ=; b=iBdtN7Bx3j/H8h6gSy6nnyKKml
	gM3L9GYB2B0qcdfz/7V225LSahjpoKLr3TnViIcL62rg8WkRPJXvVkKQKqcQXVPH
	uH4hXWo8Ji2hbQq+LILPexK2l/ja2ZgCsH6JgDxJ5pRekj5m/Mjo/vHMRXJWq4nC
	3mlaFHkKSCopCuYPgaCVHhK2jyEhqF0cFhutBtEdKnHhnemPGgwMgKTD6mb9g4zt
	Dfp+aOvhsrs1DhXWldamnLAv74+tI60wrzd2Wkpn8+gA0CgOAgPVLGyeOS3a1O8l
	LULgq1rOyz8huTdyaF6m6bAjo9SwCMVEKTsqYXdyDAvd442VyXDxIKYM72cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748540417; x=1748626817; bh=mo1w8cnNz88dRzb2GSZQVXnPWpRXPGK0vcr
	fjAOhkzQ=; b=nPZ2zjPJWDL2rene5B9G83FqMwR6Sflu2qnG5x/GNZ4Wc+bmP22
	nQB/AAQAtZ7c0rlPz79f1PCMmBgHISkZ9vdIGXYpf5MmVqcEo4H87uA/Zbz09PLL
	8JwPTSxoB93ljzF0sPOMJti4EdtA4OLJuKA6UNJCNq13eCbgtgO47ug0bC/+7mJe
	298bmZAOlehcQ1HDToBRF/nKUoX9P1ja3M/q94rYQZbFUIlQxT2mdU67aG0e/dMb
	nIhP/4wnUxDgqApKuNFhRJRVnzD2IWfjwac3WimGnav/zYEOnCOAwX1xRYc0fMzu
	YmL5S4f2E3lm6n/GKleNepIXBCpNxZJSddA==
X-ME-Sender: <xms:AZw4aIIWfjUuJBgjm2sHVX4j0MhOSXFUicHrc0cxzsTklAReyLkRng>
    <xme:AZw4aIJ9ttIoN-1FZFJwYGFx6SorybW1IocWqD88vzVSQJotkjtSMZ-x8KXZOWacZ
    jZ43jHC-9P91SDQRL0>
X-ME-Received: <xmr:AZw4aIuUrhP18A58ig7JPLcJZpwD2E_hVYJ6_LUIgTIX_p8vLO7xaiSGCZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieejieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtder
    redttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitg
    hksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduheevfeetteekuefhgfeg
    gfeliedvfffhheehiedvgeffffeijeekiedtkeehueenucffohhmrghinhepkhgvrhhnvg
    hlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
    dpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhp
    vghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurd
    horhhg
X-ME-Proxy: <xmx:AZw4aFaN0fn9wXgSOXzPgoyquHmRgrmTVoLPUynO8OaBuA7dlcRgnw>
    <xmx:AZw4aPY1wL49aGI_2VaJMOqEao9pd8WXWyRNhikgNbGdGh3yXXa6hg>
    <xmx:AZw4aBCaAHx9R2S15aMMVzgL3dicdajzQ1r2npbVSrEcyqp1FCkORw>
    <xmx:AZw4aFaKCbC-_qVlp1by7w-vDXP2ESbOvliLb7logLo-0XRqK8UPoA>
    <xmx:AZw4aLolc6A3ohMBSVXrvhZeRh555I1vMh0KvvEXTti_udeiJ2hF_xaJ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Thu,
 29 May 2025 13:40:16 -0400 (EDT)
Date: Thu, 29 May 2025 13:40:16 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: generate preset for templates
Message-ID: <aDicABG27u1_5p-q@heinlein>
References: <20250528213306.2581115-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xEm+zEdStr+QdQEI"
Content-Disposition: inline
In-Reply-To: <20250528213306.2581115-1-patrick@stwcx.xyz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 17:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217429


--xEm+zEdStr+QdQEI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 05:33:06PM -0400, Patrick Williams wrote:
> There was a regression introduced by the change to use
> systemd-systemctl-native rather than a python fake implementation,
> which caused template units to not be properly enabled when set in
> the SYSTEMD_SERVICE variable.  Through investigation, it seems that
> the best way to re-enable template instances is to handle them
> explicitly in the systemd.bbclass and enable them with `preset`, like
> most units are handled[1,2].
>=20
> Per the systemd.preset manpage, the format for template units is
> different than for regular units[3].  We need to coalesce all the
> template instances onto a single line and emit them as an additional
> space-deliminated argument.
>=20
> Ran this against openbmc's phosphor-ipmi-net recipe and generated
> the following preset file:
> ```
> $ cat packages-split/phosphor-ipmi-net/usr/lib/systemd/system-preset/98-p=
hosphor-ipmi-net.preset
> enable phosphor-ipmi-net@.service eth0
> enable phosphor-ipmi-net@.socket eth0
> ```
>=20
> [1]: https://lore.kernel.org/openembedded-core/Z2ch.1747051947055246176.o=
ktf@lists.openembedded.org/
> [2]: https://lore.kernel.org/openembedded-core/aDdoTVtCmElpURYD@heinlein/
> [3]: https://www.freedesktop.org/software/systemd/man/latest/systemd.pres=
et.html
>=20
> Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/classes-recipe/systemd.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/sy=
stemd.bbclass
> index e1fe4ed072..3cc53c44d9 100644
> --- a/meta/classes-recipe/systemd.bbclass
> +++ b/meta/classes-recipe/systemd.bbclass
> @@ -224,6 +224,8 @@ python systemd_populate_packages() {
>                          service, pkg_systemd, "Also looked for service u=
nit '{0}'.".format(base) if base is not None else ""))
> =20
>      def systemd_create_presets(pkg, action, user):
> +        import re
> +
>          # Check there is at least one service of given type (system/user=
), don't
>          # create empty files.
>          needs_preset =3D False
> @@ -239,10 +241,17 @@ python systemd_populate_packages() {
>          presetf =3D oe.path.join(d.getVar("PKGD"), d.getVar("systemd_uni=
tdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
>          bb.utils.mkdirhier(os.path.dirname(presetf))
>          with open(presetf, 'a') as fd:
> +            template_services =3D {}
>              for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
>                  if not systemd_service_exists(service, user, d):
>                      continue
> -                fd.write("%s %s\n" % (action,service))
> +                if '@' in service:

I somehow sent out an older version of this patch.  Will send an update.

If a service is "@.service", this is just a template file, and shouldn't
be added to the instance registration.

> +                    (subservice, instance, service_type) =3D re.split('[=
@.]', service)
> +                    template_services.setdefault(subservice + '@.' + ser=
vice_type, []).append(instance)
> +                else:
> +                    fd.write("%s %s\n" % (action,service))
> +            for template, instances in template_services.items():
> +                fd.write("%s %s %s\n" % (action, template, ' '.join(inst=
ances)))
>          d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("syste=
md_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
> =20
>      # Run all modifications once when creating package
> --=20
> 2.49.0
>=20

--=20
Patrick Williams

--xEm+zEdStr+QdQEI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmg4m/0ACgkQqwNHzC0A
wRmCPw//U90xHxA0ItdLDgreidofujLL+u3fv/H1AA7Fb0HL+kevHDKK4eNJEN35
aQUd6nH2NAvxrH/mjKfj7E/p9plu4J4n0LHJUIdMDYaved/+xTNqPDZZudXxSXVv
4tpP9FxKOS37T7awYMKaGCDWxlz2oDTDlQz2mF8nsC0IA+EW8moRNpADtFpi3BTR
rNclD9+V9LHvD477AVzHhxCa+0LEl5DPSIzDqLVBcfo/Pn29H4lVWayq+poi9y47
9gR1tEK1N6LUy78usXke0EHchkuXQgvxjk2D9/hUciFdwVOA2g/lme9rItvm/Zj6
00+mzrfw+1DC8UgjAkFi9p7KOLabw3pdiWSOZjssjfLdWr0i2VYxZDX+nT6d48Qo
CV9dbJw4jzzcXs0R/gwOHjz092to3KdD19u7ye8/YcV+R/WrMxs5LZrswz52UcXZ
lY3FgUmYhOFqAaDcrjpSYex6lXXQCNSdnL4B9rGqBqYTcc7eUG6S2hp1MJscylqN
1cD6tGd6TDtnqT3BOkGavpSbPLA3hl43kfRDUIGs1BZBKQn3hWRU+tS0xBMs2sDw
rmRssKv4PiXQpKPoEods/z7yejc3Kmmd+DgBtvnPZ5c1QgliCcCXmQ1HOg+TdXfO
klwSGJ76vK0o+s/4anvC6GIPntOwbiQGNwHei3KWXqDwScif5nU=
=LZfl
-----END PGP SIGNATURE-----

--xEm+zEdStr+QdQEI--

