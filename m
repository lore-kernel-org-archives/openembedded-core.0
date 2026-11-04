Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2305.1793770293010201634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JTv9gPny;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AH6Bd7QF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1a50a834b-411e260f-f0e3-4167-a173-63191a91b3b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793770292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zd81sDbyjuDlbY/P+eFpXau7mLvKV6nIUwyBRJutO9Q=;
	b=JTv9gPnydBtNct1Jc2x0rCw0n7f787oFuhbef7NQtNxE0XZvvghhZmWpc797ba1c
	wgC4zaPwfutFSxlvetcihcFid5ngTdFC6KBPoQiEIQQgJiDUp4iHmwQeFcywiXqenLj
	BXs6DAftlmiNUVk+HJ34kL/EXob7ZuvXijf2qgJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793770292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zd81sDbyjuDlbY/P+eFpXau7mLvKV6nIUwyBRJutO9Q=;
	b=AH6Bd7QFzOHdJg0r+jH3CVBujH1QNboVrjzyARawwFgZ8GqBgHP6dch3tSdeD6Uh
	1l12esf5tOQQBr0594xw9wjsiSRCWhqUSxexlkhq0UG8uqC3O0EJ17CrkU8jQwDKz1Z
	t1+50vey2jE1NURIujVE1n/4cP2Piylc5o4Ghh1o=
Content-Type: multipart/mixed; boundary="===============9070052839061457615=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.5.2 SUCCEEDED
Message-ID: <010101a1a50a834b-411e260f-f0e3-4167-a173-63191a91b3b5-000000@us-west-2.amazonses.com>
Date: Wed, 4 Nov 2026 05:31:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.04-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249321

--===============9070052839061457615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.5.1-3.5.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 889d54002ec9304fb04bdf56565800d799eddca2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 4 Nov 2026 05:19:30 +0000
Subject: [PATCH] rsync: upgrade 3.5.1 -> 3.5.2

# NEWS for rsync 3.5.2 (4 Nov 2026)
## Changes in this version:

### BUG FIXES:
- Fixed interrupted `--append` and `--inplace` transfers writing the final
  256 KiB buffer twice. An interrupted destination now remains a clean prefix
  which the next transfer can resume or repair.
- Fixed uploads through `rrsync` when the destination file already exists.
  Existing files are now reached beneath a pinned parent directory instead of
  being passed as an unwritable `/proc/self/fd/N` destination.
- Fixed poor matching performance on large sparse and repeated-block files
  when duplicate checksum chains exhausted the search limit. Valid basis
  blocks are no longer hidden behind duplicate entries.
- Bounded strong-checksum work when a malicious receiver supplies weak
  checksums that collide with consecutive rolling windows
  (CVE-2026-119741).
- Prevented the `--inplace` matcher from advancing its aligned basis index
  beyond the available checksum entries. This avoids signed overflow on large
  source files when the peer supplies a small block count.
- Recovered from failed hard-link creation without aborting or hanging the
  generator. Remaining members fall back to a fresh hard-link group when the
  original destination inode cannot accept another link.
- Prevented an out-of-bounds write while invalidating a sender checksum after
  a file read error when the negotiated checksum length is zero.
- Fixed a daemon receiver stack overflow when queued deletion output reached
  `--max-alloc`. Quiet daemon transfers no longer queue deletion messages
  unless the client requested them.
- Fixed a `--files-from` pull from a subdirectory of a daemon module, which
  read each listed file from the module root instead.  It could send, and with
  `--remove-source-files` delete, a same-named file the module's filter
  excludes.
- Fixed password files whose first line is empty. The parser no longer skips
  the empty line and uses a later password.
- Escaped terminal control characters in filenames and diagnostics written to
  standard output, standard error and log files while preserving printable
  text in the active locale.
- Preserved Cygwin and MSYS2 UNC roots during ownership-checked path walks.
- Restored daemon startup from accepted named Unix sockets on standard input,
  including filesystem and Linux abstract sockets used for socket activation.
  Unnamed local socket pairs remain non-daemon channels.
- Fixed forward-DNS hostname entries in daemon `hosts allow` and `hosts deny`
  lists for IPv6 peers. Address comparison is now binary and family-aware.
- Preserved Unix symlink permissions on systems which require `fchmodat()` to
  change the mode of a symlink rather than its target.
- Restored builds on systems without `O_CLOEXEC` or `O_DIRECTORY`, including
  Solaris 10.

### ENHANCEMENTS:
- Added `--nice` to adjust CPU and I/O scheduling priorities for local and
  remote rsync processes. Daemon clients and rrsync cannot raise server-side
  priorities.
