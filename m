Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbM-0005lt-Qc
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609018"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:19 -0700
Message-Id: <3ddb40e98dbf0fbeb65d29b09bce209a0fabb727.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 15/20] base-passwd: populate the target sysroot with passwd/group/login.defs
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:53 -0000

From: Scott Garman <scott.a.garman@intel.com>

The passwd, group, and login.defs files in the target sysroot will
be used when recipes create custom user and group permissions in
their packages.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../base-passwd/base-passwd-3.5.22/login.defs      |  386 ++++++++++++++++++++
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   27 ++-
 2 files changed, 411 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
new file mode 100644
index 0000000..1d392ac
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
@@ -0,0 +1,386 @@
+#
+# /etc/login.defs - Configuration control definitions for the shadow package.
+#
+#	$Id: login.defs 3038 2009-07-23 20:41:35Z nekral-guest $
+#
+
+#
+# Delay in seconds before being allowed another attempt after a login failure
+# Note: When PAM is used, some modules may enfore a minimal delay (e.g.
+#       pam_unix enforces a 2s delay)
+#
+FAIL_DELAY		3
+
+#
+# Enable logging and display of /var/log/faillog login failure info.
+#
+FAILLOG_ENAB		yes
+
+#
+# Enable display of unknown usernames when login failures are recorded.
+#
+LOG_UNKFAIL_ENAB	no
+
+#
+# Enable logging of successful logins
+#
+LOG_OK_LOGINS		no
+
+#
+# Enable logging and display of /var/log/lastlog login time info.
+#
+LASTLOG_ENAB		yes
+
+#
+# Enable checking and display of mailbox status upon login.
+#
+# Disable if the shell startup files already check for mail
+# ("mailx -e" or equivalent).
+#
+#MAIL_CHECK_ENAB		yes
+
+#
+# Enable additional checks upon password changes.
+#
+OBSCURE_CHECKS_ENAB	yes
+
+#
+# Enable checking of time restrictions specified in /etc/porttime.
+#
+PORTTIME_CHECKS_ENAB	yes
+
+#
+# Enable setting of ulimit, umask, and niceness from passwd gecos field.
+#
+QUOTAS_ENAB		yes
+
+#
+# Enable "syslog" logging of su activity - in addition to sulog file logging.
+# SYSLOG_SG_ENAB does the same for newgrp and sg.
+#
+SYSLOG_SU_ENAB		yes
+SYSLOG_SG_ENAB		yes
+
+#
+# If defined, either full pathname of a file containing device names or
+# a ":" delimited list of device names.  Root logins will be allowed only
+# upon these devices.
+#
+CONSOLE		/etc/securetty
+#CONSOLE	console:tty01:tty02:tty03:tty04
+
+#
+# If defined, all su activity is logged to this file.
+#
+#SULOG_FILE	/var/log/sulog
+
+#
+# If defined, ":" delimited list of "message of the day" files to
+# be displayed upon login.
+#
+MOTD_FILE	/etc/motd
+#MOTD_FILE	/etc/motd:/usr/lib/news/news-motd
+
+#
+# If defined, this file will be output before each login prompt.
+#
+#ISSUE_FILE	/etc/issue
+
+#
+# If defined, file which maps tty line to TERM environment parameter.
+# Each line of the file is in a format something like "vt100  tty01".
+#
+#TTYTYPE_FILE	/etc/ttytype
+
+#
+# If defined, login failures will be logged here in a utmp format.
+# last, when invoked as lastb, will read /var/log/btmp, so...
+#
+FTMP_FILE	/var/log/btmp
+
+#
+# If defined, name of file whose presence which will inhibit non-root
+# logins.  The contents of this file should be a message indicating
+# why logins are inhibited.
+#
+NOLOGINS_FILE	/etc/nologin
+
+#
+# If defined, the command name to display when running "su -".  For
+# example, if this is defined as "su" then a "ps" will display the
+# command is "-su".  If not defined, then "ps" would display the
+# name of the shell actually being run, e.g. something like "-sh".
+#
+SU_NAME		su
+
+#
+# *REQUIRED*
+#   Directory where mailboxes reside, _or_ name of file, relative to the
+#   home directory.  If you _do_ define both, #MAIL_DIR takes precedence.
+#
+#MAIL_DIR	/var/spool/mail
+MAIL_FILE	.mail
+
+#
+# If defined, file which inhibits all the usual chatter during the login
+# sequence.  If a full pathname, then hushed mode will be enabled if the
+# user's name or shell are found in the file.  If not a full pathname, then
+# hushed mode will be enabled if the file exists in the user's home directory.
+#
+HUSHLOGIN_FILE	.hushlogin
+#HUSHLOGIN_FILE	/etc/hushlogins
+
+#
+# If defined, either a TZ environment parameter spec or the
+# fully-rooted pathname of a file containing such a spec.
+#
+#ENV_TZ		TZ=CST6CDT
+#ENV_TZ		/etc/tzname
+
+#
+# If defined, an HZ environment parameter spec.
+#
+# for Linux/x86
+ENV_HZ		HZ=100
+# For Linux/Alpha...
+#ENV_HZ		HZ=1024
+
+#
+# *REQUIRED*  The default PATH settings, for superuser and normal users.
+#
+# (they are minimal, add the rest in the shell startup files)
+ENV_SUPATH	PATH=/sbin:/bin:/usr/sbin:/usr/bin
+ENV_PATH	PATH=/bin:/usr/bin
+
+#
+# Terminal permissions
+#
+#	TTYGROUP	Login tty will be assigned this group ownership.
+#	TTYPERM		Login tty will be set to this permission.
+#
+# If you have a "write" program which is "setgid" to a special group
+# which owns the terminals, define TTYGROUP to the group number and
+# TTYPERM to 0620.  Otherwise leave TTYGROUP commented out and assign
+# TTYPERM to either 622 or 600.
+#
+TTYGROUP	tty
+TTYPERM		0600
+
+#
+# Login configuration initializations:
+#
+#	ERASECHAR	Terminal ERASE character ('\010' = backspace).
+#	KILLCHAR	Terminal KILL character ('\025' = CTRL/U).
+#	ULIMIT		Default "ulimit" value.
+#
+# The ERASECHAR and KILLCHAR are used only on System V machines.
+# The ULIMIT is used only if the system supports it.
+# (now it works with setrlimit too; ulimit is in 512-byte units)
+#
+# Prefix these values with "0" to get octal, "0x" to get hexadecimal.
+#
+ERASECHAR	0177
+KILLCHAR	025
+#ULIMIT		2097152
+
+# Default initial "umask" value for non-PAM enabled systems.
+# UMASK is also used by useradd and newusers to set the mode of new home
+# directories.
+# 022 is the default value, but 027, or even 077, could be considered
+# better for privacy. There is no One True Answer here: each sysadmin
+# must make up her mind.
+UMASK		022
+
+#
+# Password aging controls:
+#
+#	PASS_MAX_DAYS	Maximum number of days a password may be used.
+#	PASS_MIN_DAYS	Minimum number of days allowed between password changes.
+#	PASS_MIN_LEN	Minimum acceptable password length.
+#	PASS_WARN_AGE	Number of days warning given before a password expires.
+#
+PASS_MAX_DAYS	99999
+PASS_MIN_DAYS	0
+PASS_MIN_LEN	5
+PASS_WARN_AGE	7
+
+#
+# If "yes", the user must be listed as a member of the first gid 0 group
+# in /etc/group (called "root" on most Linux systems) to be able to "su"
+# to uid 0 accounts.  If the group doesn't exist or is empty, no one
+# will be able to "su" to uid 0.
+#
+SU_WHEEL_ONLY	no
+
+#
+# If compiled with cracklib support, where are the dictionaries
+#
+CRACKLIB_DICTPATH	/var/cache/cracklib/cracklib_dict
+
+#
+# Min/max values for automatic uid selection in useradd
+#
+UID_MIN			 1000
+UID_MAX			60000
+# System accounts
+SYS_UID_MIN		  101
+SYS_UID_MAX		  999
+
+#
+# Min/max values for automatic gid selection in groupadd
+#
+GID_MIN			 1000
+GID_MAX			60000
+# System accounts
+SYS_GID_MIN		  101
+SYS_GID_MAX		  999
+
+#
+# Max number of login retries if password is bad
+#
+LOGIN_RETRIES		5
+
+#
+# Max time in seconds for login
+#
+LOGIN_TIMEOUT		60
+
+#
+# Maximum number of attempts to change password if rejected (too easy)
+#
+PASS_CHANGE_TRIES	5
+
+#
+# Warn about weak passwords (but still allow them) if you are root.
+#
+PASS_ALWAYS_WARN	yes
+
+#
+# Number of significant characters in the password for crypt().
+# Default is 8, don't change unless your crypt() is better.
+# Ignored if MD5_CRYPT_ENAB set to "yes".
+#
+#PASS_MAX_LEN		8
+
+#
+# Require password before chfn/chsh can make any changes.
+#
+CHFN_AUTH		yes
+
+#
+# Which fields may be changed by regular users using chfn - use
+# any combination of letters "frwh" (full name, room number, work
+# phone, home phone).  If not defined, no changes are allowed.
+# For backward compatibility, "yes" = "rwh" and "no" = "frwh".
+# 
+CHFN_RESTRICT		rwh
+
+#
+# Password prompt (%s will be replaced by user name).
+#
+# XXX - it doesn't work correctly yet, for now leave it commented out
+# to use the default which is just "Password: ".
+#LOGIN_STRING		"%s's Password: "
+
+#
+# Only works if compiled with MD5_CRYPT defined:
+# If set to "yes", new passwords will be encrypted using the MD5-based
+# algorithm compatible with the one used by recent releases of FreeBSD.
+# It supports passwords of unlimited length and longer salt strings.
+# Set to "no" if you need to copy encrypted passwords to other systems
+# which don't understand the new algorithm.  Default is "no".
+#
+# Note: If you use PAM, it is recommended to use a value consistent with
+# the PAM modules configuration.
+#
+# This variable is deprecated. You should use ENCRYPT_METHOD.
+#
+#MD5_CRYPT_ENAB	no
+
+#
+# Only works if compiled with ENCRYPTMETHOD_SELECT defined:
+# If set to MD5 , MD5-based algorithm will be used for encrypting password
+# If set to SHA256, SHA256-based algorithm will be used for encrypting password
+# If set to SHA512, SHA512-based algorithm will be used for encrypting password
+# If set to DES, DES-based algorithm will be used for encrypting password (default)
+# Overrides the MD5_CRYPT_ENAB option
+#
+# Note: If you use PAM, it is recommended to use a value consistent with
+# the PAM modules configuration.
+#
+#ENCRYPT_METHOD DES
+
+#
+# Only works if ENCRYPT_METHOD is set to SHA256 or SHA512.
+#
+# Define the number of SHA rounds.
+# With a lot of rounds, it is more difficult to brute forcing the password.
+# But note also that it more CPU resources will be needed to authenticate
+# users.
+#
+# If not specified, the libc will choose the default number of rounds (5000).
+# The values must be inside the 1000-999999999 range.
+# If only one of the MIN or MAX values is set, then this value will be used.
+# If MIN > MAX, the highest value will be used.
+#
+# SHA_CRYPT_MIN_ROUNDS 5000
+# SHA_CRYPT_MAX_ROUNDS 5000
+
+#
+# List of groups to add to the user's supplementary group set
+# when logging in on the console (as determined by the CONSOLE
+# setting).  Default is none.
+#
+# Use with caution - it is possible for users to gain permanent
+# access to these groups, even when not logged in on the console.
+# How to do it is left as an exercise for the reader...
+#
+#CONSOLE_GROUPS		floppy:audio:cdrom
+
+#
+# Should login be allowed if we can't cd to the home directory?
+# Default in no.
+#
+DEFAULT_HOME	yes
+
+#
+# If this file exists and is readable, login environment will be
+# read from it.  Every line should be in the form name=value.
+#
+ENVIRON_FILE	/etc/environment
+
+#
+# If defined, this command is run when removing a user.
+# It should remove any at/cron/print jobs etc. owned by
+# the user to be removed (passed as the first argument).
+#
+#USERDEL_CMD	/usr/sbin/userdel_local
+
+#
+# Enable setting of the umask group bits to be the same as owner bits
+# (examples: 022 -> 002, 077 -> 007) for non-root users, if the uid is
+# the same as gid, and username is the same as the primary group name.
+#
+# This also enables userdel to remove user groups if no members exist.
+#
+USERGROUPS_ENAB yes
+
+#
+# If set to a non-nul number, the shadow utilities will make sure that
+# groups never have more than this number of users on one line.
+# This permit to support split groups (groups split into multiple lines,
+# with the same group ID, to avoid limitation of the line length in the
+# group file).
+#
+# 0 is the default value and disables this feature.
+#
+#MAX_MEMBERS_PER_GROUP	0
+
+#
+# If useradd should create home directories for users by default (non
+# system users only)
+# This option is overridden with the -M or -m flags on the useradd command
+# line.
+#
+CREATE_HOME     yes
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 6f768ca..3315c68 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,13 +1,14 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://nobash.patch \
-           file://root-home.patch"
+           file://root-home.patch \
+           file://login.defs"
 
 SRC_URI[md5sum] = "47f22ab6b572d0133409ff6ad1fab402"
 SRC_URI[sha256sum] = "d34acb35a9f9f221e7e4f642b9ef4b22083dd77bb2fc7216756f445316d842fc"
