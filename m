Return-Path: <jin@mediatomb.cc>
X-Greylist: delayed 390 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Oct 2015 15:19:38 UTC
Received: from static.88-198-224-151.clients.your-server.de
	(static.88-198-224-151.clients.your-server.de [88.198.224.151])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE81608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 15:19:38 +0000 (UTC)
Received: by static.88-198-224-151.clients.your-server.de (Postfix,
	from userid 500)
	id 499EB1A00F0; Mon, 26 Oct 2015 16:13:07 +0100 (CET)
Date: Mon, 26 Oct 2015 16:13:07 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151026151307.GA16394@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-12-10)
Subject: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Mon, 26 Oct 2015 15:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I recently ran into a problem that I described here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8578 and while debugging
this issue an other problem came to light.

I have a multimachine configuration (armv5/imx6) and the same distro for both
of them (poky 2.0 RC based).

I have some allarch packages which have no DEPENDS, however which have an
RDEPENDS_${PN} setting.

I can see that even though there were no changes to the recipe itself and 
also no changes to the recipes listed in RDEPENDS, my recipe still gets 
rebuilt each time.

What we tried:

<bluelightning> so cleansstate the recipe, change machine, cleansstate again,
                then build it, then change machine, build it again and note
                the first task that executes

The logs for these steps, one with RDEPENDS and one without are at the end of
this mail. I can see that with present RDEPENDS "real" tasks get executed
even though no changes occured in the recipe; this is not the case when I 
drop RDEPENDS.

Is this a bug or is this just something that needs to be documented?
What is the "desired" behaviour?

Kind regards,
Sergey


What I get with RDEPENDS is:

***********
NOTE: Running setscene task 347 of 374 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 374 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_packagedata_setscene)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_populate_sysroot_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_packagedata_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 374 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_package_setscene)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_setscene: Succeeded
NOTE: Running task 1175 of 1181 (ID: 14, /oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_package_write_ipk)
NOTE: Running task 1176 of 1181 (ID: 9, /oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_package_qa)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_write_ipk: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_qa: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_qa: Succeeded
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1179 of 1181 (ID: 10, /oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_build)
NOTE: Running task 1180 of 1181 (ID: 11, /oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_rm_work)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_rm_work: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_rm_work: Succeeded
NOTE: Running task 1181 of 1181 (ID: 12, /oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_rm_work_all)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_rm_work_all: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_rm_work_all: Succeeded
***********

We can see that some "real" tasks are getting executed (do_package_write_ipk).

Now, when I remove the RDEPENDS from my recipe the log gets much shorter:

***********
NOTE: Running setscene task 73 of 76 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_populate_sysroot_setscene)
NOTE: Running setscene task 74 of 76 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_package_write_ipk_setscene)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_populate_sysroot_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 75 of 76 (/oe/dss-oe/yocto/dS/meta-digitalstrom-devel/recipes-digitalstrom/dss11-help/dss11-installation-manual-tr-tr_0.9.bb, do_packagedata_setscene)
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_packagedata_setscene: Started
NOTE: recipe dss11-installation-manual-tr-tr-0.9-r2: task do_packagedata_setscene: Succeeded
***********

Here no "real" tasks get executed.