- Human-readable output now uses dynamic precision to show three significant
  digits and appends `i` to binary unit suffixes. `--progress` uses the same
  formatter for transfer rates and labels byte counts and rates with `B` and
  `B/s`. Example output includes `46.7M`, `48.8Mi`, `782,448B` and
  `113,295B/s`. File-list, created-directory and skipped-deletion counts also
  use thousands separators.
- Added `--delay-symlinks` to defer creating new and changed symlinks until
  other transferred files are in place. It implies `--no-inc-recursive` and
  requires protocol 29 or newer with support on the receiving side. It cannot
  be combined with `--remove-source-files`, `--hard-links`, `--compare-dest`,
  `--copy-dest` or `--link-dest`.

------------------------------------------------------------------------------
| 04 Nov 2026  | 3.5.2  |                  | 33          |
---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.5.1.bb => rsync_3.5.2.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.5.1.bb => rsync_3.5.2.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 1f1fc3f3b3..9f271fa6e2 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
+From 5db6185e95929b7edc665b5f029ffd6a6f900eb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,10 +50,10 @@ index 7476f6a..b939a0c 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index 889b57b..19e5e98 100644
+index bf30df9..7da831b 100644
 --- a/log.c
 +++ b/log.c
-@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
+@@ -147,7 +147,7 @@ static void logit(int priority, const char *buf)
  	}
  }
  
