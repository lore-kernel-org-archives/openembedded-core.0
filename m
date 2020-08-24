Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.3128.1598311774880265493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07ONTUA2010752
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 18:29:31 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 0/5] Allow PR Service and hash equiv together
Date: Mon, 24 Aug 2020 18:29:25 -0500
Message-Id: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Before PR service didn't work reliably with hash equivalency.  Generally
you ended up with results that may not be reproducible, even if you
started with the same PR service database and hash equivalency database.

Overtime, intermediate PR values would be created that would cause thing
to get out of sync in the case of certain rebuilds or other corner cases.

The set refactors the PR service to work along side the new hash equiv
system.  It moves the PR and AUTOINC lookup to AFTER the do_package task
is complete.  This allows us to use the do_package unihash for lookup.

Additionally this fixed a small issue with the kernel, where the PR value
could get incremented twice.  The fix is an artifact of the other changes
that cause us to only run the PR service work once per recipe.

This has been tested with the following workflow, which covers one of
the critical corner cases for me:

configure local.conf with:

   BB_HASHSERVE = "auto"
   BB_SIGNATURE_HANDLER = "OEEquivHash"
   
   PRSERV_HOST ??= "localhost:0"
   
   INHERIT += "reproducible_build"
   INHERIT += "buildhistory"

bitbake glibc linux-yocto

# Modify meta/recipes-core/glibc/glibc_2.32.bb, add a comment
# to the do_patch_append().  This will taint the hash of this
# function.

bitbake glibc linux-yocto

# The system should have detected the output was the same, and
# no proceed past do_package in glibc.  The kernel should not
# have built at all.

# Store/mv the tmp and sstate-cache from that build elsewhere
# repeat the run

bitbake glibc linux-yocto

# Compare the results of tmp/deploy/<package>/* between last
# and current run.
#
# The contents should be the same (filenames specifically).
#
# Also the kernel should be r0.0, not r0.1.

Note: if the hash equivalency database or PR server database (located
in the cache directory) is removed, the values may not be the same
as the previous run.

Additionally while testing the various package_*.bbclass files, it
was noted that package_tar.bbclass was not working the same way as
the others.  This was correct as a standalone patch.

Mark Hatle (5):
  package_tar.bbclass: Sync to the other package_* classes
  hash equivalency and pr service
  package.bbclass: Move package_get_auto_pr to packagedata.bbclass
  package / packagedata bbclass: Change the way PRAUTO and AUTOINC are
    handled
  buildhistory.bbclass: Rework to use read_subpackage_metadata

 meta/classes/buildhistory.bbclass |  49 ++++++------
 meta/classes/kernel.bbclass       |   4 +-
 meta/classes/nopackages.bbclass   |   1 +
 meta/classes/package.bbclass      | 120 +++++++++++++++---------------
 meta/classes/package_tar.bbclass  |  11 +--
 meta/classes/packagedata.bbclass  |  69 +++++++++++++++++
 meta/conf/bitbake.conf            |   1 +
 meta/lib/oe/packagedata.py        |   8 +-
 meta/lib/oe/sstatesig.py          |   2 +
 9 files changed, 169 insertions(+), 96 deletions(-)

-- 
2.17.1

