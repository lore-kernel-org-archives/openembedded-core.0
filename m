Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62F0C6FA8E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 03:20:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.82239.1677468033146410261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 19:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oJ9PFDcS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=142213231d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R34hIA022320
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=WG1cpQST4o2VgizRfQvSl+MW3YjT3pLPNH5d21FTHZk=;
 b=oJ9PFDcSCHJmPxge/6cyHCd68YJwlD8UMb4Z96za+9x/+llRAGSVHK7EdDLNr/KBTfNS
 ANUsMzzYBa1rV7qH32tZCLvnSUXNF0MYwa5jXgASZxHkpasvl8CuQBK6bjhQORtKh0P+
 cQPfBEWnveCexrKrGrSNo1u7RY1UV6kspFkTr5LsnJwYzxhwf6mERNu6QIXdwl1q0w+T
 SkcgERPC6f+ACI9uEC49eVXiR8ESZSZ8fsJXcXP5t/6vE5h5+4UvXwP4ZGqOF3vW5jhS
 jVfDfdPS9eM4DHmBxHmzeEPW3+zcBpzxcZ4oLJgY+/Be10/8CL8ZcA6L+OhP0Uk7ZTzt CA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk9gg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:20:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sun, 26 Feb 2023 19:20:31 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 26 Feb 2023 19:20:30 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libsdl2: fix CVE-2022-4743
Date: Mon, 27 Feb 2023 11:20:29 +0800
Message-ID: <20230227032029.2364437-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fugU7cstvWtPZOwipVrpDvYbKbI18NSo
X-Proofpoint-ORIG-GUID: fugU7cstvWtPZOwipVrpDvYbKbI18NSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=5 mlxlogscore=800 clxscore=1011 bulkscore=5
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177770

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ial-memory-leak-in-GLES_CreateTextur.patch | 40 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch
new file mode 100644
index 0000000000..31bda54dd3
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch
@@ -0,0 +1,40 @@
+From 3cf2048b647484cc3a6abd0d78be60cead47b42d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 24 Feb 2023 16:59:19 +0800
+Subject: [PATCH] Fix potential memory leak in GLES_CreateTextur
+
+CVE: CVE-2022-4743
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/00b67f55727bc0944c3266e2b875440da132ce4b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/render/opengles/SDL_render_gles.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/render/opengles/SDL_render_gles.c b/src/render/opengles/SDL_render_gles.c
+index a6b58f2..237b1d6 100644
+--- a/src/render/opengles/SDL_render_gles.c
++++ b/src/render/opengles/SDL_render_gles.c
+@@ -368,6 +368,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+     renderdata->glGenTextures(1, &data->texture);
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++           SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glGenTextures()", result);
+     }
+@@ -396,6 +399,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+ 
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glTexImage2D()", result);
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index c1c827af79..abcf232e25 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -24,6 +24,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
+           file://0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch \
            "
 SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
 
-- 
2.25.1