@@ -63,7 +63,7 @@ index 889b57b..19e5e98 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index ed6e554..b5f9448 100644
+index 63c35a1..2d0c165 100644
 --- a/main.c
 +++ b/main.c
 @@ -250,7 +250,7 @@ void read_del_stats(int f)
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index 890275f6d7..8883f9ffab 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
+From 637d3e6dd6414c89b3a0e96eccbb8b37d179acec Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index de24949..bb9bb27 100644
+index 9de687e..44a8ee6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -28,6 +28,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 59255d15e7..4734f2c7c4 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
+From 79b3194efff7e55ae9d0fadc40d45bec4bd37ea7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 716171d..de24949 100644
+index 3a5d509..9de687e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
+@@ -306,60 +306,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.5.1.bb b/meta/recipes-devtools/rsync/rsync_3.5.2.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.5.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.2.bb
index 6b121ab1a8..299b444898 100644
--- a/meta/recipes-devtools/rsync/rsync_3.5.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef"
+SRC_URI[sha256sum] = "a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============9070052839061457615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rsync: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.5.1.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.5.2.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1655720 to 1697824 (+3%)
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGSIZE changed from 328580 to 332684 (+1%)
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1592781 to 1619571 (+2%)
packages/x86-64-v3-poky-linux/rsync/rsync-src: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync-src: FILELIST: directory renamed /usr/src/debug/rsync/3.5.1/lib -> /usr/src/debug/rsync/3.5.2/lib, removed "/usr/src/debug/rsync/3.5.1/rsync.h /usr/src/debug/rsync/3.5.1/inums.h /usr/src/debug/rsync/3.5.1/proto.h /usr/src/debug/rsync/3.5.1/io.h /usr/src/debug/rsync/3.5.1/exclude.c /usr/src/debug/rsync/3.5.1/uidlist.c /usr/src/debug/rsync/3.5.1/batch.c /usr/src/debug/rsync/3.5.1/chmod.c /usr/src/debug/rsync/3.5.1/clientname.c /usr/src/debug/rsync/3.5.1/flist.c /usr/src/debug/rsync/3.5.1/byteorder.h /usr/src/debug/rsync/3.5.1/checksum.c /usr/src/debug/rsync/3.5.1/hlink.c /usr/src/debug/rsync/3.5.1/io.c /usr/src/debug/rsync/3.5.1/daemon-parm.h /usr/src/debug/rsync/3.5.1/match.c /usr/src/debug/rsync/3.5.1/syscall.c /usr/src/debug/rsync/3.5.1/backup.c /usr/src/debug/rsync/3.5.1/progress.c /usr/src/debug/rsync/3.5.1/ifuncs.h /usr/src/debug/rsync/3.5.1/itypes.h /usr/src/debug/rsync/3.5.1/cleanup.c /usr/src/debug/rsync/3.5.1/log.c /usr/src/debug/rsyn
 c/3.5.1/options.c /usr/src/debug/rsync/3.5.1/sender.c /usr/src/debug/rsync/3.5.1/loadparm.c /usr/src/debug/rsync/3.5.1/access.c /usr/src/debug/rsync/3.5.1/hashtable.c /usr/src/debug/rsync/3.5.1/params.c /usr/src/debug/rsync/3.5.1/xattrs.c /usr/src/debug/rsync/3.5.1/compat.c /usr/src/debug/rsync/3.5.1/socket.c /usr/src/debug/rsync/3.5.1/authenticate.c /usr/src/debug/rsync/3.5.1/acls.c /usr/src/debug/rsync/3.5.1/main.c /usr/src/debug/rsync/3.5.1/pipe.c /usr/src/debug/rsync/3.5.1/clientserver.c /usr/src/debug/rsync/3.5.1/help-rsyncd.h /usr/src/debug/rsync/3.5.1/connection.c /usr/src/debug/rsync/3.5.1/delete.c /usr/src/debug/rsync/3.5.1/rsync.c /usr/src/debug/rsync/3.5.1/token.c /usr/src/debug/rsync/3.5.1/usage.c /usr/src/debug/rsync/3.5.1/util1.c /usr/src/debug/rsync/3.5.1/util2.c /usr/src/debug/rsync/3.5.1/receiver.c /usr/src/debug/rsync/3.5.1/help-rsync.h /usr/src/debug/rsync/3.5.1/fileio.c /usr/src/debug/rsync/3.5.1/generator.c", added "/usr/src/debug/rsync/3.5.2/inums.h /usr/src/de
 bug/rsync/3.5.2/proto.h /usr/src/debug/rsync/3.5.2/rsync.h /usr/src/debug/rsync/3.5.2/uidlist.c /usr/src/debug/rsync/3.5.2/batch.c /usr/src/debug/rsync/3.5.2/chmod.c /usr/src/debug/rsync/3.5.2/clientname.c /usr/src/debug/rsync/3.5.2/flist.c /usr/src/debug/rsync/3.5.2/byteorder.h /usr/src/debug/rsync/3.5.2/checksum.c /usr/src/debug/rsync/3.5.2/hlink.c /usr/src/debug/rsync/3.5.2/match.c /usr/src/debug/rsync/3.5.2/daemon-parm.h /usr/src/debug/rsync/3.5.2/rsync.c /usr/src/debug/rsync/3.5.2/syscall.c /usr/src/debug/rsync/3.5.2/log.c /usr/src/debug/rsync/3.5.2/backup.c /usr/src/debug/rsync/3.5.2/progress.c /usr/src/debug/rsync/3.5.2/niceness.c /usr/src/debug/rsync/3.5.2/ifuncs.h /usr/src/debug/rsync/3.5.2/itypes.h /usr/src/debug/rsync/3.5.2/cleanup.c /usr/src/debug/rsync/3.5.2/options.c /usr/src/debug/rsync/3.5.2/sender.c /usr/src/debug/rsync/3.5.2/token.c /usr/src/debug/rsync/3.5.2/loadparm.c /usr/src/debug/rsync/3.5.2/access.c /usr/src/debug/rsync/3.5.2/hashtable.c /usr/src/debug/rsync/
 3.5.2/params.c /usr/src/debug/rsync/3.5.2/usage.c /usr/src/debug/rsync/3.5.2/util1.c /usr/src/debug/rsync/3.5.2/util2.c /usr/src/debug/rsync/3.5.2/xattrs.c /usr/src/debug/rsync/3.5.2/compat.c /usr/src/debug/rsync/3.5.2/socket.c /usr/src/debug/rsync/3.5.2/authenticate.c /usr/src/debug/rsync/3.5.2/acls.c /usr/src/debug/rsync/3.5.2/main.c /usr/src/debug/rsync/3.5.2/pipe.c /usr/src/debug/rsync/3.5.2/clientserver.c /usr/src/debug/rsync/3.5.2/help-rsyncd.h /usr/src/debug/rsync/3.5.2/connection.c /usr/src/debug/rsync/3.5.2/delete.c /usr/src/debug/rsync/3.5.2/io.c /usr/src/debug/rsync/3.5.2/exclude.c /usr/src/debug/rsync/3.5.2/io.h /usr/src/debug/rsync/3.5.2/receiver.c /usr/src/debug/rsync/3.5.2/help-rsync.h /usr/src/debug/rsync/3.5.2/fileio.c /usr/src/debug/rsync/3.5.2/generator.c"
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PV changed from "3.5.1" to "3.5.2"
packages/x86-64-v3-poky-linux/rsync/rsync: PKGV changed from 3.5.1 [default] to 3.5.2 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 614597 to 631205 (+3%)
packages/x86-64-v3-poky-linux/rsync/rsync: PV changed from "3.5.1" to "3.5.2"

--===============9070052839061457615==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.5.1-3.5.2.patch"

