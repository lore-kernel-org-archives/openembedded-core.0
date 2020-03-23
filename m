Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.51215.1584965951609962192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 05:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:48368 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGM2w-006Rr9-71
	for openembedded-core@lists.openembedded.org; Mon, 23 Mar 2020 08:19:10 -0400
Date: Mon, 23 Mar 2020 08:19:06 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: safe to get rid of refs to CVSDIR, SVNDIR, GITDIR?
Message-ID: <alpine.LFD.2.21.2003230814250.10783@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  cleaning up docs, and just noticed this from several months back:

commit 4ff058226cfc3e7d5bf9a873d1de4475f65ef2f2
Author: Andre McCurdy <armccurdy@gmail.com>
Date:   Fri Aug 23 13:51:32 2019 -0700

    bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides

    This completes cleanup originally proposed in 2012:


http://lists.openembedded.org/pipermail/openembedded-core/2012-July/064224.html

    Current versions of bitbake have "sane" default fetcher commands
    so it's no longer necessary for bitbake.conf to over-ride them.

    Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1311e6b5fd..a0a7f4911e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -360,12 +360,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
str(d.getVar('MACHINE'))][bool(d.getVar('M
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
-CO_DIR = "${DL_DIR}"
-CVSDIR = "${CO_DIR}/cvs"
-SVNDIR = "${CO_DIR}/svn"
-GITDIR = "${CO_DIR}/git2"
-BZRDIR = "${CO_DIR}/bzr"
-HGDIR = "${CO_DIR}/hg"


  so is it safe to remove the remnants of references to those
variables? all that's left is [doc] references to CVSDIR, SVNDIR and
GITDIR, and this from meta/lib/oe/recipeutils.py:

  def get_recipe_upgrade_status(recipes=None):
      pkgs_list = []
      data_copy_list = []
      copy_vars = ('SRC_URI',
                 'PV',
                 'GITDIR',       <---
                 'DL_DIR',
                 'PN',
                 'CACHE',

all of that safe to delete? any others that can go with it? (i didn't
notice any.)

rday
