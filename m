Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6D8D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:41:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4972.1765276886346374208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ky861H9W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9ARQ6K2368380
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 10:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5F70jeoZGXDTvs44zlZy
	1oMG1QwkpemuwgPQJS0wd4Y=; b=ky861H9WHfyKBgCtJWvSW6iQfyIBBP75xlTB
	IWtty4ECKdh+gm7Pe7990M17ZYt0AfXz4Upg9UkGZDpDCRBqOBh1mztarY//M9/9
	EnDJLFgtoT0SG0thztdbM52g3bkldpDfeAINO4dJc3VHWJe9Nni6b1o6z6KF3dbt
	keTokxWLwMRZPaoqk8cF/+E6LXBjrIT4eQbNbfPS50phR+XIQz+7aLlPHvOiOru3
	xMqWJV30J5NUI+Qy8cQ7Oa+k0ruoiUVVJkhjvPkXLWYYcz606vDRzL6tLtMvL58i
	i+ZSMFFd6WvWQR6MIe87vwqoqyYmZs+sji1jIf39RZmSNZVi5g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742vby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:41:25 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 9 Dec 2025 02:41:23 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 9 Dec 2025 02:41:23 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
Date: Tue, 9 Dec 2025 18:41:21 +0800
Message-ID: <20251209104122.369943-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: 0gd9AafZM013fMi-e10eMoFXAeQoD8Qn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3NCBTYWx0ZWRfXz5z41RAYARk8
 qLrFxjTvHaNp7DE30k8t3rfUCHcMxW3EgEks6fHzKUI+eZxgwb2uqOJVnxsQgISfQsdlHwHceLj
 3m8nXhwqtI+8EsJt2v7MTAxJkRNAufoAlxnzSm9MOT5tsSbuedlE93gdc/1aGSVVesumNXEK8CO
 /7Rv7ZTF7KiyqAb2hbbYXCqBT1coJ158E++Xa21/9qopeuChdEd7BuSmWCLqd5r2OMOyJx/ashr
 Ew0KxDDG80Mef2/nRyvXyUywDG0Up3nzaxxZV5pFgs8hSoYc3GeMDtiLntUzOftek/ROhhauyu3
 KluwaCY+EQlIL4au1EDeW+jznPu6W0svbgp655djyNqZXK3KUvN4qFGWFqPHF7m/FcEcpKxGFjm
 mmf/m/qMzsC/bRRcTa7n9z+jmt4k9Q==
X-Proofpoint-ORIG-GUID: 0gd9AafZM013fMi-e10eMoFXAeQoD8Qn
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=6937fcd5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=PR8TqU6HpCKTr1hTGzYA:9 a=YH-7kEGJnRg4CV3apUU-:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227423

From: Changqing Li <changqing.li@windriver.com>

When cgo is enabled, the Go toolchain writes temporary source files
(*.c) under GOTMPDIR and compiles them there. when -trimpath is passed
to go, Go passes options such as
-ffile-prefix-map=3D$WORK/b387=3D/tmp/go-build internally to the GCC
instance it invokes. The variable WORK is a temporary directory created
under GOTMPDIR, refer the following log:

[snip of compile log]
WORK=3D/build/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build-tmp/go-buil=
d377321751
cd $WORK/b387
TERM=3D'dumb' x86_64-wrs-linux-gcc -m64 -march=3Dx86-64-v3 -fstack-protecto=
r-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-security --sysroot=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recip=
e-sysroot -I /tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1=
.41.5/src/github.com/containers/buildah/vendor/github.com/proglottis/gpgme =
-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0 -ffile-prefix=
-map=3D$WORK/b387=3D/tmp/go-build -gno-record-gcc-switches -v -D_FILE_OFFSE=
T_BITS=3D64 -I $WORK/b387/ -O2 -g -ffile-prefix-map=3D/tmp/work/x86-64-v3-w=
rs-linux/buildah/1.41.5/sources/buildah-1.41.5=3D/usr/src/debug/buildah/1.4=
1.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build=
=3D/usr/src/debug/buildah/1.41.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wr=
s-linux/buildah/1.41.5/recipe-sysroot=3D -ffile-prefix-map=3D/tmp/work/x86-=
64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native=3D -pipe -v -ffile-pre=
fix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1.41=
.5/src/github.com/containers/buildah/vendor=3D/_/vendor -frandom-seed=3DTZk=
SPVSBUvDMjg4wKjWS -o $WORK/b387/_x004.o -c unset_agent_info.cgo2.c
[snip of compile log]

OE also passes its own DEBUG_PREFIX_MAP to GCC(finally by CGO_CFLAGS),
including -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}, where B is
${WORKDIR}/build. Because GOTMPDIR defaults to ${WORKDIR}/build-tmp, the
Go temporary directory looks like ${WORKDIR}/build-tmp/go-buildXYZ. Its
prefix therefore begins with ${WORKDIR}/build, so GCC matches the
DEBUG_PREFIX_MAP entry for ${B} first.

As a result, a path such as ${WORKDIR}/build-tmp/go-buildXYZ is
rewritten to ${TARGET_DBGSRC_DIR}-tmp/go-buildXYZ. This breaks the
-ffile-prefix-map option that Go itself adds, because the original WORK
path no longer matches the value Go expects. Since Go creates
go-buildXYZ directories randomly and internally, this causes the build
non-reproducible.

This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
${WORKDIR}/tmp-go-build so that the path no longer matches ${B}. This
prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
restores reproducibility.

Note that pure go program like go-helloworld under OE will not have this
issue since it doen't use cgo, it is reproducible without this fix

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index e0f667373e..c323d4c9c9 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -79,7 +79,7 @@ B =3D "${WORKDIR}/build"
 export GOPATH =3D "${B}"
 export GOENV =3D "off"
 export GOPROXY ??=3D "https://proxy.golang.org,direct"
-export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
+export GOTMPDIR ?=3D "${WORKDIR}/tmp-go-build"
 GOTMPDIR[vardepvalue] =3D ""
=20
 GO_SRCURI_DESTSUFFIX =3D "${@os.path.join(os.path.basename(d.getVar('S')),=
 'src', d.getVar('GO_IMPORT')) + '/'}"
--=20
2.34.1