RnJvbSA4ODlkNTQwMDJlYzkzMDRmYjA0YmRmNTY1NjU4MDBkNzk5ZWRkY2EyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNCBOb3YgMjAyNiAwNToxOTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJz
eW5jOiB1cGdyYWRlIDMuNS4xIC0+IDMuNS4yCgojIE5FV1MgZm9yIHJzeW5jIDMuNS4yICg0IE5v
diAyMDI2KQojIyBDaGFuZ2VzIGluIHRoaXMgdmVyc2lvbjoKCiMjIyBCVUcgRklYRVM6Ci0gRml4
ZWQgaW50ZXJydXB0ZWQgYC0tYXBwZW5kYCBhbmQgYC0taW5wbGFjZWAgdHJhbnNmZXJzIHdyaXRp
bmcgdGhlIGZpbmFsCiAgMjU2IEtpQiBidWZmZXIgdHdpY2UuIEFuIGludGVycnVwdGVkIGRlc3Rp
bmF0aW9uIG5vdyByZW1haW5zIGEgY2xlYW4gcHJlZml4CiAgd2hpY2ggdGhlIG5leHQgdHJhbnNm
ZXIgY2FuIHJlc3VtZSBvciByZXBhaXIuCi0gRml4ZWQgdXBsb2FkcyB0aHJvdWdoIGBycnN5bmNg
IHdoZW4gdGhlIGRlc3RpbmF0aW9uIGZpbGUgYWxyZWFkeSBleGlzdHMuCiAgRXhpc3RpbmcgZmls
ZXMgYXJlIG5vdyByZWFjaGVkIGJlbmVhdGggYSBwaW5uZWQgcGFyZW50IGRpcmVjdG9yeSBpbnN0
ZWFkIG9mCiAgYmVpbmcgcGFzc2VkIGFzIGFuIHVud3JpdGFibGUgYC9wcm9jL3NlbGYvZmQvTmAg
ZGVzdGluYXRpb24uCi0gRml4ZWQgcG9vciBtYXRjaGluZyBwZXJmb3JtYW5jZSBvbiBsYXJnZSBz
cGFyc2UgYW5kIHJlcGVhdGVkLWJsb2NrIGZpbGVzCiAgd2hlbiBkdXBsaWNhdGUgY2hlY2tzdW0g
Y2hhaW5zIGV4aGF1c3RlZCB0aGUgc2VhcmNoIGxpbWl0LiBWYWxpZCBiYXNpcwogIGJsb2NrcyBh
cmUgbm8gbG9uZ2VyIGhpZGRlbiBiZWhpbmQgZHVwbGljYXRlIGVudHJpZXMuCi0gQm91bmRlZCBz
dHJvbmctY2hlY2tzdW0gd29yayB3aGVuIGEgbWFsaWNpb3VzIHJlY2VpdmVyIHN1cHBsaWVzIHdl
YWsKICBjaGVja3N1bXMgdGhhdCBjb2xsaWRlIHdpdGggY29uc2VjdXRpdmUgcm9sbGluZyB3aW5k
b3dzCiAgKENWRS0yMDI2LTExOTc0MSkuCi0gUHJldmVudGVkIHRoZSBgLS1pbnBsYWNlYCBtYXRj
aGVyIGZyb20gYWR2YW5jaW5nIGl0cyBhbGlnbmVkIGJhc2lzIGluZGV4CiAgYmV5b25kIHRoZSBh
dmFpbGFibGUgY2hlY2tzdW0gZW50cmllcy4gVGhpcyBhdm9pZHMgc2lnbmVkIG92ZXJmbG93IG9u
IGxhcmdlCiAgc291cmNlIGZpbGVzIHdoZW4gdGhlIHBlZXIgc3VwcGxpZXMgYSBzbWFsbCBibG9j
ayBjb3VudC4KLSBSZWNvdmVyZWQgZnJvbSBmYWlsZWQgaGFyZC1saW5rIGNyZWF0aW9uIHdpdGhv
dXQgYWJvcnRpbmcgb3IgaGFuZ2luZyB0aGUKICBnZW5lcmF0b3IuIFJlbWFpbmluZyBtZW1iZXJz
IGZhbGwgYmFjayB0byBhIGZyZXNoIGhhcmQtbGluayBncm91cCB3aGVuIHRoZQogIG9yaWdpbmFs
IGRlc3RpbmF0aW9uIGlub2RlIGNhbm5vdCBhY2NlcHQgYW5vdGhlciBsaW5rLgotIFByZXZlbnRl
ZCBhbiBvdXQtb2YtYm91bmRzIHdyaXRlIHdoaWxlIGludmFsaWRhdGluZyBhIHNlbmRlciBjaGVj
a3N1bSBhZnRlcgogIGEgZmlsZSByZWFkIGVycm9yIHdoZW4gdGhlIG5lZ290aWF0ZWQgY2hlY2tz
dW0gbGVuZ3RoIGlzIHplcm8uCi0gRml4ZWQgYSBkYWVtb24gcmVjZWl2ZXIgc3RhY2sgb3ZlcmZs
b3cgd2hlbiBxdWV1ZWQgZGVsZXRpb24gb3V0cHV0IHJlYWNoZWQKICBgLS1tYXgtYWxsb2NgLiBR
dWlldCBkYWVtb24gdHJhbnNmZXJzIG5vIGxvbmdlciBxdWV1ZSBkZWxldGlvbiBtZXNzYWdlcwog
IHVubGVzcyB0aGUgY2xpZW50IHJlcXVlc3RlZCB0aGVtLgotIEZpeGVkIGEgYC0tZmlsZXMtZnJv
bWAgcHVsbCBmcm9tIGEgc3ViZGlyZWN0b3J5IG9mIGEgZGFlbW9uIG1vZHVsZSwgd2hpY2gKICBy
ZWFkIGVhY2ggbGlzdGVkIGZpbGUgZnJvbSB0aGUgbW9kdWxlIHJvb3QgaW5zdGVhZC4gIEl0IGNv
dWxkIHNlbmQsIGFuZCB3aXRoCiAgYC0tcmVtb3ZlLXNvdXJjZS1maWxlc2AgZGVsZXRlLCBhIHNh
bWUtbmFtZWQgZmlsZSB0aGUgbW9kdWxlJ3MgZmlsdGVyCiAgZXhjbHVkZXMuCi0gRml4ZWQgcGFz
c3dvcmQgZmlsZXMgd2hvc2UgZmlyc3QgbGluZSBpcyBlbXB0eS4gVGhlIHBhcnNlciBubyBsb25n
ZXIgc2tpcHMKICB0aGUgZW1wdHkgbGluZSBhbmQgdXNlcyBhIGxhdGVyIHBhc3N3b3JkLgotIEVz
Y2FwZWQgdGVybWluYWwgY29udHJvbCBjaGFyYWN0ZXJzIGluIGZpbGVuYW1lcyBhbmQgZGlhZ25v
c3RpY3Mgd3JpdHRlbiB0bwogIHN0YW5kYXJkIG91dHB1dCwgc3RhbmRhcmQgZXJyb3IgYW5kIGxv
ZyBmaWxlcyB3aGlsZSBwcmVzZXJ2aW5nIHByaW50YWJsZQogIHRleHQgaW4gdGhlIGFjdGl2ZSBs
b2NhbGUuCi0gUHJlc2VydmVkIEN5Z3dpbiBhbmQgTVNZUzIgVU5DIHJvb3RzIGR1cmluZyBvd25l
cnNoaXAtY2hlY2tlZCBwYXRoIHdhbGtzLgotIFJlc3RvcmVkIGRhZW1vbiBzdGFydHVwIGZyb20g
YWNjZXB0ZWQgbmFtZWQgVW5peCBzb2NrZXRzIG9uIHN0YW5kYXJkIGlucHV0LAogIGluY2x1ZGlu
ZyBmaWxlc3lzdGVtIGFuZCBMaW51eCBhYnN0cmFjdCBzb2NrZXRzIHVzZWQgZm9yIHNvY2tldCBh
Y3RpdmF0aW9uLgogIFVubmFtZWQgbG9jYWwgc29ja2V0IHBhaXJzIHJlbWFpbiBub24tZGFlbW9u
IGNoYW5uZWxzLgotIEZpeGVkIGZvcndhcmQtRE5TIGhvc3RuYW1lIGVudHJpZXMgaW4gZGFlbW9u
IGBob3N0cyBhbGxvd2AgYW5kIGBob3N0cyBkZW55YAogIGxpc3RzIGZvciBJUHY2IHBlZXJzLiBB
ZGRyZXNzIGNvbXBhcmlzb24gaXMgbm93IGJpbmFyeSBhbmQgZmFtaWx5LWF3YXJlLgotIFByZXNl
cnZlZCBVbml4IHN5bWxpbmsgcGVybWlzc2lvbnMgb24gc3lzdGVtcyB3aGljaCByZXF1aXJlIGBm
Y2htb2RhdCgpYCB0bwogIGNoYW5nZSB0aGUgbW9kZSBvZiBhIHN5bWxpbmsgcmF0aGVyIHRoYW4g
aXRzIHRhcmdldC4KLSBSZXN0b3JlZCBidWlsZHMgb24gc3lzdGVtcyB3aXRob3V0IGBPX0NMT0VY
RUNgIG9yIGBPX0RJUkVDVE9SWWAsIGluY2x1ZGluZwogIFNvbGFyaXMgMTAuCgojIyMgRU5IQU5D
RU1FTlRTOgotIEFkZGVkIGAtLW5pY2VgIHRvIGFkanVzdCBDUFUgYW5kIEkvTyBzY2hlZHVsaW5n
IHByaW9yaXRpZXMgZm9yIGxvY2FsIGFuZAogIHJlbW90ZSByc3luYyBwcm9jZXNzZXMuIERhZW1v
biBjbGllbnRzIGFuZCBycnN5bmMgY2Fubm90IHJhaXNlIHNlcnZlci1zaWRlCiAgcHJpb3JpdGll
cy4KLSBIdW1hbi1yZWFkYWJsZSBvdXRwdXQgbm93IHVzZXMgZHluYW1pYyBwcmVjaXNpb24gdG8g
c2hvdyB0aHJlZSBzaWduaWZpY2FudAogIGRpZ2l0cyBhbmQgYXBwZW5kcyBgaWAgdG8gYmluYXJ5
IHVuaXQgc3VmZml4ZXMuIGAtLXByb2dyZXNzYCB1c2VzIHRoZSBzYW1lCiAgZm9ybWF0dGVyIGZv
ciB0cmFuc2ZlciByYXRlcyBhbmQgbGFiZWxzIGJ5dGUgY291bnRzIGFuZCByYXRlcyB3aXRoIGBC
YCBhbmQKICBgQi9zYC4gRXhhbXBsZSBvdXRwdXQgaW5jbHVkZXMgYDQ2LjdNYCwgYDQ4LjhNaWAs
IGA3ODIsNDQ4QmAgYW5kCiAgYDExMywyOTVCL3NgLiBGaWxlLWxpc3QsIGNyZWF0ZWQtZGlyZWN0
b3J5IGFuZCBza2lwcGVkLWRlbGV0aW9uIGNvdW50cyBhbHNvCiAgdXNlIHRob3VzYW5kcyBzZXBh
cmF0b3JzLgotIEFkZGVkIGAtLWRlbGF5LXN5bWxpbmtzYCB0byBkZWZlciBjcmVhdGluZyBuZXcg
YW5kIGNoYW5nZWQgc3ltbGlua3MgdW50aWwKICBvdGhlciB0cmFuc2ZlcnJlZCBmaWxlcyBhcmUg
aW4gcGxhY2UuIEl0IGltcGxpZXMgYC0tbm8taW5jLXJlY3Vyc2l2ZWAgYW5kCiAgcmVxdWlyZXMg
cHJvdG9jb2wgMjkgb3IgbmV3ZXIgd2l0aCBzdXBwb3J0IG9uIHRoZSByZWNlaXZpbmcgc2lkZS4g
SXQgY2Fubm90CiAgYmUgY29tYmluZWQgd2l0aCBgLS1yZW1vdmUtc291cmNlLWZpbGVzYCwgYC0t
aGFyZC1saW5rc2AsIGAtLWNvbXBhcmUtZGVzdGAsCiAgYC0tY29weS1kZXN0YCBvciBgLS1saW5r
LWRlc3RgLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnwgMDQgTm92IDIwMjYgIHwgMy41LjIgIHwg
ICAgICAgICAgICAgICAgICB8IDMzICAgICAgICAgIHwKLS0tCiAuLi4tQWRkLW1pc3NpbmctcHJv
dG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggfCA4ICsrKystLS0tCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoICAgICAgICAgfCA0
ICsrLS0KIC4uLi9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoICAgICAgICAg
ICAgICAgICB8IDYgKysrLS0tCiAuLi4vcnN5bmMve3JzeW5jXzMuNS4xLmJiID0+IHJzeW5jXzMu
NS4yLmJifSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3lu
Yy97cnN5bmNfMy41LjEuYmIgPT4gcnN5bmNfMy41LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90
eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRl
Y2xhcmF0aW9ucy5wYXRjaAppbmRleCAxZjFmYzNmM2IzLi45ZjI3MWZhNmUyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90
b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0
aW9uLWRlY2xhcmF0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTZhNzg1YTdkOTY0
Zjc5N2E3ODZiMmQ1Yjc1ZDljZWU1MWI1MzBiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNWRiNjE4NWU5NTkyOWI3ZWRjNjY1YjVmMDI5ZmZkNmE2ZjkwMGViMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBN
b24sIDI5IEF1ZyAyMDIyIDE5OjUzOjI4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNz
aW5nIHByb3RvdHlwZXMgdG8gZnVuY3Rpb24gZGVjbGFyYXRpb25zCkBAIC01MCwxMCArNTAsMTAg
QEAgaW5kZXggNzQ3NmY2YS4uYjkzOWEwYyAxMDA2NDQKICAJaWYgKHBhcnRpYWxfc3RyaW5nX2J1
ZikgewogIAkJaWYgKHBhcnRpYWxfc3RyaW5nX2xlbikKIGRpZmYgLS1naXQgYS9sb2cuYyBiL2xv
Zy5jCi1pbmRleCA4ODliNTdiLi4xOWU1ZTk4IDEwMDY0NAoraW5kZXggYmYzMGRmOS4uN2RhODMx
YiAxMDA2NDQKIC0tLSBhL2xvZy5jCiArKysgYi9sb2cuYwotQEAgLTE0MCw3ICsxNDAsNyBAQCBz
dGF0aWMgdm9pZCBsb2dpdChpbnQgcHJpb3JpdHksIGNvbnN0IGNoYXIgKmJ1ZikKK0BAIC0xNDcs
NyArMTQ3LDcgQEAgc3RhdGljIHZvaWQgbG9naXQoaW50IHByaW9yaXR5LCBjb25zdCBjaGFyICpi
dWYpCiAgCX0KICB9CiAgCkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDg4OWI1N2IuLjE5ZTVlOTgg
MTAwNjQ0CiAgCWludCBvcHRpb25zID0gTE9HX1BJRDsKICAKIGRpZmYgLS1naXQgYS9tYWluLmMg
Yi9tYWluLmMKLWluZGV4IGVkNmU1NTQuLmI1Zjk0NDggMTAwNjQ0CitpbmRleCA2M2MzNWExLi4y
ZDBjMTY1IDEwMDY0NAogLS0tIGEvbWFpbi5jCiArKysgYi9tYWluLmMKIEBAIC0yNTAsNyArMjUw
LDcgQEAgdm9pZCByZWFkX2RlbF9zdGF0cyhpbnQgZikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoCmluZGV4IDg5MDI3NWY2ZDcuLjg4ODNm
OWZmYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRl
cm1pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVy
bWlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTc4NDEzMWU0Y2NiYWY4YWQ3MTA3ZDFm
N2E3ZjEzZGE4YzY3NTgyNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjM3ZDNlNmRk
NjQxNGM4OWIzYTBlOTZlY2NiYjhiMzdkMTc5YWNlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
PgogRGF0ZTogU3VuLCAyMSBGZWIgMjAyMSAwOTo0NTo0OCArMDAwMAogU3ViamVjdDogW1BBVENI
XSByc3luYzogRml4IGEgZmlsZSBzb3J0aW5nIGRldGVybWluaXNtIGlzc3VlCkBAIC0yNSw3ICsy
NSw3IEBAIGh0dHBzOi8vZ2l0aHViLmNvbS9XYXluZUQvcnN5bmMvY29tbWl0L2QzMDg1ZjdhZGQz
OGE1Y2Y4MzNhMGIzMWNiMDYzN2ZmNDZjODBmOGQKICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRleCBk
ZTI0OTQ5Li5iYjliYjI3IDEwMDY0NAoraW5kZXggOWRlNjg3ZS4uNDRhOGVlNiAxMDA2NDQKIC0t
LSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgogQEAgLTI4LDYgKzI4LDExIEBAIE1L
RElSX1A9QE1LRElSX1BACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMv
ZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
c3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCmluZGV4IDU5MjU1ZDE1ZTcuLjQ3
MzRmMmM3YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9t
YWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3lu
Yy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAw
ZTFmMmFlYzBkYmZjMTUwMDEzODYwYjQyYjQxNjQ1Y2ViZTIzNmI3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA3OWIzMTk0ZWZmZjdlNTVhZTlkMGZhZGM0MGQ0NWJlYzRiZDM3ZWE3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGlu
dGVsLmNvbT4KIERhdGU6IFR1ZSwgMTIgQXByIDIwMTYgMTU6NTE6NTQgKzAxMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcnN5bmM6IHJlbW92ZSB1cHN0cmVhbSdzIHJlYnVpbGQgbG9naWMKQEAgLTEzLDEw
ICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1NCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01h
a2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDcxNjE3MWQuLmRlMjQ5NDkgMTAwNjQ0Citp
bmRleCAzYTVkNTA5Li45ZGU2ODdlIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBiL01h
a2VmaWxlLmluCi1AQCAtMjY3LDYwICsyNjcsNiBAQCBjb25mOiBjb25maWd1cmUuc2ggY29uZmln
LmguaW4KK0BAIC0zMDYsNjAgKzMwNiw2IEBAIGNvbmY6IGNvbmZpZ3VyZS5zaCBjb25maWcuaC5p
bgogIC5QSE9OWTogZ2VuCiAgZ2VuOiBjb25mIHByb3RvLmggbWFuIGdpdC12ZXJzaW9uLmgKICAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjUuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjUuMi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy41
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjUuMi5i
YgppbmRleCA2YjEyMWFiMWE4Li4yOTliNDQ0ODk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JzeW5jL3JzeW5jXzMuNS4yLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6
Ly9kb3dubG9hZC5zYW1iYS5vcmcvcHViLyR7QlBOfS9zcmMvJHtCUH0udGFyLmd6IFwKICAgICAg
ICAgICAgZmlsZTovL2RldGVybWlzbS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFk
ZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM1NWY5YzlkYzEwZmI4YmVjMzk3YjM5
OWEwZmRkZWQ1M2NjOWEyZDhlMzA4OTFiYjBkNjM3MjRkMjVjMzdiZWYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTEwZDU5MTgyNTI1MWUwNzBmNzRjOThkZjNkYWFkMTk1ZGVmNGVkODFiNGEyZGUx
NjE2OTAyNmFlYTMzZjZjOCIKIAogIyBPdXQtb2YtdHJlZSBidWlsZHMgZG9uJ3QgaW5zdGFsbCB0
aGUgZG9jdW1lbnRhdGlvbiBjdXJyZW50bHkKICMgaHR0cHM6Ly9naXRodWIuY29tL1JzeW5jUHJv
amVjdC9yc3luYy9pc3N1ZXMvODQ2Ci0tIAoyLjQ3LjEKCg==

