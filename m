Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.8593.1589383494533759531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 08:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04DFOp1i025420
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 10:24:53 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][ 0/2] Fix for two issues related to sstate-cache
Date: Wed, 13 May 2020 10:24:49 -0500
Message-Id: <20200513152451.162042-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Patch 1 is a backport from master (it's already in Dunfell).  If you have a
locked-sigs file, and the sstate for that item isn't available the .siginfo and
sigdata files were not being written.  Patch 1/2 resolved that with the
fragment in "dump_sigtask".

Patch 2 was sent for master as well, and this is just to get it applied to
Zeus.  Due to problem #1, we were generating sstate-cache that did not have
siginfo files.  Due to this we were getting failures later on using that
sstate-cache in a subsequent build.  This patch ensures if this happens
again (of if someone intentionally strips those) it won't fail.

Mark Hatle (1):
  sstate.bbclass: When siginfo or sig files are missing, stop fetcher
    errors

Richard Purdie (1):
  sstatesig: Optimise get_taskhash for hashequiv

 meta/classes/sstate.bbclass |  6 +++++-
 meta/lib/oe/sstatesig.py    | 13 +++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.17.1

