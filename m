Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8536E6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 10:08:12 +0000 (UTC)
Received: by mail-bk0-f51.google.com with SMTP id w10so249087bkz.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 02:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=tEEsEi225iQsxtWBs6imDXxpGLuuvq3c1zVO3uDNhGE=;
	b=BzWWj87QB/4h4ReUS2avNSTRdNlyjXPrLSSl4meUAl7pYHAUTFx7xaCh9xytW7DgP9
	VJJ+AiZeAMLIaLlsJJt0guDBW4DlzxWNLqDO+iyDVB7UO2M9HSgRJn2Z2om4O0JDhq1t
	K0VHOvcUNOboR86oDTA8RNyLkQ5vUT9ry7ROnlWZHBdSWM0VmJi1xYdon7clWCSetew2
	okbFBnIHFR18WwZ2y8Ge2W2drjudGIuSKjf1vP1yKn+LJ388QljDlv1nKOxso8gwC2oo
	ghCsGcSu2JApz5ArIRPs3kMpnRooDYn+fqzMKj6wFd69MT16zcdPjEEJrORGBZ7B/VWA
	PLkA==
X-Gm-Message-State: ALoCoQlPyP7FLYKAyHagd3au95PnMhWXnI8RipxGPTkGHITD+Et8AxIeqIXR3ZmUiOel8+uxQ9u5
X-Received: by 10.205.40.137 with SMTP id tq9mr4986bkb.168.1390903692103;
	Tue, 28 Jan 2014 02:08:12 -0800 (PST)
Received: from ?IPv6:2001:610:612::7047:93bc:eb13:30d0?
	([2001:610:612:0:7047:93bc:eb13:30d0])
	by mx.google.com with ESMTPSA id ch4sm16450583bkc.8.2014.01.28.02.08.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 02:08:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1390833588.17424.254.camel@ted>
Date: Tue, 28 Jan 2014 11:08:08 +0100
Message-Id: <BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
References: <1390833588.17424.254.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Tue, 28 Jan 2014 10:08:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2014, om 15:39 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> Its rather sad that people don't appear to read local.conf and then =
complain
> about slow builds when they're just using a single thread. Most =
systems have
> more than one core now so we might as well use a more automatic =
default
> for these values. This may lead to better experiences for new users.
>=20
> [YOCTO #2528]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 71856b8..36d33e1 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -18,12 +18,18 @@
> # option determines how many tasks bitbake should run in parallel:
> #
> #BB_NUMBER_THREADS ?=3D "4"
> +#
> +# Default to setting automatically based on cpu count
> +BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"

I've noticed that after 4 threads IO becomes a big bottleneck when you =
have things like webkit, qt, asio etc in the buildqueue. Combine that =
with issues like every make -j thread taking >2GB ram with asio and =
webkit this default seems a bit high. I'd use 0.5*numcpu with a lower =
bound of 2.

regards,

Koen

> #=20
> # The second option controls how many processes make should run in =
parallel when
> # running compile tasks:
> #
> #PARALLEL_MAKE ?=3D "-j 4"
> #
> +# Default to setting automatically based on cpu count
> +PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
> +#
> # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j 4" would
> # be appropriate for example.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


