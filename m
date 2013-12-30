Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id C79B060647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 10:10:19 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so5001675eaj.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5FML7XB8WbfKjMVkJ5/rBnBzyIvAxxZVrPOznhLDlSo=;
	b=m+U2AI+ADgae3PglF24sK7jYqA2c3cDhEHyuBsNTdPY0oixHoERoYLsZTllLtHfItj
	DmRb3AWQRrNkbPC4N6fepoD2mzFQHLV+ahsuWFpBT5HW7TaTmel9NMq2LrV1Po4U+cEs
	nojBkXG1KN4C2jdKMDuz1tYsAsK/UBPNzq9wwYqFfileHfHQCooEsjIT573HS2wXMDYr
	gOIiY8ke4y4KvNtzw1BrT9XO15ZFB0ID3pijz7xwPrBw2se/EmEFygAkKxsx8f3pq44J
	/URidKfzL8Qth1XHyaGzWCKyIDIjPwjNydfZvW2LqbaVHtnk0UK5n739g+8xoH+fbsx+
	haCQ==
X-Received: by 10.15.33.199 with SMTP id c47mr810890eev.109.1388398220426;
	Mon, 30 Dec 2013 02:10:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm107252920eef.9.2013.12.30.02.10.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 02:10:19 -0800 (PST)
Date: Mon, 30 Dec 2013 11:10:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: jackie.huang@windriver.com
Message-ID: <20131230101020.GA3719@jama>
References: <1388394556-28170-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1388394556-28170-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] test-dependencies.sh: avoid showing misleading error messages
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
X-List-Received-Date: Mon, 30 Dec 2013 10:10:20 -0000
X-Groupsio-MsgNum: 48520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2013 at 05:09:16PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> This avoids the following error messages when no dependency
> issue detected:
> find: `/build/r_cgp-dep_1225/p_x86_1225/bitbake_build/tmp/work/': No such=
 file or directory
> grep: test-dependencies/1388042399/3_min/failed/*: No such file or direct=
ory
> ls: cannot access test-dependencies/1388042399/3_min/failed/*: No such fi=
le or directory

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  scripts/test-dependencies.sh |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
> index e4cf4d3..ca7e687 100755
> --- a/scripts/test-dependencies.sh
> +++ b/scripts/test-dependencies.sh
> @@ -178,14 +178,14 @@ build_every_recipe() {
>    # This will be usefull to see which library is pulling new dependency
>    echo "Copying do_package logs to ${OUTPUTB}/do_package/"
>    mkdir ${OUTPUTB}/do_package
> -  find $tmpdir/work/ -name log.do_package | while read f; do
> +  find $tmpdir/work/ -name log.do_package 2>/dev/null| while read f; do
>      # pn is 3 levels back, but we don't know if there is just one log pe=
r pn (only one arch and version)
>      # dest=3D`echo $f | sed 's#^.*/\([^/]*\)/\([^/]*\)/\([^/]*\)/log.do_=
package#\1#g'`
>      dest=3D`echo $f | sed "s#$tmpdir/work/##g; s#/#_#g"`
>      cp $f ${OUTPUTB}/do_package/$dest
>    done
> -  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/*
> -  ls -1 ${OUTPUTB}/failed/* >> ${OUTPUT_BASE}/failed.recipes
> +  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/* 2>/dev/null
> +  ls -1 ${OUTPUTB}/failed/* >> ${OUTPUT_BASE}/failed.recipes 2>/dev/null
>  }
> =20
>  compare_deps() {
> --=20
> 1.7.9.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLBRowACgkQN1Ujt2V2gBwL7ACgoZom8dMiTy1HFw/dFdv/8iod
KyYAn2Z5Tm13R5Ca59Gmm1n8W74Tt12y
=ZvKJ
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
