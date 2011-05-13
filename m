Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QL1f3-0002h5-JM
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:20:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 16:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,366,1301900400"; d="scan'208";a="747035632"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2011 16:17:54 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 14 May 2011 07:17:53 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Sat, 14 May 2011 07:17:52 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sat, 14 May 2011 07:17:51 +0800
Thread-Topic: [OE-core] [RFC][v2] [PATCH 1/1] package-index.bb: add support
	for	deb and rpm.
Thread-Index: AcwRvHShAaU4Mi6zQsiSpzO8gYy3KgABcMMg
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BDA2@shsmsx502.ccr.corp.intel.com>
References: <cover.1305279161.git.dexuan.cui@intel.com>
	<abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
	<4DCDAF76.7020701@linux.intel.com>
In-Reply-To: <4DCDAF76.7020701@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC][v2] [PATCH 1/1] package-index.bb: add support for	deb and rpm.
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
X-List-Received-Date: Fri, 13 May 2011 23:20:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 05/13/2011 02:53 AM, Dexuan Cui wrote:
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>=20
>> diff --git a/meta/classes/package_deb.bbclass
>> b/meta/classes/package_deb.bbclass=20
>> index 4faeb4a..4cc0b69 100644
>> --- a/meta/classes/package_deb.bbclass
>> +++ b/meta/classes/package_deb.bbclass
>> @@ -431,3 +431,12 @@ python do_package_write_deb () {
>>   do_package_write_deb[dirs] =3D "${PKGWRITEDIRDEB}"
>>   addtask package_write_deb before do_package_write after do_package
>>=20
>> +
>> +do_package_index[depends] +=3D "dpkg-native:do_populate_sysroot
>> apt-native:do_populate_sysroot" +do_package_index[recrdeptask] +=3D
>> "package_update_index_deb" + +do_package_index() {
>> +   set -ex
>> +   package_update_index_deb
>> +   set +ex
>> +}
>=20
> Why do you continue to include the do_package_index here, it's no
> longer needed with the setting of do_package_index[recrdeptask], this
> is true below also.
Sorry, I didn't use the recrdeptask flag and I guess I still don't quite un=
derstand it.

Here removing the do_package_index() I will get such an ERROR:
ERROR: Task do_package_index from /distro/dcui/pc1/meta/recipes-core/meta/p=
ackage-index.bb seems to be empty?!##########################              =
     | ETA:  00:00:00
ERROR: Error parsing /distro/dcui/pc1/meta/recipes-core/meta/package-index.=
bb: md5() argument 1 must be string or read-only buffer, not None          =
     | ETA:  00:00:00

About the recrdeptask  flag: "These are specified with the 'recrdeptask' fl=
ag and is used signify the task(s) of each RDEPENDS which must have complet=
ed before that task can be executed. It applies recursively so also, the RD=
EPENDS of each item in the original RDEPENDS must be met and so on. It also=
 runs all DEPENDS first too".
I even added RDEPENDS +=3D " package-index" in package-index.bb, but no cha=
nge.

I'm trying to figure this out. Please point out my issue once this is obvio=
us to you. :-)

BTW: using the recrdeptask method, we have no chance to do "set -ex" and as=
 a result we lose some debug info in the log file. Is this ok?

>> +
>> diff --git a/meta/classes/package_rpm.bbclass
>> b/meta/classes/package_rpm.bbclass=20
>> index 70170d1..d9470d6 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -814,3 +814,10 @@ python do_package_write_rpm () {
>>   do_package_write_rpm[dirs] =3D "${PKGWRITEDIRRPM}"
>>   addtask package_write_rpm before do_package_write after do_package
>>=20
>> +do_package_index[depends] +=3D
>> "createrepo-native:do_populate_sysroot" +do_package_index() { +  =20
>> set -ex +    package_update_index_rpm
>> +    createrepo "${DEPLOY_DIR_RPM}"
>> +    set +ex
>> +}
>=20
> Nor this do_package_index() function, why no
> do_package_index[recrdeptask] setting in RPM?  If you need a special
> function here them call it do_package_index_rpm() and set the
> do_package_index[recrdeptask] to that function.
Yes, I should have added a new function including package_update_index_rpm =
and  createrepo "${DEPLOY_DIR_RPM}". and set do_package_index[recrdeptask] =
to it.=20

Thanks,
-- Dexuan


