Return-Path: <prvs=2023e75b6a=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 69C3D731D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 21:24:22 +0000 (UTC)
X-AuditID: 0a000213-f79d76d0000013de-d8-57a26105f9f8
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	7D.64.05086.50162A75; Wed,  3 Aug 2016 16:24:21 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 3 Aug 2016 16:24:21 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][krogoth][master][PATCH] peusdo: Add nobody user and
	group
Thread-Index: AQHR7c1mUOsvVq2jmkO0jT9Uh08Z9w==
Date: Wed, 3 Aug 2016 21:24:21 +0000
Message-ID: <1470259405-15271-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWyRiBPQ5c1cVG4wbqDkhZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8b5d99YCn5zVHw+eY21gfELexcjJ4eEgInEt++voWwxiQv3
	1rN1MXJxCAmcYJQ4/e4HC4Qzk1FiyZwtYFVsAkYS565vYgSxRQSiJZbOmAkWZxYwkHi3eSMr
	iC0s4CNxcscRVoiaYInv3ddYIGw9iUX/lwBt4OBgEVCR+PhEHiTMK+Apcf3KBzYQmxHoiO+n
	1jBBjBSXuPVkPhPEcQISS/acZ4awRSVePv7HCmHLSnzbMYUFol5P4sbUKWwQtrbEsoWvmSHm
	C0qcnPmEZQKjyCwkY2chaZmFpGUWkpYFjCyrGAVzEzNzDPVSi4vL8ktS9ZLzczcxAoOei4FJ
	eAfjnCm2hxgFOBiVeHgDoheFC7EmlhVX5h5ilOZgURLnVRFSChcSSE8sSc1OTS1ILYovKs1J
	LT7EyMTBeYhRgoNLSqQ4NS8ltSixtCQjHhRb8cXA6JJqYHTNvL/yxdb4j6cmfEmq2XXk+xej
	R7NP6zLu5FnKorxvR0iMU6+SjNcv+T9mMdKR8fNX8X7++Pe3o15Ep+fs3S2RXVfDdk4NK+f+
	29krmTGxTnaJhOVHF35nidT0/Jebz8zVskvaxJixQVf3QbroOvVJLh2d/ofmssRPWDA5/9eC
	57EvVwkfsVZiKc5INNRiLipOBAB3N0bAdgIAAA==
Subject: [krogoth][master][PATCH] peusdo: Add nobody user and group
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
X-List-Received-Date: Wed, 03 Aug 2016 21:24:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Nodejs expects the user and group nobody to exist on global install command=
s.
The target build work work as base-passwd contained it, however the fallbac=
k passwd did not.
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

