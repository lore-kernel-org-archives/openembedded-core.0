Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id CB4246DF75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:18:04 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A808EF811E5; Thu,  5 Dec 2013 05:18:04 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D564EF811E2;
	Thu,  5 Dec 2013 05:18:03 -0700 (MST)
Message-ID: <52A06F24.1060009@mlbassoc.com>
Date: Thu, 05 Dec 2013 05:18:44 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: BB_NO_NETWORK broken for git
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
X-List-Received-Date: Thu, 05 Dec 2013 12:18:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I try to use a local source mirror, fully populated with packages, so I
can deliver a complete (no network required) bundle to my customers.  This
has recently been broken.

I can no longer use BB_NO_NETWORK=1 for git recipes, since this revision:
commit 2354250a95eab484459f41f8715ae112295c2174
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Mon Nov 18 17:17:16 2013 +0000

     bitbake: git: Use merge-base instead of log for testing if a commit is present

     The current use of git log to check if a given revision is present can be
     a little fragile.

     For example if revision X was on branch A, and then later added to branch
     B, the update checks would not notice this since they just check for X
     being in the repository.

     We also had some autobuilder corruption where an older packed-refs file
     was copied over a new repository containing newer pack files. There
     was no update to the refs file since the revision was present but
     not accessible in any branch.

     The correct fix is to check that the required revisions are present
     on the specific branches. This patch does this using merge-base.

     (Bitbake rev: 89abfbc1953e3711d6c90aff793ee622c22609b1)

     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

To test this, just add these settings to local.conf
   SOURCE_MIRROR_URL ?= "file:///work/misc/Poky/sources/"
   INHERIT += "own-mirrors"
   BB_NO_NETWORK = "1"
   BB_GENERATE_MIRROR_TARBALLS ?= "1"

Make sure and put the appropriate git tarball into the SOURCE_MIRROR.
I tested this using prelink, e.g.
   $ bitbake prelink -c fetch
the the tarball is git2_git.yoctoproject.org.prelink-cross.git.tar.gz
A copy of this is at
   http://www.mlbassoc.com/poky/git2_git.yoctoproject.org.prelink-cross.git.tar.gz

Filed as bug #5631 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=5631)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