@@ -16,6 +17,8 @@ S = "${WORKDIR}/base-passwd"
 
 inherit autotools
 
+SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
+
 do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -p -m 755 update-passwd ${D}${sbindir}/
@@ -27,6 +30,7 @@ do_install () {
 	install -d -m 755 ${D}${datadir}/base-passwd
 	install -p -m 644 passwd.master ${D}${datadir}/base-passwd/
 	install -p -m 644 group.master ${D}${datadir}/base-passwd/
+	install -p -m 644 ${S}/../login.defs ${D}${datadir}/base-passwd/login.defs
 
 	install -d -m 755 ${D}${docdir}/${PN}
 	install -p -m 644 debian/changelog ${D}${docdir}/${PN}/
@@ -45,5 +49,24 @@ pkg_postinst_${PN} () {
 	if [ ! -e $D${sysconfdir}/group ] ; then
 		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
 	fi
+
+	if [ ! -e $D{sysconfdir}/login.defs ] ; then
+		cp $D${datadir}/base-passwd/login.defs $D${sysconfdir}/login.defs
+	fi
 	exit 0
 }
+
+base_passwd_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		# Staging does not copy ${sysconfdir} files into the
+		# target sysroot, so we need to do so manually. We
+		# put these files in the target sysroot so they can
+		# be used by recipes which use custom user/group
+		# permissions.
+		install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
+		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/passwd.master ${STAGING_DIR_TARGET}${sysconfdir}/passwd
+		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/group.master ${STAGING_DIR_TARGET}${sysconfdir}/group
+		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/login.defs ${STAGING_DIR_TARGET}/${sysconfdir}/login.defs
+	fi
+}
-- 
1.7.3.4



