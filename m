Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UAQzT-0000Q3-AY
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:19:33 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1QK2kTk009985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 12:02:46 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.233]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0328.009;
	Tue, 26 Feb 2013 12:02:46 -0800
From: "Dubielzig, Rich" <rich.dubielzig@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] nfs-utils: Add scratch directory for NFS
	upcall state storage
Thread-Index: AQHOE4g3CtJ2x0FD7k60lvN6txNVhJiLw4OAgADMrrk=
Date: Tue, 26 Feb 2013 20:02:44 +0000
Message-ID: <4DDB2CE82D9BF44DB2EC2903AD859F8185591B7C@ALA-MBB.corp.ad.wrs.com>
References: <1361817899-22185-1-git-send-email-rich.dubielzig@windriver.com>,
	<512BF7AB.70302@linux.intel.com>
In-Reply-To: <512BF7AB.70302@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.80.152]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: Add scratch directory for NFS upcall state storage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 20:19:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I can make this change, but if ${localstatedir} ends up being different tha=
n /var it would not be consistent with current kernel code which hardcodes =
the path "/var/lib/nfs/v4recovery" by default in fs/nfsd/nfs4recover.c=0A=
=0A=
http://lxr.linux.no/#linux+v3.8/fs/nfsd/nfs4recover.c=0A=
=0A=
-Rich=0A=
________________________________________=0A=
From: Saul Wold [sgw@linux.intel.com]=0A=
Sent: Monday, February 25, 2013 3:45 PM=0A=
To: Dubielzig, Rich=0A=
Cc: Openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] nfs-utils: Add scratch directory for NFS upc=
all state storage=0A=
=0A=
On 02/25/2013 10:44 AM, Rich Dubielzig wrote:=0A=
> When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot=0A=
> record the upcall state and cannot end the 90-second grace period on=0A=
> startup.  This is true even when NFS4 is not being served according to=0A=
> nfsstat.=0A=
>=0A=
> More details and discussion here:=0A=
> https://lkml.org/lkml/2012/6/11/206=0A=
>=0A=
> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>=0A=
> ---=0A=
>   .../nfs-utils/nfs-utils_1.2.3.bb                   |    5 ++++-=0A=
>   1 files changed, 4 insertions(+), 1 deletions(-)=0A=
>=0A=
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
> index 84c4464..a0b2399 100644=0A=
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
> @@ -12,7 +12,7 @@ DEPENDS =3D "libcap libnfsidmap libevent util-linux tcp=
-wrappers"=0A=
>   RDEPENDS_${PN} =3D "rpcbind"=0A=
>   RRECOMMENDS_${PN} =3D "kernel-module-nfsd"=0A=
>=0A=
> -PR =3D "r4"=0A=
> +PR =3D "r5"=0A=
>=0A=
>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \=0A=
>              file://nfs-utils-1.0.6-uclibc.patch \=0A=
> @@ -58,4 +58,7 @@ do_install_append () {=0A=
>       rm -f ${D}${sbindir}/rpcdebug=0A=
>       rm -f ${D}${sbindir}/rpcgen=0A=
>       rm -f ${D}${sbindir}/locktest=0A=
> +=0A=
> +     # needed to allow NFSD to end its grace period=0A=
> +     install -d ${D}/var/lib/nfs/v4recovery=0A=
=0A=
This should really use ${localstatedir} instead of var, it would also be=0A=
better to co-locate this with the other directory creations earlier in=0A=
the do_install_append().=0A=
=0A=
Sau!=0A=
=0A=
>   }=0A=
>=0A=


