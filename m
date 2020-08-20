Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.103936.1597898654464758956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 21:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07K4i6Nb006808
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 19 Aug 2020 23:44:07 -0500
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Subject: hash equivalency and PR service - RFC
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Joshua Watt <jpewhacker@gmail.com>
Message-ID: <54f14f4e-00f3-950f-c28e-7da70857804b@kernel.crashing.org>
Date: Wed, 19 Aug 2020 23:44:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I've been working recently to try to get hash equivalency and PR service to work
together properly.  Earlier today I sent a patch to address one of the issues I
found (un-related to PR service).

In order to replicate the condition, I've been using poky master (oe should work
fine) with the following configuration:

BB_HASHSERVE = "auto"
BB_SIGNATURE_HANDLER = "OEEquivHash"

PRSERV_HOST ??= "localhost:0"

PKGR[vardepsexclude] = "EXTENDPRAUTO"

INHERIT += "reproducible_build"

INHERIT += "buildhistory"

I then run:

MACHINE=qemuarm64 bitbake glibc

Go in and edit meta/recipes-core/glibc/glibc_2.32.bb, search for the
do_patch_append and add "# modify hash".

Re-run the build command.  The result SHOULD be the system detects that nothing
changed (in do_package, inspecting log.do_package should show it changed the
unihash.)  And then the rest is accelerated.  However, the PKGR (from the PR and
AUTOPR) cause this to fail, as well as any embedded dependencies that also have
PR/AUTOPR embedded into them.  Both of these are written to pkgdata files, and
when compared to prior builds for hashs will always be different.

I tried to break this by moving the AUTOPR value into a separate file that was
not used to calculate hash information.  For the most part this works, but I ran
into some problems.  (See below).

I've generated a patch:

https://github.com/mhatle/poky/commit/86fbd639261319de4c951708d9805abba6036510

(I'm not entirely happy with the change, but I think it's a reasonable start for
a review to make sure the direction of the change is reasonable.)

The header of the patch explains some of the work that I've done:


When the PR service is enabled a number of small changes happen to variables.

During the do_package task, EXTENDPRAUTO will get a value placed into it that
is intended to be used to extend the PR.  This value will get written to
various intermediate files and will result in the computed hash never being
equivalent.

To resolve this issue, we create a new file with the extension ".oe_nohash".
This extension contains various values that need to be passed from task to
task, but NOT calculated within the scope of the task hash.  The items
placed into the nohash are captured in package.bbclass in PKGDATA_VAR_NOHASH.

The PKGDATA_VAR_NOHASH is also used to prevent expansion of the value when
users are written to the various pkgdata files.  This expansion is prevented
by replacing the variable references ${VAR} with ##{VAR}## in a local
data store.  The pkgdata loading routines then know to load the nohash and
translate the ##{VAR}## back to ${VAR} automatically.

Additionally package dependencies rely on variables that also eventually
include EXTENDPRAUTO.  So instead of resolving the variable at getVar time,
we keep them as references.

The goal is instead of taking:

RRECOMMEND_package-dev = 'package = ${EXTENDPKGV}'

and making it:

RRECOMMEND_package-dev = 'package = 1.0-r0.1'

We want to keep EXTENDPKGV which internally refers to EXTENDPRAUTO
which is already in the special NOHASH category.

NOTE:  The above is not working properly in the case of ${@...} python
functions.  This is because the bb.utils.explode_dep_version2 does not
understand how to expand or deal with ${@ ... } syntax.  (It expects
a comma or space separated list, so the spaces cause problems!)


If anyone has any ideas how to address the RRECOMMEND issue above, I could use
some help.  I'm going to keep working on it, but I'm not sure how to get the
system to expand some but not everything.  (I might need to use the same local
datastore trick in this expansion that I used elsewhere.)

--Mark
