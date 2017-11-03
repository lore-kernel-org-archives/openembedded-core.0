Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id B5C8A7835E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 22:03:11 +0000 (UTC)
X-AuditID: 0a000213-591ff7000000040f-20-59fce79af35f
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	34.05.01039.A97ECF95; Fri,  3 Nov 2017 17:03:09 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 3 Nov 2017 17:03:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Philippe Coval <philippe.coval@osg.samsung.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] classes/npm: Fix install to use offline option
Thread-Index: AQHTVJIla/hDWuSvQUqvJ31Z8EKe9KMCtzswgAB88sA=
Date: Fri, 3 Nov 2017 22:03:06 +0000
Message-ID: <655290B7709079438B7932553958E60DA1380FCE@ESS-EX01.essvote.corp.local>
References: <1509706432-21131-1-git-send-email-philippe.coval@osg.samsung.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.61]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRiBPQ3fu8z+RBq2LBSzu/HzHbvH87C02
	ByaPcxtXMHps6b/LHsAUxWWTkpqTWZZapG+XwJXxY/Ff5oJrMhVPnuxjamC8J97FyMkhIWAi
	8fjANdYuRi4OIYETjBJ9Gx6zgCSEBGYySmzfGQtiswkYSZy7vokRpEhEoI9RYt+N9awgCWEB
	X4mJV5aB2SICARLL9rYzdTFyANlWEicmSYOEWQRUJI4+ncwMYvMKBEmsfzaXEWK+v8SPuy3s
	IDajgJjE91NrmEBsZgFxiVtP5jNBHCcgsWTPeWYIW1Ti5eN/rBC2nETfxIfsEPU6Egt2f2KD
	sLUlli18DbVLUOLkzCcsExiFZyEZOwtJyywkLbOQtCxgZFnFKJibmJljqJdaXFyWX5Kql5yf
	u4kRGO5cDEzCOxgXzIg9xCjAwajEw7thwu9IIdbEsuLK3EOM0hwsSuK8i691RgoJpCeWpGan
	phakFsUXleakFh9iZOLgBBFcUg2Ma48eCPlqX6N2+sIOY0kWV+55ly4Uznk+w/7M4fPME+LO
	hMqddHr46XXo/MDj67b6O+/ZrmzIHVkUpGNpnMuttfzPkTXiLjN/N3gKuR40iE27kVXIwCnr
	3vX79Jxc79uvfKbfZk4/dUpT7gj7o8lnqttsq67IOhSXbPqiW7xHnt/3oL3vbcOHSizFGYmG
	WsxFxYkAyaqiCl0CAAA=
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
X-List-Received-Date: Fri, 03 Nov 2017 22:03:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just an update on this for Philippe and any interested parties.
I started down the line of grabbing the patch and was indeed able to get th=
e tars to add into the cache.  I was also able to get the system to build o=
ffline with some manual tweaking.
The main issue I am running into now is that we need a full shrinkwrap afte=
r npm install to get the proper information for the cache to pick things up=
.
This will cause pretty sizable rewrites to how the npm fetcher currently fu=
nctions, maybe the recipe generator too.

It will be awhile before I have the free time to attempt to something like =
that so if anyone wants to pick up where I left off send me an email.=20
I can supply you with details of what I have done so far.


-----Original Message-----
From: Davis, Michael=20
Sent: Friday, November 03, 2017 9:39 AM
To: 'Philippe Coval'; openembedded-core@lists.openembedded.org
Subject: RE: [OE-core] [PATCH] classes/npm: Fix install to use offline opti=
on

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

