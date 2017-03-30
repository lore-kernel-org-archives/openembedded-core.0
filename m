Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D7C2E77D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490893451; x=1522429451;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=fdQZPdtrJ2qVCfRNktSbwYVZowyqJD4f/6cE03yU3OY=;
	b=VRt0gDKqkbedI4vl0ngBgxtjJjfXJpM/0530CU0rRAIUhStzvu2RNCI4
	XEHwWw/SX1tbnikMhF78Zx7+NSS47g==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 10:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; 
	d="asc'?scan'208";a="1148914298"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.126])
	([10.219.128.126])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2017 10:03:52 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	Patrick Ohly <patrick.ohly@intel.com>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
	<1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
	<1490853745.6396.439.camel@gmx.de> <58DD2C5B.8010704@linux.intel.com>
	<1490890422.6396.459.camel@intel.com>
	<58DD3595.1060209@linux.intel.com>
	<1490893081.1227.5.camel@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58DD3B65.9020503@linux.intel.com>
Date: Thu, 30 Mar 2017 11:07:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1490893081.1227.5.camel@linux.intel.com>
Cc: saul.wold@intel.com,
	OpenEmbedded <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 30 Mar 2017 17:04:10 -0000
X-Groupsio-MsgNum: 95576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="H6aAdHC9B0jOu5mq1oKmVWA9Ct9Xbkj9W"

--H6aAdHC9B0jOu5mq1oKmVWA9Ct9Xbkj9W
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 03/30/2017 10:58 AM, Joshua Lock wrote:
> On Thu, 2017-03-30 at 10:43 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>
>> On 03/30/2017 10:13 AM, Patrick Ohly wrote:
>>> On Thu, 2017-03-30 at 10:03 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>>>
>>>> On 03/30/2017 12:02 AM, Patrick Ohly wrote:
>>>>> On Wed, 2017-03-29 at 15:44 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>>>>> ...
>>>>>> +show_help() {
>>>>>> +	printf "Usage: %s [-o output_log] [-h] LAYER_DIR
>>>>>> ...\n" $0
>>>>>> +}
>>>>>> +
>>>>>
>>>>> ...
>>>>>> +env_dir=3D$(mktemp -d -t yocto-compat-XXXX)
>>>>>> +echo "The environment will be setup at $env_dir"
>>>>>> +echo ""
>>>>>
>>>>> The directory gets created, but not removed.
>>>>
>>>> I didn't remove the temp directory because may be the user wants
>>>> to
>>>> access the dir after the check.
>>>
>>> I think that this should be something that the user explicitly
>>> needs to
>>> request. As it is now, accumulating directories in /tmp when
>>> invoking
>>> the script is just unexpected and not the normal behavior of tools
>>> creating something in /tmp.
>>
>> Ok, i will add an option to don't delete and change the default
>> behavior
>> to delete after check.
>>
>>
>>>
>>>>>> +echo "Cloning oe-core..."
>>>>>> +git clone $oe_core_repo $env_dir
>>>>>> +if [ $? -ne 0 ]; then
>>>>>> +	echo "Failed to clone oe-core repository"
>>>>>> +	exit 1
>>>>>> +fi
>>>>>> +
>>>>>> +echo "Cloning bitbake..."
>>>>>> +git clone $bitbake_repo $env_dir/bitbake
>>>>>> +if [ $? -ne 0 ]; then
>>>>>> +	echo "Failed to clone bitbake repository"
>>>>>> +	exit 1
>>>>>> +fi
>>>>>
>>>>> Cloning bitbake and OE-core each time the script runs will be
>>>>> fairly
>>>>> slow. There's also a chicken-and-egg problem: if you don't have
>>>>> bitbake,
>>>>> where's the script?
>>>>>
>>>>> I'd prefer to use an existing checkout of both, just as for the
>>>>> layers
>>>>> which are to be tested.
>>>>
>>>> I choose to clone the oe-core/bitbake to ensure there are a clean
>>>> environment, without any previous layer added.
>>>
>>> I don't quite get that argument. When using existing bitbake and
>>> OE-core
>>> directories, how can they have layers added to them? I understand
>>> that
>>> the existing checkout might contain additional modifications and/or
>>> might not match current master, but I consider that a feature. As
>>> it
>>> stands now, the caller of the script cannot test against Yocto 2.3
>>> once
>>> it is released, because the script will always check out master.
>>>
>>> Control over that can of course also be added to the script, but I
>>> just
>>> don't see the need for all this additional complexity. Just my 2
>>> cents.
>>
>> That's the original issue to create this script, if a user tries to
>> validate a layer and has modifications in configuration (bblayers,
>> local, auto), the check will be contaminated in some how.
>=20
> Those are all build-directory state, not items which are tracked in the=

> git repository.
>=20
> Rather than cloning repositories to ensure clean state your script
> could ensure a unique/new build directory by sourcing oe-init-build-env=
=20
> with a non-standard build directory, perhaps checking whether the
> directory exists first and adding random characters until you get
> something new?

That's a very good idea, i can generate tmp build directory and in this
way we can delete the logic for clone a new repository, so if anyone
reject, i'll do that.

	Anibal

>=20
> Joshua
>=20


--H6aAdHC9B0jOu5mq1oKmVWA9Ct9Xbkj9W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJY3TtnAAoJEGJqcE9h3glgHoIP/ijzCMmw5rAbFV5zIk4dd4s4
CKlUTAPSs7zM2RHStR8m5iVnophZu65AHPn+1mr8nGrd5ux9iJA9cxCHsyRH/3du
vieUoQ/Z9L5ACWoJrbqxDA+5zBfl7b9MfpFRjgmDAjk79zvlkCkAOql2mSpxcpla
XFysrKZxSoe735VvS5EXB58qfFj7IbExQ7aOotstoaBad/DHcgXVG45xnDxgmdxj
jTKUfwAzAp8n3Y9TNpfIm5XMetJvWJM0dB2kuVHx2bgLVZG9GIO5MwixFBIFLRm3
0WWEQk8F2P9grvZO8ZfRwxqao3s2kWDEfn3hZbhDblhMbSdl237lhbOHQTZpRdJ6
giIIHmJZTivdenXxFCP7bUHG78cYqXKs+OecQxfQtriWSYtcMHsG/GQYzp9sjv3a
1vCRxyd+nftN+Qv0UhsfpfKvVAGRHBcnbzy/tetTK7i3stIN0F6+RaHiEkFHlHQT
p8xfZc6ndI0MIn4OTQWzRiLKXQAXg0gob7CP2HpQD7to6VAEr0LFyIbjSEVLGzXZ
Ph+kOpr+TvwpBtFw8NqWWg0sr12dkiHYdFaKmZb8HW6jmHpzmf0sIjAgkqX9PXm/
1pK9lmZPud1Hrc4NjcEd1XDZTKpEljFuyWbBAWWCQ588xDoSasqL3knVINkRULUu
05xBaqWO+S6sUN3BRyEq
=3efd
-----END PGP SIGNATURE-----

--H6aAdHC9B0jOu5mq1oKmVWA9Ct9Xbkj9W--
