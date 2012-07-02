Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Slegk-0006NX-Il
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 13:21:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jul 2012 04:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172471454"
Received: from fmsmsx107.amr.corp.intel.com ([10.19.9.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jul 2012 04:10:05 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.19.17.221) by
	FMSMSX107.amr.corp.intel.com (10.19.9.54) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 2 Jul 2012 04:10:04 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	fmsmsx152.amr.corp.intel.com (10.19.17.221) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 2 Jul 2012 04:10:04 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.33]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.220]) with mapi id
	14.01.0355.002; Mon, 2 Jul 2012 19:10:02 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V3 2/3] image/core-image: Handle conflicting
	IMAGE_FEATURES.
Thread-Index: AQHNWDCu7atxfgi2l0WkjNKL+/gz0ZcV0/3Q
Date: Mon, 2 Jul 2012 11:10:02 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FE5361F@SHSMSX102.ccr.corp.intel.com>
References: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
	<13ed4eabf4dfcb28267d045fc30e402a3484e95d.1340600710.git.lianhao.lu@intel.com>
	<1341219341.23146.183.camel@ted>
In-Reply-To: <1341219341.23146.183.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH V3 2/3] image/core-image: Handle conflicting IMAGE_FEATURES.
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
X-List-Received-Date: Mon, 02 Jul 2012 11:21:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Richard Purdie wrote on 2012-07-02:
> On Mon, 2012-06-25 at 13:15 +0800, Lianhao Lu wrote:
>> IMAGE_FEATURES such as 'ssh-server-dropbear' and 'ssh-server-openssh'
>> can't be both enabled. User can use the following variables to define
>> the relationship of image features:
>>=20
>> IMAGE_FEATURES_REPLACES_foo =3D "bar" means including image feature "foo=
"
>> would replace the image feature "bar".
>>=20
>> IMAGE_FEATURES_CONFLICTS_foo =3D "bar" means including both image featur=
es
>> "foo" and "bar" would cause an parsing error.
>>=20
>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>> ---
>>  meta/classes/core-image.bbclass                 |   11 ++++++++++-
>>  meta/classes/image.bbclass                      |   17 ++++++++++++++++=
+
>>  meta/recipes-sato/images/core-image-sato-sdk.bb |    2 ++
>>  3 files changed, 29 insertions(+), 1 deletions(-)
>> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.b=
bclass
>> index 25f5c5a..6b207d7 100644
>> --- a/meta/classes/core-image.bbclass
>> +++ b/meta/classes/core-image.bbclass
>> @@ -47,6 +47,14 @@ PACKAGE_GROUP_ssh-server-openssh =3D "task-core-ssh-o=
penssh"
>>  PACKAGE_GROUP_package-management =3D "${ROOTFS_PKGMANAGE}"
>>  PACKAGE_GROUP_qt4-pkgs =3D "task-core-qt-demos"
>> +
>> +# IMAGE_FEAETURES_REPLACES_foo =3D 'bar1 bar2'
>> +# Including image feature foo would replace the image features bar1 and=
 bar2
>> +IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D "ssh-server-dropbear"
>> +
>> +# IMAGE_FEATURES_CONFLICTS_foo =3D 'bar1 bar2'
>> +# An error exception would be raised if both image features foo and bar=
1(or bar2) are included
>> +
>>  CORE_IMAGE_BASE_INSTALL =3D '\
>>      task-core-boot \
>>      task-base-extended \
>> @@ -60,7 +68,8 @@ IMAGE_INSTALL ?=3D "${CORE_IMAGE_BASE_INSTALL}"
>>=20
>>  X11_IMAGE_FEATURES  =3D "x11-base apps-x11-core package-management"
>>  ENHANCED_IMAGE_FEATURES =3D "${X11_IMAGE_FEATURES} apps-x11-games apps-=
x11-pimlico package-management"
>> -SATO_IMAGE_FEATURES =3D "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server=
-dropbear"
>> +SSHSERVER_IMAGE_FEATURES ??=3D "ssh-server-dropbear"
>> +SATO_IMAGE_FEATURES =3D "${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSERVE=
R_IMAGE_FEATURES}"
>>=20
>>  inherit image
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 0772363..6fac974 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -87,6 +87,23 @@ python () {
>>          deps +=3D " %s:do_populate_sysroot" % dep
>>      d.setVarFlag('do_rootfs', 'depends', deps)
>> +    #process IMAGE_FEATURES, we must do this before runtime_mapping_ren=
ame
>> +    #Check for replaces image features
>> +    features =3D set(oe.data.typed_value('IMAGE_FEATURES', d))
>> +    remain_features =3D features.copy()
>> +    for feature in features:
>> +        replaces =3D set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % featu=
re, True) or "").split())
>> +        remain_features -=3D replaces
>> +
>> +    #Check for conflict image features
>> +    for feature in remain_features:
>> +        conflicts =3D set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % fea=
ture, True) or "").split())
>> +        temp =3D conflicts & remain_features
>> +        if temp:
>> +            raise bb.parse.SkipPackage("%s contains conflicting IMAGE_F=
EATURES %s %s" % (d.getVar('PN', True), feature, '
> '.join(list(temp))))
>=20
>=20
> I'm not sure that SkipPackage is the right error here. This will simply
> make the image target "disappear" when in this case we really want to
> raise a "proper" error?
>=20

How about directly bb.fatal? Just like the base.bbclass handles the recipes=
 without setting the LICENSE field.

Best Regards,
Lianhao




