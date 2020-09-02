Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.10490.1599060804842243006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 082FXM9n003166
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Sep 2020 10:33:23 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v8 0/1]
Date: Wed,  2 Sep 2020 10:33:21 -0500
Message-Id: <20200902153322.55112-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

v8:

Only one patch left...  Was found that in some configurations the
prservice oe-selftest (prservice.BitbakePrTests) was failing.  Fix
the issue, by changing the way the test case configures itself to ensure
it will work with both unihash on and off.  (Before it only worked with
it off.)

v7:

Update packagedata_translate_pr_autoinc function to handle when there is no
pkgdata to process.

Exception: bb.process.ExecutionError: Execution of '/mnt/b/yoe/master/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.packagedata_translate_pr_autoinc.2499440' failed with exit code 123:
sed: no input files
WARNING: /mnt/b/yoe/master/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.packagedata_translate_pr_autoinc.2499440:151 exit 123 from 'xargs sed -e 's,@PRSERV_PV_AUTOINC@,AUTOINC,g' -e 's,@EXTENDPRAUTO@,.0,g' -i'

Uses the --no-run-if-empty options for xargs.

v6:

Refactor do_packagedata to use existing copy routine, and then sed "inline" to
translate EXTENDPRAUTO and AUTOINC parts.

v5 (not sent to mailing list):

Refactor do_packagedata and create a custom copy routine.  The routine also
uses sed to translate EXTENDPRAUTO and AUTOINC.  This also introduces changes
to the new package_convert_pr_autoinc to always translate PRSERV_PV_AUTOINC
and EXTENDPRAUTO to @PRSERV_PV_AUTOINC@ and @EXTENDPRAUTO@.  So all users of
the do_package components will see this translated version.

Remove the commit that moved package_get_auto_pr into the packagedata.bbclass.

v4 (not sent to mailing list):

rename package_convert_autoinc to package_convert_pr_autoinc.

Revert the creation of 'exclude_pkgdata_vars', and all of the custom 
processing of the excluded variables.

(prior patch 1 and 2 were merged, so no longer part of this.

v3 (not sent to mailing list):

Address all patch comments from the list, except for the 'sed' refactor
items.

v2:

Most comments have been addressed to create a v2 version.  I've refactored
the commits to make a few things more clear, basically moving code around
and fixing minor issues BEFORE the big patch.

Before there were two patches that together implemented the PR Serv/Hash
work.  This has been combined into a single patch and the oe_nohash stuff
has simply been removed as no longer applicable.

The only comment that was NOT addressed in this was the suggestion to
sed the pkgdata files in do_packagedata.  I'm hesitent to do this as
sed with ${...} in them has proven to be fragile for me in the past.  If
we decide that is necessary, I'd suggest we start with this set and then
sed with ${...} in them has proven to be fragile for me in the past.  If
we decide that is necessary, I'd suggest we start with this set and then
make that change after this proves to work (or not).

v1:

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

Mark Hatle (1):
  package.bbclass: hash equivalency and pr service

 meta/classes/package.bbclass              | 58 +++++++++++++++++++----
 meta/conf/bitbake.conf                    |  1 +
 meta/lib/oeqa/selftest/cases/prservice.py |  8 ++--
 3 files changed, 55 insertions(+), 12 deletions(-)

-- 
2.17.1

