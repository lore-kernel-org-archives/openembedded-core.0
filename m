Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85D5B776F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 06:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 08BA5181C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id baYNTe0ksqai
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:16 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 635E2181C1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 47D2017DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:16 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 3D1F317B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:16 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 3B6533AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:23:16 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Wed, 7 Sep 2016 08:23:15 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%23]) with mapi id
	15.00.1156.000; Wed, 7 Sep 2016 08:23:15 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/9] recipetool: create: support git submodules
Thread-Index: AQHSCCYN8+6qcQvpCE6CIwwJEUt1HqBtj45Q
Date: Wed, 7 Sep 2016 06:23:15 +0000
Message-ID: <1e9475f4422447368ffc76229252acbc@XBOX04.axis.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
	<2374b44b9289aea7fc23c47a71af0526416ec3a8.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <2374b44b9289aea7fc23c47a71af0526416ec3a8.1473155977.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] recipetool: create: support git submodules
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
X-List-Received-Date: Wed, 07 Sep 2016 06:23:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Paul Eggleton
> Sent: den 6 september 2016 12:03
>=20
> Ensure we fetch submodules and set SRC_URI correctly when pointing to a
> git repository that contains submodules.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/lib/recipetool/create.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
> index a08352e..7cbd614 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -399,6 +399,11 @@ def create_recipe(args):
>                      if '<html' in f.read(100).lower():
>                          logger.error('Fetching "%s" returned a single HT=
ML page - check
> the URL is correct and functional' % fetchuri)
>                          sys.exit(1)
> +        if os.path.exists(os.path.join(srctree, '.gitmodules')) and
> srcuri.startswith('git://'):
> +            srcuri =3D 'gitsm://' + srcuri[6:]
> +            logger.info('Fetching submodules...')
> +            bb.process.run('git submodule init', cwd=3Dsrctree)
> +            bb.process.run('git submodule update', cwd=3Dsrctree)
>=20

This is not how the gitsm fetcher does it.

git submodule update --init --recursive

will actually fetch all submodules recursively.

--=20
Ola Nilsson

