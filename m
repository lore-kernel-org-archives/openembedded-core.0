Return-Path: <John_Mehaffey@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 29BD7739BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 04:15:08 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YVBZU-0000g9-Sy from John_Mehaffey@mentor.com ;
	Mon, 09 Mar 2015 21:15:08 -0700
Received: from NA-MBX-01.mgc.mentorg.com ([169.254.1.131]) by
	SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.168]) with mapi id
	14.03.0224.002; Mon, 9 Mar 2015 21:15:08 -0700
From: "Mehaffey, John" <John_Mehaffey@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] lttng: Add tracing group when building
	lttng-tools
Thread-Index: AdBSMx5fI5OOMto2SLqibXks+TQjLgIszfmAAABYdSk=
Date: Tue, 10 Mar 2015 04:15:07 +0000
Message-ID: <371E240E6FC1D44DA5E51EE9DCDCB784012B9E22B3@NA-MBX-01.mgc.mentorg.com>
References: <371E240E6FC1D44DA5E51EE9DCDCB784012B9C4987@NA-MBX-01.mgc.mentorg.com>,
	<CAJTo0Lboahoc8Y6BDoEfOLQpG=y-_UuA0cEakNNaTy=nZo818A@mail.gmail.com>
In-Reply-To: <CAJTo0Lboahoc8Y6BDoEfOLQpG=y-_UuA0cEakNNaTy=nZo818A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "mehaf@gedanken.com" <mehaf@gedanken.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng: Add tracing group when building lttng-tools
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
X-List-Received-Date: Tue, 10 Mar 2015 04:15:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Burton, Ross [ross.burton@intel.com]=0A=
Sent: Monday, March 09, 2015 1:57 PM=0A=
To: Mehaffey, John=0A=
Cc: openembedded-core@lists.openembedded.org; mehaf@gedanken.com=0A=
Subject: Re: [OE-core] [PATCH] lttng: Add tracing group when building lttng=
-tools=0A=
=0A=
> On 27 February 2015 at 02:17, Mehaffey, John <John_Mehaffey@mentor.com> w=
rote:=0A=
> > +inherit autotools-brokensep ptest pkgconfig adduser=0A=
>=0A=
> Did you mean useradd?  Or is adduser something Mentor-specific?=0A=
>=0A=
> Ross=0A=
=0A=
No, it was just a typo in transcribing from a .bbappend :(=0A=
=0A=
Here is the corrected version:=0A=
=0A=
From e65f1e31d1f5691c676da3fb33d7c3feab4ef74c Mon Sep 17 00:00:00 2001=0A=
From: John Mehaffey <mehaf@gedanken.com>=0A=
Date: Thu, 26 Feb 2015 10:51:28 -0800=0A=
Subject: [OE-core] [PATCH] lttng: Add tracing group when building lttng-too=
ls=0A=
=0A=
The lttng subsystem issues a warning if there is no=0A=
group 'tracing' when it it started.=0A=
=0A=
Signed-off-by: John Mehaffey <mehaf@gedanken.com>=0A=
---=0A=
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb | 5 ++++-=0A=
 1 file changed, 4 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-=
kernel/lttng/lttng-tools_2.6.0.bb=0A=
index 15125e3..f0969b5 100644=0A=
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb=0A=
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb=0A=
@@ -30,7 +30,10 @@ SRC_URI =3D "git://git.lttng.org/lttng-tools.git;branch=
=3Dstable-2.6 \=0A=
 =0A=
 S =3D "${WORKDIR}/git"=0A=
 =0A=
-inherit autotools-brokensep ptest pkgconfig=0A=
+inherit autotools-brokensep ptest pkgconfig useradd=0A=
+=0A=
+USERADD_PACKAGES =3D "${PN}"=0A=
+GROUPADD_PARAM_${PN} =3D "tracing"=0A=
 =0A=
 export KERNELDIR=3D"${STAGING_KERNEL_DIR}"=0A=
 =0A=
-- =0A=
1.9.1=0A=
=0A=

