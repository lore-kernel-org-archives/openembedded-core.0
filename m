Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6D7F601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:51:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6psia024166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:51:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:51:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:51:51 -0700
Message-ID: <fb8e7eea5abaf585bab2904af2b0485f66b15942.1457938004.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938004.git.liezhi.yang@windriver.com>
References: <cover.1457938004.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Mon, 14 Mar 2016 06:51:53 -0000
Content-Type: text/plain

From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>

We get below host contamination warnings of license files for
each recipe, when we try to create a separate ${PN}-lic package (which
contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
in local.conf.

-- snip --
WARNING: QA Issue: libcgroup: /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
-- CUT --

Since the license files from source and OE-core, are populated in a normal
shell environment rather in pseudo environment (fakeroot); the ownership of
these files will be same as host user running bitbake. During the do_package
task (which runs in pseudo environment (fakeroot)), os.link preserves the
ownership of these license files as host user instead of root user.
This causes license files to have UID same as host user id and resulting in
above warnings during do_package_qa task.

Changing ownership of license files to root user (which has UID and GID as 0)
under pseudo environment will solve above warnings, and on exiting pseudo
environment the license files will continue to be owned by host user. Perform
this manipulation within try/except statements, as tasks which are not exected
under pseudo (such as do_populate_lic) result in OSError when trying to
change ownership of license files.

(From OE-Core master rev: a411e96c3989bc9ffbd870b54cd6a7ad2e9f2c61)

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/license.bbclass |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8ad4614..c714da3 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -185,6 +185,16 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
                 os.link(src, dst)
+                try:
+                    os.chown(dst,0,0)
+                except OSError as err:
+                    import errno
+                    if err.errno == errno.EPERM:
+                        # suppress "Operation not permitted" error, as
+                        # sometimes this function is not executed under pseudo
+                        pass
+                    else:
+                        raise
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-- 
1.7.9.5