--===============9070052839061457615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rsync-changelog.txt"

# NEWS for rsync 3.5.2 (4 Nov 2026)
## Changes in this version:

### BUG FIXES:
- Fixed interrupted `--append` and `--inplace` transfers writing the final
  256 KiB buffer twice. An interrupted destination now remains a clean prefix
  which the next transfer can resume or repair.
- Fixed uploads through `rrsync` when the destination file already exists.
  Existing files are now reached beneath a pinned parent directory instead of
  being passed as an unwritable `/proc/self/fd/N` destination.
- Fixed poor matching performance on large sparse and repeated-block files
  when duplicate checksum chains exhausted the search limit. Valid basis
  blocks are no longer hidden behind duplicate entries.
- Bounded strong-checksum work when a malicious receiver supplies weak
  checksums that collide with consecutive rolling windows
  (CVE-2026-119741).
- Prevented the `--inplace` matcher from advancing its aligned basis index
  beyond the available checksum entries. This avoids signed overflow on large
  source files when the peer supplies a small block count.
- Recovered from failed hard-link creation without aborting or hanging the
  generator. Remaining members fall back to a fresh hard-link group when the
  original destination inode cannot accept another link.
- Prevented an out-of-bounds write while invalidating a sender checksum after
  a file read error when the negotiated checksum length is zero.
