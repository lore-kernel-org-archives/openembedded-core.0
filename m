Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TBK4E-0001OI-RT
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 08:35:26 +0200
Received: by wibhq4 with SMTP id hq4so2700638wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 23:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ZAyQumyNkcdngPNzjoxh9gEBTcbWV0oXDDnf20iINtQ=;
	b=dp7qUq3ZGwSEkhBni8NhYeivGCJD/+KDpRwkckDlglkfwDmn4s7dniHbpaecZQAK04
	4XaxS9wm/LmpBbAvXrK/1fOmXUNUB3bYKnFv/ggvoG2y0wlp0MFEQLJfDLB/HflW88Xq
	T1LJhNTxR7F74qzGDSVXP3pdXpq2u9SIK0qXfc0Elc/FamtJx9rNCKGQK+jQfsxwPBmE
	9D1vx3FPELEYTqwyfOGRtn/5UgBChUFbbkgKIAU6Plbhzu5GqaofoIQxHn214scRaKQS
	gEpYFXZgZB7MnnycRI281iP16bPxnBejtzKWwO3ZKS7jnIn+WxT5N6T2OwhZcQWEvgqj
	tzBg==
Received: by 10.180.98.138 with SMTP id ei10mr22698760wib.1.1347344576610;
	Mon, 10 Sep 2012 23:22:56 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm1049149wib.6.2012.09.10.23.22.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 23:22:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347304161-19864-1-git-send-email-msm@freescale.com>
Date: Tue, 11 Sep 2012 08:22:55 +0200
Message-Id: <C79EC08E-0DE4-4ECF-B0A9-53FBB7E57248@dominion.thruhere.net>
References: <1347304161-19864-1-git-send-email-msm@freescale.com>
To: Matthew McClintock <msm@freescale.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlBveoa0bxbCEUqWLvkpza+giZ7KRjRWdPCHGYMiuPy9Fs7otj5lBhXLLWiog29GRvzaouk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 06:35:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 sep. 2012, om 21:09 heeft Matthew McClintock <msm@freescale.com> =
het volgende geschreven:

> Right now, we delay running the serial console checks to we boot up. =
This causes
> issues for read only file systems. So, if have not configured any =
serial ports to
> check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This =
fixes any
> issues with read only file systems and ipk packaging.
>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb =
b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 1089edb..5394f18 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -65,7 +65,11 @@ if [ "x$D" =3D=3D "x" ]; then
> 	done
> 	kill -HUP 1
> else
> -	exit 1
> +	if [ "${SERIAL_CONSOLES_CHECK}" =3D "" ]; then
> +		exit 0
> +	else
> +		exit 1
> +	fi
> fi
> }


MIssing PR bump=


