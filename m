Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EF58A60FD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 11:32:55 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so2311770wib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 03:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=/jVSVo2v+Kc/LRJRL6LUjkrVoqNYtF6ioSxVGXFCJCA=;
	b=BurYiE3xR6IgUkbnWeaA+AYEwt7UhjPkl+pbioYUa4TB/nfvC1OOqOaxLH/yU0ukss
	0gmC/LbRyxC8VQ8AGi7rji2T2nXTob5Owo9ijjBoopdkNe5iKLM8zI4+u2jZVFVXvO7C
	Q845bP/Wlaq8GaGmLOguJK/qg7qnfNCaV9+SIVLtlaEmFYFVDHXVTbe5CzN5Ex9ISrBs
	aRnJ2n+MmCvv/i1WrMl6Ppg2veTQkZM3oeajvbWHZSpCqAIoKalYH4ug4QHx1DtnyzrY
	nHw9BHYmftohn+QJukU1AMkOQcrLN3qKGuCwXby0Oo3GOlG5IRGt4dnV+TUQv1Xmk552
	lPWg==
X-Gm-Message-State: ALoCoQmImTUzNnaXyDGL6UfS76kXFAlTj+QWNx5WvbGxgtMPdhkRqoTvraMxbtMogkrmWJC49Tcv
X-Received: by 10.180.100.70 with SMTP id ew6mr25005315wib.9.1386847974763;
	Thu, 12 Dec 2013 03:32:54 -0800 (PST)
Received: from ?IPv6:2001:610:612::f407:e39a:bf65:c761?
	([2001:610:612:0:f407:e39a:bf65:c761])
	by mx.google.com with ESMTPSA id w20sm24004689wia.5.2013.12.12.03.32.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Dec 2013 03:32:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
Date: Thu, 12 Dec 2013 12:33:20 +0100
Message-Id: <A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
References: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1822)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Thu, 12 Dec 2013 11:32:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 12 dec. 2013, om 11:04 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> systemd will create the machine ID automatically if it isn't set,

That's not the whole story, it will generate a new one every boot

> so this unit doesn't serve any purpose.

That's correct, you need to generate it offline, since /etc/machine-id =
is a bind mount after booting :(


> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-core/systemd/systemd-compat-units.bb      |    4 ----
> .../systemd/systemd-compat-units/machineid.service     |   16 =
----------------
> 2 files changed, 20 deletions(-)
> delete mode 100644 =
meta/recipes-core/systemd/systemd-compat-units/machineid.service
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb =
b/meta/recipes-core/systemd/systemd-compat-units.bb
> index 6eb5ffd..e4d93d2 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -19,10 +19,6 @@ do_install() {
> 	install -m 0644 ${WORKDIR}/run-postinsts.service =
${D}${systemd_unitdir}/system
> 	ln -sf ../run-postinsts.service =
${D}${systemd_unitdir}/system/basic.target.wants/
> 	ln -sf ../run-postinsts.service =
${D}${systemd_unitdir}/system/sysinit.target.wants/
> -
> -	install -m 0644 ${WORKDIR}/machineid.service =
${D}${systemd_unitdir}/system
> -	ln -sf ../machineid.service =
${D}${systemd_unitdir}/system/sysinit.target.wants/
> -	ln -sf ../machineid.service =
${D}${systemd_unitdir}/system/basic.target.wants/
> }
>=20
> SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
> diff --git =
a/meta/recipes-core/systemd/systemd-compat-units/machineid.service =
b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> deleted file mode 100644
> index f586c6d..0000000
> --- a/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -[Unit]
> -Description=3DMachine ID first boot configure
> -DefaultDependencies=3Dno
> -ConditionPathExists=3D|!/etc/machine-id
> -After=3Dsystemd-remount-fs.service
> -Before=3Dsysinit.target
> -
> -[Service]
> -ExecStart=3D/bin/systemd-machine-id-setup
> -RemainAfterExit=3DNo
> -Type=3Doneshot
> -StandardOutput=3Dsyslog
> -
> -[Install]
> -WantedBy=3Dbasic.target
> -WantedBy=3Dsysinit.target
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


