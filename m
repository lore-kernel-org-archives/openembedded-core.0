Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UBZpl-0002JX-6A
	for Openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:57:59 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r21NfP9E011212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 15:41:25 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.233]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0328.009;
	Fri, 1 Mar 2013 15:41:24 -0800
From: "Dubielzig, Rich" <rich.dubielzig@windriver.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [V3] nfs-utils: Add scratch directory for NFS upcall state
	storage (denzil)
Thread-Index: AQHOFtWL5dE/EfA3skmIHla59zMS8piRfr/1
Date: Fri, 1 Mar 2013 23:41:23 +0000
Message-ID: <4DDB2CE82D9BF44DB2EC2903AD859F8185594A0F@ALA-MBB.corp.ad.wrs.com>
References: <1362077027-25696-1-git-send-email-rich.dubielzig@windriver.com>,
	<1362180962-13024-1-git-send-email-rich.dubielzig@windriver.com>
In-Reply-To: <1362180962-13024-1-git-send-email-rich.dubielzig@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.80.129]
MIME-Version: 1.0
Subject: Re: [V3] nfs-utils: Add scratch directory for NFS upcall state storage (denzil)
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
X-List-Received-Date: Fri, 01 Mar 2013 23:58:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm sorry to be filling up the forum like this.  Please disregard this patc=
h, for some reason it is reverting my change instead of adding it.=0A=
________________________________________=0A=
From: Rich Dubielzig [rich.dubielzig@windriver.com]=0A=
Sent: Friday, March 01, 2013 3:36 PM=0A=
To: Openembedded-core@lists.openembedded.org=0A=
Cc: Dubielzig, Rich=0A=
Subject: [V3] nfs-utils: Add scratch directory for NFS upcall state storage=
 (denzil)=0A=
=0A=
When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot=0A=
record the upcall state and cannot end the 90-second grace period on=0A=
startup.  This is true even when NFS4 is not being served according to=0A=
nfsstat.=0A=
=0A=
Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>=0A=
---=0A=
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    4 +---=0A=
 1 files changed, 1 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
index 138791b..84c4464 100644=0A=
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb=0A=
@@ -12,7 +12,7 @@ DEPENDS =3D "libcap libnfsidmap libevent util-linux tcp-w=
rappers"=0A=
 RDEPENDS_${PN} =3D "rpcbind"=0A=
 RRECOMMENDS_${PN} =3D "kernel-module-nfsd"=0A=
=0A=
-PR =3D "r5"=0A=
+PR =3D "r4"=0A=
=0A=
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \=0A=
            file://nfs-utils-1.0.6-uclibc.patch \=0A=
@@ -53,8 +53,6 @@ RDEPENDS_${PN}-stats =3D "python"=0A=
 do_install_append () {=0A=
        install -d ${D}${sysconfdir}/init.d=0A=
        install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsse=
rver=0A=
-       # kernel code as of 3.8 hard-codes this path as a default=0A=
-       install -d ${D}/var/lib/nfs/v4recovery=0A=
=0A=
        # the following are built by CC_FOR_BUILD=0A=
        rm -f ${D}${sbindir}/rpcdebug=0A=
--=0A=
1.7.1=0A=
=0A=


