Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qqz7I-0004MB-JN
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 05:06:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2011 20:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,347,1309762800"; d="scan'208";a="36898122"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2011 20:01:29 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 10 Aug 2011 11:01:04 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 10 Aug 2011 11:01:03 +0800
From: "Yu, Ke" <ke.yu@intel.com>
To: Leandro Dorileo <ldorileo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 11:01:01 +0800
Thread-Topic: [PATCH] scripts/combo-layer: a simple way to script the
	como-layer conf
Thread-Index: AcxWzRfBSyfaE2JjSruPMGan9GXoegAPCgaA
Message-ID: <33AB447FBD802F4E932063B962385B3512D96A8247@shsmsx501.ccr.corp.intel.com>
References: <1312919065-7554-1-git-send-email-ldorileo@gmail.com>
In-Reply-To: <1312919065-7554-1-git-send-email-ldorileo@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/combo-layer: a simple way to script the como-layer conf
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
X-List-Received-Date: Wed, 10 Aug 2011 03:06:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It looks good to me. You may also want to update the config file descriptio=
n in the "class Configuration". So that user will be aware of the usage.

Regards
Ke

> -----Original Message-----
> From: Leandro Dorileo [mailto:ldorileo@gmail.com]
> Sent: Wednesday, August 10, 2011 3:44 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Yu, Ke; Leandro Dorileo
> Subject: [PATCH] scripts/combo-layer: a simple way to script the como-lay=
er
> conf
>=20
> This small patch introduces a a very simple and basic way to script the c=
ombo-
> layer conf file. With that a combo can be shared with no need to change i=
ts
> config - associated to the use of environment variables for example.
>=20
> *Similar* to bitbake it considers every value starting with @ to be a pyt=
hon
> script. So local_repo could be easily configured as:
>=20
> [bitbake]
> local_repo =3D @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
>=20
> or any more sophisticated python syntax.
>=20
> Signed-off-by: Leandro Dorileo <ldorileo@gmail.com>
> ---
>  scripts/combo-layer |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/scripts/combo-layer b/scripts/combo-layer index d129175..3da=
df4a
> 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -91,6 +91,9 @@ last_revision =3D
>          for repo in self.parser.sections():
>              self.repos[repo] =3D {}
>              for (name, value) in self.parser.items(repo):
> +              if value.startswith("@"):
> +                self.repos[repo][name] =3D eval(value.strip("@"))
> +              else:
>                  self.repos[repo][name] =3D value
>=20
>      def update(self, repo, option, value):
> --
> 1.7.2.5



