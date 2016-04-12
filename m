Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0DD65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4633F180EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hssTFN+wkIRl
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id C85051806C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A6BA214F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9BB711368
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 99EF1788
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3CDIYM7015660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3CDIY5B015612
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 15:18:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:18:32 +0200
Message-Id: <cover.1460467072.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv2 0/1] Revert cleaning of users/groups
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
X-List-Received-Date: Tue, 12 Apr 2016 13:18:37 -0000

About a week ago the "solution" to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9262 was accepted
into OE-Core. This is supposed to solve the problem that users/groups
are not removed from the sysroot when the recipe is cleansstated. The
solution, however, totally fails to handle the case where multiple
recipes have installed the same user/group causing the build to fail
all over the place.

We have a lot of recipes that installs users and groups, many of which
are created by multiple recipes. An example of how this change broke
for us:

Recipe libwsd creates the wsd group. Recipe wsd creates the wsd group
and the wsd user which has the wsd group as it primary group. When the
libwsd recipe needs to be rebuilt the following error occurs:

groupdel: cannot remove the primary group of user 'wsd'

and the build aborts.

If a solution like this is supposed to be implemented it needs to keep
track of all recipes that install a particular user/group and only
when all of them have been removed can the user/group be removed.
Until that has been solved, the current solution needs to be
reverted...

PATCHv2: Correct a typo in the commit message.

//Peter

The following changes since commit 5602f64ab8c3654737273c0e7ac1c966fa8afb6a:

  archiver: Fix ASSUME_PROVIDED issues (2016-04-11 09:03:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/clean_users
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/clean_users

Peter Kjellerstedt (1):
  Revert "useradd.bbclass: remove user/group created by the package in
    clean* task"

 meta/classes/sstate.bbclass  |  5 -----
 meta/classes/useradd.bbclass | 29 -----------------------------
 2 files changed, 34 deletions(-)

-- 
2.1.0


