Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQEKr-0003gZ-8v
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 09:53:25 +0200
Received: by wwb17 with SMTP id 17so2106758wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 00:50:12 -0700 (PDT)
Received: by 10.216.143.96 with SMTP id k74mr475659wej.100.1306569012246;
	Sat, 28 May 2011 00:50:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f60sm1365703wef.37.2011.05.28.00.50.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 00:50:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7c83be4418db5dc23614761dd34a2887c44828b4.1306550616.git.raj.khem@gmail.com>
Date: Sat, 28 May 2011 09:50:09 +0200
Message-Id: <F46CB9CD-BA76-4A6E-AFD7-2A2833C5743F@dominion.thruhere.net>
References: <59c5261bea00cac9498a176d40e1aaa05da15a55.1306550616.git.raj.khem@gmail.com>
	<7c83be4418db5dc23614761dd34a2887c44828b4.1306550616.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] package.bbclass, prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
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
X-List-Received-Date: Sat, 28 May 2011 07:53:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 mei 2011, om 04:44 heeft Khem Raj het volgende geschreven:

> Value of USE_PR_SERV is either "1" or "0" looking at
> settings in bitbake.conf
> USE_PR_SERV =3D "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) =
or (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
> So we compare the strings
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Fixes the problem for me:

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/classes/package.bbclass |    2 +-
> meta/classes/prserv.bbclass  |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
> index a1b9482..1e6a872 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -330,7 +330,7 @@ def runtime_mapping_rename (varname, d):
> #
>=20
> python package_get_auto_pr() {
> -	if d.getVar('USE_PR_SERV', True):
> +	if d.getVar('USE_PR_SERV', True) !=3D "0":
> 		auto_pr=3Dprserv_get_pr_auto(d)
> 		if auto_pr is None:
> 			bb.fatal("Can NOT get auto PR revision from =
remote PR service")
> diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
> index de46ff6..18b8589 100644
> --- a/meta/classes/prserv.bbclass
> +++ b/meta/classes/prserv.bbclass
> @@ -12,7 +12,7 @@ def prserv_make_conn(d):
>     return conn
>=20
> def prserv_get_pr_auto(d):
> -    if not d.getVar('USE_PR_SERV', True):
> +    if d.getVar('USE_PR_SERV', True) !=3D "0":
>         bb.warn("Not using network based PR service")
>         return None
>=20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



