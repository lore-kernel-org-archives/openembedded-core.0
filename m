Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U7Zpb-0007HQ-NS for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 00:09:10 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1IMxCSX028045; Mon, 18 Feb 2013 22:59:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qWDaOfFEck0w; Mon, 18 Feb 2013 22:59:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1IMwvMf028023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Feb 2013 22:59:13 GMT
Message-ID: <1361194088.5927.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2013 13:28:08 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.6.3-1 
Subject: [PATCH RFC] image: Enable fakeroot for the devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 23:09:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The rootfs task runs under fakeroot. This converts the devshell to do the same,
allowing the user easier debugging of problems like permissions for example.

I'm really after to provoke some discussion with this patch. There are a
variety of cases where it would be desirable to run devshell in fakeroot
context. This patch enables it for one, the image generation case but
there are others.

We have several options:

a) Add these in on a case by case basis. Image generation is one which
is clearly makes sense to me.
b) Always enable fakeroot for devshell. The downside is some calls
accessing the user's session won't work properly. You'd have to run
those in the form "PSEUDO_UNLOAD=1 <command>"
c) Add a new fakerootdevshell task which sits along side devshell but
starts devshell with fakeroot privileges.

Adding a new task is relatively expensive in parsing performance and in
runqueue generation. I'm not sure whether there is enough of a case for
two different tasks or that it would user friendly. I'm therefore
seriously considering b) but would be interested in the opinions of
others. The attached patch implements a) as a proof of concept. b) would
be just adding those lines to devshell.bbclass instead.

Regardless of which we pick, we need to document it, cc'ing Scott s he
knows there is a change in this area brewing and needed before release.

[YOCTO #3374]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index dd78acb..0d737c3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -184,6 +184,9 @@ do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
 do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
 do_build[nostamp] = "1"
 
+do_devshell[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+do_devshell[fakeroot] = "1"
+
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"




