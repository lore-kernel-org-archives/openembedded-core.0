Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKh6v-0002hv-MO
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 03:24:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 18:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,361,1301900400"; d="scan'208";a="746555503"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 18:21:19 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 May 2011 09:21:05 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 13 May 2011 09:21:04 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "Wold, Saul" <saul.wold@intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 09:21:02 +0800
Thread-Topic: [OE-core] [PATCH 0/1] Automatically generate package repos for
	rpm	and deb [bug #1024]
Thread-Index: AcwQ1Gx/GSI2iipaSSiJOmVth1aLBQAM7R8g
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD9A@shsmsx502.ccr.corp.intel.com>
References: <cover.1305196874.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB69334F4BD99@shsmsx502.ccr.corp.intel.com>
	<4DCC2A34.7040709@intel.com>
In-Reply-To: <4DCC2A34.7040709@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Qing He' <qing.x.he@gmail.com>
Subject: Re: [PATCH 0/1] Automatically generate package repos for rpm	and deb [bug #1024]
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
X-List-Received-Date: Fri, 13 May 2011 01:24:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wold, Saul wrote:
> On 05/12/2011 04:38 AM, Cui, Dexuan wrote:
>> Dexuan Cui wrote:
>>> From: Dexuan Cui<dexuan.cui@intel.com>
>>>=20
>>> This was made to address
>>> http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1024. Please
>>> comment.=20
>>>=20
>>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>>    Branch: dcui/master
>>>    Browse:
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master
>>=20
>> This is an improved and simple version that keeps 1  package-index
>> recipe and updates the 3 kinds of packages at the same time:
>> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/pac=
kage-index&id=3Dfb26e81dcb6e27e2908294e406a3011baed0120d
>> This avoids forcing the user to remember which package type they
>> enabled when running "bitbake package-index". (I also past the new
>> version at the end of this mail for easy reviewing) =20
>>=20
> Dexuan,
>=20
> I am not sure that this is the correct approach.  I think that you
> should look at how the packages get generated based on which package
> classes are included via PACKAGE_CLASSES, then in each of those
> classes set it up so that when the package-index task is called you
> know which indexer to run. This would be moving what you have in the
> package-index-<packager>.bb files to their respective
> package_<packager>.bbclass files and use
>=20
> do_package_index[recrdeptask] +=3D package_index_<packager>
>=20
> in the case of ipk it would be in package_ipk.bbclass
>=20
> do_package_index[recrdeptask] +=3D "package_update_index_ipk"
>=20
> You will also need to move the do_package_index[depends]
OK, thanks very much for the detailed suggestion! I'll change to this bette=
r method.

> Another thing to verify is the current package_update_index_* correct
> for the different package types? Looking at package_update_index_rpm,
> I am not sure since it does not call createrepo, there might be a
> reason for this that Mark H or Qing can comment on.
My understanding about package_update_index_rpm vs. createrepo is:
both can be used to generate rpm repo;
package_update_index_rpm generates the metadata about the packages in solve=
db to have rpm install the packages into target rootfs. This is the current=
 method used in do_rootfs for rpm. This is complex and the generated repo i=
s not suitable to be exported (e.g., via http) for general use;
createrepo generated the metadata in .xml files and the generated repo can =
be easily exported via http and can be used easily by standard zypper (and =
yum) tools.
So in package-index.bb, I adopt createrepo for rpm.

Let me Cc Qing and Mark for comments about this.

Thanks!
-- Dexuan
=20


