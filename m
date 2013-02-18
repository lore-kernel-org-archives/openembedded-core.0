Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U7O8n-0003X9-SD
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 11:40:19 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 51B592543431
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 10:40:16 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>) id 1U7NtC-00049P-1x
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 11:24:02 +0100
Date: Mon, 18 Feb 2013 11:24:02 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130218102402.GA15710@xiaoyu.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: State of systemd from an integrator point of view
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 10:40:19 -0000
X-List-Received-Date: Mon, 18 Feb 2013 10:40:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

this is my second attempt to use systemd with Poky for our sysmoBTS
product (mostly to replace some respawn shell scripts and not to use
the daemontools). I aborted the first trial because of journald and
now that systemd is being merged into OE-Core I started again and I
would like to share some of my issues.


* systemd as a watchdog. For our BTS I have a init script for the
watchdog package and a configuration file in our BSP layer. For systemd
I want the watchdog functionality provided by systemd itself. So I
have a system.conf in my BSP layer an this line in my machine config:

MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "\
	...
	${@['watchdog', ''][d.getVar('DISTRO_FEATURES_INITMAN', True) == 'systemd']} \
	kernel-module-rtfifo "

IMAGE_FSTYPES ?= "tar.bz2 cpio.gz ubifs ubi jffs2"

MACHINE_EXTRA_RDEPENDS = "\
	...
	${@['watchdog', ''][d.getVar('DISTRO_FEATURES_INITMAN', True) == 'systemd']} \
	"

this is obviously not a piece of beauty.. and it would be nicer if
systemd itself could build a watchdog package or such...


* systemd and svsv start scripts. I am using the busybox ifplugd to
configure the network on plug/un-plug of the cable. My start script ended
with .sh in the name. systemd recognized the script but failed to start
it. Renaming it to not end with .sh fixed the issue for me. This is more
like a systemd bug than OE but I wonder if we could change update-rc.d
bbclass to check the for the .sh in the start script and then complain
about it?


* systemd's journald is not suitable for small devices. I think the default
should be to disable the journald and do not disable the busybox log
application in the systemd-compat units package. journald is dominated by
memory allocations and reading procfs over and over again.


regards
	holger



