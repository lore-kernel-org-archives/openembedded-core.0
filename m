Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 378C5719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:39:32 +0000 (UTC)
X-AuditID: 0a00029b-c8dff70000007b66-25-59fc7fa02a32
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	C5.4C.31590.0AF7CF95; Fri,  3 Nov 2017 09:39:31 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 3 Nov 2017 09:39:27 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Philippe Coval <philippe.coval@osg.samsung.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] classes/npm: Fix install to use offline option
Thread-Index: AQHTVJIla/hDWuSvQUqvJ31Z8EKe9KMCtzsw
Date: Fri, 3 Nov 2017 14:39:27 +0000
Message-ID: <655290B7709079438B7932553958E60DA1380C60@ESS-EX01.essvote.corp.local>
References: <1509706432-21131-1-git-send-email-philippe.coval@osg.samsung.com>
In-Reply-To: <1509706432-21131-1-git-send-email-philippe.coval@osg.samsung.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.61]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWyRiBPQ3dx/Z9IgwP3tSzu/HzHbvH87C02
	ByaPcxtXMHps6b/LHsAUxWWTkpqTWZZapG+XwJVx7X4DU8EXkYoPP/cwNTAeFexi5OSQEDCR
	uDy3hbGLkYtDSOAoo8SBM6uhnJmMEt0/LjOBVLEJGEmcu74JLCEi0Mcose/GelaQhLCAr8TE
	K8vAbBGBAIlle9uZIGwjiTMvdjGD2CwCKhKLHp4Di/MKBEnc23ePEcQWEvCTuPjjPDuIzSng
	L/Fl4g2wOKOAmMT3U2vA6pkFxCVuPZnPBHGqgMSSPeeZIWxRiZeP/7FC2HISfRMfskPU60gs
	2P2JDcLWlli28DUzxF5BiZMzn7BMYBSZhWTsLCQts5C0zELSsoCRZRUjX66RXmpxcVl+Sape
	cn7uJkZgFHAxMM3ewdjTFHuIUYCDUYmHd8OE35FCrIllxZW5hxilOViUxHkXX+uMFBJITyxJ
	zU5NLUgtii8qzUktPsTIxMEJIrikGhi7Xzwy4NXOZ9A4vva8ojRvBsMDXmen9Sdbr7DtOvHf
	9bhHRPjcGtadEts+2OsG8vy2EFArkfh2aw/TVpboBbNy+T0P/X3b0zvnQ/cOAZ7NU1iVT604
	MOfVHJUbfPdz5izjdDixcHv9xcNhX1YeehRnuf5DvfshC5F/IfN+Z3tyFquWGTk2dXxUYinO
	SDTUYi4qTgQAh+mhlmgCAAA=
Subject: Re: [PATCH] classes/npm: Fix install to use offline option
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
X-List-Received-Date: Fri, 03 Nov 2017 14:39:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Npm v4/v6 have a patch to allow the --no-registry to work.  It was taken ou=
t in the transition to Node 8 since the cache system is completely differen=
t.
Unfortunately this doesn't work for nodev8 / npmv5 so the offline build on =
master/rocko is completely broken.
I am trying to get something working by adding the dependency tar.gz direct=
ly into the cache manually before the build, but I am running into a npm bu=
g.
https://github.com/nodejs/help/issues/944


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Philippe Coval
Sent: Friday, November 03, 2017 5:54 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] classes/npm: Fix install to use offline option

Option --no-registry seems deprecated or even non supported for ages,
while --offline fixed the problem on install task.

Issue can be reproduced using:

  devtool add "npm://registry.npmjs.org;name=3Depoll;version=3Dlatest"
  bitbake epoll

  | DEBUG: Executing shell function do_install
  (...)
  | npm ERR! argv ".../node" ".../npm" "install" (...) "--production" "--no=
-registry"
  | npm ERR! node v6.11.0
  | npm ERR! npm  v3.10.10
  | npm ERR! registry URL is required

And also from log file ".../epoll/1.0.0-r0/npmpkg/npm-debug.log":

   silly mapToRegistry using default registry
   41 silly mapToRegistry registry null
   42 verbose stack AssertionError: registry URL is required
   42 verbose stack     at Conf.getCredentialsByURI (.../get-credentials-by=
-uri.js:8:3)

More relevent insights:
https://github.com/npm/npm/issues/2568#

Signed-off-by: Philippe Coval <philippe.coval@osg.samsung.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedb..dfd1ffe 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -45,7 +45,7 @@ npm_do_install() {
 	# be created in this directory
 	export HOME=3D${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
-	npm install --prefix ${D}${prefix} -g --arch=3D${NPM_ARCH} --target_arch=
=3D${NPM_ARCH} --production --no-registry
+	npm install --prefix ${D}${prefix} -g --arch=3D${NPM_ARCH} --target_arch=
=3D${NPM_ARCH} --production --offline
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
--=20
1.9.1

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

