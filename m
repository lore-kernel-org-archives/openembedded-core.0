Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1EBF6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 15:13:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jun 2016 08:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,552,1459839600"; d="scan'208";a="131306221"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2016 08:13:42 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7be77d90-7458-0427-8a34-11fa771874e0@linux.intel.com>
Date: Thu, 30 Jun 2016 18:13:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
Subject: oe-core package maintenance Q&A document
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
X-List-Received-Date: Thu, 30 Jun 2016 15:13:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello world,

I've written a brief Q&A about how package maintenance works in
OpenEmbedded-core. I would really appreciate any suggestions about what
needs to be changed, added, or expanded - then this can go into Yocto
blog for example.

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbeddedOpenembbedded-core
package maintenance

1. What is the recipes' version update policy?

In the master branch, the policy is to try to stay as close to
latest upstream versions as possible (excluding development and
pre-release versions) at all times except Yocto freeze periods.
It's totally fine and expected to update a recipe to the latest
version even if there is no specific need for it, and there is a
possibility of new problems caused by the update.

This is done for two reasons:

- oe-core gets all the work done upstream as quickly as possible:
new features, bugfixes, and particularly security fixes. Oe-core
keeps up with the times and stays in touch.

- it is far, far easier to update packages in small, incremental steps
than go from an old version to a much newer version, both for technical
reasons (the recipe needs to accommodate all the changes that happened 
at once, so writing and testing them takes a lot of time and effort), 
and political reasons (users of oe-core are much more reluctant to 
accept dramatic changes, particularly when they break things for them).

2. Who is doing the work?

In openmbedded-core there is no formal assignment of recipes to 
maintainers. Anyone can send a version update patch to oe-core mailing 
list for review and testing.

However, Poky distro does have a list of recipe maintainers:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-poky/conf/distro/include/maintainers.inc

Those are the people who are doing most of the work on particular
recipes and know their inner workings well. Typically they also take 
care of updating to newer versions.

3. How to find out if the recipe is in need of an update to a later version?

Openembedded-core has utility libraries that query upstream webpages or
git repositories and figure out what is the current latest versions. To 
use them, add

INHERIT+= "distrodata"

to your conf/local.conf

and run

bitbake -c checkpkg <recipe>

The results will be written into <build directory>/tmp/log/checkpkg.csv
- the second and third field are the current oe-core version and the 
latest upstream version.

There is also a web service that checks all recipes against upstream
every day:

http://recipes.yoctoproject.org
(currently broken because it needs to be ported to Python 3)

The service provides overall statistics, and allows filtering by recipe
status and maintainer name.

4. How to update a recipe to a later version?

At most basic, you need to do the following:

a. Rename the recipe filename, so that the filename refers to a later
version.

b. If the sources are taken from git repository, update SRCREV to a git
commit id that corresponds to the new version.

c. Try to build the recipe; if the sources are taken from a tarball,
then the build will print the new tarball checksums that need to be 
written into the recipe's SRC_URI[md5sum] and SRC_URI[sha256sum] lines.

d. Try to build the recipe again; occasionally the build will succeed,
but often it's not that simple. A common problem is that custom patches 
provided through the recipe no longer apply to the source code; in that 
case they need to be rebased against the new version, or dropped 
entirely, if the source code already contains the fixes. Such rebasing 
can be done by commenting the patches out from the recipe and then using 
'devtool modify', and applying the patches by hand to an external source 
tree that 'devtool modify' creates.

e. When the recipe finally builds without error, it's often a good idea
to build an image that contains it and to check that the image still 
boots, and the recipe still functions.

f. Then the update can be send as a patch for review to the oe-core
mailing list:
Remember to follow the guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Regards,
Alex


