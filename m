Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADDAD6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NDLhXK020993; Tue, 23 Sep 2014 14:21:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mGHonFbQQoWE; Tue, 23 Sep 2014 14:21:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NDLc4A020989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 23 Sep 2014 14:21:40 +0100
Message-ID: <1411478501.15825.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Steffen
	Sledz <sledz@dresearch-fe.de>
Date: Tue, 23 Sep 2014 14:21:41 +0100
In-Reply-To: <54216293.4040907@dresearch-fe.de>
References: <54216293.4040907@dresearch-fe.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Lianhao Lu <lianhao.lu@intel.com>
Subject: Re: hash generation/PR service problem with xuser-account and other packages
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
X-List-Received-Date: Tue, 23 Sep 2014 13:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-23 at 14:07 +0200, Steffen Sledz wrote:
> As i mentioned in another thread before we're investigating some problems related with package versions going backwards using a PR service.
> 
> Now i have some more information. But i'm not able to understand and fix the problem for myself.
> 
> Assume we have a clean workspace and i bitbake the xuser-account package with this command:
> 
>   MACHINE="foo" bitbake xuser-account
> 
> This generates these packages (the 207 comes from our PR service).
> 
>   tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.207_all.ipk
>   tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.207_all.ipk
>   tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.207_all.ipk
> 
> If i call the same bitbake command again, the same packages are generated. Fine!
> 
> Now i call:
> 
>   MACHINE="bar" bitbake xuser-account
> 
> The generated packages now get a new number from the PR server (so they have a different hash i believe).
> 
>   tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.208_all.ipk
>   tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.208_all.ipk
>   tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.208_all.ipk
> 
> But this package does not seem to be machine dependent!?
> 
> If the next build for machine foo is a clean build again (e.g. on our Jenkins continuous integration server which makes clean builds once a week) the PR service generated number wents back to 207 which results in:
> 
>   "ERROR: QA Issue: Package version for package xuser-account went backwards which would break package feeds"
> 
> Can someone confirm this behaviour?
> 
> Is this a bug? I think so.
> 
> Can someone give some details what went wrong here? Also after studying <http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#checksums> i was not able to fully understand the background, not to speak of fixing something.
> 
> BTW: We see the same behaviour for the cpufreq-tweaks, linux-firmware, run-postinsts, and some of our own packages.

I just took a look at this on master. There are some changes between
master and daisy and I want to get this resolved in master before we
think about daisy. I thought walking through debugging this may be
helpful, so, I did:

MACHINE=qemux86 bitbake xuser-account
MACHINE=qemuarm bitbake xuser-account

and sure enough, you are correct, things rebuild and they should not for
an allarch package like this. Looking at the list of packages being
built, its pulling in the toolchain. I checked:

MACHINE=qemuarm bitbake xuser-account -e | grep INHIBIT_DEFAULT_DEPS

and sure enough, that is set (as per allarch.bbclass) so why is it
building the toolchain?! It has to be a dependency, so:

MACHINE=qemuarm bitbake xuser-account -e | grep DEPENDS=

and in there we see:

DEPENDS="  base-files base-passwd shadow-native shadow-sysroot shadow"

base-files is whitelisted in conf/layer.conf as a dependency we don't
need to checksum. The checksum of shadow-native isn't an issue, the
others however are a problem. Since they have well behaved APIs, we can
add them to the list in layer.conf.

What this does mean is that if shadow rebuilds, xuser-account will not
rebuild automatically. I don't believe that should be an issue.

After doing this, I reran the bitbake commands and then:

ls tmp/stamps/all-poky-linux/xuser-account/

shows things like:

0.1-r0.do_populate_sysroot.978b6f9bfd5282121de701a24dc52c80.qemuarm
0.1-r0.do_populate_sysroot.978b6f9bfd5282121de701a24dc52c80.qemux86


basically, the stamp hashes should not change between the two bitbake
commands. SO the patch needed to fix xuser is:

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9143bdb..4deee89 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -31,6 +31,9 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   packagegroup-x11-xserver \
   systemd-serialgetty \
   initscripts \
+  shadow \
+  shadow-sysroot \
+  base-passwd \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \

The other recipes will need investigating since I doubt its this issue
for them.

Cheers,

Richard



