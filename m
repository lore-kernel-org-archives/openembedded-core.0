Return-Path: <John_Mehaffey@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C964371637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 02:17:21 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YRAUT-0001yT-Iy from John_Mehaffey@mentor.com ;
	Thu, 26 Feb 2015 18:17:21 -0800
Received: from NA-MBX-01.mgc.mentorg.com ([169.254.1.131]) by
	SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.168]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 18:17:21 -0800
From: "Mehaffey, John" <John_Mehaffey@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] lttng: Add tracing group when building lttng-tools
Thread-Index: AdBSMx5fI5OOMto2SLqibXks+TQjLg==
Date: Fri, 27 Feb 2015 02:17:20 +0000
Message-ID: <371E240E6FC1D44DA5E51EE9DCDCB784012B9C4987@NA-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "mehaf@gedanken.com" <mehaf@gedanken.com>
Subject: [PATCH] lttng: Add tracing group when building lttng-tools
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
X-List-Received-Date: Fri, 27 Feb 2015 02:17:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This prevents the "Warning: No tracing group detected" message
from lttng when there is no group 'tracing' while using lttng
on the target.

Signed-off-by: John Mehaffey <mehaf@gedanken.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-=
kernel/lttng/lttng-tools_2.6.0.bb
index 15125e3..48d1a86 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -30,7 +30,10 @@ SRC_URI =3D "git://git.lttng.org/lttng-tools.git;branch=
=3Dstable-2.6 \

 S =3D "${WORKDIR}/git"

-inherit autotools-brokensep ptest pkgconfig
+inherit autotools-brokensep ptest pkgconfig adduser
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM_${PN} =3D "tracing"

 export KERNELDIR=3D"${STAGING_KERNEL_DIR}"

--=20
1.9.1