- Fixed a daemon receiver stack overflow when queued deletion output reached
  `--max-alloc`. Quiet daemon transfers no longer queue deletion messages
  unless the client requested them.
- Fixed a `--files-from` pull from a subdirectory of a daemon module, which
  read each listed file from the module root instead.  It could send, and with
  `--remove-source-files` delete, a same-named file the module's filter
  excludes.
- Fixed password files whose first line is empty. The parser no longer skips
  the empty line and uses a later password.
- Escaped terminal control characters in filenames and diagnostics written to
  standard output, standard error and log files while preserving printable
  text in the active locale.
- Preserved Cygwin and MSYS2 UNC roots during ownership-checked path walks.
- Restored daemon startup from accepted named Unix sockets on standard input,
  including filesystem and Linux abstract sockets used for socket activation.
  Unnamed local socket pairs remain non-daemon channels.
- Fixed forward-DNS hostname entries in daemon `hosts allow` and `hosts deny`
  lists for IPv6 peers. Address comparison is now binary and family-aware.
- Preserved Unix symlink permissions on systems which require `fchmodat()` to
  change the mode of a symlink rather than its target.
- Restored builds on systems without `O_CLOEXEC` or `O_DIRECTORY`, including
  Solaris 10.

### ENHANCEMENTS:
- Added `--nice` to adjust CPU and I/O scheduling priorities for local and
  remote rsync processes. Daemon clients and rrsync cannot raise server-side
  priorities.
- Human-readable output now uses dynamic precision to show three significant
  digits and appends `i` to binary unit suffixes. `--progress` uses the same
  formatter for transfer rates and labels byte counts and rates with `B` and
  `B/s`. Example output includes `46.7M`, `48.8Mi`, `782,448B` and
  `113,295B/s`. File-list, created-directory and skipped-deletion counts also
  use thousands separators.
- Added `--delay-symlinks` to defer creating new and changed symlinks until
  other transferred files are in place. It implies `--no-inc-recursive` and
  requires protocol 29 or newer with support on the receiving side. It cannot
  be combined with `--remove-source-files`, `--hard-links`, `--compare-dest`,
  `--copy-dest` or `--link-dest`.

------------------------------------------------------------------------------
| 04 Nov 2026  | 3.5.2  |                  | 33          |

--===============9070052839061457615==--
