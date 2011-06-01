Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRhhK-0007Ad-5T
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 11:26:42 +0200
Received: by wwb17 with SMTP id 17so4958555wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 02:23:31 -0700 (PDT)
Received: by 10.217.6.79 with SMTP id x57mr4714613wes.10.1306920211893;
	Wed, 01 Jun 2011 02:23:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm599530wbh.59.2011.06.01.02.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 02:23:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 1 Jun 2011 11:23:30 +0200
Message-Id: <F501F79C-B3A9-4C49-9253-3617F466FC0A@dominion.thruhere.net>
References: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] shadow: remove selinux entry from pam.d/login
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
X-List-Received-Date: Wed, 01 Jun 2011 09:26:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This one is orthogonal to the other shadow patches by the looks of it.

Op 31 mei 2011, om 20:33 heeft Koen Kooi het volgende geschreven:

> SElinux has been disabled in the recipe, leading to messages like =
this:
>=20
> [  167.643218] login[312]: PAM unable to =
dlopen(/lib/security/pam_selinux.so): /lib/security/pam_selinux.so: =
cannot open shared object file: No such file or directory
> [  167.670837] login[312]: PAM adding faulty module: =
/lib/security/pam_selinux.so
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-extended/shadow/files/pam.d/login |    7 -------
> meta/recipes-extended/shadow/shadow.inc        |    2 ++
> 2 files changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-extended/shadow/files/pam.d/login =
b/meta/recipes-extended/shadow/files/pam.d/login
> index e41eb04..e4dacc2 100644
> --- a/meta/recipes-extended/shadow/files/pam.d/login
> +++ b/meta/recipes-extended/shadow/files/pam.d/login
> @@ -26,13 +26,6 @@ auth       [success=3Dok ignore=3Dignore =
user_unknown=3Dignore default=3Ddie]  pam_secur
> # (Replaces the `NOLOGINS_FILE' option from login.defs)
> auth       requisite  pam_nologin.so
>=20
> -# SELinux needs to be the first session rule. This ensures that any=20=

> -# lingering context has been cleared. Without out this it is possible=20=

> -# that a module could execute code in the wrong domain.
> -# When the module is present, "required" would be sufficient (When =
SELinux
> -# is disabled, this returns success.)
> -session [success=3Dok ignore=3Dignore module_unknown=3Dignore =
default=3Dbad] pam_selinux.so close
> -
> # This module parses environment configuration file(s)
> # and also allows you to use an extended config
> # file /etc/security/pam_env.conf.
> diff --git a/meta/recipes-extended/shadow/shadow.inc =
b/meta/recipes-extended/shadow/shadow.inc
> index 42f92a7..35bd6a8 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -6,6 +6,8 @@ LICENSE =3D "BSD | Artistic"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D08c553a87d4e51bbed50b20e0adcaede \
>                     =
file://src/passwd.c;firstline=3D8;endline=3D30;md5=3D2899a045e90511d0e043b=
85a7db7e2fe"
>=20
> +PR =3D "r1"
> +
> PAM_PLUGINS =3D "  libpam-runtime \
>                  pam-plugin-faildelay \
>                  pam-plugin-securetty \
> --=20
> 1.6.6.1
>=20



