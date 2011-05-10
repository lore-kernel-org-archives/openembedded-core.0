Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX9-0005r0-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:32 +0200
Received: by rex (Postfix, from userid 1000)
	id CF97120C44; Tue, 10 May 2011 15:00:39 +0100 (BST)
Message-Id: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 14:53:37 +0100
Date: Tue, 10 May 2011 15:00:39 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 0/6] RFC Distro config changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 14:03:32 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

As discussed, we want to make OE-Core usable with no distro set. This patch series
makes some big steps towards that goal. I'd be interested in feedback on whether it
does the right things and would be usable by others.

The key is the inclusion of a distro/defaultsetup.conf file by bitbake.conf and 
in turn this pulls in a variety of other common include files which can likely be
shared. Any point of this cycle can be overridden by another layer so its totally
customisable. I'd encourage users to use the pieces they can where possible so we
all share best practises but obviously people have choice.

I did dump a load of "default" variables into default-distrovars.inc, I'm not
calling that file finished, I just had to draw the line somewhere and start a 
discussion about this :)

Also, I'm aware there are still a few poky-* files in meta/conf/distro/include.
Some of these can just be deleted, others renamed tcmode-* and I'll take care 
of that. I'll also delete the poky.conf file since it no longer contains anything
required to make OE-Core build as far as I know (wider testing needed).

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: rpurdie/distro
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/distro

Richard Purdie (6):
  Drop poky-floating-revisions.inc, poky-bleeding.conf and
    poky-lsb.conf
  bitbake.conf: Include the new default-providers.inc and
    default-versions.inc files
  distro: Add defaultsetup.conf, a set of default configuration
    providing sane overrridable default for commonly used options
  machine/qemu: Add qemu-config as an essential machine speicfic
    dependency and drop specific distro config
  conf/distro/include/default-distrovars.inc: Create set of default
    'distro' variable values
  preferred-xorg-versions.inc: Drop this, it makes no sense given we
    only have one version of these recipes

 meta/conf/bitbake.conf                             |    1 +
 meta/conf/distro/defaultsetup.conf                 |   24 +++
 meta/conf/distro/include/default-distrovars.inc    |   41 ++++++
 meta/conf/distro/include/default-providers.inc     |   34 +++++
 meta/conf/distro/include/default-versions.inc      |   18 +++
 meta/conf/distro/include/poky-fixed-revisions.inc  |   27 ----
 .../distro/include/poky-floating-revisions.inc     |   83 -----------
 .../distro/include/preferred-xorg-versions.inc     |  150 --------------------
 .../include/{poky-eglibc.inc => tclibc-eglibc.inc} |    6 +-
 .../include/{poky-glibc.inc => tclibc-glibc.inc}   |    6 +-
 .../include/{poky-uclibc.inc => tclibc-uclibc.inc} |    4 +
 .../{poky-default.inc => tcmode-default.inc}       |   13 +-
 meta/conf/distro/poky-bleeding.conf                |    8 -
 meta/conf/distro/poky-lsb.conf                     |    9 --
 meta/conf/distro/poky.conf                         |  150 ++------------------
 meta/conf/machine/include/qemu.inc                 |    1 +
 meta/conf/machine/qemux86-64.conf                  |    2 +-
 meta/conf/machine/qemux86.conf                     |    2 +-
 18 files changed, 149 insertions(+), 430 deletions(-)
 create mode 100644 meta/conf/distro/defaultsetup.conf
 create mode 100644 meta/conf/distro/include/default-distrovars.inc
 create mode 100644 meta/conf/distro/include/default-providers.inc
 create mode 100644 meta/conf/distro/include/default-versions.inc
 delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc
 delete mode 100644 meta/conf/distro/include/poky-floating-revisions.inc
 delete mode 100644 meta/conf/distro/include/preferred-xorg-versions.inc
 rename meta/conf/distro/include/{poky-eglibc.inc => tclibc-eglibc.inc} (92%)
 rename meta/conf/distro/include/{poky-glibc.inc => tclibc-glibc.inc} (91%)
 rename meta/conf/distro/include/{poky-uclibc.inc => tclibc-uclibc.inc} (86%)
 rename meta/conf/distro/include/{poky-default.inc => tcmode-default.inc} (85%)
 delete mode 100644 meta/conf/distro/poky-bleeding.conf
 delete mode 100644 meta/conf/distro/poky-lsb.conf

-- 
1.7.4.1



