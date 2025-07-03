Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50082C83F04
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 10:24:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19100.1751538242705911099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 03:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9279857999=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5633o286020656
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 03:24:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm55h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 03:24:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 03:24:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 03:24:03 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  2/6] xwayland: fix CVE-2025-49176
Date: Thu, 3 Jul 2025 15:53:50 +0530
Message-ID: <20250703102354.1810188-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250703102354.1810188-1-archana.polampalli@windriver.com>
References: <20250703102354.1810188-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=68665a41 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=6zgkpjy-AAAA:8
 a=3VCh78rLSpcNRmjF8KkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=VIsXyf1S9QfxK1bU9KZx:22
X-Proofpoint-GUID: wiCzy-ZyaPZO01yPqJtRweUqOk_pOik6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4NSBTYWx0ZWRfX4M1UOfQLVGi5 YhYcp9D43rEHvqHlLHPhDMN3Rg5HQfnWguHIQWbjnAnk0fZcNrQNiAO00qC7pjnI5kQ8nFlUfaE UXTJM871U7/VAvhwl4aA5slBQEb9vekKjnuV0c2sWJ+wqmEu3nRBZyQa5hA9ozlLrDHW9f+fn4V
 pI/PlBDLy2YpY1P8hQfOS05lVD95di8wOQBsx7fmj9ST5VgB9wF5yoCT+PPrfTup0lZN6wFxfvK U2L4aReUpe18gQ6YldOOP8V9TPbLZLmECWQE35Ru9ukxLGn+UlHQBsuXrsOaDNNBPe3jdzG4fsW u/UwTwrIQeJ4ihp1K/TLTawnSFafvvb34cbobYowHMd2AMKmnmPrg7+454+hLQwd0YhhX33Ocf0
 95UUkzzU45GkRiRprZ1rzPBQQqsoxd430Q2pfJ+jcQpb6nl/Wy5jpDfL2sODuRUE7JFkTMET
X-Proofpoint-ORIG-GUID: wiCzy-ZyaPZO01yPqJtRweUqOk_pOik6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5633o286020656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 10:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219869

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Big Requests extension. The request length is mul=
tiplied
by 4 before checking against the maximum allowed size, potentially causin=
g an
integer overflow and bypassing the size check.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/CVE-2025-49176-0001.patch        | 93 +++++++++++++++++++
 .../xwayland/CVE-2025-49176-0002.patch        | 38 ++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-4917=
6-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-4917=
6-0002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.=
patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
new file mode 100644
index 0000000000..fd3b1d936b
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
@@ -0,0 +1,93 @@
+From 03731b326a80b582e48d939fe62cb1e2b10400d9 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 7 Apr 2025 16:13:34 +0200
+Subject: [PATCH] os: Do not overflow the integer size with BigRequest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The BigRequest extension allows requests larger than the 16-bit length
+limit.
+
+It uses integers for the request length and checks for the size not to
+exceed the maxBigRequestSize limit, but does so after translating the
+length to integer by multiplying the given size in bytes by 4.
+
+In doing so, it might overflow the integer size limit before actually
+checking for the overflow, defeating the purpose of the test.
+
+To avoid the issue, make sure to check that the request size does not
+overflow the maxBigRequestSize limit prior to any conversion.
+
+The caller Dispatch() function however expects the return value to be in
+bytes, so we cannot just return the converted value in case of error, as
+that would also overflow the integer size.
+
+To preserve the existing API, we use a negative value for the X11 error
+code BadLength as the function only return positive values, 0 or -1 and
+update the caller Dispatch() function to take that case into account to
+return the error code to the offending client.
+
+CVE-2025-49176
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
024>
+
+CVE: CVE-2025-49176
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/03731b326a80b582e48d939fe62cb1e2b10400d9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ dix/dispatch.c | 9 +++++----
+ os/io.c        | 4 ++++
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index 9e98d54..20473f1 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -513,9 +513,10 @@ Dispatch(void)
+
+                 /* now, finally, deal with client requests */
+                 result =3D ReadRequestFromClient(client);
+-                if (result <=3D 0) {
+-                    if (result < 0)
+-                        CloseDownClient(client);
++                if (result =3D=3D 0)
++                    break;
++                else if (result =3D=3D -1) {
++                    CloseDownClient(client);
+                     break;
+                 }
+
+@@ -536,7 +537,7 @@ Dispatch(void)
+                                           client->index,
+                                           client->requestBuffer);
+ #endif
+-                if (result > (maxBigRequestSize << 2))
++                if (result < 0 || result > (maxBigRequestSize << 2))
+                     result =3D BadLength;
+                 else {
+                     result =3D XaceHookDispatch(client, client->majorOp=
);
+diff --git a/os/io.c b/os/io.c
+index 841a0ee..aeece86 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -296,6 +296,10 @@ ReadRequestFromClient(ClientPtr client)
+                 needed =3D get_big_req_len(request, client);
+         }
+         client->req_len =3D needed;
++        if (needed > MAXINT >> 2) {
++            /* Check for potential integer overflow */
++            return -(BadLength);
++        }
+         needed <<=3D 2;           /* needed is in bytes now */
+     }
+     if (gotnow < needed) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.=
patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
new file mode 100644
index 0000000000..6d7df79111
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
@@ -0,0 +1,38 @@
+From 4fc4d76b2c7aaed61ed2653f997783a3714c4fe1 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Jun 2025 08:39:02 +0200
+Subject: [PATCH] os: Check for integer overflow on BigRequest length
+
+Check for another possible integer overflow once we get a complete xReq
+with BigRequest.
+
+Related to CVE-2025-49176
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Suggested-by: Peter Harris <pharris2@rocketsoftware.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
028>
+
+CVE: CVE-2025-49176
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/4fc4d76b2c7aaed61ed2653f997783a3714c4fe1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ os/io.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/os/io.c b/os/io.c
+index aeece86..67465f9 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -395,6 +395,8 @@ ReadRequestFromClient(ClientPtr client)
+                     needed =3D get_big_req_len(request, client);
+             }
+             client->req_len =3D needed;
++            if (needed > MAXINT >> 2)
++                return -(BadLength);
+             needed <<=3D 2;
+         }
+         if (gotnow < needed) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_22.1.8.bb
index 55d381f868..40f010865e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -44,6 +44,8 @@ SRC_URI =3D "https://www.x.org/archive/individual/xserv=
er/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
            file://CVE-2025-49175.patch \
+           file://CVE-2025-49176-0001.patch \
+           file://CVE-2025-49176-0002.patch \
 "
 SRC_URI[sha256sum] =3D "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e5=
8c045ad9ecaa2f73"
=20
--=20
2.40.0


