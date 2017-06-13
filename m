Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFBFA7760A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:26:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5DKQpuu028672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:26:51 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Jun 2017 13:26:50 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 16:26:45 -0400
Message-ID: <1497385605-16433-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] attr: Fix build failure when image includes man-pages pkg
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
X-List-Received-Date: Tue, 13 Jun 2017 20:26:51 -0000
Content-Type: text/plain

If you attempt to build an image with both attr(-doc) and man-pages
packages your rootfs might fail to assemble. The error will be
something like:

Error: Transaction check error:
  file /usr/share/man/man2/fgetxattr.2 from install of \
    attr-doc-2.4.47-r0.core2_64 conflicts with file from \
    package man-pages-4.11-r0.core2_64

(the error is usually only seen on builders which don't have manpages
installed, if you have /usr/share/man/man1/man.1.gz your build will
complete but you will have duplicate manpages, just one zipped and one
not)

Backporting changes from upstream attr removes the conflicted files in
favour of those in the man-pages package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

v2: Fixed case in Upstream-Status

 meta/recipes-support/attr/attr_2.4.47.bb           |   2 +
 ...ve-the-attr.5-man-page-moved-to-man-pages.patch | 240 ++++++++
 .../files/Remove-the-section-2-man-pages.patch     | 666 +++++++++++++++++++++
 3 files changed, 908 insertions(+)
 create mode 100644 meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
 create mode 100644 meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index 556c8e4..2dada7a 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -4,6 +4,8 @@ require attr.inc
 # future releases of attr, remove this when updating the recipe.
 SRC_URI += "file://attr-Missing-configure.ac.patch \
             file://dont-use-decl-macros.patch \
+            file://Remove-the-section-2-man-pages.patch \
+            file://Remove-the-attr.5-man-page-moved-to-man-pages.patch \
            "
 
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
diff --git a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch b/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
new file mode 100644
index 0000000..d5ab83d
--- /dev/null
+++ b/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
@@ -0,0 +1,240 @@
+From 6047c8522b91235ad1e835f44f5e36472d9d49b2 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+Date: Wed, 22 Apr 2015 11:46:59 +0200
+Subject: [PATCH 2/2] Remove the attr.5 man page (moved to man-pages)
+
+Commit dce9b4448c7f2b22bd206cd068fb05cb2f3255b9 from
+https://git.savannah.nongnu.org/git/attr.git
+
+The attr.5 page is part of the extended attribute system call documentation,
+which has been moved into the man-pages package. Move the attr.5 page there
+as well.
+
+Upstream-Status: Backport
+
+[MA: updated to apply directly to v2.4.47]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ man/Makefile      |   2 +-
+ man/man5/Makefile |  35 -------------
+ man/man5/attr.5   | 153 ------------------------------------------------------
+ 3 files changed, 1 insertion(+), 189 deletions(-)
+ delete mode 100644 man/man5/Makefile
+ delete mode 100644 man/man5/attr.5
+
+diff --git a/man/Makefile b/man/Makefile
+index 755daed..9301f09 100644
+--- a/man/Makefile
++++ b/man/Makefile
+@@ -19,7 +19,7 @@
+ TOPDIR = ..
+ include $(TOPDIR)/include/builddefs
+ 
+-SUBDIRS = man1 man3 man5
++SUBDIRS = man1 man3
+ 
+ default : $(SUBDIRS)
+ 
+diff --git a/man/man5/Makefile b/man/man5/Makefile
+deleted file mode 100644
+index 6b70d3d..0000000
+--- a/man/man5/Makefile
++++ /dev/null
+@@ -1,35 +0,0 @@
+-#
+-# Copyright (c) 2000, 2002 Silicon Graphics, Inc.  All Rights Reserved.
+-# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
+-#
+-# This program is free software: you can redistribute it and/or modify it
+-# under the terms of the GNU General Public License as published by
+-# the Free Software Foundation, either version 2 of the License, or
+-# (at your option) any later version.
+-#
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
+-#
+-# You should have received a copy of the GNU General Public License
+-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+-#
+-
+-TOPDIR = ../..
+-include $(TOPDIR)/include/builddefs
+-
+-MAN_SECTION	= 5
+-
+-MAN_PAGES	= $(shell echo *.$(MAN_SECTION))
+-MAN_DEST	= $(PKG_MAN_DIR)/man$(MAN_SECTION)
+-LSRCFILES	= $(MAN_PAGES)
+-
+-default : $(MAN_PAGES)
+-
+-include $(BUILDRULES)
+-
+-install : default
+-	$(INSTALL) -m 755 -d $(MAN_DEST)
+-	$(INSTALL_MAN)
+-install-dev install-lib:
+diff --git a/man/man5/attr.5 b/man/man5/attr.5
+deleted file mode 100644
+index a02757d..0000000
+--- a/man/man5/attr.5
++++ /dev/null
+@@ -1,153 +0,0 @@
+-.\" Extended attributes manual page
+-.\"
+-.\" Copyright (C) 2000, 2002, 2007  Andreas Gruenbacher <agruen@suse.de>
+-.\" Copyright (C) 2001, 2002, 2004, 2007 Silicon Graphics, Inc.
+-.\" All rights reserved.
+-.\"
+-.\" This is free documentation; you can redistribute it and/or
+-.\" modify it under the terms of the GNU General Public License as
+-.\" published by the Free Software Foundation; either version 2 of
+-.\" the License, or (at your option) any later version.
+-.\"
+-.\" The GNU General Public License's references to "object code"
+-.\" and "executables" are to be interpreted as the output of any
+-.\" document formatting or typesetting system, including
+-.\" intermediate and printed output.
+-.\"
+-.\" This manual is distributed in the hope that it will be useful,
+-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-.\" GNU General Public License for more details.
+-.\"
+-.\" You should have received a copy of the GNU General Public
+-.\" License along with this manual.  If not, see
+-.\" <http://www.gnu.org/licenses/>.
+-.\"
+-.TH ATTR 5
+-.SH NAME
+-attr - Extended attributes
+-.SH DESCRIPTION
+-Extended attributes are name:value pairs associated permanently with
+-files and directories, similar to the environment strings associated
+-with a process.
+-An attribute may be defined or undefined.
+-If it is defined, its value may be empty or non-empty.
+-.PP
+-Extended attributes are extensions to the normal attributes which are
+-associated with all inodes in the system (i.e. the
+-.BR stat (2)
+-data).
+-They are often used to provide additional functionality
+-to a filesystem \- for example, additional security features such as
+-Access Control Lists (ACLs) may be implemented using extended attributes.
+-.PP
+-Users with search access to a file or directory may retrieve a list of
+-attribute names defined for that file or directory.
+-.PP
+-Extended attributes are accessed as atomic objects.
+-Reading retrieves the whole value of an attribute and stores it in a buffer.
+-Writing replaces any previous value with the new value.
+-.PP
+-Space consumed for extended attributes is counted towards the disk quotas
+-of the file owner and file group.
+-.PP
+-Currently, support for extended attributes is implemented on Linux by the
+-ext2, ext3, ext4, XFS, JFS and reiserfs filesystems.
+-.SH EXTENDED ATTRIBUTE NAMESPACES
+-Attribute names are zero-terminated strings.
+-The attribute name is always specified in the fully qualified
+-.IR namespace.attribute
+-form, eg.
+-.IR user.mime_type ,
+-.IR trusted.md5sum ,
+-.IR system.posix_acl_access ,
+-or
+-.IR security.selinux .
+-.PP
+-The namespace mechanism is used to define different classes of extended
+-attributes.
+-These different classes exist for several reasons, e.g. the permissions
+-and capabilities required for manipulating extended attributes of one
+-namespace may differ to another.
+-.PP
+-Currently the
+-.IR security ,
+-.IR system ,
+-.IR trusted ,
+-and
+-.IR user
+-extended attribute classes are defined as described below. Additional
+-classes may be added in the future.
+-.SS Extended security attributes
+-The security attribute namespace is used by kernel security modules,
+-such as Security Enhanced Linux.  
+-Read and write access permissions to security attributes depend on the
+-policy implemented for each security attribute by the security module.
+-When no security module is loaded, all processes have read access to
+-extended security attributes, and write access is limited to processes
+-that have the CAP_SYS_ADMIN capability.
+-.SS Extended system attributes
+-Extended system attributes are used by the kernel to store system
+-objects such as Access Control Lists and Capabilities.  Read and write
+-access permissions to system attributes depend on the policy implemented
+-for each system attribute implemented by filesystems in the kernel.
+-.SS Trusted extended attributes
+-Trusted extended attributes are visible and accessible only to processes that
+-have the CAP_SYS_ADMIN capability (the super user usually has this
+-capability).
+-Attributes in this class are used to implement mechanisms in user
+-space (i.e., outside the kernel) which keep information in extended attributes
+-to which ordinary processes should not have access.
+-.SS Extended user attributes
+-Extended user attributes may be assigned to files and directories for
+-storing arbitrary additional information such as the mime type,
+-character set or encoding of a file. The access permissions for user
+-attributes are defined by the file permission bits.
+-.PP
+-The file permission bits of regular files and directories are
+-interpreted differently from the file permission bits of special files
+-and symbolic links. For regular files and directories the file
+-permission bits define access to the file's contents, while for device special
+-files they define access to the device described by the special file.
+-The file permissions of symbolic links are not used in access
+-checks. These differences would allow users to consume filesystem resources in
+-a way not controllable by disk quotas for group or world writable special files and directories.
+-.PP
+-For this reason, extended user attributes are only allowed for regular files and directories, and access to extended user attributes is restricted to the
+-owner and to users with appropriate capabilities for directories with the
+-sticky bit set (see the
+-.BR chmod (1)
+-manual page for an explanation of Sticky Directories).
+-.SH FILESYSTEM DIFFERENCES
+-The kernel and the filesystem may place limits on the maximum number
+-and size of extended attributes that can be associated with a file.
+-Some file systems, such as ext2/3 and reiserfs, require the filesystem
+-to be mounted with the
+-.B user_xattr
+-mount option in order for extended user attributes to be used.
+-.PP
+-In the current ext2, ext3 and ext4 filesystem implementations, each
+-extended attribute must fit on a single filesystem block (1024, 2048
+-or 4096 bytes, depending on the block size specified when the
+-filesystem was created).
+-.PP
+-In the XFS and reiserfs filesystem implementations, there is no
+-practical limit on the number or size of extended attributes
+-associated with a file, and the algorithms used to store extended
+-attribute information on disk are scalable.
+-.PP
+-In the JFS filesystem implementation, names can be up to 255 bytes and
+-values up to 65,535 bytes.
+-.SH ADDITIONAL NOTES
+-Since the filesystems on which extended attributes are stored might also
+-be used on architectures with a different byte order and machine word
+-size, care should be taken to store attribute values in an architecture
+-independent format.
+-.SH AUTHORS
+-Andreas Gruenbacher,
+-.RI < a.gruenbacher@bestbits.at >
+-and the SGI XFS development team,
+-.RI < linux-xfs@oss.sgi.com >.
+-.SH SEE ALSO
+-getfattr(1),
+-setfattr(1).
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch b/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
new file mode 100644
index 0000000..044c5a0
--- /dev/null
+++ b/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
@@ -0,0 +1,666 @@
+From b972600a26f3a930e53e2fce2625266a5d29813e Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+Date: Tue, 14 Apr 2015 23:53:11 +0200
+Subject: [PATCH 1/2] Remove the section 2 man pages
+
+Commit 8d1263bca95722d66a6f8e83450f49d0956ea534 from upstream
+https://git.savannah.nongnu.org/git/attr.git/
+
+The section 2 man pages have long since been added to the man-pages package
+which documents all system calls; they were disabled in attr by default since
+January 2014.  Get rid of them here.
+
+Upstream-Status: Backport
+
+[MA: modified to apply directly to v2.4.47]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ man/Makefile           |   2 +-
+ man/man2/Makefile      |  35 -----------
+ man/man2/getxattr.2    | 143 --------------------------------------------
+ man/man2/listxattr.2   | 158 -------------------------------------------------
+ man/man2/removexattr.2 | 111 ----------------------------------
+ man/man2/setxattr.2    | 143 --------------------------------------------
+ 6 files changed, 1 insertion(+), 591 deletions(-)
+ delete mode 100644 man/man2/Makefile
+ delete mode 100644 man/man2/getxattr.2
+ delete mode 100644 man/man2/listxattr.2
+ delete mode 100644 man/man2/removexattr.2
+ delete mode 100644 man/man2/setxattr.2
+
+diff --git a/man/Makefile b/man/Makefile
+index 9535426..755daed 100644
+--- a/man/Makefile
++++ b/man/Makefile
+@@ -19,7 +19,7 @@
+ TOPDIR = ..
+ include $(TOPDIR)/include/builddefs
+ 
+-SUBDIRS = man1 man2 man3 man5
++SUBDIRS = man1 man3 man5
+ 
+ default : $(SUBDIRS)
+ 
+diff --git a/man/man2/Makefile b/man/man2/Makefile
+deleted file mode 100644
+index d77309d..0000000
+--- a/man/man2/Makefile
++++ /dev/null
+@@ -1,35 +0,0 @@
+-#
+-# Copyright (c) 2000-2002 Silicon Graphics, Inc.  All Rights Reserved.
+-# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
+-#
+-# This program is free software: you can redistribute it and/or modify it
+-# under the terms of the GNU General Public License as published by
+-# the Free Software Foundation, either version 2 of the License, or
+-# (at your option) any later version.
+-#
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
+-#
+-# You should have received a copy of the GNU General Public License
+-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+-#
+-
+-TOPDIR = ../..
+-include $(TOPDIR)/include/builddefs
+-
+-MAN_SECTION	= 2
+-
+-MAN_PAGES	= $(shell echo *.$(MAN_SECTION))
+-MAN_DEST	= $(PKG_MAN_DIR)/man$(MAN_SECTION)
+-LSRCFILES	= $(MAN_PAGES)
+-
+-default install : $(MAN_PAGES)
+-
+-include $(BUILDRULES)
+-
+-install-dev : default
+-	$(INSTALL) -m 755 -d $(MAN_DEST)
+-	$(INSTALL_MAN)
+-install-lib:
+diff --git a/man/man2/getxattr.2 b/man/man2/getxattr.2
+deleted file mode 100644
+index 405ad89..0000000
+--- a/man/man2/getxattr.2
++++ /dev/null
+@@ -1,143 +0,0 @@
+-.\"
+-.\" Extended attributes system calls manual pages
+-.\"
+-.\" (C) Andreas Gruenbacher, February 2001
+-.\" (C) Silicon Graphics Inc, September 2001
+-.\"
+-.\" This is free documentation; you can redistribute it and/or
+-.\" modify it under the terms of the GNU General Public License as
+-.\" published by the Free Software Foundation; either version 2 of
+-.\" the License, or (at your option) any later version.
+-.\"
+-.\" The GNU General Public License's references to "object code"
+-.\" and "executables" are to be interpreted as the output of any
+-.\" document formatting or typesetting system, including
+-.\" intermediate and printed output.
+-.\"
+-.\" This manual is distributed in the hope that it will be useful,
+-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-.\" GNU General Public License for more details.
+-.\"
+-.\" You should have received a copy of the GNU General Public
+-.\" License along with this manual.  If not, see
+-.\" <http://www.gnu.org/licenses/>.
+-.\"
+-.TH GETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
+-.SH NAME
+-getxattr, lgetxattr, fgetxattr \- retrieve an extended attribute value
+-.SH SYNOPSIS
+-.fam C
+-.nf
+-.B #include <sys/types.h>
+-.B #include <attr/xattr.h>
+-.sp
+-.BI "ssize_t getxattr (const char\ *" path ", const char\ *" name ",
+-.BI "\t\t\t\t void\ *" value ", size_t " size );
+-.BI "ssize_t lgetxattr (const char\ *" path ", const char\ *" name ",
+-.BI "\t\t\t\t void\ *" value ", size_t " size );
+-.BI "ssize_t fgetxattr (int " filedes ", const char\ *" name ",
+-.BI "\t\t\t\t void\ *" value ", size_t " size );
+-.fi
+-.fam T
+-.SH DESCRIPTION
+-Extended attributes are
+-.IR name :\c
+-.I value
+-pairs associated with inodes (files, directories, symlinks, etc).
+-They are extensions to the normal attributes which are associated
+-with all inodes in the system (i.e. the
+-.BR stat (2)
+-data).
+-A complete overview of extended attributes concepts can be found in
+-.BR attr (5).
+-.PP
+-.B getxattr
+-retrieves the
+-.I value
+-of the extended attribute identified by
+-.I name
+-and associated with the given
+-.I path
+-in the filesystem.
+-The length of the attribute
+-.I value
+-is returned.
+-.PP
+-.B lgetxattr
+-is identical to 
+-.BR getxattr ,
+-except in the case of a symbolic link, where the link itself is
+-interrogated, not the file that it refers to.
+-.PP
+-.B fgetxattr
+-is identical to
+-.BR getxattr ,
+-only the open file pointed to by
+-.I filedes
+-(as returned by
+-.BR open (2))
+-is interrogated in place of
+-.IR path .
+-.PP
+-An extended attribute
+-.I name
+-is a simple NULL-terminated string.
+-The name includes a namespace prefix \- there may be several, disjoint
+-namespaces associated with an individual inode.
+-The value of an extended attribute is a chunk of arbitrary textual or
+-binary data of specified length.
+-.PP
+-An empty buffer of
+-.I size
+-zero can be passed into these calls to return the current size of the
+-named extended attribute, which can be used to estimate the size of a
+-buffer which is sufficiently large to hold the value associated with
+-the extended attribute.
+-.PP
+-The interface is designed to allow guessing of initial buffer
+-sizes, and to enlarge buffers when the return value indicates
+-that the buffer provided was too small.
+-.SH RETURN VALUE
+-On success, a positive number is returned indicating the size of the
+-extended attribute value.
+-On failure, \-1 is returned and
+-.I errno
+-is set appropriately.
+-.PP
+-If the named attribute does not exist, or the process has no access to
+-this attribute,
+-.I errno
+-is set to ENOATTR.
+-.PP
+-If the
+-.I size
+-of the
+-.I value
+-buffer is too small to hold the result,
+-.I errno
+-is set to ERANGE.
+-.PP
+-If extended attributes are not supported by the filesystem, or are disabled,
+-.I errno
+-is set to ENOTSUP.
+-.PP
+-The errors documented for the
+-.BR stat (2)
+-system call are also applicable here.
+-.SH AUTHORS
+-Andreas Gruenbacher,
+-.RI < a.gruenbacher@bestbits.at >
+-and the SGI XFS development team,
+-.RI < linux-xfs@oss.sgi.com >.
+-Please send any bug reports or comments to these addresses.
+-.SH SEE ALSO
+-.BR getfattr (1),
+-.BR setfattr (1),
+-.BR open (2),
+-.BR stat (2),
+-.BR setxattr (2),
+-.BR listxattr (2),
+-.BR removexattr (2),
+-and
+-.BR attr (5).
+diff --git a/man/man2/listxattr.2 b/man/man2/listxattr.2
+deleted file mode 100644
+index 8b4371c..0000000
+--- a/man/man2/listxattr.2
++++ /dev/null
+@@ -1,158 +0,0 @@
+-.\"
+-.\" Extended attributes system calls manual pages
+-.\"
+-.\" (C) Andreas Gruenbacher, February 2001
+-.\" (C) Silicon Graphics Inc, September 2001
+-.\"
+-.\" This is free documentation; you can redistribute it and/or
+-.\" modify it under the terms of the GNU General Public License as
+-.\" published by the Free Software Foundation; either version 2 of
+-.\" the License, or (at your option) any later version.
+-.\"
+-.\" The GNU General Public License's references to "object code"
+-.\" and "executables" are to be interpreted as the output of any
+-.\" document formatting or typesetting system, including
+-.\" intermediate and printed output.
+-.\"
+-.\" This manual is distributed in the hope that it will be useful,
+-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-.\" GNU General Public License for more details.
+-.\"
+-.\" You should have received a copy of the GNU General Public
+-.\" License along with this manual.  If not, see
+-.\" <http://www.gnu.org/licenses/>.
+-.\"
+-.TH LISTXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
+-.SH NAME
+-listxattr, llistxattr, flistxattr \- list extended attribute names
+-.SH SYNOPSIS
+-.fam C
+-.nf
+-.B #include <sys/types.h>
+-.B #include <attr/xattr.h>
+-.sp
+-.BI "ssize_t listxattr (const char\ *" path ",
+-.BI "\t\t\t\t char\ *" list ", size_t " size );
+-.BI "ssize_t llistxattr (const char\ *" path ",
+-.BI "\t\t\t\t char\ *" list ", size_t " size );
+-.BI "ssize_t flistxattr (int " filedes ",
+-.BI "\t\t\t\t char\ *" list ", size_t " size );
+-.fi
+-.fam T
+-.SH DESCRIPTION
+-Extended attributes are name:value
+-pairs associated with inodes (files, directories, symlinks, etc).
+-They are extensions to the normal attributes which are associated
+-with all inodes in the system (i.e. the
+-.BR stat (2)
+-data).
+-A complete overview of extended attributes concepts can be found in
+-.BR attr (5).
+-.PP
+-.B listxattr
+-retrieves the
+-.I list
+-of extended attribute names associated with the given
+-.I path
+-in the filesystem.
+-The list is the set of (NULL-terminated) names, one after the other.
+-Names of extended attributes to which the calling process does not
+-have access may be omitted from the list.
+-The length of the attribute name
+-.I list
+-is returned.
+-.PP
+-.B llistxattr
+-is identical to
+-.BR listxattr ,
+-except in the case of a symbolic link, where the list of names of
+-extended attributes associated with the link itself is retrieved,
+-not the file that it refers to.
+-.I list
+-is a caller-allocated buffer of size
+-.IR size .
+-.PP
+-.B flistxattr
+-is identical to
+-.BR listxattr ,
+-only the open file pointed to by
+-.I filedes
+-(as returned by
+-.BR open (2))
+-is interrogated in place of
+-.IR path .
+-.PP
+-A single extended attribute
+-.I name
+-is a simple NULL-terminated string.
+-The name includes a namespace prefix \- there may be several, disjoint
+-namespaces associated with an individual inode.
+-.PP
+-An empty buffer of
+-.I size
+-zero can be passed into these calls to return the current size of the
+-list of extended attribute names, which can be used to estimate the
+-size of a buffer which is sufficiently large to hold the list of names.
+-.SH EXAMPLES
+-The
+-.I list
+-of names is returned as an unordered array of NULL-terminated character
+-strings (attribute names are separated by NULL characters), like this:
+-.fam C
+-.RS
+-.nf
+-user.name1\\0system.name1\\0user.name2\\0
+-.fi
+-.RE
+-.fam T
+-.P
+-Filesystems like ext2, ext3 and XFS which implement POSIX ACLs using
+-extended attributes, might return a
+-.I list
+-like this:
+-.fam C
+-.RS
+-.nf
+-system.posix_acl_access\\0system.posix_acl_default\\0
+-.fi
+-.RE
+-.fam T
+-.SH RETURN VALUE
+-On success, a positive number is returned indicating the size of the
+-extended attribute name list.
+-On failure, \-1 is returned and
+-.I errno
+-is set appropriately.
+-.PP
+-If the
+-.I size
+-of the
+-.I list
+-buffer is too small to hold the result,
+-.I errno
+-is set to ERANGE.
+-.PP
+-If extended attributes are not supported by the filesystem, or are disabled,
+-.I errno
+-is set to ENOTSUP.
+-.PP
+-The errors documented for the
+-.BR stat (2)
+-system call are also applicable here.
+-.SH AUTHORS
+-Andreas Gruenbacher,
+-.RI < a.gruenbacher@bestbits.at >
+-and the SGI XFS development team,
+-.RI < linux-xfs@oss.sgi.com >.
+-Please send any bug reports or comments to these addresses.
+-.SH SEE ALSO
+-.BR getfattr (1),
+-.BR setfattr (1),
+-.BR open (2),
+-.BR stat (2),
+-.BR getxattr (2),
+-.BR setxattr (2),
+-.BR removexattr (2),
+-and
+-.BR attr (5).
+diff --git a/man/man2/removexattr.2 b/man/man2/removexattr.2
+deleted file mode 100644
+index 2c7d934..0000000
+--- a/man/man2/removexattr.2
++++ /dev/null
+@@ -1,111 +0,0 @@
+-.\"
+-.\" Extended attributes system calls manual pages
+-.\"
+-.\" (C) Andreas Gruenbacher, February 2001
+-.\" (C) Silicon Graphics Inc, September 2001
+-.\"
+-.\" This is free documentation; you can redistribute it and/or
+-.\" modify it under the terms of the GNU General Public License as
+-.\" published by the Free Software Foundation; either version 2 of
+-.\" the License, or (at your option) any later version.
+-.\"
+-.\" The GNU General Public License's references to "object code"
+-.\" and "executables" are to be interpreted as the output of any
+-.\" document formatting or typesetting system, including
+-.\" intermediate and printed output.
+-.\"
+-.\" This manual is distributed in the hope that it will be useful,
+-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-.\" GNU General Public License for more details.
+-.\"
+-.\" You should have received a copy of the GNU General Public
+-.\" License along with this manual.  If not, see
+-.\" <http://www.gnu.org/licenses/>.
+-.\"
+-.TH REMOVEXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
+-.SH NAME
+-removexattr, lremovexattr, fremovexattr \- remove an extended attribute
+-.SH SYNOPSIS
+-.fam C
+-.nf
+-.B #include <sys/types.h>
+-.B #include <attr/xattr.h>
+-.sp
+-.BI "int removexattr (const char\ *" path ", const char\ *" name );
+-.BI "int lremovexattr (const char\ *" path ", const char\ *" name );
+-.BI "int fremovexattr (int " filedes ", const char\ *" name );
+-.fi
+-.fam T
+-.SH DESCRIPTION
+-Extended attributes are
+-.IR name :\c
+-value pairs associated with inodes (files, directories, symlinks, etc).
+-They are extensions to the normal attributes which are associated
+-with all inodes in the system (i.e. the
+-.BR stat (2)
+-data).
+-A complete overview of extended attributes concepts can be found in
+-.BR attr (5).
+-.PP
+-.B removexattr
+-removes the extended attribute identified by
+-.I name
+-and associated with the given
+-.I path
+-in the filesystem.
+-.PP
+-.B lremovexattr
+-is identical to 
+-.BR removexattr ,
+-except in the case of a symbolic link, where the extended attribute is
+-removed from the link itself, not the file that it refers to.
+-.PP
+-.B fremovexattr
+-is identical to
+-.BR removexattr ,
+-only the extended attribute is removed from the open file pointed to by
+-.I filedes
+-(as returned by
+-.BR open (2))
+-in place of
+-.IR path .
+-.PP
+-An extended attribute name is a simple NULL-terminated string.
+-The
+-.I name
+-includes a namespace prefix \- there may be several, disjoint
+-namespaces associated with an individual inode.
+-.SH RETURN VALUE
+-On success, zero is returned.
+-On failure, \-1 is returned and
+-.I errno
+-is set appropriately.
+-.PP
+-If the named attribute does not exist,
+-.I errno
+-is set to ENOATTR.
+-.PP
+-If extended attributes are not supported by the filesystem, or are disabled,
+-.I errno
+-is set to ENOTSUP.
+-.PP
+-The errors documented for the
+-.BR stat (2)
+-system call are also applicable here.
+-.SH AUTHORS
+-Andreas Gruenbacher,
+-.RI < a.gruenbacher@bestbits.at >
+-and the SGI XFS development team,
+-.RI < linux-xfs@oss.sgi.com >.
+-Please send any bug reports or comments to these addresses.
+-.SH SEE ALSO
+-.BR getfattr (1),
+-.BR setfattr (1),
+-.BR open (2),
+-.BR stat (2),
+-.BR setxattr (2),
+-.BR getxattr (2),
+-.BR listxattr (2),
+-and
+-.BR attr (5).
+diff --git a/man/man2/setxattr.2 b/man/man2/setxattr.2
+deleted file mode 100644
+index b20dc9f..0000000
+--- a/man/man2/setxattr.2
++++ /dev/null
+@@ -1,143 +0,0 @@
+-.\"
+-.\" Extended attributes system calls manual pages
+-.\"
+-.\" (C) Andreas Gruenbacher, February 2001
+-.\" (C) Silicon Graphics Inc, September 2001
+-.\"
+-.\" This is free documentation; you can redistribute it and/or
+-.\" modify it under the terms of the GNU General Public License as
+-.\" published by the Free Software Foundation; either version 2 of
+-.\" the License, or (at your option) any later version.
+-.\"
+-.\" The GNU General Public License's references to "object code"
+-.\" and "executables" are to be interpreted as the output of any
+-.\" document formatting or typesetting system, including
+-.\" intermediate and printed output.
+-.\"
+-.\" This manual is distributed in the hope that it will be useful,
+-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-.\" GNU General Public License for more details.
+-.\"
+-.\" You should have received a copy of the GNU General Public
+-.\" License along with this manual.  If not, see
+-.\" <http://www.gnu.org/licenses/>.
+-.\"
+-.TH SETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
+-.SH NAME
+-setxattr, lsetxattr, fsetxattr \- set an extended attribute value
+-.SH SYNOPSIS
+-.fam C
+-.nf
+-.B #include <sys/types.h>
+-.B #include <attr/xattr.h>
+-.sp
+-.BI "int setxattr (const char\ *" path ", const char\ *" name ",
+-.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
+-.BI "int lsetxattr (const char\ *" path ", const char\ *" name ",
+-.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
+-.BI "int fsetxattr (int " filedes ", const char\ *" name ",
+-.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
+-.fi
+-.fam T
+-.SH DESCRIPTION
+-Extended attributes are
+-.IR name :\c
+-.I value
+-pairs associated with inodes (files, directories, symlinks, etc).
+-They are extensions to the normal attributes which are associated
+-with all inodes in the system (i.e. the
+-.BR stat (2)
+-data).
+-A complete overview of extended attributes concepts can be found in
+-.BR attr (5).
+-.PP
+-.B setxattr
+-sets the
+-.I value
+-of the extended attribute identified by
+-.I name
+-and associated with the given
+-.I path
+-in the filesystem.
+-The
+-.I size
+-of the
+-.I value
+-must be specified.
+-.PP
+-.B lsetxattr
+-is identical to 
+-.BR setxattr ,
+-except in the case of a symbolic link, where the extended attribute is
+-set on the link itself, not the file that it refers to.
+-.PP
+-.B fsetxattr
+-is identical to
+-.BR setxattr ,
+-only the extended attribute is set on the open file pointed to by
+-.I filedes
+-(as returned by
+-.BR open (2))
+-in place of
+-.IR path .
+-.PP
+-An extended attribute name is a simple NULL-terminated string.
+-The
+-.I name
+-includes a namespace prefix \- there may be several, disjoint
+-namespaces associated with an individual inode.
+-The
+-.I value
+-of an extended attribute is a chunk of arbitrary textual or
+-binary data of specified length.
+-.PP
+-The
+-.I flags
+-parameter can be used to refine the semantics of the operation.
+-XATTR_CREATE specifies a pure create, which fails if the named
+-attribute exists already.
+-XATTR_REPLACE specifies a pure replace operation, which fails if the
+-named attribute does not already exist.
+-By default (no flags), the extended attribute will be created if
+-need be, or will simply replace the value if the attribute exists.
+-.SH RETURN VALUE
+-On success, zero is returned.
+-On failure, \-1 is returned and
+-.I errno
+-is set appropriately.
+-.PP
+-If XATTR_CREATE is specified, and the attribute exists already,
+-.I errno
+-is set to EEXIST.
+-If XATTR_REPLACE is specified, and the attribute does not exist,
+-.I errno
+-is set to ENOATTR.
+-.PP
+-If there is insufficient space remaining to store the extended attribute,
+-.I errno
+-is set to either ENOSPC, or EDQUOT if quota enforcement was the cause.
+-.PP
+-If extended attributes are not supported by the filesystem, or are disabled,
+-.I errno
+-is set to ENOTSUP.
+-.PP
+-The errors documented for the
+-.BR stat (2)
+-system call are also applicable here.
+-.SH AUTHORS
+-Andreas Gruenbacher,
+-.RI < a.gruenbacher@bestbits.at >
+-and the SGI XFS development team,
+-.RI < linux-xfs@oss.sgi.com >.
+-Please send any bug reports or comments to these addresses.
+-.SH SEE ALSO
+-.BR getfattr (1),
+-.BR setfattr (1),
+-.BR open (2),
+-.BR stat (2),
+-.BR getxattr (2),
+-.BR listxattr (2),
+-.BR removexattr (2),
+-and
+-.BR attr (5).
+-- 
+2.7.4
+
-- 
2.7.4


