Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTclp-0003QK-Q0
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 18:35:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56GW0GQ024136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 09:32:00 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Jun 2011 09:32:00 -0700
Message-ID: <4DED00FB.4080205@windriver.com>
Date: Mon, 6 Jun 2011 11:31:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Directory Ownership - RFC
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
X-List-Received-Date: Mon, 06 Jun 2011 16:35:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I'm starting to work on an enhancement that will allow (binary) packages
produced from the recipes to clearly own directories.  I'm trying to find a
simple enough solution that avoids having to change most recipes, while still
giving the developer and distribution designers flexibility to establish clear
lines of ownership and system/distribution policy.

Problem
-------

Currently directories are "owned" by whatever packages use them.  This works for
the most part, but can lead to problems when many different packages use the
same directory -- such as /bin, /sbin, /etc, /lib, /usr/lib, etc....

When packaging (at least with RPM), the directory permissions, owners and groups
are automatically included into the package using the existing FILES_pkg globbing.

The primary issue is that the first package that creates/uses the directory is
generally the one that sets the permissions, owner and group.  For many
directories 0755, root, root is perfectly fine, however other standard
directories may require specific modes, owners and groups...  (We recently had
an issue with sudo creating /var and /var/lib as 0700... which caused failures
in other packages.)

This causes issues with consistency between recipes as well as potential
security implications on multi-user systems.

Proposed solution
-----------------

Add a new "DIRS" variable, similar to the existing "FILES", that will specify
the directories for a package to own.  By default DIRS = FILES, i.e. DIRS_${PN}
?= FILES_${PN}

The purpose of this is to automatically inherit the files list and walk the
directories in the same way that existing recipes do it.  Resulting in no change
to most recipes, but also giving a package a clear way to override the values
and specify select directories to own.

A key difference in behavior between the DIRS and FILES methods would be any
directory specified with a "/" at the end of the name would avoid walking the
directory.  For example, DIRS = /usr/share/foo  would include "foo" and all of
the directories under it.  While DIRS = /usr/share/foo/ would simply include
"foo", and avoid walking the subdirectories.  Q: Is this confusing behavior?

In addition to the above, a new way to exclude directories from being included
-- even if in the DIRS list is needed to keep things "simple".

This requires adding a new variable that that will contain a list of directories
that should be ignored when processing the FILES_pkg.  This exclusion list only
covers the directories themselves, not the files that would normally be found
inside of them.

The exclusion variable would be set, by default, to (based on base-files):

/tmp ${localstatedir}/volatile/lock ${localstatedir}/volatile/tmp
/home ${prefix}/src ${localstatedir}/local
/bin /boot /dev ${sysconfdir} ${sysconfdir}/default
${sysconfdir}/skel /lib /mnt /proc /home/root /sbin
${prefix} ${bindir} ${docdir} /usr/games ${includedir}
${libdir} ${sbindir} ${datadir}
${datadir}/common-licenses ${datadir}/dict ${infodir}
${mandir} ${datadir}/misc ${localstatedir}
${localstatedir}/backups ${localstatedir}/lib
/sys ${localstatedir}/lib/misc ${localstatedir}/spool
${localstatedir}/volatile ${localstatedir}/volatile/cache
${localstatedir}/volatile/lock/subsys
${localstatedir}/volatile/log
${localstatedir}/volatile/run
/mnt /media /media/card /media/cf /media/net /media/ram
/media/union /media/realroot /media/hdd
/media/mmc1
/srv
${prefix}/local ${prefix}/local/bin ${prefix}/local/games
${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin
${prefix}/local/share ${prefix}/local/src
/var/mail

Assuming the variable is called "EXCLUDEDIRS" (I'm still looking for a good
variable name), a recipe would be able to override it for the recipe as a whole,
or for the split packages.  Almost all recipes would not need to ever override
the value.

----

The net result is any existing package will continue to work.

A new distribution wide set of directories that regular recipes should not own
can be created.

And the few key packages that need to own directories can do so, and be sure
that they are the exclusive owners.

Comments, Suggestions?

--Mark


