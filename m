Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 88DC077009
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 00:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 830102E1D8;
	Wed,  4 Nov 2015 01:06:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id d7lv-CB6loTY; Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 4517D2E1D7;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 212F0152;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 136429E;
	Wed,  4 Nov 2015 01:06:17 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id D54903E58B;
	Wed,  4 Nov 2015 01:06:17 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tA406Hv3009216;
	Wed, 4 Nov 2015 01:06:17 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tA406HUs009214;
	Wed, 4 Nov 2015 01:06:17 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 01:06:04 +0100
Message-Id: <cover.1446595453.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] Improvements for useradd-staticids.bbclass
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
X-List-Received-Date: Wed, 04 Nov 2015 00:06:24 -0000

This series of patches aims to improve useradd-staticids.bbclass.

We are currently using useradd-staticids.bbclass to make sure all
users and groups have well defined IDs. So far we have had the
definitions of the users both in the recipes and in the passwd file
used by useradd-staticids.bbclass. Since we have a huge number of
recipes that create users, having to duplicate the definitions all
over the place has turned out to be a burden we should be able to
avoid.

So the current plan for us is to have one passwd file per layer with
the definitions of all users that layer needs. These definitions do
not include the static IDs for the users. Instead the static IDs for
the users are specified in a distro specific passwd-static file. There
is also a distro specific group-static file for the group IDs. With
that in place it should be enough to define a user as:

USERADD_PARAM_${PN} = "--system foobar"

in a recipe and let useradd-staticids.bbclass handle the specifics for
how that user should be defined.

The above worked fine for all users that had a primary group with the
same name as the user. However, it turned out that for users that
wanted some other primary group, specifying it in the passwd file was
not enough. We still had to add --gid <some group> in the recipe where
<some group> had to match what was specified in the passwd file. This
was less than optimal, and somewhat defeated the setup.

It also turned out that for users with a primary group that does not
match the user name, useradd-staticids.bbclass would still add the
creation of a group with the same name as the user (when it parsed the
passwd-static file) and the add another creation of the correct group
(when it parsed the passwd file).

So after spending quite a lot of time on trying to decode how
rewrite_useradd() calculated the --gid option, I came up with this
series of changes that should correct the problems described above and
make the code easier to understand while (hopefully) maintaining
compatibility with the old code.

I fully understand that this is very late for Jethro and do not really
expect it to make it into 2.0.0, but if at all possible I hope it can
make it since that would make my life much easier. :)

//Peter

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd_improvements
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd_improvements

Peter Kjellerstedt (5):
  useradd-staticids.bbclass: Treat mutually exclusive options as such
  useradd-staticids.bbclass: Make --no-user-group have effect
  useradd-staticids.bbclass: Simplify some logic
  useradd-staticids.bbclass: Simplify the logic for when to add groups
  useradd-staticids.bbclass: Read passwd/group files before parsing

 meta/classes/useradd-staticids.bbclass | 192 ++++++++++++++++++---------------
 1 file changed, 103 insertions(+), 89 deletions(-)

-- 
2.1.0


