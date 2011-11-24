Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTbTZ-00018i-Jp
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 16:44:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Nov 2011 07:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,565,1315206000"; d="scan'208";a="40889049"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Nov 2011 07:38:02 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 24 Nov 2011 23:38:01 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 24 Nov 2011 23:38:01 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 24 Nov 2011 23:38:00 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 23:37:59 +0800
Thread-Topic: [OE-core] [PATCH 2/4] gcc-package-target.inc: add the symbol
	link /lib/cpp
Thread-Index: Acyqm0Nbee7mIZAvQ++MQthQj3hC/gAIOCxA
Message-ID: <1865303E0DED764181A9D882DEF65FB6E81DE4410E@shsmsx502.ccr.corp.intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
	<d4724b4050931ff51499a8808287f04b0091e93e.1322128489.git.dexuan.cui@intel.com>
	<1322133692.24143.10.camel@ted>
In-Reply-To: <1322133692.24143.10.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] gcc-package-target.inc: add the symbol link /lib/cpp
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
X-List-Received-Date: Thu, 24 Nov 2011 15:44:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-11-24:
> On Thu, 2011-11-24 at 18:08 +0800, Dexuan Cui wrote:
>> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
>> @@ -122,6 +122,8 @@ do_install () {
>>  	ln -sf ${TARGET_PREFIX}g++ g++
>>  	ln -sf ${TARGET_PREFIX}gcc gcc
>>  	ln -sf ${TARGET_PREFIX}cpp cpp
>> +	install -d ${D}${base_libdir}
>> +	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
>>  	ln -sf g++ c++
>>  	ln -sf gcc cc
>=20
> Why do we need this change?
When I was trying self-hosted-image, eglibc's do_install failed in the targ=
et:
ERROR: cannot stat bootparam_prot.h: the cause is: rpcgen doesn't work prop=
erly: rpcgen can't exec /lib/cpp since it doesn't exist.

According to http://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/lib.html, =
 "if a C preprocessor is installed, /lib/cpp must be a reference to it, for=
 historical reasons. The usual placement of this binary is /usr/bin/cpp".

Typical distros, like Ubuntu, openSuSE, Fedora, RHEL, all comply with the r=
ule.

Actually in meta/recipes-devtools/gcc/gcc-package-target.inc, we do try to =
package ${base_libdir}/cpp:
 FILES_cpp =3D "\
  ${bindir}/${TARGET_PREFIX}cpp \
  ${base_libdir}/cpp \
  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
But unluckily we didn't to create a symbol link in do_install. This patch a=
dds the symbol link.

Thanks,
-- Dexuan




