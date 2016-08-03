Return-Path: <prvs=9023ee1d74=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 10E34731D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 21:26:57 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-a0-57a261a1057c
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	7C.7B.03522.1A162A75; Wed,  3 Aug 2016 16:26:57 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 3 Aug 2016 16:26:57 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][krogoth][master][PATCHv2] pseudo: Add nobody user
	and group
Thread-Index: AQHR7c3DIWbNfSdIKEaxD5luTtg3dQ==
Date: Wed, 3 Aug 2016 21:26:57 +0000
Message-ID: <1470259580-15389-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRiBPQ3dh4qJwg4cTTC3u/HzH7sDocW7j
	CsYAxihum6TEkrLgzPQ8fbsE7oxpS+IKvnNUXDhxlr2B8SN7FyMnh4SAicSSl4uYIWwxiQv3
	1rN1MXJxCAkcZZQ41d7PDuHMZJT49egpWBWbgJHEueubGEFsEYFoiaUzZoJNYhYwkHi3eSMr
	iC0sECBx/xrEBhGBUIkLM+ewQth6EnM2b2MBsVkEVCTOHLkOFucV8JQ43P2YCcRmBLri+6k1
	TBAzxSVuPZnPBHGdgMSSPeehLhWVePn4HyuELSvxbccUFoh6PYkbU6ewQdjaEssWvmaGmC8o
	cXLmE5YJjCKzkIydhaRlFpKWWUhaFjCyrGLkyzXSSy0uLssvSdVLzs/dxAgMdy4Gptk7GPdM
	cDjEKMDBqMTDGxC9KFyINbGsuDL3EKM0B4uSOK+KkFK4kEB6YklqdmpqQWpRfFFpTmrxIUYm
	Ds5DjBIcXFIixal5KalFiaUlGfGgqIovBsaVVANjtfwR6Zgp/H0TVt1PEcl+9bJO8Xr/4pUp
	Hu1dM0wsL1++xpAXcrvy8Y1Zp9Y3GPo8UO5323Ca3+fKxiMV/tNc5OKS1hzXyJluwzld0D9n
	ws1FicxSYYZzwyJZUt9Fyk9ZYV4ZU3HmXPpd9w3dB1QjipXPJ60X7es+mRdvH/05Y/vimxOL
	TPyVWIozEg21mIuKEwGfWHgucwIAAA==
Subject: [krogoth][master][PATCHv2] pseudo: Add nobody user and group
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
X-List-Received-Date: Wed, 03 Aug 2016 21:26:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Nodejs expects the user and group nobody to exist on global install command=
s.
The target build works as base-passwd contained it, however the fallback pa=
sswd did not.
This broke the SDK if nodejs was included.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/recipes-devtools/pseudo/files/fallback-group  | 1 +
 meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/files/fallback-group b/meta/recip=
es-devtools/pseudo/files/fallback-group
index 81bf732..bb3dbca 100644
--- a/meta/recipes-devtools/pseudo/files/fallback-group
+++ b/meta/recipes-devtools/pseudo/files/fallback-group
@@ -1,2 +1,3 @@
 root:*:0:
 mail:*:8:
+nobody:*:99:
diff --git a/meta/recipes-devtools/pseudo/files/fallback-passwd b/meta/reci=
pes-devtools/pseudo/files/fallback-passwd
index c1458dc..0889c57 100644
--- a/meta/recipes-devtools/pseudo/files/fallback-passwd
+++ b/meta/recipes-devtools/pseudo/files/fallback-passwd
@@ -1 +1,2 @@
 root::0:0:root:/home/root:/bin/sh
+nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
--=20
2.5.5

