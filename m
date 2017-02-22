Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 55AFF7315D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:15:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 08:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,195,1484035200"; 
	d="asc'?scan'208";a="68878736"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.120])
	([10.219.128.120])
	by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2017 08:15:24 -0800
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1487717331-26684-3-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1487778772.4973.2.camel@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58ADB9E8.8030908@linux.intel.com>
Date: Wed, 22 Feb 2017 10:18:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1487778772.4973.2.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] classes/populate_sdk_base: Adds support to generate extensible sdk package manifest
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
X-List-Received-Date: Wed, 22 Feb 2017 16:15:24 -0000
X-Groupsio-MsgNum: 93846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uLmax6IXln11vSsLD4qvFfu9KV1N6EwrD"

--uLmax6IXln11vSsLD4qvFfu9KV1N6EwrD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2017 09:52 AM, Joshua Lock wrote:
> On Tue, 2017-02-21 at 14:48 -0800, Francisco Pedraza wrote:
>> This function writes on host and target manifest files for eSDK.
>> [YOCTO #9038]
>>
>> Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.
>> com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass | 26
>> +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass
>> b/meta/classes/populate_sdk_base.bbclass
>> index 33665cd..db700d7 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -59,6 +59,9 @@ SDK_TITLE ?=3D "${@d.getVar('DISTRO_NAME') or
>> d.getVar('DISTRO')} SDK"
>> =20
>>  SDK_TARGET_MANIFEST =3D
>> "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
>>  SDK_HOST_MANIFEST =3D
>> "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
>> +SDK_EXT_TARGET_MANIFEST =3D
>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
>> +SDK_EXT_HOST_MANIFEST =3D
>> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
>> +
>>  python write_target_sdk_manifest () {
>>      if d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk':
>>          from oe.sdk import sdk_list_installed_packages
>> @@ -69,6 +72,17 @@ python write_target_sdk_manifest () {
>>              bb.utils.mkdirhier(sdkmanifestdir)
>>          with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
>>              output.write(format_pkg_list(pkgs, 'ver'))
>> +    elif d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
>=20
> Rather than checking which task is running like this couldn't we do the=

> following logic in the
> populate_sdk_ext.bbclass:write_target_sdk_manifest() and similarly move=

> the above into populate_sdk.bbclass?

Yes, that would be a good idea.

	alimon


>=20
> Joshua
>> +        from oe.sdk import get_extra_sdkinfo
>> +        sstate_dir =3D d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-
>> cache')
>> +        extra_info =3D get_extra_sdkinfo(sstate_dir)
>> +        target =3D d.getVar('TARGET_SYS')
>> +        target_multimach =3D d.getVar('MULTIMACH_TARGET_SYS')
>> +        with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
>> +            for fn in extra_info['filesizes']:
>> +                info =3D fn.split(':') #added
>> +                if info[2] in (target, target_multimach):
>> +                    f.write("%s %s %s\n" % (info[1], info[2],
>> info[3]))
>>  }
>> =20
>>  python write_sdk_test_data() {
>> @@ -88,12 +102,22 @@ python write_host_sdk_manifest () {
>>              bb.utils.mkdirhier(sdkmanifestdir)
>>          with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
>>              output.write(format_pkg_list(pkgs, 'ver'))
>> +    elif d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
>> +        from oe.sdk import get_extra_sdkinfo
>> +        sstate_dir =3D d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-
>> cache')
>> +        extra_info =3D get_extra_sdkinfo(sstate_dir)
>> +        host =3D d.getVar('BUILD_SYS')
>> +        with open(d.getVar('SDK_EXT_HOST_MANIFEST'), 'w') as f:
>> +            for fn in extra_info['filesizes']:
>> +                info =3D fn.split(':') #added
>> +                if info[2] =3D=3D host:
>> +                    f.write("%s %s %s\n" % (info[1], info[2],
>> info[3]))
>>  }
>> =20
>>  POPULATE_SDK_POST_TARGET_COMMAND_append =3D "
>> write_target_sdk_manifest ; write_sdk_test_data ; "
>>  POPULATE_SDK_POST_HOST_COMMAND_append =3D " write_host_sdk_manifest; =
"
>>  SDK_PACKAGING_COMMAND =3D "${@'${SDK_PACKAGING_FUNC};' if
>> '${SDK_PACKAGING_FUNC}' else ''}"
>> -SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; check_sdk_sysroots;
>> tar_sdk; ${SDK_PACKAGING_COMMAND} "
>> +SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; check_sdk_sysroots;
>> tar_sdk; write_target_sdk_manifest; write_host_sdk_manifest;
>> ${SDK_PACKAGING_COMMAND} "
>> =20
>>  def populate_sdk_common(d):
>>      from oe.sdk import populate_sdk
>> --=20
>> 1.8.3.1
>>


--uLmax6IXln11vSsLD4qvFfu9KV1N6EwrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYrbnqAAoJEGJqcE9h3glgcIMP/3IJGMFSj50i1VMU6UWwo7oh
ne3zSqr7xen+lCvB5F1HWEJV449DzCYQedMY7wqq8ujO7qqsfBUzdUIYX+EZiaot
Ok2P8a4LqWDjIvnhvQvTKotiXFTSPEQw8FyL+9RW2UH7GG9CLx2v0SM6QFix3AFH
kytoFH179C1W5L5HqamkderBt0zR7o6n79ZLPT5r5jMDo9hNwvT891z9npYnKrSj
/4KvzB/5OB95OEZlx9LJkm9Yz9znL/QwMItCHI2PN9pvrcye9i0zkbIJHDv9aCml
pCmZ7dis8AbGcvZ0f9QDpTbZPqGwMpNtRgi05ZXsRY+e4ksGs8A+QjskewoUTxeH
I4jNcBc8ar7vR40mxuvAJrVPg5A3s8g+W0J3E2ARLtKTwovN8oqZmO+fCzcW2Gzp
ojYLLy8yjMrOPuyLj1cgMrDIh55bXaFCR/vJnXXhoh7ImSuVoJyHFyQhZIdrEQ84
iVS/+YURxpIY8RLKNejBlMpp4BAoqgat2NRFgP4Z8o7GNgCtXtanWFMj4kTDE8nk
yxAKAWsh/OppPS4T3K2BuQkJXhhR16Pq4hLk3iN5hClzLwJMI+LAewYtNEqemXp+
qRIdvX24J+aj2xSxhc2BqSLqtwAa++1KkinK+TrwdEb+SMLHyglLFQ1QXh7sduyK
a+h2WYDyMs7uE98v6ivz
=1lur
-----END PGP SIGNATURE-----

--uLmax6IXln11vSsLD4qvFfu9KV1N6EwrD--
