Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Nov 2017 22:11:49 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id AD60471DEE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:11:49 +0000 (UTC)
X-AuditID: 0a000213-591ff7000000040f-a3-59fa431d7d3f
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	AC.B3.01039.D134AF95; Wed,  1 Nov 2017 16:56:47 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 1 Nov 2017 16:56:45 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] npm.bbclass: Force cache clear
Thread-Index: AQHTU1xPq/kn1nXKA0GmlrRu3dS/hQ==
Date: Wed, 1 Nov 2017 21:56:45 +0000
Message-ID: <20171101215632.10549-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.97]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsWyRiBPQ1fe+VekwfQ/ohZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXRuPVrSwF6zgqLu1qY25gfMPWxcjJISFgIjGj6zCQzcUhJHCC
	UWLL9yZGkISQwExGiR19ySA2m4CRxLnrm8DiIgLREktnzGQHsZkFDCTebd7ICmILC1hIbD8x
	nxmixlaibfIEJghbT+J+52awehYBFYlzM+6C2bwCdhIrNrwFm8koICbx/dQaJoiZ4hK3nsxn
	gjhOQGLJnvPMELaoxMvH/1ghbDmJB39PQ9XrSdyYOoUNwtaWWLbwNTPEfEGJkzOfsExgFJ6F
	ZOwsJC2zkLTMQtKygJFlFaNgbmJmjqFeanFxWX5Jql5yfu4mRmBoczEwCe9gXDAj9hCjAAej
	Eg/vAfVfkUKsiWXFlbmHGKU5WJTEeRdf64wUEkhPLEnNTk0tSC2KLyrNSS0+xMjEwQkiuKQa
	GKdpnowvqNxooxnS+e3CzTseR7Yv8mzyuz8//HDcK1tbq4unZsnrH9hfER5mq7Ay8L9Tb2Ev
	w3+5FJO9UiwBgo23v607ZuJoM/OpFmOypsajS8UzLiyJC3v2NuLF+ZjdD7JmrTxxY1Hg9x9L
	DV6Zz5mybMfXkhDNlu4X2opOso/TLs0pWf5AaoMSS3FGoqEWc1FxIgACXLNsUwIAAA==
Subject: [PATCH] npm.bbclass: Force cache clear
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
X-List-Received-Date: Wed, 01 Nov 2017 22:11:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fixes the following issue when trying to build npm based recipes:
| npm ERR! As of npm@5, the npm cache self-heals from corruption issues and=
 data extracted from the cache is guaranteed to be valid. If you want to ma=
ke sure everything is consistent, use 'npm cache verify' instead.
| npm ERR! If you're sure you want to delete the entire cache, rerun this c=
ommand with --force.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedbb28..e5a10dd392 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -31,7 +31,7 @@ npm_do_compile() {
 	fi
 	npm set cache ${WORKDIR}/npm_cache
 	# clear cache before every build
-	npm cache clear
+	npm cache clear --force
 	# Install pkg into ${S} without going to the registry
 	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
 		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --no-registry insta=
ll
--=20
2.13.6

