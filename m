Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QM72B-0006xG-L6 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 01:17:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GNDssR025134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:13:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24987-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:13:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GNDgcK025128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:13:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
Date: Tue, 17 May 2011 00:13:39 +0100
Message-ID: <1305587619.3424.134.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate breakage with multimachine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 23:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 13:20 +0200, Koen Kooi wrote:
> This bug gets reintroduced every other week, so let's try to fix it
> properly this time. The situation:
> 
> 2 machines (beagleboard, pandaboard) using the same base architecture
> (armv7a).
> 
> step 0: rm build pseudone -rf
> step 1: MACHINE=beagleboard bitbake console-image
> step 2: MACHINE=omap4430-panda bitbake console-image
> 
> Step 0 and 1 work great, but I can't get step 2 to work. Attached is
> the complete output of step 2. As you can see without any updates to
> the repositories it wants to rebuild (e)glibc.
> 
> Why does it wants to rebuild all that? Why does it fail?

I had a look at this. Firstly, I figured out I needed an incantation to
reproduce which turned out to be:

git clone git://git.angstrom-distribution.org/setup-scripts
git checkout oe-core
MACHINE=beagleboard ./oebb.sh config beagleboard
MACHINE=beagleboard ./oebb.sh bitbake console-image -S
MACHINE=omap4430-panda ./oebb.sh bitbake console-image -S

I added the -S option to dump sigdata files into the stamp directory so
I didn't need to run two builds before being able to look at this. Sure
enough, if you look
at /media/build2/builds/angstrom/setup-scripts/build/tmp-angstrom_2010_x/stamps/all-angstrom-linux-gnueabi
update-rc.d* then the do_populate_lic task is duplicated as are the
do_package and its subsequent tasks.

Diffing the do_populate_lic task, it shows DEPLOY_DIR_IMAGE has a
dependency on the MACHINE variable so its correctly rerunning the task
for that reason. This is an Angstrom specific change and adding: 

 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
+DEPLOY_DIR_IMAGE[vardepsexclude] = "MACHINE"
 
to conf/distro/include/angstrom.inc makes it go away. I'm not claiming
its the correct fix, it just proves where the problem is.

Secondly, the do_package task was depending on eglibc do_package. This
is almost certainly due to the default dependencies on things like
virtual/libc which we add. Being an "all" PACKAGE_ARCH, it clearly
doesn't depend on this so adding INHIBIT_DEFAULT_DEPS = "1" to the
update-rc.d recipe removed that problem and meant packaging didn't
rerun.

Further investigation is needed and these fixes need some thought and
creation of proper patches but hopefully this gives a handle on whats
going on and it turns out its not that hard to figure out (although some
scripts to compare two such runs would be interesting and/or some proper
test cases).

Note that the DEPLOY_DIR_IMAGE[vardepsexclude] is not correct. The
do_populate_lic task is putting files into the directory and the system
is therefore totally correct in deciding that the task needed to rerun
as the files were being placed in a different directory. do_populate_lic
could likely use some work in that regard as I'm not sure this is the
right place to be putting its data though.

Cheers,

Richard



