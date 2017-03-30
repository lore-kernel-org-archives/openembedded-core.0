Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2761477D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490889726; x=1522425726;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=zEOuB4BpMG3n5mRTrlEUdN+Ji2Gt0MmubbDZYY+iDsw=;
	b=qQ/KFuqWlaLH4j5BKGOjikEhrPWSwedzkyuemhtxiz6k8ZhgivTwzn60
	1w16yyEIcMm/YlovGnmItHz1nlGNiQ==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 09:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; 
	d="asc'?scan'208";a="82365977"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.126])
	([10.219.128.126])
	by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2017 09:02:01 -0700
To: Patrick Ohly <patrick.ohly@gmx.de>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
	<1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
	<1490853745.6396.439.camel@gmx.de> <58DD2C5B.8010704@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58DD2CE6.6020704@linux.intel.com>
Date: Thu, 30 Mar 2017 10:05:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <58DD2C5B.8010704@linux.intel.com>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] scripts: Add yocto-compat-layer-wrapper
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
X-List-Received-Date: Thu, 30 Mar 2017 16:02:05 -0000
X-Groupsio-MsgNum: 95560
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="qxdbIi5FkDJ48UmCresIUTMeSIUAokStJ"

--qxdbIi5FkDJ48UmCresIUTMeSIUAokStJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sending to oe-core ml, i used wrong oe-core mail address, :/,

	Anibal



On 03/30/2017 10:03 AM, An=C3=ADbal Lim=C3=B3n wrote:
>=20
>=20
> On 03/30/2017 12:02 AM, Patrick Ohly wrote:
>> On Wed, 2017-03-29 at 15:44 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>> ...
>>> +show_help() {
>>> +	printf "Usage: %s [-o output_log] [-h] LAYER_DIR ...\n" $0
>>> +}
>>> +
>> ...
>>> +env_dir=3D$(mktemp -d -t yocto-compat-XXXX)
>>> +echo "The environment will be setup at $env_dir"
>>> +echo ""
>>
>> The directory gets created, but not removed.
>=20
> I didn't remove the temp directory because may be the user wants to
> access the dir after the check.
>=20
>>
>>> +echo "Cloning oe-core..."
>>> +git clone $oe_core_repo $env_dir
>>> +if [ $? -ne 0 ]; then
>>> +	echo "Failed to clone oe-core repository"
>>> +	exit 1
>>> +fi
>>> +
>>> +echo "Cloning bitbake..."
>>> +git clone $bitbake_repo $env_dir/bitbake
>>> +if [ $? -ne 0 ]; then
>>> +	echo "Failed to clone bitbake repository"
>>> +	exit 1
>>> +fi
>>
>> Cloning bitbake and OE-core each time the script runs will be fairly
>> slow. There's also a chicken-and-egg problem: if you don't have bitbak=
e,
>> where's the script?
>>
>> I'd prefer to use an existing checkout of both, just as for the layers=

>> which are to be tested.
>=20
> I choose to clone the oe-core/bitbake to ensure there are a clean
> environment, without any previous layer added. I could add an option to=

> specify a oe-core/bitbake dir if isn't set then clone.
>=20
>>
>>> +cd $env_dir
>>> +source oe-init-build-env
>>> +if [[ -z $output_log ]]; then
>>> +	echo "Running yocto-compat-layer.py $layer_dirs"
>>> +	yocto-compat-layer.py $layer_dirs
>>> +else
>>> +	echo "Running yocto-compat-layer.py -o $output_log $layer_dirs"
>>> +	yocto-compat-layer.py -o $output_log $layer_dirs
>>> +fi
>>
>> It would be useful to accept and pass through all yocto-compat-layer.p=
y
>> parameters, ideally without having to repeat a full list of them in th=
e
>> argument parsing of the wrapper.
>=20
> Agree,
>=20
> 	Anibal
>>
>=20


--qxdbIi5FkDJ48UmCresIUTMeSIUAokStJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJY3SzoAAoJEGJqcE9h3glgFNgP/2/3ZALwYgyPJMuUL7eluCi1
bqIkwr20g3EGn63WR7dicUZjyM28emd4GILWhLmYprbUR8iIMl0iNnFKfrBb2Czh
Q50x1VEp+hFHh2gi/aVttSsExGYILcEs/rjkmAdGp/1YgK3+W/hV9sKwK/AO8X41
+pc+ztL+TQnDNT5mX7GZ4/guTYP+cFibb7fzQLljzzti/idz9DE0Z+EoZZv00UnJ
RcWWnEBOKL8Bf73XYlFr/EMQVyXvZS8sHDuutRI9xqrtOiB5mlByx0Q4rPoP7TZh
QhrPXKiKwR31TXCxm2UJYo1sp+3GCfcf8Z+4twYldvQWRKOqiwVI8hhLNKAK4WKA
IR8mIAlsnEshwQ4FM38iG8KFHMJsrfaBCcP5n7KZ1O0H/k5jzLf1kzOezcaaJ/Ar
efoM4YB805NJ/+EuE+KCiCwYxj/19dXH/ipdkWfamwmQIbTJLUkvrsGa+L6ebSuH
ym4hipROvJ+7vTBynuHKoIXV0yokjCzEIfFoUqXbR5k0bGnxK1Z2SyTliTV7g8bY
vlNDggBP4pCtaY54VD5HSwZaLEAM5yX5GnAKorJLVVZi6+BBnrWmvhl2xsW3wvmp
2OIDU+9U6iK/U9F9KBPHyYY9CaCvBTt2j/lOb64rfDkRXUZ2cYRdmB/2607fUsDN
ne1N0IGZ9c8IpWdCo0FH
=YYhW
-----END PGP SIGNATURE-----

--qxdbIi5FkDJ48UmCresIUTMeSIUAokStJ--
