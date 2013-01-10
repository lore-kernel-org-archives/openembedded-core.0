Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtNKI-0006kq-7A
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 19:58:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jan 2013 10:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,446,1355126400"; d="scan'208";a="242398583"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by azsmga001.ch.intel.com with ESMTP; 10 Jan 2013 10:42:33 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 20:42:41 +0200
Message-Id: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] connman: upgrade to 1.10
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
X-List-Received-Date: Thu, 10 Jan 2013 18:58:25 -0000

From: Constantin Musca <constantinx.musca@intel.com>

0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
    - adapted to the new version

0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
    - patch removed (it is included in the new version)

inet-fix-ip-cleanup-functions.patch: added
    - fix for ip cleanup functions

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/layer.conf                               |    1 +
 meta/conf/machine/include/qemu.inc                 |    2 +
 meta/recipes-connectivity/connman/connman-conf.bb  |   19 ++
 .../connman/connman-conf/COPYING                   |  340 ++++++++++++++++++++
 .../connman/connman-conf/qemu/main.conf            |   78 +++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   61 ----
 ...If-there-is-no-d_type-support-use-fstatat.patch |   38 ++-
 .../connman/inet-fix-ip-cleanup-functions.patch    |   40 +++
 .../connman/{connman_1.4.bb => connman_1.10.bb}    |    8 +-
 9 files changed, 507 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/COPYING
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemu/main.conf
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.4.bb => connman_1.10.bb} (71%)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 78ceae9..3259e5c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow-securetty \
   opkg-config-base \
   netbase \
+  connman-conf \
   formfactor \
   xserver-xf86-config \
   pointercal \
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 5d59a7f..41fe552 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
+MACHINEOVERRIDES .= ":qemu"
+
 IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
new file mode 100644
index 0000000..a6a6f53
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -0,0 +1,19 @@
+#connman config to ignore wired interfaces on qemu machines
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRC_URI  = "file://COPYING"
+SRC_URI_append_qemu = " file://main.conf"
+
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    #Blacklist ethn network interface in case of qemu* machines
+    if test -e ${WORKDIR}/main.conf; then
+        install -d ${D}${sysconfdir}/connman
+        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
+    fi
+}
diff --git a/meta/recipes-connectivity/connman/connman-conf/COPYING b/meta/recipes-connectivity/connman/connman-conf/COPYING
new file mode 100644
index 0000000..6d45519
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/COPYING
@@ -0,0 +1,340 @@
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemu/main.conf b/meta/recipes-connectivity/connman/connman-conf/qemu/main.conf
new file mode 100644
index 0000000..1d9e657
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemu/main.conf
@@ -0,0 +1,78 @@
+[General]
+
+# Set input request timeout. Default is 120 seconds
+# The request for inputs like passphrase will timeout
+# after certain amount of time. Use this setting to
+# increase the value in case of different user
+# interface designs.
+# InputRequestTimeout = 120
+
+# Set browser launch timeout. Default is 300 seconds
+# The request for launching a browser for portal pages
+# will timeout after certain amount of time. Use this
+# setting to increase the value in case of different
+# user interface designs.
+# BrowserLaunchTimeout = 300
+
+# Enable background scanning. Default is true.
+# Background scanning will start every 5 minutes unless
+# the scan list is empty. In that case, a simple backoff
+# mechanism starting from 10s up to 5 minutes will run.
+# BackgroundScanning = true
+
+# List of Fallback timeservers separated by ",".
+# These timeservers are used for NTP sync when there are
+# no timeserver set by the user or by the service.
+# These can contain mixed combination of fully qualified
+# domain names, IPv4 and IPv6 addresses.
+# FallbackTimeservers =
+
+# List of fallback nameservers separated by "," appended
+# to the list of nameservers given by the service. The
+# nameserver entries must be in numeric format, host
+# names are ignored.
+# FallbackNameservers =
+
+# List of technologies that are marked autoconnectable
+# by default, separated by commas ",". The default value
+# for this entry when empty is ethernet,wifi,cellular.
+# Services that are automatically connected must have been
+# set up and saved to storage beforehand.
+# DefaultAutoConnectTechnologies =
+
+# List of preferred technologies from the most preferred
+# one to the least preferred one separated by commas ",".
+# Services of the listed technology type will be tried one
+# by one in the order given, until one of them gets connected
+# or they are all tried. A service of a preferred technology
+# type in state 'ready' will get the default route when
+# compared to another preferred type further down the list
+# with state 'ready' or with a non-preferred type; a service
+# of a preferred technology type in state 'online' will get
+# the default route when compared to either a non-preferred
+# type or a preferred type further down in the list.
+# PreferredTechnologies =
+
+# List of blacklisted network interfaces separated by ",".
+# Found interfaces will be compared to the list and will
+# not be handled by connman, if their first characters
+# match any of the list entries. Default value is
+# vmnet,vboxnet,virbr.
+NetworkInterfaceBlacklist = eth
+
+# Allow connman to change the system hostname. This can
+# happen for example if we receive DHCP hostname option.
+# Default value is true.
+# AllowHostnameUpdates = true
+
+# Keep only a single connected technology at any time. When a new
+# service is connected by the user or a better one is found according
+# to PreferredTechnologies, the new service is kept connected and all
+# the other previously connected services are disconnected. With this
+# setting it does not matter whether the previously connected services
+# are in 'online' or 'ready' states, the newly connected service is
+# the only one that will be kept connected. A service connected by the
+# user will be used until going out of network coverage. With this
+# setting enabled applications will notice more network breaks than
+# normal. Default value is false.
+# SingleConnectedTechnology = false
diff --git a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
deleted file mode 100644
index 3bced52..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f2094e6b2e4542adf458d8fa58d7bccd5edb762e Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Tue, 17 Jul 2012 17:27:39 +0300
-Subject: [PATCH V3 1/2] timezone.c: If there is no d_type support use
- fstatat()
-
-This is useful for filesystems where d_type is always DT_UNKNOWN.
-In this case use fstatat() function.
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
-Upstream-Status: Submitted
- 
----
- src/timezone.c |   24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/src/timezone.c b/src/timezone.c
-index 173d658..f951f6b 100644
---- a/src/timezone.c
-+++ b/src/timezone.c
-@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat *src_st,
- 	DIR *dir;
- 	struct dirent *d;
- 	char *str, pathname[PATH_MAX];
-+	struct stat buf;
-+	int ret;
- 
- 	if (subpath == NULL)
- 		strncpy(pathname, basepath, sizeof(pathname));
-@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat *src_st,
- 				return str;
- 			}
- 			break;
-+		case DT_UNKNOWN:
-+			/*
-+			 * If there is no d_type support use fstatat()
-+			 * to check if directory
-+			 */
-+			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
-+			if (ret < 0)
-+				continue;
-+			if (!(buf.st_mode & S_IFDIR))
-+				continue;
-+			if (subpath == NULL)
-+				strncpy(pathname, d->d_name, sizeof(pathname));
-+			else
-+				snprintf(pathname, sizeof(pathname),
-+						"%s/%s", subpath, d->d_name);
-+
-+			str = find_origin(src_map, src_st, basepath, pathname);
-+			if (str != NULL) {
-+				closedir(dir);
-+				return str;
-+			}
-+			break;
- 		}
- 	}
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
index d3205c0..7315545 100644
--- a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
@@ -8,20 +8,33 @@ This is useful for filesystems where d_type is always DT_UNKNOWN.
 In this case use fstatat() function.
 
 Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 Upstream-Status: Submitted
  
 ---
  src/storage.c |   19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
