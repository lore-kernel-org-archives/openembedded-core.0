Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D656C959
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 23:37:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s16NbPxw019102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Feb 2014 15:37:26 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 6 Feb 2014 15:37:25 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2014 17:37:22 -0600
Message-ID: <cover.1391729077.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [v3 PATCH 0/2] Implement deterministic uid/gid
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
X-List-Received-Date: Thu, 06 Feb 2014 23:37:26 -0000
Content-Type: text/plain

V3:

Refactor the code into a new class specific with rewriting the adduser
functions.  Otherwise the code is the same as before.

V2:

Rebase to latest master...

Rework the code a bit based on comments from a few people.  Specifically
add a mode where passwd/group file entries are NOT overridden (blank info).

Clearly comment that the 'password' field is ignored, as is the group's
member fields.

Ensure that the 'enforcing' mode, doesn't trigger build failures, but simply
excludes the recipe from the build list.  If the package is needed an error
indicating the problem will be generated.  Makes for a cleaner build, and a
more targeted passwd/group file.


This was tested by doing the following:

(not enabling any of the code), build core-image-sato

copy the passwd/group file from tmp-eglibc/sysroots/<machine>/etc/ to meta/files/.

Clear the build directory

Enable the code adding the following to the conf/local.conf:
USERADD_REWRITE_PARAMS = '1'

Build, compare the rootfs  /etc/passwd and /etc/group to the version in meta/files.
Verify the uid, gid and other information match.  (Note xuser will have a slight
difference in the 'shell' field, but this is does to the difference between the
configuration of the sysroot and the target filesystem.)

Clear the build directory again

Enable the code adding the following to conf/local.conf:
USERADD_ERROR_DYNAMIC = '1'

Repeat the validation steps.

Clear the build directory again

Modify the meta/files/passwd and remove the items in the comment, home_dir and
shell fields.  i.e.:

root::0:0:root:/home/root:/bin/sh

becomes

root::0:0:::

Repeat the build, verify the fields are all correct in the final image.

V1:

The following series implements the deterministic uid/gid setting for a
distribution.  Currently when a filesystem is generated the uid/gid values
are generally set at install time, so the install order determines what
the actual uid/gid values become.  In order to create a deterministic uid/gid
set, that still dynamically constructs the passwd/group file, we add an
option to read a special passwd/group file to allow the system to determine
the values.

It uses the existing parameters, and the values from the special passwd/group
files to reconstruct the parameter set to ensure these items are fully
defined with static values.

The first patch (01/02) is generally applicable.  It fixes a real bug in
the way the user/group adds occur today within the system.

Patch 02/02 implements the new functionality.

The following changes since commit cda502815c6acf789e1a0db7a7a1a7015b4ef71d:

  build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81583cc34c2ff555 (2014-02-06 15:36:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/uidgid
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid

Mark Hatle (2):
  useradd.bbclass: Fix build time install issues
  useradd.bbclass: Add ability to select a static uid/gid automatically

 meta/classes/useradd-staticids.bbclass | 259 +++++++++++++++++++++++++++++++++
 meta/classes/useradd.bbclass           |  26 +++-
 meta/conf/local.conf.sample.extended   |  24 +++
 3 files changed, 303 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes/useradd-staticids.bbclass

-- 
1.8.5.3


