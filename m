Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QH0On-0007lr-7U
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 23:11:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p42L8hcX026766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 May 2011 14:08:43 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 May 2011 14:08:42 -0700
Message-ID: <4DBF1D59.2050506@windriver.com>
Date: Mon, 2 May 2011 16:08:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, poky <poky@yoctoproject.org>
Subject: RFC: Recipe based User & Group addition, modification and deletion
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
X-List-Received-Date: Mon, 02 May 2011 21:11:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

RFC: Recipe based User & Group addition, modification and deletion

Problem:

In OE-Core we need a method for dynamically adding non-standard user and group
entries to the system.  This system must be flexible, extensible and easy to use
by the recipe authors.  We require this functionality in order to address
numerous system wide security requirements.  Among these requirements is the
necessity to enable non-root owned files (and eventually directories) in the
packages constructed by the build system.

Architecture:

The architecture design is based in part on the existing update-rc.d
infrastructure.  As such three choices for architecture were considered.  In
each of the descriptions below any references to the passwd file should also
assume a shadow file may exist, similarly any references to a group file should
assume a gshadow file may exist.

1) Enable a small set of native tools that can be used to manipulate the passwd
and group files in both pre and post install scripts as specified in the recipes.

The small set of tools should include: adduser, addgroup, moduser, modgroup,
deluser, delgroup, passwd and gpasswd.

This set of tools will enable the addition, modification and removal of specific
user and group entries, as well as enable the ability to set the corresponding
passwords for a given entry.  The tools in question also need to support shadow
password files.

In order to leverage the existing tooling it is expected that they will each be
modified to add a "--root" parameter that enables the program to either chroot
into a specific directory using the facilities provided by pseudo, or using the
item as an alternative mechanism to locate files on the disk.

A set of example pre and post install recipe instructions will be generated as
examples.

2) We add a new variable to the recipe syntax.  The variable will need to allow
a recipe to specify an arbitrary number of new users and groups, along with
their corresponding settings.

The update-rc.d.bbclass is used as an example for this item.  The new class
_useradd.bbclass_ will use a small number of variables to control user and group
creation.  As with update-rc.d, an 'inherit useradd' will be required in the
recipe to use this functionality.

The variable USERADD_PACKAGES will control which binary packages will have the
special user add code.  The corresponding USERADD_PARAM_pkg variable will
contain a list of parameters in the format of the command line useradd program
as document by useradd(8) man page.  Multiple parameters will be separated by a
semicolon (";").

For example, to add two new users for sendmail, you could use:

USERADD_PACKAGES = "sendmail"
USERADD_PARAM_sendmail = "-u 47 -d /var/spool/mqueue -r -s /bin/true mailnull ;
-u 51 -d /var/spool/mqueue -r -s /bin/true smmsp"

This would add two users, and their corresponding groups based on the rules of
the useradd program parameters.

For GROUP control, the vales would be changed to GROUPADD_PACKAGES and
GROUPADD_PARAM_pkg.  Note, many groups are automatically generated as part of a
useradd -- so specific group adds are only required in specific circumstances.

If both USERADD and GROUPADD are specified, the GROUPADD will always run before
the USERADD.  This ensures that new users can rely on similarly new groups.

Removal and modification of existing users is not supported by this approach.

The implementation of the actual add of user and group entries is up to the
packaging approach with a reasonable default approach specified.

3) Combine approaches 1 and 2.  Ensure that the recipe variable approach (2)
uses the mechanisms as implemented and defined in the command approach (1).

This will allow for the most flexibility, but also ensure that if a recipe needs
more then simple 'add' control it can be achieved.

---

It is recommended that the 3rd choice above be selected as the architecture for
the new functionality.  However, no matter which choice above is selected -- or
potentially even ones that are not listed above there are still some additional
items that will need to be resolved.

Any pre-installation steps will need to be preformed prior to the do_install()
stage of recipe building.  Otherwise the necessary user/group entries may not be
available which could lead to incorrect packaging occurring.  The passwd and
group files manipulated by this pre-install step will need to be global to the
sysroot, with PSEUDO specified to use this specific passwd and group file.
(PSEUDO_PASSWD environment variable specifies the path to a directory containing
a passwd and group file.)

The above will enable the ability to do, chown new_user:new_group path/file.
within a do_install() step.

During rootfs image creation, the pre-install steps will also need to be
executed prior to the package being installed -- or a suitable cleanup step run
that ensures the correct owners and groups for files (and directories) exist
after installation.  This will likely require changes to the various rootfs
classes.  Note, user and group creation will generally have to wait until after
the default passwd and group files have been installed.

Note, there is no guaranty that the sysroot and rootfs will match.  This is
intentional as dynamic user and group assignment is expected to create entries
specific to a given configuration.

The sstate items will need to also be verified to correctly maintain user and
group entries within the cache, as well as run the pre-install operation against
the sysroot before the do_install-like sstate operations occur.

Post install script changes can be left as currently implemented, as they will
not directly affect the rootfs image creation.

Finally some user and group creation policies should be put in place.  This
policy should include:

1) What are the default user and groups on a system?  (Recommendation LSB or a
subset of the LSB.)

2) When adding a user and group, should user and group numbers be assigned or
done dynamically?  (Recommendation done dynamically whenever possible, as this
avoid conflicting numbers)

3) When adding a user and group, if a specific user/group number must be used
how do we avoid conflicts.  (Specifically in the case a package embeds the
user/group id number.  Do we define a registry, or some other mechanism?)

4) When adding a user and group, how to determine if the user and group should
be a system account or not.

---

Any comments on the above?


