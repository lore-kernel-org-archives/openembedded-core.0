Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RLV4W-0000it-10
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 08:17:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Nov 2011 00:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,442,1315206000"; d="scan'208";a="80334699"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2011 00:11:06 -0700
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 2 Nov 2011 15:10:58 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 2 Nov 2011 15:10:57 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 2 Nov 2011
	15:10:56 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2011 15:10:55 +0800
Thread-Topic: [OE-core] [PATCH 1/1] bash: make job control really work
Thread-Index: AcyYgAoaAlOnzbvDTdid8KG/MzZGlQArC18Q
Message-ID: <1865303E0DED764181A9D882DEF65FB6D836780D9E@shsmsx502.ccr.corp.intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
	<ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
	<1320142868.13918.0.camel@ted>
In-Reply-To: <1320142868.13918.0.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] bash: make job control really work
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
X-List-Received-Date: Wed, 02 Nov 2011 07:17:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-11-01:
> On Tue, 2011-11-01 at 16:05 +0800, Dexuan Cui wrote:
>> It turns out 9393ff833f44570fd5f500bc9de6c72db94b0296 didn't really
>> fix the bug.
>>=20
>> This patch is made and tested after I read the link below
>> http://www.mail-archive.com/bug-bash@gnu.org/msg03107.html
>>=20
>> [YOCTO #487]
>>=20
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>> ---
>>  meta/recipes-extended/bash/bash.inc    |    1 +
>>  meta/recipes-extended/bash/bash_4.2.bb |    2 +-
>>  2 files changed, 2 insertions(+), 1 deletions(-)
>> diff --git a/meta/recipes-extended/bash/bash.inc
>> b/meta/recipes-extended/bash/bash.inc
>> index d55e517..d495538 100644
>> --- a/meta/recipes-extended/bash/bash.inc
>> +++ b/meta/recipes-extended/bash/bash.inc
>> @@ -23,6 +23,7 @@ ALTERNATIVE_LINK =3D "${base_bindir}/sh"
>>  ALTERNATIVE_PRIORITY =3D "100"
>> =20
>>  do_configure () { +	export bash_cv_job_control_missing=3Dpresent
>>  	gnu-configize 	oe_runconf }
>=20
> This really should go into the common site files...
Hi Richard,
I found we do define the variable:
meta/site/common-linux:33:bash_cv_job_control_missing=3D${bash_cv_job_contr=
ol_missing=3Dpresent}
but looks autoconf doesn't realize the variable has been assigned the value=
 'present'?
I think this is because of the below do_configure in bash.inc -- looks auto=
reconf is skipped?
do_configure () {
    gnu-configize
    oe_runconf
}
Why do we need a customized do_configure to replace autotools_do_configure?

Later, after I added
do_configure_prepend () {
    autoreconf -f -i -s
}
The generated config.log does show bash_cv_job_control_missing is assigned =
with 'present'.
(BTW, common-linux also introduces many other variables -- would this be sa=
fe? Actually here I only need to introduce bash_cv_job_control_missing.)

However, finally, do_compile got a strange failure:
| shell.c: In function 'shell_reinitialize':
| shell.c:1742:20: error: 'PPROMPT' undeclared (first use in this function)
| shell.c:1742:20: note: each undeclared identifier is reported only once f=
or each function it appears in
| shell.c:1743:22: error: 'SPROMPT' undeclared (first use in this function)

Could you please give some suggestions?

Thanks,
-- Dexuan




