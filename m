Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3159877D2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490891960; x=1522427960;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=rQwEaU/w1l3LXa320fUq/slDXJjg5gs/SKThCgTur0c=;
	b=dZI7OItbx1LDiQqbt4SsiaywgQABU37yPVvdO+pCWJdu5O+6qK0Wk2X/
	0qoKfIncAos0ztcYZkfH9tzIc7Kpeg==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 09:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; 
	d="asc'?scan'208";a="949868185"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.126])
	([10.219.128.126])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2017 09:39:04 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
	<1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
	<1490853745.6396.439.camel@gmx.de> <58DD2C5B.8010704@linux.intel.com>
	<1490890422.6396.459.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58DD3595.1060209@linux.intel.com>
Date: Thu, 30 Mar 2017 10:43:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1490890422.6396.459.camel@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>,
	saul.wold@intel.com
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
X-List-Received-Date: Thu, 30 Mar 2017 16:39:18 -0000
X-Groupsio-MsgNum: 95567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TJuI1xEfbAcI6x2kIq8Pvq6kQMAHrchfr"

--TJuI1xEfbAcI6x2kIq8Pvq6kQMAHrchfr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 03/30/2017 10:13 AM, Patrick Ohly wrote:
> On Thu, 2017-03-30 at 10:03 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>
>> On 03/30/2017 12:02 AM, Patrick Ohly wrote:
>>> On Wed, 2017-03-29 at 15:44 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>> ...
>>>> +show_help() {
>>>> +	printf "Usage: %s [-o output_log] [-h] LAYER_DIR ...\n" $0
>>>> +}
>>>> +
>>> ...
>>>> +env_dir=3D$(mktemp -d -t yocto-compat-XXXX)
>>>> +echo "The environment will be setup at $env_dir"
>>>> +echo ""
>>>
>>> The directory gets created, but not removed.
>>
>> I didn't remove the temp directory because may be the user wants to
>> access the dir after the check.
>=20
> I think that this should be something that the user explicitly needs to=

> request. As it is now, accumulating directories in /tmp when invoking
> the script is just unexpected and not the normal behavior of tools
> creating something in /tmp.

Ok, i will add an option to don't delete and change the default behavior
to delete after check.


>=20
>>>> +echo "Cloning oe-core..."
>>>> +git clone $oe_core_repo $env_dir
>>>> +if [ $? -ne 0 ]; then
>>>> +	echo "Failed to clone oe-core repository"
>>>> +	exit 1
>>>> +fi
>>>> +
>>>> +echo "Cloning bitbake..."
>>>> +git clone $bitbake_repo $env_dir/bitbake
>>>> +if [ $? -ne 0 ]; then
>>>> +	echo "Failed to clone bitbake repository"
>>>> +	exit 1
>>>> +fi
>>>
>>> Cloning bitbake and OE-core each time the script runs will be fairly
>>> slow. There's also a chicken-and-egg problem: if you don't have bitba=
ke,
>>> where's the script?
>>>
>>> I'd prefer to use an existing checkout of both, just as for the layer=
s
>>> which are to be tested.
>>
>> I choose to clone the oe-core/bitbake to ensure there are a clean
>> environment, without any previous layer added.
>=20
> I don't quite get that argument. When using existing bitbake and OE-cor=
e
> directories, how can they have layers added to them? I understand that
> the existing checkout might contain additional modifications and/or
> might not match current master, but I consider that a feature. As it
> stands now, the caller of the script cannot test against Yocto 2.3 once=

> it is released, because the script will always check out master.
>=20
> Control over that can of course also be added to the script, but I just=

> don't see the need for all this additional complexity. Just my 2 cents.=


That's the original issue to create this script, if a user tries to
validate a layer and has modifications in configuration (bblayers,
local, auto), the check will be contaminated in some how.

If you want to run in some previous cloned repository you can use
directly the yocto-compat-layer.py without the wrapper.

>=20
>> I could add an option to
>> specify a oe-core/bitbake dir if isn't set then clone.
>=20
> At the very least please do that.

Yes i will do.

	Anibal
>=20


--TJuI1xEfbAcI6x2kIq8Pvq6kQMAHrchfr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJY3TWXAAoJEGJqcE9h3glgY0wP/0FT3fQf62JcDXTo7ziJqLYV
uVle0PwOHJKeHyyoa5H8BhyJsUAqRDrITrF+PBmMSv0zveBI69L7bCuBHMH4AoqJ
XidfQxr5twoB1cGgmc5GNyIISilzmkuhhvDxqK8NcOcCMJEjHFyff+9vLkqeQyMb
FMurXNJyLDzUcQE9hgH1hJc4bNLOUCHCIHV8j/msj2yvthLz4d+qQdQiplbfj+TN
6R1unfnccJePWgNMZ7pfylxb0pIIATvPfLa3jD0h3a4jPLl+bF4JT28EGPqfFMBZ
8Z9NqF0lDAbabc6GY4euW1qZKgNoB3i5wcDbzXDxhViphOE7S6Qa/SmYhcelUH1t
Epqz9Dy12CGdtYV6GiyQzvH32do4OP/PW27QMEoZDyFg9Bf7xtAkUevBqHQOrdEg
QeAC7kFs6B9vz3/J2GULEjycwkj5zaLRlOFzptv2HimsWL2vBCo5Cx/IfzPc1m5k
mMNvlOMO70JAMQfTXjq9Jukk2hbcjCVDRwvW8Fi0lFx0WVP+KX4z1nCpNYMR7/KX
xXXQcFIV0RAhRxa7n/P09ZguhleAiB8ktv7Kwe91K07NYqb0mIqSm5ECITe6qVnz
aszo1ZHF2CFiURLST8PfXLkoDFm9lG2vzB3UuR51I97FP/vU5gAEIl2cIyOhj58B
/EMgSctnLGLXIYfEOtqB
=O3P8
-----END PGP SIGNATURE-----

--TJuI1xEfbAcI6x2kIq8Pvq6kQMAHrchfr--