-diff --git a/src/storage.c b/src/storage.c
-index 47bd0cb..0491a52 100644
---- a/src/storage.c
-+++ b/src/storage.c
-@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
+Index: git/src/storage.c
+===================================================================
+--- git.orig/src/storage.c
++++ git/src/storage.c
+@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
  
- 			g_string_append_printf(result, "%s/", d->d_name);
- 			break;
+ 		switch (d->d_type) {
+ 		case DT_DIR:
+-		case DT_UNKNOWN:
+ 			/*
+ 			 * If the settings file is not found, then
+ 			 * assume this directory is not a services dir.
+@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
+ 			ret = stat(str, &buf);
+ 			g_free(str);
+ 			if (ret < 0)
++				continue;
++
++			g_string_append_printf(result, "%s/", d->d_name);
++			break;
 +		case DT_UNKNOWN:
 +			/*
 +			 * If there is no d_type support use fstatat()
@@ -37,13 +50,6 @@ index 47bd0cb..0491a52 100644
 +			ret = stat(str, &buf);
 +			g_free(str);
 +			if (ret < 0)
-+				continue;
-+
-+			g_string_append_printf(result, "%s/", d->d_name);
-+			break;
- 		}
- 	}
+ 				continue;
  
--- 
-1.7.9.5
-
+ 			g_string_append_printf(result, "%s/", d->d_name);
diff --git a/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
new file mode 100644
index 0000000..3071549
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
@@ -0,0 +1,40 @@
+From 100353e10f60a50ca1ba78daa6bc4dfebf5b3297 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Wed, 5 Dec 2012 15:07:21 +0200
+Subject: [PATCH] inet: fix ip cleanup functions
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+---
+ src/inet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/inet.c b/src/inet.c
+index be69aca..e76a1f1 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -626,6 +626,10 @@ int connman_inet_clear_ipv6_address(int index, const char *address,
+ 
+ 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
+ 
++	if (address == NULL) {
++		return -1;
++	}
++
+ 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET6,
+ 				address, NULL, prefix_len, NULL);
+ 	if (err < 0) {
+@@ -649,6 +653,10 @@ int connman_inet_clear_address(int index, struct connman_ipaddress *ipaddress)
+ 
+ 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
+ 
++	if (address == NULL) {
++		return -1;
++	}
++
+ 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET,
+ 				address, peer, prefix_len, broadcast);
+ 	if (err < 0) {
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-connectivity/connman/connman_1.4.bb b/meta/recipes-connectivity/connman/connman_1.10.bb
similarity index 71%
rename from meta/recipes-connectivity/connman/connman_1.4.bb
rename to meta/recipes-connectivity/connman/connman_1.10.bb
index bd8ba65..10d5255 100644
--- a/meta/recipes-connectivity/connman/connman_1.4.bb
+++ b/meta/recipes-connectivity/connman/connman_1.10.bb
@@ -1,12 +1,14 @@
 require connman.inc
 
-# 1.4 tag
-SRCREV = "f701bbca259f1f35e68d338f31f5373f75f3da5f"
+# 1.10 tag
+SRCREV = "3bda76eb442c9395db1dba17352c3e78376671cc"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
+            file://inet-fix-ip-cleanup-functions.patch"
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
+
+RRECOMMENDS_${PN} = "connman-conf"
-- 
1.7.10.4



