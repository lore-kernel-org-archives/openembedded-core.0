Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16565.1792647341506841463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bFSTNumI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J8Du2P6V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1621ba171-1d903421-bf2a-4956-a9cc-fcc5635dafe1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647340;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=YRKJpTf8TZpzbFJNiVYaDycnPh7+bU5r9as10fEsZRQ=;
	b=bFSTNumIPkvbA7bj6oNqDp6Jjjibb+h+LcVJ9MHjuLmbRpJWfRiURsuPPm+41pWi
	WqM+hgON/x+8hlAe36m5XFZX2W5Lpk+qEsOc5m/sjsz2hIWOejudjwk0HIKatnPk2E4
	Pd75UPbJuRziK6oKneUcefEA4QdjIyi9eyoOmDi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647340;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=YRKJpTf8TZpzbFJNiVYaDycnPh7+bU5r9as10fEsZRQ=;
	b=J8Du2P6VBvyqXs5cyDgwRkBcduaVueTBVWcXfT99/tEHTwPGk8suoJDmnV7Cm2JH
	CcTQSo4WKf/Q3KF2pWo/N2OSaLTUSF0y5al+WWdJYlaJe+ICz2VFZXIwSSVJLVEpeeu
	eIHHFn2q+j916MJ8/K6XNgsbdCl0/A84nWgLGi8o=
Content-Type: multipart/mixed; boundary="===============3690457317252574938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.20.30 SUCCEEDED
Message-ID: <010101a1621ba171-1d903421-bf2a-4956-a9cc-fcc5635dafe1-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248413

--===============3690457317252574938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.29-9.20.30.patch
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
From 5f1b223a99401a4b88ef96e6641c98d5a7f52692 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:09:24 +0000
Subject: [PATCH] bind: upgrade 9.20.29 -> 9.20.30

BIND 9.20.29
------------

Security Fixes
~~~~~~~~~~~~~~

- [CVE-2026-19668] Prevent excessive CPU use validating crafted DNSSEC
  responses. ``a0a61dba9e``

  A malicious authoritative server could serve a securely delegated zone
  whose DS and DNSKEY records carry many distinct key tags but no valid
  match, forcing a validating resolver into excessive key-tag matching
  and high CPU use for every query. BIND now bounds this work with the
  per-query validation limit (max-validations-per-fetch). :gl:`#5349`

- [CVE-2026-19033] Require a TSIG on every message of incoming zone
  transfers. ``9404cd2b8c``

  BIND 9 used to accept TSIG-signed zone transfers in which some
  messages were unsigned, and processed those messages before the next
  signature could vouch for them. It now requires a TSIG on every
  message of an incoming AXFR or IXFR; all modern nameserver already
  sign every message, so no change is expected in practice. :gl:`#6062`

- [CVE-2026-77119] Prevent a DNSSEC downgrade of secure delegations via
  unrelated NSEC3. ``3bed9c8e9e``

  A validating resolver could be tricked into treating a secure
  delegation as unsigned and accepting forged answers for names beneath
  it, if an attacker could inject responses to its queries. Such forged
  proofs are now rejected. :gl:`#6234`

- [CVE-2026-19941] Prevent forged DNSSEC-validated NXDOMAIN responses.
  ``a36bf58daf``

  A validating resolver could accept a signed NSEC record from an
  unrelated zone as proof that a wildcard did not exist. An on-path
  attacker or malicious forwarder controlling a signed zone could
  therefore forge an authenticated NXDOMAIN response for a name that
  should resolve through a wildcard. BIND now requires the
  wildcard-denial and name-nonexistence proofs to be signed by the same
  zone. :gl:`#6253`

- [CVE-2026-19666] DNS64 with break-dnssec could cause an assertion
  failure. ``4cec4965c4``

  When a "dns64" statement is configured with "break-dnssec yes" and its
  "exclude" list matches some but not all of the addresses in an AAAA
  RRset, named removes the excluded addresses from the answer instead of
  synthesizing new ones. If the answer being filtered had been cached
  together with a proof that the queried name does not exist -- which is
  what a wildcard match produces -- named terminated with an assertion
  failure.

  Only recursive resolvers are affected, and only when "break-dnssec
  yes" is in use; the answer has to come from the cache, so a server
  that is only authoritative cannot reach this. :gl:`#6301`

- [CVE-2026-19667] Reject negative cache records that do not fit in a
  dns_rdata_t. ``dbf08c8581``

  A single crafted response from a server could make a resolver cache a
  malformed negative entry and then terminate with an assertion failure
  when reading it back. Only recursive resolvers are affected, on a
  default configuration. :gl:`#6302`

- [CVE-2026-19662] Prevent resolver crash with cached DNSSEC proofs.
  ``c884cc1ba0``

  Under certain timing conditions, concurrent recursive queries could
  cause named to crash when cached DNSSEC NOQNAME proof data was
  replaced while still in use. Cached proof data is now retained until
  all queries using it have completed. :gl:`#6333`

- [CVE-2026-75029] Discard repeated SOA, CNAME, and DNAME records when
  parsing DNS messages. ``0d630758c2``

  A DNS message could carry the same SOA, CNAME, or DNAME record many
  times, and named kept every copy while parsing it. With name
  compression those copies took up far more memory internally than in
  the message itself, and every later processing step had to handle all
  of them. named now keeps the first copy of such a record and discards
  identical repeats. :gl:`#6335`

- [CVE-2026-77692] Fix an unauthenticated crash on HTTPS using SIG(0)
  ``5a24401c5c``

  A specifically crafted HTTPS query using SIG(0) as authentication
  could crash named if the client closes the connection before named
  actually verifies the signature. This is now fixed. :gl:`#6343`

- [CVE-2026-81736] Cached HTTPS/SVCB aliases could exhaust resolver CPU.
  ``20bbb1639a``

  A recursive resolver that had cached a large set of interlinked HTTPS
  or SVCB records in alias form could be driven to do an excessive
  amount of work assembling a single response, because it followed every
  cached alias target when building the additional section. A client
  permitted to use recursion, together with an attacker-controlled zone
  used to plant the records, could repeat small queries to consume
  enough CPU to delay or deny service to other clients. The amount of
  additional processing done for one query is now bounded. :gl:`#6347`

- [CVE-2026-76163] Prevent TKEY queries from terminating named without
  global options. ``7645138538``

  named could terminate unexpectedly when a remote client sent a TKEY
  query if the configuration did not include a global options statement.
  This has been fixed.

  ISC thanks Owais Lone (thesecguy) f

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.29.bb => bind_9.20.30.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb => bind_9.20.30.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 15796a15fb..d302bc1481 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 95141cf9494292fc5645165ef3d5e9e2ed2208c6 Mon Sep 17 00:00:00 2001
+From 1c087c24e8162c7a042cf1f19ad313e0f3a21196 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 99e781799d..eb0adcfabe 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 06e9624eb7e474a08ed7e1a456bfe9759ba211da Mon Sep 17 00:00:00 2001
+From aa978a473328123575af0270dc1dd274050bdfc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 80a4f2abde..5871fb433c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From f28920a59b658fcda24efde1c45322f785a0b0fe Mon Sep 17 00:00:00 2001
+From 525570781b873c3434df49ac753afca7c1bd9613 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0bc3965..e1c2b12 100644
+index 4d02c6e..225f59c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 323985a402..73300b46e8 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From f003f396067e6cc1e2ec609b296bb642b8ddf47b Mon Sep 17 00:00:00 2001
+From 4388bec9a8ebd7d9dded4b1942a5670cdaec064f Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26c442a..0bc3965 100644
+index 75088e5..4d02c6e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 28ee4ae74d..f88f93951f 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 5fc3dfd3f994b5fd97e97837eee2ad808cd8af93 Mon Sep 17 00:00:00 2001
+From 65c90b60cc9f30c383b8e30b900abd04bc977bd1 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index b373251c47..388335b271 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 42c109317070d19fda70635b7043cbc6f9ec36ef Mon Sep 17 00:00:00 2001
+From c58e1309e80449ecc1fa1fa793630b53c08f958e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74cf947787..bd6ada8822 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2e1314f2e71be15704ba18756250185b36a5c0da Mon Sep 17 00:00:00 2001
+From ad9cb821a119f441f6131e01715d5e0eab368fc0 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.29.bb b/meta/recipes-connectivity/bind/bind_9.20.30.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.29.bb
rename to meta/recipes-connectivity/bind/bind_9.20.30.bb
index c280d5b98d..44f09ceaa8 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.29.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.30.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1"
+SRC_URI[sha256sum] = "9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============3690457317252574938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16220048 to 16254392 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.20.29.so /usr/lib/.debug/libisccfg-9.20.29.so /usr/lib/.debug/libisc-9.20.29.so /usr/lib/.debug/libns-9.20.29.so /usr/lib/.debug/libisccc-9.20.29.so", added "/usr/lib/.debug/libns-9.20.30.so /usr/lib/.debug/libisc-9.20.30.so /usr/lib/.debug/libdns-9.20.30.so /usr/lib/.debug/libisccfg-9.20.30.so /usr/lib/.debug/libisccc-9.20.30.so"
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1607498 to 1614128 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/tm.h"
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.29.so", added "/usr/lib/*-9.20.30.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3692392 to 3688320 (-0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.29.so /usr/lib/libdns-9.20.29.so /usr/lib/libisc-9.20.29.so /usr/lib/libisccfg-9.20.29.so /usr/lib/libisccc-9.20.29.so", added "/usr/lib/libisccfg-9.20.30.so /usr/lib/libns-9.20.30.so /usr/lib/libdns-9.20.30.so /usr/lib/libisc-9.20.30.so /usr/lib/libisccc-9.20.30.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10186145 to 10194651 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.29/bin/named/include/dlz -> /usr/src/debug/bind/9.20.30/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.29/bin/check -> /usr/src/debug/bind/9.20.30/bin/check, directory renamed /usr/src/debug/bind/9.20.29/bin/tools -> /usr/src/debug/bind/9.20.30/bin/tools, directory renamed /usr/src/debug/bind/9.20.29/bin/confgen -> /usr/src/debug/bind/9.20.30/bin/confgen, directory renamed /usr/src/debug/bind/9.20.29/lib/isccc -> /usr/src/debug/bind/9.20.30/lib/isccc, directory renamed /usr/src/debug/bind/9.20.29/lib/isccfg -> /usr/src/debug/bind/9.20.30/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.29/bin/nsupdate -> /usr/src/debug/bind/9.20.30/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.29/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.30/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.29/lib/dns -> /usr/src/debug/bind/9.20.30/lib/dn
 s, directory renamed /usr/src/debug/bind/9.20.29/lib/isc/netmgr -> /usr/src/debug/bind/9.20.30/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.29/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.30/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.29/bin/named -> /usr/src/debug/bind/9.20.30/bin/named, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.30/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.29/bin/named/include/named -> /usr/src/debug/bind/9.20.30/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.29/bin/dnssec -> /usr/src/debug/bind/9.20.30/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.29/bin/dig -> /usr/src/debug/bind/9.20.30/bin/dig, directory renamed /usr/src/debug/bind/9.20.29/bin/rndc -> /usr/src/debug/bind/9.20.30/bin/rndc, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/include/dst -> /usr/src/debug/bind/9.20.30/lib/dns/include/dst
 , directory renamed /usr/src/debug/bind/9.20.29/bin/delv -> /usr/src/debug/bind/9.20.30/bin/delv, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/include/dns -> /usr/src/debug/bind/9.20.30/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.30/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.30/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.29/lib/ns/include/ns -> /usr/src/debug/bind/9.20.30/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.30/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.29/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.30/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.29/lib/ns -> /usr/src/debug/bind/9.20.30/lib/ns, directory renamed /usr/src/debug/bind/9.20.29/bin/plugins -> /usr/src/debug/bind/9.20.30/bin/pl
 ugins, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.30/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.29/lib/dns/include/irs -> /usr/src/debug/bind/9.20.30/lib/dns/include/irs, removed "/usr/src/debug/bind/9.20.29/lib/isc/region.c /usr/src/debug/bind/9.20.29/lib/isc/sockaddr.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/file.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.20.29/lib/isc/md.c /usr/src/debug/bind/9.20.29/lib/isc/async_p.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/uv.h /usr/src/debug/bind/9.20.29/lib/isc/stdtime.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/ratelimiter.h /
 usr/src/debug/bind/9.20.29/lib/isc/condition.c /usr/src/debug/bind/9.20.29/lib/isc/errno.c /usr/src/debug/bind/9.20.29/lib/isc/histo.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/hashmap.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.20.29/lib/isc/stdio.c /usr/src/debug/bind/9.20.29/lib/isc/errno2result.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.20.29/lib/isc/ascii.c /usr/src/debug/bind/9.20.29/lib/isc/errno2result.c /usr/src/debug/bind/9.20.29/lib/isc/syslog.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/getaddresses.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.20.29/lib/isc/proxy2.c /usr/src/debug/bind/9.20.29/lib/isc/counter.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/tid.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/radix.h /usr/src/debug/bin
 d/9.20.29/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.20.29/lib/isc/loop_p.h /usr/src/debug/bind/9.20.29/lib/isc/string.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/proxy2.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/queue.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/os.h /usr/src/debug/bind/9.20.29/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.20.29/lib/isc/base32.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/once.h /usr/src/debug/bind/9.20.29/lib/isc/meminfo.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/random.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/ascii.h /usr/src/debug/bind/9.20.29/lib/isc/thread.c /
 usr/src/debug/bind/9.20.29/lib/isc/include/isc/job.h /usr/src/debug/bind/9.20.29/lib/isc/hashmap.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.20.29/lib/isc/symtab.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/barrier.h /usr/src/debug/bind/9.20.29/lib/isc/job_p.h /usr/src/debug/bind/9.20.29/lib/isc/interfaceiter.c /usr/src/debug/bind/9.20.29/lib/isc/mem_p.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/net.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/work.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/signal.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.20.29/lib/isc/openssl_shim.c /usr/src/debug/bind/9.20.29/lib/isc/os.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/result.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/h
 isto.h /usr/src/debug/bind/9.20.29/lib/isc/serial.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/error.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/types.h /usr/src/debug/bind/9.20.29/lib/isc/portset.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/string.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/async.h /usr/src/debug/bind/9.20.29/lib/isc/quota.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/log.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/time.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/xml.h /usr/src/debug/bind/9.20.29/lib/isc/async.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.20.29
 /lib/isc/log.c /usr/src/debug/bind/9.20.29/lib/isc/mem.c /usr/src/debug/bind/9.20.29/lib/isc/net.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.20.29/lib/isc/tid.c /usr/src/debug/bind/9.20.29/lib/isc/tls.c /usr/src/debug/bind/9.20.29/lib/isc/url.c /usr/src/debug/bind/9.20.29/lib/isc/xml.c /usr/src/debug/bind/9.20.29/lib/isc/dir.c /usr/src/debug/bind/9.20.29/lib/isc/hex.c /usr/src/debug/bind/9.20.29/lib/isc/job.c /usr/src/debug/bind/9.20.29/lib/isc/lex.c /usr/src/debug/bind/9.20.29/lib/isc/crc64.c /usr/src/debug/bind/9.20.29/lib/isc/lib.c /usr/src/debug/bind/9.20.29/lib/isc/error.c /usr/src/debug/bind/9.20.29/lib/isc/timer.c /usr/src/debug/bind/9.20.29/lib/isc/netaddr.c /usr/src/debug/bind/9.20.29/lib/isc/assertions.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.20.29/lib/isc/os_p.h /usr/src/debug/bind/9.20.29/lib/isc/mutex.c /usr/src/debug/bind/9.20.29/lib/isc/rad
 ix.c /usr/src/debug/bind/9.20.29/lib/isc/regex.c /usr/src/debug/bind/9.20.29/lib/isc/tm.c /usr/src/debug/bind/9.20.29/lib/isc/file.c /usr/src/debug/bind/9.20.29/lib/isc/fips.c /usr/src/debug/bind/9.20.29/lib/isc/hash.c /usr/src/debug/bind/9.20.29/lib/isc/heap.c /usr/src/debug/bind/9.20.29/lib/isc/hmac.c /usr/src/debug/bind/9.20.29/lib/isc/loop.c /usr/src/debug/bind/9.20.29/lib/isc/safe.c /usr/src/debug/bind/9.20.29/lib/isc/time.c /usr/src/debug/bind/9.20.29/lib/isc/utf8.c /usr/src/debug/bind/9.20.29/lib/isc/work.c /usr/src/debug/bind/9.20.29/lib/isc/backtrace.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/dnsstream.h /usr/src/debug/bind/9.20.29/lib/isc/mutexblock.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/md.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.20.29/lib/isc/iterated_hash.c /usr/src/debug/bind/9.20.29/lib/isc/ratelimiter
 .c /usr/src/debug/bind/9.20.29/lib/isc/random.c /usr/src/debug/bind/9.20.29/lib/isc/httpd.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.20.29/lib/isc/getaddresses.c /usr/src/debug/bind/9.20.29/lib/isc/base64.c /usr/src/debug/bind/9.20.29/lib/isc/result.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.20.29/lib/isc/mutex_p.h /usr/src/debug/bind/9.20.29/lib/isc/commandline.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.20.29/lib/isc/uv.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/region.h /usr/src/debug/bind/9.20.29/lib/isc/managers.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/url.h /usr/src/debug/bi
 nd/9.20.29/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.20.29/lib/isc/stats.c /usr/src/debug/bind/9.20.29/lib/isc/netscope.c /usr/src/debug/bind/9.20.29/lib/isc/ht.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.20.29/lib/isc/include/isc/fips.h /usr/src/debug/bind/9.20.29/lib/isc/parseint.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.20.29/lib/isc/picohttpparser.c /usr/src/debug/bind/9.20.29/lib/isc/include/isc/loop.h /usr/src/debug/bind/9.20.29/lib/isc/picohttpparser.h /usr/src/debug/bind/9.20.29/lib/isc/signal.c /usr/src/debug/bind/9.20.29/lib/isc/rwlock.c", added "/usr/src/debug/bind/9.20.30/lib/isc/include/isc/string.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/async.h /usr/src/debug/bind/9.20.30/lib/isc/quota.c /usr/src/debug/bind/9.20.30/
 lib/isc/include/isc/log.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/time.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/xml.h /usr/src/debug/bind/9.20.30/lib/isc/async.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.20.30/lib/isc/hex.c /usr/src/debug/bind/9.20.30/lib/isc/job.c /usr/src/debug/bind/9.20.30/lib/isc/lex.c /usr/src/debug/bind/9.20.30/lib/isc/dir.c /usr/src/debug/bind/9.20.30/lib/isc/crc64.c /usr/src/debug/bind/9.20.30/lib/isc/lib.c /usr/src/debug/bind/9.20.30/lib/isc/error.c /usr/src/debug/bind/9.20.30/lib/isc/log.c /usr/src/debug/bind/9.20.30/lib/isc/mem.c /usr/src/debug/bind/9.20.30/lib/isc/net.c /usr/src/debug/bind/9.20.30/lib/isc/timer.c /usr/src/debug/bind/9.20.30/lib/isc/netaddr.c /usr/src/debug/bind/9.20.30
 /lib/isc/assertions.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.20.30/lib/isc/os_p.h /usr/src/debug/bind/9.20.30/lib/isc/mutex.c /usr/src/debug/bind/9.20.30/lib/isc/radix.c /usr/src/debug/bind/9.20.30/lib/isc/regex.c /usr/src/debug/bind/9.20.30/lib/isc/file.c /usr/src/debug/bind/9.20.30/lib/isc/fips.c /usr/src/debug/bind/9.20.30/lib/isc/hash.c /usr/src/debug/bind/9.20.30/lib/isc/heap.c /usr/src/debug/bind/9.20.30/lib/isc/hmac.c /usr/src/debug/bind/9.20.30/lib/isc/loop.c /usr/src/debug/bind/9.20.30/lib/isc/safe.c /usr/src/debug/bind/9.20.30/lib/isc/time.c /usr/src/debug/bind/9.20.30/lib/isc/utf8.c /usr/src/debug/bind/9.20.30/lib/isc/work.c /usr/src/debug/bind/9.20.30/lib/isc/backtrace.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/dnsstream.h /usr/src/debug/bind/9.20.30/lib/isc/mutexblock.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.20.30/lib/isc/include/i
 sc/md.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.20.30/lib/isc/iterated_hash.c /usr/src/debug/bind/9.20.30/lib/isc/ratelimiter.c /usr/src/debug/bind/9.20.30/lib/isc/random.c /usr/src/debug/bind/9.20.30/lib/isc/httpd.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.20.30/lib/isc/getaddresses.c /usr/src/debug/bind/9.20.30/lib/isc/base64.c /usr/src/debug/bind/9.20.30/lib/isc/result.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.20.30/lib/isc/mutex_p.h /usr/src/debug/bind/9.20.30/lib/isc/commandline.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.20.30/lib/isc/uv.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/region.h /usr/src/
 debug/bind/9.20.30/lib/isc/managers.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/url.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.20.30/lib/isc/stats.c /usr/src/debug/bind/9.20.30/lib/isc/netscope.c /usr/src/debug/bind/9.20.30/lib/isc/ht.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/fips.h /usr/src/debug/bind/9.20.30/lib/isc/parseint.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.20.30/lib/isc/picohttpparser.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/loop.h /usr/src/debug/bind/9.20.30/lib/isc/picohttpparser.h /usr/src/debug/bind/9.20.30/lib/isc/serial.c /usr/src/debug/bind/9.20.30/lib/isc/rwlock.c /usr/src/debug/bind/9.20.30/lib/isc/signal.c /usr/src/debug/bind/9.20.30/lib/isc/region.c /usr/src/debug/bind/9.20.30/lib/isc/sockaddr.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/serial.h /usr/sr
 c/debug/bind/9.20.30/lib/isc/include/isc/file.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.20.30/lib/isc/md.c /usr/src/debug/bind/9.20.30/lib/isc/async_p.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/uv.h /usr/src/debug/bind/9.20.30/lib/isc/stdtime.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.20.30/lib/isc/condition.c /usr/src/debug/bind/9.20.30/lib/isc/errno.c /usr/src/debug/bind/9.20.30/lib/isc/histo.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/hashmap.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.20.30/lib/isc/stdio.c /usr/src/debug/bind/9.20.30/lib/isc/errno2result.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/syslog.h /us
 r/src/debug/bind/9.20.30/lib/isc/ascii.c /usr/src/debug/bind/9.20.30/lib/isc/errno2result.c /usr/src/debug/bind/9.20.30/lib/isc/syslog.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/getaddresses.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.20.30/lib/isc/proxy2.c /usr/src/debug/bind/9.20.30/lib/isc/counter.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/tid.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.20.30/lib/isc/loop_p.h /usr/src/debug/bind/9.20.30/lib/isc/string.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/proxy2.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/queue.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/dir
 .h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/os.h /usr/src/debug/bind/9.20.30/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.20.30/lib/isc/base32.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/once.h /usr/src/debug/bind/9.20.30/lib/isc/meminfo.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/random.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/ascii.h /usr/src/debug/bind/9.20.30/lib/isc/thread.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/job.h /usr/src/debug/bind/9.20.30/lib/isc/hashmap.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.20.30/lib/isc/symtab.c /usr/src/debug/bind/9.20.30/lib/isc/tid.c /usr/src/debug/bind/9.20.30/lib/isc/tls.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/barrier.h /usr/src/debug/bind/9.20.30/lib/isc/url.c /usr/src/debug/bind/9.
 20.30/lib/isc/xml.c /usr/src/debug/bind/9.20.30/lib/isc/job_p.h /usr/src/debug/bind/9.20.30/lib/isc/interfaceiter.c /usr/src/debug/bind/9.20.30/lib/isc/mem_p.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/net.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/work.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/signal.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.20.30/lib/isc/openssl_shim.c /usr/src/debug/bind/9.20.30/lib/isc/os.c /usr/src/debug/bind/9.20.30/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/result.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/histo.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/error.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.20.30/lib/isc/include/isc/types.h /usr
 /src/debug/bind/9.20.30/lib/isc/portset.c"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGSIZE changed from 483832 to 487928 (+1%)
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.29" to "9.20.30"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.29/bind-9.20.29.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.29 [default] to 9.20.30 [default]
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.29.so to libdns-9.20.30.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.29.so to libisccc-9.20.30.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.29.so to libisccfg-9.20.30.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.29.so to libisc-9.20.30.so
  /usr/lib/libns.so changed symlink target from libns-9.20.29.so to libns-9.20.30.so
  /usr/lib/libdns-9.20.29.so moved to /usr/lib/libdns-9.20.30.so
  /usr/lib/libisc-9.20.29.so moved to /usr/lib/libisc-9.20.30.so
  /usr/lib/libisccc-9.20.29.so moved to /usr/lib/libisccc-9.20.30.so
  /usr/lib/libisccfg-9.20.29.so moved to /usr/lib/libisccfg-9.20.30.so
  /usr/lib/libns-9.20.29.so moved to /usr/lib/libns-9.20.30.so
  /usr/include/isc/tm.h was removed

--===============3690457317252574938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bind-changelog.txt"

QklORCA5LjIwLjI5Ci0tLS0tLS0tLS0tLQoKU2VjdXJpdHkgRml4ZXMKfn5+fn5+fn5+fn5+fn4K
Ci0gW0NWRS0yMDI2LTE5NjY4XSBQcmV2ZW50IGV4Y2Vzc2l2ZSBDUFUgdXNlIHZhbGlkYXRpbmcg
Y3JhZnRlZCBETlNTRUMKICByZXNwb25zZXMuIGBgYTBhNjFkYmE5ZWBgCgogIEEgbWFsaWNpb3Vz
IGF1dGhvcml0YXRpdmUgc2VydmVyIGNvdWxkIHNlcnZlIGEgc2VjdXJlbHkgZGVsZWdhdGVkIHpv
bmUKICB3aG9zZSBEUyBhbmQgRE5TS0VZIHJlY29yZHMgY2FycnkgbWFueSBkaXN0aW5jdCBrZXkg
dGFncyBidXQgbm8gdmFsaWQKICBtYXRjaCwgZm9yY2luZyBhIHZhbGlkYXRpbmcgcmVzb2x2ZXIg
aW50byBleGNlc3NpdmUga2V5LXRhZyBtYXRjaGluZwogIGFuZCBoaWdoIENQVSB1c2UgZm9yIGV2
ZXJ5IHF1ZXJ5LiBCSU5EIG5vdyBib3VuZHMgdGhpcyB3b3JrIHdpdGggdGhlCiAgcGVyLXF1ZXJ5
IHZhbGlkYXRpb24gbGltaXQgKG1heC12YWxpZGF0aW9ucy1wZXItZmV0Y2gpLiA6Z2w6YCM1MzQ5
YAoKLSBbQ1ZFLTIwMjYtMTkwMzNdIFJlcXVpcmUgYSBUU0lHIG9uIGV2ZXJ5IG1lc3NhZ2Ugb2Yg
aW5jb21pbmcgem9uZQogIHRyYW5zZmVycy4gYGA5NDA0Y2QyYjhjYGAKCiAgQklORCA5IHVzZWQg
dG8gYWNjZXB0IFRTSUctc2lnbmVkIHpvbmUgdHJhbnNmZXJzIGluIHdoaWNoIHNvbWUKICBtZXNz
YWdlcyB3ZXJlIHVuc2lnbmVkLCBhbmQgcHJvY2Vzc2VkIHRob3NlIG1lc3NhZ2VzIGJlZm9yZSB0
aGUgbmV4dAogIHNpZ25hdHVyZSBjb3VsZCB2b3VjaCBmb3IgdGhlbS4gSXQgbm93IHJlcXVpcmVz
IGEgVFNJRyBvbiBldmVyeQogIG1lc3NhZ2Ugb2YgYW4gaW5jb21pbmcgQVhGUiBvciBJWEZSOyBh
bGwgbW9kZXJuIG5hbWVzZXJ2ZXIgYWxyZWFkeQogIHNpZ24gZXZlcnkgbWVzc2FnZSwgc28gbm8g
Y2hhbmdlIGlzIGV4cGVjdGVkIGluIHByYWN0aWNlLiA6Z2w6YCM2MDYyYAoKLSBbQ1ZFLTIwMjYt
NzcxMTldIFByZXZlbnQgYSBETlNTRUMgZG93bmdyYWRlIG9mIHNlY3VyZSBkZWxlZ2F0aW9ucyB2
aWEKICB1bnJlbGF0ZWQgTlNFQzMuIGBgM2JlZDljOGU5ZWBgCgogIEEgdmFsaWRhdGluZyByZXNv
bHZlciBjb3VsZCBiZSB0cmlja2VkIGludG8gdHJlYXRpbmcgYSBzZWN1cmUKICBkZWxlZ2F0aW9u
IGFzIHVuc2lnbmVkIGFuZCBhY2NlcHRpbmcgZm9yZ2VkIGFuc3dlcnMgZm9yIG5hbWVzIGJlbmVh
dGgKICBpdCwgaWYgYW4gYXR0YWNrZXIgY291bGQgaW5qZWN0IHJlc3BvbnNlcyB0byBpdHMgcXVl
cmllcy4gU3VjaCBmb3JnZWQKICBwcm9vZnMgYXJlIG5vdyByZWplY3RlZC4gOmdsOmAjNjIzNGAK
Ci0gW0NWRS0yMDI2LTE5OTQxXSBQcmV2ZW50IGZvcmdlZCBETlNTRUMtdmFsaWRhdGVkIE5YRE9N
QUlOIHJlc3BvbnNlcy4KICBgYGEzNmJmNThkYWZgYAoKICBBIHZhbGlkYXRpbmcgcmVzb2x2ZXIg
Y291bGQgYWNjZXB0IGEgc2lnbmVkIE5TRUMgcmVjb3JkIGZyb20gYW4KICB1bnJlbGF0ZWQgem9u
ZSBhcyBwcm9vZiB0aGF0IGEgd2lsZGNhcmQgZGlkIG5vdCBleGlzdC4gQW4gb24tcGF0aAogIGF0
dGFja2VyIG9yIG1hbGljaW91cyBmb3J3YXJkZXIgY29udHJvbGxpbmcgYSBzaWduZWQgem9uZSBj
b3VsZAogIHRoZXJlZm9yZSBmb3JnZSBhbiBhdXRoZW50aWNhdGVkIE5YRE9NQUlOIHJlc3BvbnNl
IGZvciBhIG5hbWUgdGhhdAogIHNob3VsZCByZXNvbHZlIHRocm91Z2ggYSB3aWxkY2FyZC4gQklO
RCBub3cgcmVxdWlyZXMgdGhlCiAgd2lsZGNhcmQtZGVuaWFsIGFuZCBuYW1lLW5vbmV4aXN0ZW5j
ZSBwcm9vZnMgdG8gYmUgc2lnbmVkIGJ5IHRoZSBzYW1lCiAgem9uZS4gOmdsOmAjNjI1M2AKCi0g
W0NWRS0yMDI2LTE5NjY2XSBETlM2NCB3aXRoIGJyZWFrLWRuc3NlYyBjb3VsZCBjYXVzZSBhbiBh
c3NlcnRpb24KICBmYWlsdXJlLiBgYDRjZWM0OTY1YzRgYAoKICBXaGVuIGEgImRuczY0IiBzdGF0
ZW1lbnQgaXMgY29uZmlndXJlZCB3aXRoICJicmVhay1kbnNzZWMgeWVzIiBhbmQgaXRzCiAgImV4
Y2x1ZGUiIGxpc3QgbWF0Y2hlcyBzb21lIGJ1dCBub3QgYWxsIG9mIHRoZSBhZGRyZXNzZXMgaW4g
YW4gQUFBQQogIFJSc2V0LCBuYW1lZCByZW1vdmVzIHRoZSBleGNsdWRlZCBhZGRyZXNzZXMgZnJv
bSB0aGUgYW5zd2VyIGluc3RlYWQgb2YKICBzeW50aGVzaXppbmcgbmV3IG9uZXMuIElmIHRoZSBh
bnN3ZXIgYmVpbmcgZmlsdGVyZWQgaGFkIGJlZW4gY2FjaGVkCiAgdG9nZXRoZXIgd2l0aCBhIHBy
b29mIHRoYXQgdGhlIHF1ZXJpZWQgbmFtZSBkb2VzIG5vdCBleGlzdCAtLSB3aGljaCBpcwogIHdo
YXQgYSB3aWxkY2FyZCBtYXRjaCBwcm9kdWNlcyAtLSBuYW1lZCB0ZXJtaW5hdGVkIHdpdGggYW4g
YXNzZXJ0aW9uCiAgZmFpbHVyZS4KCiAgT25seSByZWN1cnNpdmUgcmVzb2x2ZXJzIGFyZSBhZmZl
Y3RlZCwgYW5kIG9ubHkgd2hlbiAiYnJlYWstZG5zc2VjCiAgeWVzIiBpcyBpbiB1c2U7IHRoZSBh
bnN3ZXIgaGFzIHRvIGNvbWUgZnJvbSB0aGUgY2FjaGUsIHNvIGEgc2VydmVyCiAgdGhhdCBpcyBv
bmx5IGF1dGhvcml0YXRpdmUgY2Fubm90IHJlYWNoIHRoaXMuIDpnbDpgIzYzMDFgCgotIFtDVkUt
MjAyNi0xOTY2N10gUmVqZWN0IG5lZ2F0aXZlIGNhY2hlIHJlY29yZHMgdGhhdCBkbyBub3QgZml0
IGluIGEKICBkbnNfcmRhdGFfdC4gYGBkYmYwOGM4NTgxYGAKCiAgQSBzaW5nbGUgY3JhZnRlZCBy
ZXNwb25zZSBmcm9tIGEgc2VydmVyIGNvdWxkIG1ha2UgYSByZXNvbHZlciBjYWNoZSBhCiAgbWFs
Zm9ybWVkIG5lZ2F0aXZlIGVudHJ5IGFuZCB0aGVuIHRlcm1pbmF0ZSB3aXRoIGFuIGFzc2VydGlv
biBmYWlsdXJlCiAgd2hlbiByZWFkaW5nIGl0IGJhY2suIE9ubHkgcmVjdXJzaXZlIHJlc29sdmVy
cyBhcmUgYWZmZWN0ZWQsIG9uIGEKICBkZWZhdWx0IGNvbmZpZ3VyYXRpb24uIDpnbDpgIzYzMDJg
CgotIFtDVkUtMjAyNi0xOTY2Ml0gUHJldmVudCByZXNvbHZlciBjcmFzaCB3aXRoIGNhY2hlZCBE
TlNTRUMgcHJvb2ZzLgogIGBgYzg4NGNjMWJhMGBgCgogIFVuZGVyIGNlcnRhaW4gdGltaW5nIGNv
bmRpdGlvbnMsIGNvbmN1cnJlbnQgcmVjdXJzaXZlIHF1ZXJpZXMgY291bGQKICBjYXVzZSBuYW1l
ZCB0byBjcmFzaCB3aGVuIGNhY2hlZCBETlNTRUMgTk9RTkFNRSBwcm9vZiBkYXRhIHdhcwogIHJl
cGxhY2VkIHdoaWxlIHN0aWxsIGluIHVzZS4gQ2FjaGVkIHByb29mIGRhdGEgaXMgbm93IHJldGFp
bmVkIHVudGlsCiAgYWxsIHF1ZXJpZXMgdXNpbmcgaXQgaGF2ZSBjb21wbGV0ZWQuIDpnbDpgIzYz
MzNgCgotIFtDVkUtMjAyNi03NTAyOV0gRGlzY2FyZCByZXBlYXRlZCBTT0EsIENOQU1FLCBhbmQg
RE5BTUUgcmVjb3JkcyB3aGVuCiAgcGFyc2luZyBETlMgbWVzc2FnZXMuIGBgMGQ2MzA3NThjMmBg
CgogIEEgRE5TIG1lc3NhZ2UgY291bGQgY2FycnkgdGhlIHNhbWUgU09BLCBDTkFNRSwgb3IgRE5B
TUUgcmVjb3JkIG1hbnkKICB0aW1lcywgYW5kIG5hbWVkIGtlcHQgZXZlcnkgY29weSB3aGlsZSBw
YXJzaW5nIGl0LiBXaXRoIG5hbWUKICBjb21wcmVzc2lvbiB0aG9zZSBjb3BpZXMgdG9vayB1cCBm
YXIgbW9yZSBtZW1vcnkgaW50ZXJuYWxseSB0aGFuIGluCiAgdGhlIG1lc3NhZ2UgaXRzZWxmLCBh
bmQgZXZlcnkgbGF0ZXIgcHJvY2Vzc2luZyBzdGVwIGhhZCB0byBoYW5kbGUgYWxsCiAgb2YgdGhl
bS4gbmFtZWQgbm93IGtlZXBzIHRoZSBmaXJzdCBjb3B5IG9mIHN1Y2ggYSByZWNvcmQgYW5kIGRp
c2NhcmRzCiAgaWRlbnRpY2FsIHJlcGVhdHMuIDpnbDpgIzYzMzVgCgotIFtDVkUtMjAyNi03NzY5
Ml0gRml4IGFuIHVuYXV0aGVudGljYXRlZCBjcmFzaCBvbiBIVFRQUyB1c2luZyBTSUcoMCkKICBg
YDVhMjQ0MDFjNWNgYAoKICBBIHNwZWNpZmljYWxseSBjcmFmdGVkIEhUVFBTIHF1ZXJ5IHVzaW5n
IFNJRygwKSBhcyBhdXRoZW50aWNhdGlvbgogIGNvdWxkIGNyYXNoIG5hbWVkIGlmIHRoZSBjbGll
bnQgY2xvc2VzIHRoZSBjb25uZWN0aW9uIGJlZm9yZSBuYW1lZAogIGFjdHVhbGx5IHZlcmlmaWVz
IHRoZSBzaWduYXR1cmUuIFRoaXMgaXMgbm93IGZpeGVkLiA6Z2w6YCM2MzQzYAoKLSBbQ1ZFLTIw
MjYtODE3MzZdIENhY2hlZCBIVFRQUy9TVkNCIGFsaWFzZXMgY291bGQgZXhoYXVzdCByZXNvbHZl
ciBDUFUuCiAgYGAyMGJiYjE2MzlhYGAKCiAgQSByZWN1cnNpdmUgcmVzb2x2ZXIgdGhhdCBoYWQg
Y2FjaGVkIGEgbGFyZ2Ugc2V0IG9mIGludGVybGlua2VkIEhUVFBTCiAgb3IgU1ZDQiByZWNvcmRz
IGluIGFsaWFzIGZvcm0gY291bGQgYmUgZHJpdmVuIHRvIGRvIGFuIGV4Y2Vzc2l2ZQogIGFtb3Vu
dCBvZiB3b3JrIGFzc2VtYmxpbmcgYSBzaW5nbGUgcmVzcG9uc2UsIGJlY2F1c2UgaXQgZm9sbG93
ZWQgZXZlcnkKICBjYWNoZWQgYWxpYXMgdGFyZ2V0IHdoZW4gYnVpbGRpbmcgdGhlIGFkZGl0aW9u
YWwgc2VjdGlvbi4gQSBjbGllbnQKICBwZXJtaXR0ZWQgdG8gdXNlIHJlY3Vyc2lvbiwgdG9nZXRo
ZXIgd2l0aCBhbiBhdHRhY2tlci1jb250cm9sbGVkIHpvbmUKICB1c2VkIHRvIHBsYW50IHRoZSBy
ZWNvcmRzLCBjb3VsZCByZXBlYXQgc21hbGwgcXVlcmllcyB0byBjb25zdW1lCiAgZW5vdWdoIENQ
VSB0byBkZWxheSBvciBkZW55IHNlcnZpY2UgdG8gb3RoZXIgY2xpZW50cy4gVGhlIGFtb3VudCBv
ZgogIGFkZGl0aW9uYWwgcHJvY2Vzc2luZyBkb25lIGZvciBvbmUgcXVlcnkgaXMgbm93IGJvdW5k
ZWQuIDpnbDpgIzYzNDdgCgotIFtDVkUtMjAyNi03NjE2M10gUHJldmVudCBUS0VZIHF1ZXJpZXMg
ZnJvbSB0ZXJtaW5hdGluZyBuYW1lZCB3aXRob3V0CiAgZ2xvYmFsIG9wdGlvbnMuIGBgNzY0NTEz
ODUzOGBgCgogIG5hbWVkIGNvdWxkIHRlcm1pbmF0ZSB1bmV4cGVjdGVkbHkgd2hlbiBhIHJlbW90
ZSBjbGllbnQgc2VudCBhIFRLRVkKICBxdWVyeSBpZiB0aGUgY29uZmlndXJhdGlvbiBkaWQgbm90
IGluY2x1ZGUgYSBnbG9iYWwgb3B0aW9ucyBzdGF0ZW1lbnQuCiAgVGhpcyBoYXMgYmVlbiBmaXhl
ZC4KCiAgSVNDIHRoYW5rcyBPd2FpcyBMb25lICh0aGVzZWNndXkpIGZvciByZXBvcnRpbmcgdGhl
IGlzc3VlLiA6Z2w6YCM2MzU3YAoKLSBbQ1ZFLTIwMjYtNzgzMDFdIE91dC1vZi16b25lIHJlY29y
ZHMgaW4gYSB6b25lIGRhdGFiYXNlIGNvdWxkIGJlCiAgc2VydmVkIGFzIGF1dGhvcml0YXRpdmUu
IGBgNzJhMTBjM2EwYmBgCgogIFdoZW4gYSB6b25lIGRhdGFiYXNlIGNvbnRhaW5lZCByZWNvcmRz
IGZvciBuYW1lcyBvdXRzaWRlIHRoZSB6b25lIOKAlAogIHN1Y2ggYXMgYSBkZWxlZ2F0aW9uIGFi
b3ZlIHRoZSB6b25lIGFwZXgsIGxlZnQgYmVoaW5kIGJ5IGEgc2Vjb25kYXJ5CiAgdGhhdCBoYWQg
YWNjZXB0ZWQgb3V0LW9mLXpvbmUgZGF0YSBmcm9tIGl0cyBwcmltYXJ5IOKAlCB0aGUgc2VydmVy
IGNvdWxkCiAgdHJlYXQgdGhlbSBhcyBhdXRob3JpdGF0aXZlIGFuZCBhbnN3ZXIgcXVlcmllcyBm
b3IgbmFtZXMgaW5zaWRlIHRoZQogIHpvbmUgd2l0aCB0aGF0IG91dC1vZi16b25lIGRhdGEgaW5z
dGVhZCBvZiB0aGUgem9uZSdzIG93bi4gQSBzZXJ2ZXIKICB0aGF0IHdhcyBhbHNvIGEgcmVzb2x2
ZXIgY291bGQgZm9sbG93IHN1Y2ggYSBkZWxlZ2F0aW9uIGFuZCBjYWNoZSB0aGUKICBhbnN3ZXJz
IG9mIHRoZSBzZXJ2ZXIgaXQgbmFtZWQsIGFmZmVjdGluZyBuYW1lcyBvdXRzaWRlIHRoZSBjb25m
aWd1cmVkCiAgem9uZS4gWm9uZSBkYXRhYmFzZSBsb29rdXBzIGFyZSBub3cgY29uZmluZWQgdG8g
bmFtZXMgYXQgb3IgYmVsb3cgdGhlCiAgem9uZSdzIG9yaWdpbi4KCiAgSVNDIHdvdWxkIGxpa2Ug
dG8gdGhhbmsgSGVucmlxdWUgUGVyZWlyYSBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1ZS4KICA6Z2w6
YCM2MzYxYAoKLSBbQ1ZFLTIwMjYtODAyNzRdIENyYXNoIG9uIHdpbGRjYXJkIGFuc3dlcnMgY2Fy
cnlpbmcgYm90aCBOU0VDIGFuZAogIE5TRUMzIHByb29mcy4gYGAwZTQ0NDUxYjFhYGAKCiAgV2hl
biBhIHdpbGRjYXJkIGFuc3dlciBhcnJpdmVkIHdpdGggYm90aCBOU0VDIGFuZCBOU0VDMyByZWNv
cmRzIGF0IHRoZQogIG5hbWUgcHJvdmluZyB0aGF0IHRoZSBxdWVyaWVkIG5hbWUgZG9lcyBub3Qg
ZXhpc3QsIHRoZSByZXNvbHZlciBjb3VsZAogIHBpY2sgZGlmZmVyZW50IHJlY29yZHMgd2hlbiBj
YWNoaW5nIHRoZSBhbnN3ZXIgYW5kIHdoZW4gcmV0cmlldmluZyB0aGUKICBwcm9vZiwgZGVwZW5k
aW5nIG9uIHRoZSBvcmRlciBpbiB3aGljaCB0aGUgYXV0aG9yaXRhdGl2ZSBzZXJ2ZXIgc2VudAog
IHRoZW0uIFRoaXMgY291bGQgdGVybWluYXRlIG5hbWVkIHdpdGggYW4gYXNzZXJ0aW9uIGZhaWx1
cmUsIGZhaWwgdGhlCiAgcXVlcnkgd2l0aCBTRVJWRkFJTCwgb3Igc2VydmUgYSBkZW5pYWwgcmVj
b3JkIG90aGVyIHRoYW4gdGhlIG9uZSB0aGF0CiAgaGFkIGJlZW4gdmVyaWZpZWQuIFRoZSByZXNv
bHZlciBub3cgY2FjaGVzIGFuZCBzZXJ2ZXMgdGhlIHNhbWUgZGVuaWFsCiAgcmVjb3JkIGl0IGFj
Y2VwdGVkIHdoZW4gdGhlIGFuc3dlciB3YXMgcmVjZWl2ZWQuCgogIElTQyB3b3VsZCBsaWtlIHRv
IHRoYW5rIGh5dGh5dCBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1ZS4gOmdsOmAjNjM2OWAKCi0gW0NW
RS0yMDI2LTgxNTYzXSBGb2xsb3dpbmcgSFRUUFMvU1ZDQiBhbGlhc2VzIGNvdWxkIGxlYWsgcmVz
b2x2ZXIKICBjYWNoZSBtZW1vcnkuIGBgMzE2MmRmMzY5ZWBgCgogIFdoZW4gYSByZWN1cnNpdmUg
c2VydmVyIGFuc3dlcmVkIGEgcXVlcnkgZm9yIGFuIEhUVFBTIG9yIFNWQ0IgcmVjb3JkCiAgaW4g
YWxpYXMgZm9ybSBhbmQgdGhlIGFsaWFzIHRhcmdldCBoYWQgbW9yZSB0aGFuIDEzIHJlY29yZHMs
IHRoZQogIHRhcmdldCByZWNvcmRzIHdlcmUgcGlubmVkIGluIHRoZSBjYWNoZSBwZXJtYW5lbnRs
eSBpbnN0ZWFkIG9mIGJlaW5nCiAgcmVsZWFzZWQgb25jZSB0aGUgYW5zd2VyIHdhcyBzZW50LiBB
IHJlbW90ZSBwYXJ0eSB3aG8gY291bGQgbWFrZSB0aGUKICBzZXJ2ZXIgZm9sbG93IHN1Y2ggYWxp
YXNlcyB0byBhIHN0ZWFkeSBzdHJlYW0gb2YgZnJlc2ggbmFtZXMgY291bGQKICBncm93IHRoZSBj
YWNoZSBiZXlvbmQgdGhlIGNvbmZpZ3VyZWQgbWF4LWNhY2hlLXNpemUgdW50aWwgdGhlIHNlcnZl
cgogIHdhcyB1bmFibGUgdG8gcmVzb2x2ZSB1bnJlbGF0ZWQgbmFtZXMuIFRoZSByZWNvcmRzIGFy
ZSBub3cgcmVsZWFzZWQKICBjb3JyZWN0bHkuCgogIElTQyB3b3VsZCBsaWtlIHRvIHRoYW5rIFNh
bXkgTWVkamFoZWQvQXA0c2ggZm9yIHJlcG9ydGluZyB0aGUgaXNzdWUuCiAgOmdsOmAjNjM3NGAK
Ck5ldyBGZWF0dXJlcwp+fn5+fn5+fn5+fn4KCi0gQWRkIGFuIGFnZW50IHNraWxsIGZvciB0aGUg
aXNjX2pvYi9pc2NfYXN5bmMvaXNjX3dvcmsgQVBJcy4KICBgYGZlMzI5OTBiMDZgYAoKICBEb2N1
bWVudHMgd2hlbiB0byB1c2UgaXNjX2pvYl9ydW4oKSwgaXNjX2FzeW5jX3J1bigpIG9yCiAgaXNj
X3dvcmtfZW5xdWV1ZSgpLCBhbmQgdGhlIGNvbnRyYWN0IGVhY2ggb25lIGltcG9zZXMuIE5vIGZ1
bmN0aW9uYWwKICBjaGFuZ2UuIDpnbDpgITEyNTYxYAoKUmVtb3ZlZCBGZWF0dXJlcwp+fn5+fn5+
fn5+fn5+fn5+CgotIFJlbW92ZSB1bnVzZWQgY2xvc2VzdCBlbmNsb3NlciBwcm9vZiBjYWNoaW5n
LiBgYGFiZDhiNWJmZDhgYAoKICBCSU5EIHVzZWQgdG8gY2FjaGUgYW4gTlNFQzMgY2xvc2VzdCBl
bmNsb3NlciBwcm9vZiBhbG9uZ3NpZGUgcG9zaXRpdmUKICB3aWxkY2FyZCBhbnN3ZXJzIHNvIHRo
YXQgYSByZXNvbHZlciBjb3VsZCByZS1zZW5kIGl0IHdoZW4gYW5zd2VyaW5nCiAgZnJvbSBpdHMg
Y2FjaGUuIFRoYXQgc3RvcHBlZCBiZWluZyB1c2VkIGluIEJJTkQgOS45ICgyMDExKSwgd2hlbgog
IHBvc2l0aXZlIHdpbGRjYXJkIHJlc3BvbnNlcyB3ZXJlIGNoYW5nZWQgdG8gb21pdCB0aGF0IE5T
RUMzIHJlY29yZCDigJQKICBSRkMgNTE1NSByZXF1aXJlcyBvbmx5IHRoZSBuZXh0IGNsb3NlciBu
YW1lIHByb29mIOKAlCBhbmQgdGhlIGNsb3Nlc3QKICBlbmNsb3NlciBjYW1lIHRvIGJlICBkZXJp
dmVkIGR1cmluZyB2YWxpZGF0aW9uIGluc3RlYWQuIFRoZSBjYWNoaW5nCiAgY29kZSBoYXMgYmVl
biB1bnJlYWNoYWJsZSBldmVyIHNpbmNlLCBzbyB0aGlzIHJlbW92ZXMgaXQgd2l0aCBubwogIGNo
YW5nZSBpbiBiZWhhdmlvdXIuIDpnbDpgIzU4MDNgIDpnbDpgITEyNjYwYAoKRmVhdHVyZSBDaGFu
Z2VzCn5+fn5+fn5+fn5+fn5+fgoKLSBSZWplY3Qgb3ZlcnNpemVkIGFuZCBtYWxmb3JtZWQgRE5T
S0VZIHJlY29yZHMgdXAgZnJvbnQuIGBgNmMyMjEwOTkyNGBgCgogIE92ZXJzaXplZCBSU0Ega2V5
IG1hdGVyaWFsIGluIGEgRE5TS0VZIHJlY29yZCB3YXMgb25seSByZWplY3RlZCBhZnRlcgogIGl0
IGhhZCBiZWVuIGNvbnZlcnRlZCwgYWxsb2NhdGluZyBtZW1vcnkgcHJvcG9ydGlvbmFsIHRvIHRo
ZSByZWNvcmQKICBzaXplLiBTdWNoIHJlY29yZHMgYXJlIG5vdyByZWplY3RlZCBiZWZvcmUgY29u
dmVyc2lvbiwgYXMgYXJlIEVkMjU1MTkKICBhbmQgRWQ0NDgga2V5cyB3aXRoIHRyYWlsaW5nIGJ5
dGVzIHRoYXQgd2VyZSBwcmV2aW91c2x5IHNpbGVudGx5CiAgaWdub3JlZC4gOmdsOmAjNDUzN2Ag
OmdsOmAhMTI1NjBgCgpCdWcgRml4ZXMKfn5+fn5+fn5+CgotIFByZXZlbnQgYSBjcmFzaCB3aGVu
IHVzaW5nIGJvdGggZG5zNjQgYW5kIGZpbHRlci1hLiBgYGJjZTVkMTBkMThgYAoKICBBbiBhc3Nl
cnRpb24gZmFpbHVyZSB3YXMgcG9zc2libGUgd2hlbiB1c2luZyBib3RoIGBkbnM2NGAgYW5kIHRo
ZQogIGBmaWx0ZXItYWAgcGx1Z2luIHNpbXVsdGFuZW91c2x5OyB0aGlzIGhhcyBiZWVuIGZpeGVk
LiA6Z2w6YCM1OTc5YAogIDpnbDpgITEyNjYzYAoKLSBGaXggdXBkYXRlLXBvbGljeSBncmFudCBl
eHRlcm5hbCBhZGRyZXNzIHBhc3NpbmcuIGBgYjFlOTU1YzMyNmBgCgogIE9ubHkgVENQIGNsaWVu
dCBhZGRyZXNzZXMgYXJlIHN1cHBvc2VkIHRvIGJlIHBhc3NlZCB0byBhbiBgZXh0ZXJuYWxgCiAg
aGFuZGxlciBmb3IgdGhlIGFzc29jaWF0ZWQgYHVwZGF0ZS1wb2xpY3lgIHJ1bGUsIGJ1dCBVRFAg
Y2xpZW50CiAgYWRkcmVzc2VzIHdlcmUgYWxzbyBiZWluZyBwYXNzZWQuICBUaGlzIGNvdWxkIGhh
dmUgY2F1c2VkIHRoZSBleHRlcm5hbAogIGhhbmRsZXIgdG8gcmV0dXJuIGEgcmVzdWx0IGl0IG90
aGVyd2lzZSB3b3VsZG4ndC4gVGhpcyBoYXMgYmVlbiBmaXhlZC4KICA6Z2w6YCM2MDYxYCA6Z2w6
YCExMjU1NWAKCi0gTWlzc2luZyByZXF1aXJlZCBOU0VDMyBmb3IgZGVsZWdhdGlvbiBub3QgZGV0
ZWN0ZWQuIGBgZTg0ZWQyZTlkN2BgCgogIEEgbWlzc2luZyByZXF1aXJlZCBOU0VDMyByZWNvcmQg
Zm9yIGFuIGluc2VjdXJlIGRlbGVnYXRpb24gaW4gYSBub24KICBPUFRPVVQgcmFuZ2Ugd2FzIG5v
dCBiZWluZyBkZXRlY3RlZC4gIFRoaXMgaGFzIGJlZW4gZml4ZWQuIDpnbDpgIzYwNjNgCiAgOmds
OmAhMTI2MTFgCgotIFRpZ2h0ZW4gRVVJNDggYW5kIEVVSTQ4IHRleHQgcGFyc2luZy4gYGBmZjUw
ZjJjZGYxYGAKCiAgTWFsZm9ybWVkIEVVSTQ4IGFuZCBFVUk2NCByZWNvcmRzIGNvdWxkIGJlIGFj
Y2VwdGVkLiAgVGhpcyBoYXMgYmVlbgogIGZpeGVkLiA6Z2w6YCM2MDgyYCA6Z2w6YCExMjUyMWAK
Ci0gR2VvSVAgQUNMIHN0YXRlIGNhbiBiZSBzdGFsZSBvciB3cm9uZyBhZnRlciByZWxvYWQuIGBg
NjNiYWY0MjViM2BgCgogIGBuYW1lZGAgY2FjaGVzIEdlb0lQIGluZm9ybWF0aW9uIGFmdGVyIGxv
b2tpbmcgaXQgdXAsIGJ1dCB0aGUgY2FjaGVkCiAgaW5mb3JtYXRpb24gd2FzIG5vdCBpbnZhbGlk
YXRlZCB3aGVuIHRoZSBHZW9JUCBkYXRhYmFzZSB3YXMgcmVsb2FkZWQsCiAgc28gaXQgY291bGQg
Y29udGludWUgdG8gYmUgdXNlZC4gIFdlIG5vdyBpbnZhbGlkYXRlIGV4aXN0aW5nIGNhY2hlZAog
IEdlb0lQIGluZm9ybWF0aW9uIGFzIHBhcnQgb2YgdGhlIHJlbG9hZGluZyBwcm9jZXNzLiA6Z2w6
YCM2MDgzYAogIDpnbDpgITEyNjYyYAoKLSBIb25vciBETlNTRUMgcG9saWN5IGtleSB0YWcgcmFu
Z2VzLiBgYGI4MmU1ODM0YjdgYAoKICBXaGVuIGEgRE5TU0VDIHBvbGljeSBjb25maWd1cmVkIGEg
bm9uLWRlZmF1bHQgdGFnLXJhbmdlLCBkbnNzZWMta2V5Z2VuCiAgYW5kIGRuc3NlYy1rc3IgY291
bGQgYWNjZXB0IGdlbmVyYXRlZCBrZXlzIG91dHNpZGUgdGhhdCByYW5nZS4gQm90aAogIHRvb2xz
IG5vdyBob25vciB0aGUgY29uZmlndXJlZCBtaW5pbXVtIGFuZCBtYXhpbXVtIGtleSB0YWdzLgog
IDpnbDpgIzYwOTFgIDpnbDpgITEyNTQ5YAoKLSBGaXggZG91YmxlIGZyZWUgaW4gbWRpZyB3aGVu
IEVETlMgb3B0aW9ucyBhcmUgc3BlY2lmaWVkLgogIGBgYWY1YmQwYjBmZmBgCgogIFdoZW4gdGhl
IGRlZmF1bHRfcXVlcnkgaXMgY2xvbmVkIHRoZSBFRE5TIG9wdGlvbnMgbmVlZCB0byBiZSBjbG9u
ZWQKICByYXRoZXIgdGhhbiB0aGUgcG9pbnRlciBjb3BpZWQuICBUaGUgb2xkIGJlaGF2aW91ciBy
ZXN1bHRzIGluIGEgZG91YmxlCiAgZnJlZSBvZiB0aGUgb3B0aW9ucy4gIFRoaXMgaGFzIGJlZW4g
Zml4ZWQuIDpnbDpgIzYwOTVgIDpnbDpgITEyNjYxYAoKLSBGaXggYSBjcmFzaCB3aGVuIGFuIElY
RlIgZmFsbHMgYmFjayB0byBBWEZSIHdpdGggdXBkYXRlcyBzdGlsbAogIHBlbmRpbmcuIGBgZTM0
MDYyYmM3ZWBgCgogIFdoZW4gYSBzZWNvbmRhcnkgem9uZSByZWNlaXZlZCBhbiBpbmNyZW1lbnRh
bCB0cmFuc2ZlciAoSVhGUikgYW5kIHRoZQogIHByaW1hcnkgdGhlbiBjYXVzZWQgbmFtZWQgdG8g
ZmFsbCBiYWNrIHRvIGEgZnVsbCB0cmFuc2ZlciAoQVhGUikgd2hpbGUKICBzb21lIG9mIHRoZSBh
bHJlYWR5LXJlY2VpdmVkIGluY3JlbWVudGFsIGNoYW5nZXMgd2VyZSBzdGlsbCB3YWl0aW5nIHRv
CiAgYmUgYXBwbGllZCwgbmFtZWQgY291bGQgbGF0ZXIgY3Jhc2ggd2hlbiB0aGF0IHRyYW5zZmVy
IGZpbmlzaGVkLiBUaGUKICBwZW5kaW5nIGNoYW5nZXMgYXJlIG5vdyBkaXNjYXJkZWQgY29ycmVj
dGx5IGJlZm9yZSB0aGUgQVhGUiByZXRyeS4KICA6Z2w6YCM2MTE0YCA6Z2w6YCExMjYyNGAKCi0g
Rml4IERTIHJlcXVlc3RzIHRvIHBhcmVudGFsIGFnZW50cyBvdmVyIFRMUy4gYGA1NTgzMGQzMGY2
YGAKCiAgVExTIGNvbmZpZ3VyYXRpb24gZm9yIHBhcmVudGFsIGFnZW50cyB3YXMgYmVpbmcgaWdu
b3JlZCB3aGVuIHNlbmRpbmcKICBEUyByZXF1ZXN0cy4gVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmds
OmAjNjEzNWAgOmdsOmAhMTI2MTNgCgotIEZpeCBhIGNyYXNoIHdoZW4gcmVzb2x2aW5nIG5hbWVz
IGJlbG93IGEgY2FjaGVkIEROQU1FLiBgYGI5NGU5NDBmNTJgYAoKICBBIHJlY3Vyc2l2ZSByZXNv
bHZlciBjb3VsZCBjcmFzaCB3aGVuIGl0IGFuc3dlcmVkIGEgcXVlcnkgZm9yIGEgbmFtZQogIGJl
bmVhdGggYSBjYWNoZWQgRE5BTUUgd2hpbGUgdGhhdCBzYW1lIEROQU1FIHJlY29yZCB3YXMgY29u
Y3VycmVudGx5CiAgcmVmcmVzaGVkIG9yIGV2aWN0ZWQgZnJvbSB0aGUgY2FjaGUuIDpnbDpgIzYx
ODJgIDpnbDpgITEyNTkzYAoKLSBSbmRjLWNvbmZnZW4gYC1xYCAocXVpZXQpIG9wdGlvbiBpcyBk
b2N1bWVudGVkIGJ1dCBkb2Vzbid0IHdvcmsuCiAgYGA3ZTRhN2NhMWE3YGAKCiAgVGhlIGNvbW1h
bmQgbGluZSBwYXJzaW5nIGluIHJuZGMtY29uZmdlbiB3YXMgYnJva2VuIHNvICBgcm5kYy1jb25m
Z2VuCiAgLXFgIGRpZCBub3Qgd29yay4gIFRoaXMgaGFzIGJlZW4gZml4ZWQuIDpnbDpgIzYxODdg
IDpnbDpgITEyNTc1YAoKLSBFbmZvcmNlIHF1ZXJ5IEFDTHMgZm9yIHJlZGlyZWN0IHpvbmVzIGFu
ZCBzZWFyY2hlZCBETFpzLgogIGBgYmM2OTg3NmIyZWBgCgogIFF1ZXJpZXMgYW5zd2VyZWQgZnJv
bSByZWRpcmVjdCB6b25lcyBvciBzZWFyY2hlZCBETFogZGF0YWJhc2VzIGRpZCBub3QKICBjb25z
aXN0ZW50bHkgaG9ub3IgYGFsbG93LXF1ZXJ5YCBhbmQgYGFsbG93LXF1ZXJ5LW9uYCwgcG90ZW50
aWFsbHkKICBleHBvc2luZyByZXN0cmljdGVkIEROUyBkYXRhIHRvIGV4Y2x1ZGVkIGNsaWVudHMg
b3IgdGhyb3VnaCBleGNsdWRlZAogIGxpc3RlbmluZyBhZGRyZXNzZXMuIFRoZXNlIEFDTHMgYXJl
IG5vdyBlbmZvcmNlZCBiZWZvcmUgcmVkaXJlY3Qgb3IKICBETFogZGF0YSBpcyByZXR1cm5lZC4g
OmdsOmAjNjI1MWAsICM2MjUyIDpnbDpgITEyNjQ2YAoKLSBDaGVjayAiYXNudW0iIHZhbGlkaXR5
IGluIEdlb0lQIEFDTHMuIGBgMjhjMmJmZGM3YmBgCgogIFdlIG5vdyBjaGVjayB0aGUgdmFsaWRp
dHkgb2YgYXV0b25vbW91cyBzeXN0ZW0gKEFTKSBudW1iZXJzIHdoZW4KICBwYXJzaW5nIEdlb0lQ
IEFDTHMgdGhhdCB1c2UgYGFzbnVtYCBlbGVtZW50cyBhdCBjb25maWd1cmF0aW9uIHRpbWUuCgog
IGBhc251bWAgdmFsdWVzIHN0YXJ0IHdpdGggYW4gb3B0aW9uYWwgY2FzZS1pbnNlbnNpdGl2ZSAi
QVMiIHByZWZpeCwKICBmb2xsb3dlZCBvbmx5IGJ5IGRlY2ltYWwgZGlnaXRzLCB3aXRoIG5vIHNw
YWNlcyBvciBvdGhlciBleHRyYW5lb3VzCiAgY2hhcmFjdGVycy4gVGhlIHZhbHVlIHJlcHJlc2Vu
dGVkIGNhbm5vdCBleGNlZWQgMl4zMi4gOmdsOmAjNjI1NWAKICA6Z2w6YCExMjUxMWAKCi0gUHJl
dmVudCBjcmFzaGVzIHdoaWxlIHJlcG9ydGluZyBETlNTRUMgc2lnbmluZyBzdGF0aXN0aWNzLgog
IGBgYzE5MDUxNGYwYWBgCgogIFNlcnZlcnMgd2l0aCB6b25lLXN0YXRpc3RpY3MgZnVsbCBjb3Vs
ZCB0ZXJtaW5hdGUgd2hpbGUgcmVwb3J0aW5nCiAgRE5TU0VDIHNpZ25pbmcgc3RhdGlzdGljcyBm
b3IgYSB6b25lIHRyYWNraW5nIGFkZGluZyBtb3JlIHRoYW4gZm91cgogIHNpZ25pbmcga2V5cy4g
OmdsOmAjNjI1NmAgOmdsOmAhMTI2NzRgCgotIEZpeCB2YXJpb3VzIG5pdHMgaW4gdGhlIG5ldG1n
ciBjb2RlLiBgYGMyOGNkYWQ1MWJgYAoKICBUaGUgTVIgY29uc2lzdHMgb2YgY291cGxlIG9mIHNt
YWxsIGZpeGVzIGFuZCB1bmNhdWdodCBlcnJvcnMgaW4gdGhlCiAgTmV0d29yayBNYW5hZ2VyLiA6
Z2w6YCM2MjU3YCA6Z2w6YCExMjU3NmAKCi0gRml4IGEgY3Jhc2ggb24gcmVtb3RlLXNlcnZlcnMg
bGlzdHMgdGhhdCByZWZlcmVuY2UgdGhlbXNlbHZlcy4KICBgYGFhYWU2MTRmOWRgYAoKICBTaW5j
ZSA5LjIxLjE2IGFuZCA5LjIwLjE3LCBhIHJlbW90ZS1zZXJ2ZXJzLCBwcmltYXJpZXMsIG1hc3Rl
cnMsIG9yCiAgcGFyZW50YWwtYWdlbnRzIGxpc3QgdGhhdCByZWZlcmVuY2VkIGl0c2VsZiwgZGly
ZWN0bHkgb3IgdGhyb3VnaAogIGFub3RoZXIgbGlzdCwgbWFkZSBuYW1lZCBjcmFzaCBvbiBzdGFy
dHVwIG9yIHJlY29uZmlndXJhdGlvbi4gU3VjaAogIHJlZmVyZW5jZXMgYXJlIGFnYWluIHNraXBw
ZWQgYW5kIHRoZSByZW1haW5pbmcgZW50cmllcyBpbiB0aGUgbGlzdCBhcmUKICB1c2VkLCBhcyBp
biBlYXJsaWVyIHZlcnNpb25zLiA6Z2w6YCM2Mjg3YCA6Z2w6YCExMjYwNGAKCi0gQSByZWNvcmQg
ZnJvbSBvdXRzaWRlIGEgcmVzcG9uc2UgcG9saWN5IHpvbmUgY291bGQgc3RvcCBuYW1lZC4KICBg
YGQxMzU1MTNiMzdgYAoKICBBIHJlc3BvbnNlIHBvbGljeSB6b25lIHRyYW5zZmVycmVkIGZyb20g
YSBwcmltYXJ5IGNhbiBjb250YWluIGEgcmVjb3JkCiAgd2hvc2UgbmFtZSBsaWVzIG91dHNpZGUg
dGhlIHpvbmUuIFN1Y2ggYSByZWNvcmQgY291bGQgc3RvcCBuYW1lZCwgYm90aAogIHdoZW4gaXQg
YXJyaXZlZCBhbmQgYWdhaW4gYXQgZXZlcnkgc3RhcnR1cCBhZnRlcndhcmRzLCBiZWNhdXNlIGEK
ICBzZWNvbmRhcnkga2VlcHMgaXQgaW4gaXRzIG93biBjb3B5IG9mIHRoZSB6b25lLiBSZWNvcmRz
IGxpa2UgdGhpcyBhcmUKICBub3cgcmVqZWN0ZWQgYW5kIGxvZ2dlZDsgcHJldmlvdXNseSBvbmUg
Y291bGQgYWxzbyBzaWxlbnRseSBjcmVhdGUgYQogIHBvbGljeSBlbnRyeSBmb3IgYW4gdW5yZWxh
dGVkIG5hbWUuIDpnbDpgIzYzMDRgIDpnbDpgITEyNTQzYAoKLSAicm5kYyBmbHVzaHRyZWUgLiIg
ZmFpbGVkIHRvIGZsdXNoIHRoZSBjYWNoZS4gYGA5NmU4YjU4NWVkYGAKCiAgYHJuZGMgZmx1c2h0
cmVlYCBmbHVzaGVzIGNhY2hlIGRhdGEgYmVsb3cgYSBzcGVjaWZpZWQgbmFtZS4gSWYgdGhlCiAg
bmFtZSBzcGVjaWZpZWQgaXMgdGhlIEROUyByb290LCBpdCBzaG91bGQgZnVsbHkgZW1wdHkgdGhl
IGNhY2hlLCB0aGUKICBzYW1lIGFzIGBybmRjIGZsdXNoYC4gIEhvd2V2ZXIsIHRoZXJlIHdhcyBh
IGJ1ZyBjYXVzaW5nIHRoZSBjb21tYW5kLAogIGluIHRoYXQgY2FzZSwgdG8gaGF2ZSBubyBlZmZl
Y3Qgb24gdGhlIGNhY2hlIGF0IGFsbDsgdGhpcyBoYXMgYmVlbgogIGZpeGVkLiA6Z2w6YCM2MzA4
YCA6Z2w6YCExMjU4MmAKCi0gSW52YWxpZCBrZXktc3RvcmUgY29uZmlndXJhdGlvbiBjb3VsZCBh
Ym9ydCB0aGUgRE5TU0VDIHRvb2xzLgogIGBgMWQ3OTZhYjA3MmBgCgogIEludmFsaWQgY29uZmln
dXJlZCBrZXktc3RvcmVzIG5hbWVkICJrZXktZGlyZWN0b3J5IiBpbiBjb25maWd1cmF0aW9uCiAg
ZmlsZXMgY291bGQgYWJvcnQgdGhlIEROU1NFQyB0b29scy4gVGhpcyBoYXMgYmVlbiBmaXhlZC4g
OmdsOmAjNjMxM2AKICA6Z2w6YCExMjY1M2AKCi0gTlNFQyBzaWduYXR1cmUgc2V0IGNvdWxkIGJ5
cGFzcyB0aGUgc2VjdXJlLWRlbGVnYXRpb24gY2hlY2suCiAgYGBjOTY2MTc3ZjZjYGAKCiAgV2hl
biBwcm92aW5nIHRoYXQgYSBkZWxlZ2F0aW9uIGlzIGluc2VjdXJlLCB0aGUgdmFsaWRhdG9yIGJv
dW5kZWQgYW4KICBOU0VDIHJlY29yZCdzIGF1dGhvcml0eSBieSB0aGUgc2lnbmVyIG9mIHdoaWNo
ZXZlciBSUlNJRyBoYXBwZW5lZCB0bwogIGNvbWUgZmlyc3QgaW4gdGhlIHJlY29yZCdzIHNpZ25h
dHVyZSBzZXQsIHJhdGhlciB0aGFuIHRoZSBzaWduYXR1cmUKICB0aGF0IGFjdHVhbGx5IHZlcmlm
aWVkLiBBIGdyYW5kcGFyZW50IE5TRUMgcGFkZGVkIHdpdGggYW4gZXh0cmEsCiAgdW52ZXJpZmlh
YmxlIHNpZ25hdHVyZSBjb3VsZCB0aGVyZWZvcmUgcGFzcyB0aGUgY2hlY2sgdGhhdCBrZWVwcyBz
dWNoCiAgcHJvb2ZzIGZyb20gcmVhY2hpbmcgYmVsb3cgYSBzaWduZWQgY2hpbGQgem9uZS4gVGhl
IHZhbGlkYXRvciBub3cKICByZXF1aXJlcyBldmVyeSBzaWduYXR1cmUgb24gdGhlIE5TRUMgdG8g
bmFtZSB0aGUgc2FtZSBzaWduZXIgYW5kCiAgcmVmdXNlcyBwcm9vZnMgd2hvc2Ugc2lnbmF0dXJl
IHNldCBpcyBtYWxmb3JtZWQgb3IgbGFyZ2VyIHRoYW4KICBtYXgtdmFsaWRhdGlvbnMtcGVyLWZl
dGNoIGFsbG93cy4gOmdsOmAjNjMyMWAKCi0gRml4IGEgcG9zc2libGUgbnN1cGRhdGUgaXNzdWUg
d2hlbiB1c2luZyBHU1MtVFNJRy4gYGA0ZGRjYWIyZDNjYGAKCiAgVGhlIDppc2NtYW46YG5zdXBk
YXRlYCBwcm9jZXNzIGNvdWxkIHRlcm1pbmF0ZSB1bmV4cGVjdGVkbHkgd2hlbiB1c2luZwogIHRo
ZSBHU1MtVFNJRyBtb2RlIGV4ZWN1dGVkIHdpdGggdGhlIDpvcHRpb246YG5zdXBkYXRlIC1nYCBv
cHRpb24uIFRoaXMKICBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNjMyNWAgOmdsOmAhMTI1ODhgCgot
IEZpeCBpc2NjY19hbGlzdF9kZWZpbmUgZXJyb3IgcGF0aHMuIGBgYWYxMzQ5NTUyYWBgCgogIElm
IHRoZXJlIGlzIGFuIG91dCBvZiBtZW1vcnkgZXJyb3IgaW4gaXNjY2NfYWxpc3RfZGVmaW5lIGEg
bWVtb3J5IGxlYWsKICAodGhlIHNleHByIGhvbGRpbmcgdGhlIGtleSBuYW1lKSBvciBhIGRvdWJs
ZSBmcmVlICh2YWx1ZSkgY291bGQgb2NjdXIuCiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAj
NjMyOWAgOmdsOmAhMTI2MzZgCgotIENoZWNrIGZvciBlbXB0eSAnZW5kcG9pbnRzJyBsaXN0LiBg
YDIzZjU4YWY0NDNgYAoKICBDb25maWd1cmluZyBhbiBgaHR0cGAgYmxvY2sgd2l0aCBgZW5kcG9p
bnRzIHt9O2AgcHJldmlvdXNseSBjYXVzZWQgYQogIGNyYXNoIGluIGBuYW1lZGAuIFRoaXMgaXMg
bm93IHJlamVjdGVkIGVhcmxpZXIgYnkgdGhlIGNvbmZpZ3VyYXRpb24KICBjaGVjay4gOmdsOmAj
NjMzMGAgOmdsOmAhMTI1NTJgCgotIE5hbWVkIGNvdWxkIGNyYXNoIHdpdGggYSBzaW5nbGUtZWxl
bWVudCBnZW9pcCBzb3J0bGlzdC4gYGAwZTk5NmE0ZDNiYGAKCiAgSWYgYG5hbWVkYCB3YXMgY29u
ZmlndXJlZCB3aXRoIGEgc2luZ2xlLWVsZW1lbnQgc29ydGxpc3QgY29udGFpbmluZyBhCiAgYGdl
b2lwYCBBQ0wgZWxlbWVudCwgYW55IG1hdGNoaW5nIHF1ZXJ5IHRyaWdnZXJlZCBhbiBhc3NlcnRp
b24KICBmYWlsdXJlLiBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MzQyYCA6Z2w6YCExMjU4
M2AKCi0gUHJldmVudCBvdXQtb2YtYmFpbGl3aWNrIENOQU1FcyBmcm9tIGV2aWN0aW5nIGNhY2hl
ZCByZWNvcmRzLgogIGBgY2RlZGQ0YWNkNWBgCgogIEEgcmVjdXJzaXZlIHJlc29sdmVyIGNvdWxk
IHJlbW92ZSB2YWxpZCBjYWNoZWQgcmVjb3JkcyB3aGVuIGEgRE5TCiAgcmVzcG9uc2UgY29udGFp
bmVkIGFuIG91dC1vZi1iYWlsaXdpY2sgQ05BTUUgd2l0aCB0aGUgc2FtZSBvd25lciBuYW1lLgog
IE91dC1vZi1iYWlsaXdpY2sgZGF0YSBpcyBub3cgZGlzY2FyZGVkIGJlZm9yZSBpdCBjYW4gbW9k
aWZ5IHRoZSBjYWNoZS4KICA6Z2w6YCM2MzQ1YCA6Z2w6YCExMjY1MWAKCi0gUmVzdG9yZSBwZXJp
b2RpYyBjbGVhbnVwIG9mIHN0YWxlIHJlc29sdmVyIGFkZHJlc3MgZGF0YS4KICBgYDM1NmY0MDEz
ZjhgYAoKICBTdGFsZSByZXNvbHZlciBhZGRyZXNzIGRhdGEgY291bGQgcmVtYWluIGNhY2hlZCB1
bnRpbCBtZW1vcnkgcHJlc3N1cmUKICBvciBhbiBleHBsaWNpdCBmbHVzaC4gQ29ycmVjdCB0aGUg
Y2xlYW51cCBpbnRlcnZhbCBzbyBpdCBpcyByZW1vdmVkCiAgcGVyaW9kaWNhbGx5LiA6Z2w6YCM2
MzQ2YCA6Z2w6YCExMjU4OWAKCi0gRml4IG5hbWVkLWNoZWNrY29uZi9uYW1lZCBjcmFzaCB3aXRo
IG1hbGZvcm1lZCBrZXkgbmFtZS4KICBgYDlmMjE4ZjZhYWZgYAoKICBXaGVuIGEgcHJpbWFyeS9y
ZW1vdGUtc2VydmVyIGtleSBuYW1lIHdhcyBtYWxmb3JtZWQsIG5hbWVkLWNoZWNrY29uZgogIGFu
ZCBuYW1lZCB3ZXJlIGJvdGggY3Jhc2hpbmcgKGFmdGVyIHdhcm5pbmcgYWJvdXQgdGhlIGludmFs
aWQga2V5CiAgbmFtZSkuIFRoaXMgaXMgbm93IGZpeGVkLiA6Z2w6YCM2MzYyYCA6Z2w6YCExMjYz
OWAKCi0gRml4IC1XZm9ybWF0LXRydW5jYXRpb24gd2FybmluZyBpbiB0b3RleHRfaW5fd2tzKCkg
YGBmOTdjMmJlYTQwYGAKCiAgQklORCA5IGZhaWxlZCB0byBidWlsZCB3aXRoIEdDQyAxNiBhdCAt
TzM6IHJlbmRlcmluZyBhIFdLUyByZWNvcmQgYXMKICB0ZXh0IHRyaWdnZXJlZCBhIC1XZm9ybWF0
LXRydW5jYXRpb24gZXJyb3IsIHdoaWNoIGlzIGZhdGFsIGluCiAgZGV2ZWxvcGVyIGJ1aWxkcy4g
VGhlIHBvcnQgbnVtYmVyIGlzIG5vdyBwcmludGVkIHdpdGggYSAxNi1iaXQgZm9ybWF0CiAgc3Bl
Y2lmaWVyLCBzbyB0aGUgY29tcGlsZXIgY2FuIHNlZSBpdCBhbHdheXMgZml0cyB0aGUgb3V0cHV0
IGJ1ZmZlci4KICA6Z2w6YCExMjU0MmAKCi0gRml4IG9mZi1ieS1vbmUgZXJyb3JzIGNhdXNlZCBi
eSBtYWdpYyBoYXJkY29kZWQgdmFsdWVzLiBgYDcyNmM2Y2I3OTVgYAoKICBGaXggb2ZmLWJ5LW9u
ZSBjb21wYXJpbnNvbiBlcnJvcnM6ICJuYW1lZCAtcCBodHRwPSIgZHJvcHBlZCB0aGUgZmlyc3QK
ICBkaWdpdCBvZiB0aGUgZ2l2ZW4gcG9ydCAoZm9yIGV4YW1wbGUsICJodHRwPTgwODAiIHNlbGVj
dGVkIHBvcnQgODApCiAgYW5kIG5vdyB1c2VzIHRoZSBwb3J0IGFzIGdpdmVuLCBhbmQgIm5hbWVk
LXJyY2hlY2tlciAtQyIgY29tcGFyZWQgb25seQogIHBhcnQgb2YgdGhlICJDTEFTUyIgcHJlZml4
IHdoZW4gZmlsdGVyaW5nIGdlbmVyaWMgY2xhc3MgbmFtZXMsIHdoaWNoCiAgd2FzIGhhcm1sZXNz
IGluIHByYWN0aWNlIGJ1dCBpcyBub3cgY29ycmVjdGVkLiA6Z2w6YCExMjYxNmAKCi0gSG1hY192
ZXJpZnkoKSBub3cgYWNjZXB0cyB0cnVuY2F0ZWQgSE1BQ3Mgb25seSB3aGVuIHJlcXVlc3RlZC4K
ICBgYGM4MWIxMTE0OTZgYAoKICBUaGUgaG1hY192ZXJpZnkoKSBmdW5jdGlvbiBpbmNvcnJlY3Rs
eSBjb21wYXJlcyBvbmx5IHVwIHRvCiAgJ3NpZy0+bGVuZ3RoJyBieXRlcywgYnV0IHRoZSBzaWdu
YXR1cmUgYW5kIGl0cyBsZW5ndGggc2hvdWxkIG5vdCBiZQogIHRydXN0ZWQsIGUuZy4gaW4gY2Fz
ZSBpZiBpdCBjb21lcyBmcm9tIGEgdXNlciBxdWVyeS4KCiAgRG9uJ3QgYWNjZXB0IHNpZ25hdHVy
ZXMgd2hpY2ggbGVuZ3RoIGlzbid0IGVxdWFsIHRvIHRoZSBleHBlY3RlZAogIGNhbGN1bGF0ZWQg
SE1BQyBsZW5ndGggdW5sZXNzIGl0IGlzIGV4cGxpY2l0bHkgcmVxdWVzdGVkIGJ5IHRoZQogIGNh
bGxlciwgZS5nLiBmb3IgdHJ1bmNhdGVkIFRTSUcgWzFdIHN1cHBvcnQuIDpnbDpgITEyNjI5YAoK
ICBbMV0gaHR0cHM6Ly9kYXRhdHJhY2tlci5pZXRmLm9yZy9kb2MvaHRtbC9yZmM4OTQ1I25hbWUt
dHNpZy10cnVuY2F0aW9uLXBvbGljeQotIFByZXZlbnQgcmVzb2x2ZXIgY3Jhc2hlcyB3aGlsZSBw
cm9jZXNzaW5nIEROUyBvdmVyIFRDUC4gYGA4MWIzYjZkODlmYGAKCiAgUmVjdXJzaXZlIHJlc29s
dmVycyBjb3VsZCB0ZXJtaW5hdGUgd2l0aCBhbiBhc3NlcnRpb24gZmFpbHVyZSB3aGlsZQogIHBy
b2Nlc3NpbmcgRE5TIHJlc3BvbnNlcyBvdmVyIFRDUCB1bmRlciBzdXN0YWluZWQgdHJhZmZpYy4g
VGhlIGZhaWx1cmUKICB3YXMgb2JzZXJ2ZWQgb24gcmVzb2x2ZXJzIGNvbmZpZ3VyZWQgZ2xvYmFs
bHkgd2l0aCBmb3J3YXJkIG9ubHk7IHRoZQogIHNhbWUgdHJhbnNwb3J0IHBhdGggaXMgYWxzbyB1
c2VkIGJ5IGl0ZXJhdGl2ZSByZXNvbHV0aW9uLiAgVGhpcyBoYXMKICBiZWVuIGZpeGVkLiA6Z2w6
YCExMjUzN2AKCkJJTkQgOS4yMC4zMAotLS0tLS0tLS0tLS0KClNlY3VyaXR5IEZpeGVzCn5+fn5+
fn5+fn5+fn5+CgotIFtDVkUtMjAyNi0xOTYzMF0gQ3JhZnRlZCBETlMgbWVzc2FnZXMgY291bGQg
ZXhoYXVzdCBDUFUgd2hpbGUgYmVpbmcKICBwYXJzZWQuIGBgNWU4YTJlMWM3NmFgYAoKICBBIGNy
YWZ0ZWQgbWVzc2FnZSBjb3VsZCBtYWtlIG5hbWVkIHNwZW5kIGEgZGlzcHJvcG9ydGlvbmF0ZSBh
bW91bnQgb2YKICB0aW1lIGV4cGFuZGluZyBjb21wcmVzc2VkIG5hbWVzIGluIGl0LCBsZXR0aW5n
IGEgY2xpZW50IHNhdHVyYXRlIGFsbAogIHdvcmtlciB0aHJlYWRzIHdpdGggdmVyeSBsaXR0bGUg
dHJhZmZpYyBhbmQgdGltZSBvdXQgbGVnaXRpbWF0ZQogIHF1ZXJpZXMuIG5hbWVkIG5vdyBib3Vu
ZHMgaG93IG11Y2ggbmFtZSBleHBhbnNpb24gYSBzaW5nbGUgbWVzc2FnZSBjYW4KICByZXF1aXJl
IGFuZCBhbnN3ZXJzIEZPUk1FUlIgd2hlbiB0aGF0IGJvdW5kIGlzIGV4Y2VlZGVkOyBvcmRpbmFy
eQogIHRyYWZmaWMsIGluY2x1ZGluZyB6b25lIHRyYW5zZmVycyBhbmQgZHluYW1pYyB1cGRhdGVz
LCBzdGF5cyB3ZWxsCiAgaW5zaWRlIGl0LiA6Z2w6YCM1OTMyYAoKLSBbQ1ZFLTIwMjYtOTQzMDBd
IEZpeCByZW1vdGUgdGVybWluYXRpb24gb2YgbmFtZWQgdW5kZXIgY29uY3VycmVudAogIEdTUy1U
U0lHIHRyYWZmaWMuIGBgZmU5Y2MxNGFmMGRgYAoKICBBIEdTUy1UU0lHIHNlc3Npb24gbmVnb3Rp
YXRlZCB0aHJvdWdoIFRLRVkgaXMgc2hhcmVkIGJ5IGV2ZXJ5IG1lc3NhZ2UKICBzaWduZWQgb3Ig
dmVyaWZpZWQgd2l0aCB0aGF0IGtleSwgYW5kIG5hbWVkIGRpZCBub3Qgc2VyaWFsaXplIGFjY2Vz
cwogIHRvIGl0LCBzbyBjb25jdXJyZW50IHNpZ25lZCBtZXNzYWdlcyBjb3VsZCBjb3JydXB0IEtl
cmJlcm9zLW93bmVkCiAgc3RhdGUgYW5kIHRlcm1pbmF0ZSBuYW1lZCB1bmV4cGVjdGVkbHkuIDpn
bDpgIzYzMjBgCgotIFtDVkUtMjAyNi05Njg4OF0gUG9zc2libGUgY3Jhc2ggd2l0aCByZWRpcmVj
dCBhbmQgcW5hbWUtbWluaW1pemF0aW9uCiAgc3RyaWN0LiBgYDFlMWQwZDQyYjU5YGAKCiAgUHJv
Y2Vzc2luZyBhbiBOWERPTUFJTiByZXNwb25zZSB3aXRoIGEgcmVkaXJlY3Qgem9uZSBjb3VsZCBj
YXVzZQogIGBuYW1lZGAgdG8gY3Jhc2ggaWYgYHFuYW1lLW1pbmltaXphdGlvbmAgd2FzIHNldCB0
byBgc3RyaWN0YC4KICA6Z2w6YCM2Mzg2YAoKLSBbQ1ZFLTIwMjYtOTczMTNdIEZpeCBhIGJ1ZyB3
aGVuIHJlc3VtaW5nIGZyb20gYSBxdWVyeSBpbml0aWF0ZWQgYnkKICBSUFouIGBgM2U0ZmUxNDM5
MmVgYAoKICBUaGUgOmlzY21hbjpgbmFtZWRgIHByb2Nlc3MgY291bGQgdGVybWluYXRlIHVuZXhw
ZWN0ZWRseSB3aGVuIHJlc3VtaW5nCiAgZnJvbSBhIHF1ZXJ5IGluaXRpYXRlZCBieSBSUFogcHJv
Y2Vzc2luZy4gVGhpcyBoYXMgYmVlbiBmaXhlZC4KCiAgSVNDIHdvdWxkIGxpa2UgdG8gdGhhbmsg
YHdoaXNwZXJlcmAgZm9yIHJlcG9ydGluZyB0aGUgaXNzdWUuCiAgOmdsOmAjNjQwOGAKCkJ1ZyBG
aXhlcwp+fn5+fn5+fn4KCi0gUmVtb3ZlIHNwdXJpb3VzIG5hbWVkL25hbWVkLWNoZWNrY29uZiB3
YXJuaW5nLiBgYGIwNjZkZGU3MDQ3YGAKCiAgInN0YXRpYyBlbnRyeSBmb3IgdGhlIHJvb3Qgem9u
ZSBXSUxMIEZBSUwgYWZ0ZXIga2V5IHJvbGxvdmVyIC0gdXNlCiAgdHJ1c3QtYW5jaG9ycyB3aXRo
IGluaXRpYWwta2V5IG9yIGluaXRpYWwtZHMgaW5zdGVhZCIgb25seSBtYWtlcyBzZW5zZQogIHdo
ZW4geW91IGFyZSB1c2luZyBJQ0FOTiByb290IGtleXMgYXMgdGhleSB1c2UgUkZDIDUwMTEgZm9y
IEROU0tFWQogIG1hbmFnZW1lbnQuICBEb24ndCBsb2cgaXQgaW4gb3RoZXIgY2lyY3Vtc3RhbmNl
cy4gOmdsOmAjNTU3MmAKICA6Z2w6YCExMjc4OGAKCi0gRml4IGEgZGF0YSByYWNlIGluIHRoZSBS
UFogc3VtbWFyeSBkYXRhYmFzZS4gYGBmODkyZmU3ODU3YmBgCgogIFJlbG9hZGluZyBhIHJlc3Bv
bnNlIHBvbGljeSB6b25lIGNvdWxkIG1vZGlmeSBlbnRyaWVzIG9mIHRoZSBzdW1tYXJ5CiAgZGF0
YWJhc2UgaW4gcGxhY2Ugd2hpbGUgcXVlcmllcyB3ZXJlIHJlYWRpbmcgdGhlbSB3aXRob3V0IGEg
bG9jaywKICB3aGljaCBUaHJlYWRTYW5pdGl6ZXIgcmVwb3J0ZWQgYXMgYSBkYXRhIHJhY2UuIEVu
dHJpZXMgYXJlIG5vdwogIHJlcGxhY2VkIHdpdGggYSBmcmVzaCBjb3B5IGluc3RlYWQsIHNvIHF1
ZXJpZXMga2VlcCByZWFkaW5nIGEKICBjb25zaXN0ZW50IGVudHJ5IGFuZCB0aGUgcXVlcnkgcGF0
aCBzdGF5cyBsb2NrLWZyZWUuIDpnbDpgIzU1OTRgCiAgOmdsOmAhMTI2OTZgCgotIEZpeCBwcml2
YXRlLXR5cGUgUlJzZXQgaGFuZGxpbmcgZHVyaW5nIGFwZXggZGVsZXRlIHVwZGF0ZXMuCiAgYGBm
MGFhMmEwZmFiM2BgCgogIFdoZW4gRE5TIFVQREFURSBwcm9jZXNzaW5nIG1hbmlwdWxhdGVzIGBk
aWZmLnR1cGxlc2AgKGUuZy4gZHVyaW5nCiAgZGVsZXRlLWFsbC1hdC1uYW1lIG9yIGRlbGV0ZS1S
UnNldCBvcGVyYXRpb25zIGF0IGEgem9uZSBhcGV4IHdpdGgKICBUWVBFNjU1MzQgcHJpdmF0ZSBz
aWduaW5nIHN0YXRlKSwgdHVwbGVzIHdlcmUgYmVpbmcgdW5saW5rZWQgZnJvbSB0aGUKICBsaXN0
IHVzaW5nIGBJU0NfTElTVF9VTkxJTksoKWAgZGlyZWN0bHkuIFRoaXMgYnlwYXNzZWQgdGhlIGBk
aWZmLnNpemVgCiAgY291bnRlciwgY2F1c2luZyBpdCB0byBkcmlmdCBvdXQgb2Ygc3luYyB3aXRo
IHRoZSBhY3R1YWwgbGlzdAogIGNvbnRlbnRzLgoKICBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGBk
bnNfZGlmZl91bmxpbmsoKWAsIHdoaWNoIGtlZXBzIGBkaWZmLnNpemVgCiAgYWNjdXJhdGUgd2hl
biByZW1vdmluZyBhIHR1cGxlLCBhbmQgdXBkYXRlcyBhbGwgY2FsbCBzaXRlcyBpbgogIGBsaWIv
ZG5zL2AgYW5kIGBsaWIvbnMvYCB0aGF0IHByZXZpb3VzbHkgbWFuaXB1bGF0ZWQgdGhlIGxpc3QK
ICBkaXJlY3RseS4KCiAgSVNDIHRoYW5rcyBNY3NreTIzIGFuZCBRaWZhbiBaaGFuZyBvZiBQYWxv
IEFsdG8gTmV0d29ya3MgZm9yIHJlcG9ydGluZwogIHRoZSBpc3N1ZS4gOmdsOmAjNTgwMmAgOmds
OmAhMTI3MDNgCgotIFJldmVydCAiUHJldmVudCBvdmVyd3JpdGluZyBhbiBleGlzdGluZyBpcHRh
YmxlIG5vZGUgd2hlbiBtZXJnaW5nIgogIGBgMTJkZGEzODYzN2ZgYAoKICBUaGlzIHJldmVydHMg
Y29tbWl0IGViZDg2MDc2YmMzMDMyMmQyOTU1NTk5YmJjMzZlY2ZjYmY4YzA2NjQuCgogIFRoZSBh
Ym92ZSBjaGFuZ2UgaGFkIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLiAgVGhlIGlzc3VlIGl0IGF0
dGVtcHRlZAogIHRvIGFkZHJlc3Mgd2lsbCBiZSBmaXhlZCBwcm9wZXJseSBpbiBkdWUgY291cnNl
LiA6Z2w6YCM2MDQ5YAogIDpnbDpgITEyNzQwYAoKLSBEb24ndCBhY2NlcHQgSE1BQy1iYXNlZCBr
ZXlzIGFuZCBzaWduYXR1cmVzIGZvciBTSUcoMCkgb3IgRE5TU0VDLgogIGBgNTIzMjZhM2ZkMDVg
YAoKICBEdWUgdG8gYW4gb3ZlcnNpZ2h0IEhNQUMga2V5cyBjb3VsZCBiZSBhY2NlcHRlZCBmb3Ig
U0lHKDApIGFuZCBETlNTRUMKICBwdXJwb3Nlcy4gIFRoaXMgaGFzIGJlZW4gZml4ZWQuIDpnbDpg
IzYwODZgIDpnbDpgITEyNzAwYAoKLSBGaXggRE5TU0VDIHRvb2wgZGF0ZXMgcmVhZCBvbmUgaG91
ciBsYXRlIGR1cmluZyBkYXlsaWdodCBzYXZpbmcgdGltZS4KICBgYDc4YmU0MmIzZmRkYGAKCiAg
V2hlbiBhIGtleSB0aW1pbmcgdmFsdWUgd2FzIHBhc3NlZCB0byB0aGUgRE5TU0VDIHRvb2xzIGlu
IHRoZSBmb3JtYXQKICB0aGF0IGRuc3NlYy1zZXR0aW1lIC1wIHByaW50cyAoZm9yIGV4YW1wbGUg
V2VkIEp1bCAgMSAxMjowMDowMCAyMDI2KSwKICBpdCB3YXMgcmVhZCBhcyBzdGFuZGFyZCB0aW1l
LiBXaGlsZSBkYXlsaWdodCBzYXZpbmcgdGltZSB3YXMgaW4KICBlZmZlY3QsIHRoZSByZXN1bHRp
bmcgdGltZSB3YXMgb25lIGhvdXIgbGF0ZS4gVGhlc2UgdmFsdWVzIGFyZSBub3cKICByZWFkIGlu
IHRoZSBjb3JyZWN0IGxvY2FsIHRpbWUuIDpnbDpgIzYwODlgIDpnbDpgITEyODg5YAoKLSAibGli
aXNjY2MgZmxhdCBTLWV4cHJlc3Npb24gZnJlZSBjYW4gZXhoYXVzdCBzdGFjayIgYGBiY2I0NWY0
YzY5NmBgCgogIEl0IHdhcyBwb3NzaWJsZSB0byBleGNlZWQgdGhlIHN0YWNrIGluIHJuZGMgaWYg
aXQgaGFkIHRvIGZyZWUgcmVhbGx5CiAgZGVlcCBhbnN3ZXIgY2hhaW5zIGZyb20gYSBob3N0aWxl
IHNlcnZlci4gIEZsYXR0ZW4gdGhlIGZyZWVpbmcgb2YKICBhbnN3ZXIgY2hhaW5zLiAgUHJpbnRp
bmcgdGhlIHNleHByIHRyZWUgZm9yIGRlYnVnZ2luZyBhbHNvIHN1ZmZlcnMKICBmcm9tIHRoZSBz
YW1lIHN0YWNrIGV4aGF1c3Rpb24gcHJvYmxlbSBkdWUgdG8gZXhjZXNzaXZlIHJlY3Vyc2lvbi4K
ICBGbGF0dGVuIHNleHByIHRyZWUgcHJpbnRpbmcuIDpnbDpgIzYwOTBgIDpnbDpgITEyNzg2YAoK
LSBGaXggUlJMIHFwcy1zY2FsZSBUQ1AgY3JlZGl0IGFnZSBjaGVjayB1c2VzIHRoZSByZXNwb25z
ZSBidWNrZXQgYWdlLgogIGBgMGYwNDc1MjVkOTRgYAoKICBUaGVyZSB3YXMgYSBjdXQtYW5kLXBh
c3RlIGJ1ZyBpbiBgZGViaXRfcnJsX2VudHJ5YCB3aGVyZSB0aGUgYWdlIGZyb20KICB0aGUgd3Jv
bmcgZW50cnkgd2FzIHVzZWQgdG8gc2V0IHNjYWxlLiAgVXNlIGBjcmVkaXRfZWAgaW5zdGVhZCBv
ZiBgZWAuCiAgOmdsOmAjNjEwNmAgOmdsOmAhMTI4NTBgCgotIEVuZm9yY2Ugbm9uIGVtcHR5IFVS
SSB0YXJnZXQgZmllbGQgaW4gVVJJIHJlY29yZC4gYGA0MDliNGM4MmUxOWBgCgogIFJGQyA3NTUz
IHJlcXVpcmVzIHRoYXQgdGhlIFVSSSB0YXJnZXQgZmllbGQgTVVTVCBOT1QgYmUgYW4gZW1wdHkg
VVJJCiAgKCIiKS4gIFRoaXMgaXMgbm93IGVuZm9yY2VkIGJ5IHRoZSBmcm9tIHRleHQgYW5kIGZy
b20gd2lyZSBtZXRob2RzLgogIDpnbDpgIzYxMzRgIDpnbDpgITEyNjk5YAoKLSBGaXggYSBzcGFj
ZSBjYWxjdWxhdGlvbiBidWcgd2hlbiBsb2FkaW5nIGEgem9uZSBpbiAiUkFXIiBmb3JtYXQuCiAg
YGBmNmEwOGM3ZjM0ZWBgCgogIFdoZW4gbG9hZGluZyBhIHNwZWNpYWxseSBjcmFmdGVkIHpvbmUg
ZmlsZSBpbiAiUkFXIiBmb3JtYXQsIHRoZQogIDppc2NtYW46YG5hbWVkYCBwcm9jZXNzIGNvdWxk
IHRlcm1pbmF0ZSB1bmV4cGVjdGVkbHkuIFRoaXMgaGFzIGJlZW4KICBmaXhlZC4gOmdsOmAjNjE0
MWAgOmdsOmAhMTI3ODJgCgotIERzdF9rZXlfZnJvbWRucyBzaG91bGQgZmFpbCBvbiB1bnN1cHBv
cnRlZCBhbGdvcml0aG1zLiBgYGNlN2M3NzA0ZjMwYGAKCiAgZHN0X2tleV9mcm9tZG5zIGNvdWxk
IHN1Y2NlZWQgb24gdW5zdXBwb3J0ZWQgYWxnb3JpdGhtcyBjYXVzaW5nCiAgZmFpbHVyZXMgbGF0
ZXIgaW4gY29kZSB3aGljaCBhc3N1bWVkIHRoYXQgYSBkc3Rfa2V5X3QgYWx3YXlzIGhhZCBhCiAg
c3VwcG9ydGVkIGFsZ29yaXRobXMuICAgOmdsOmAjNjE5MmAgOmdsOmAhMTI3MDdgCgotIER5bmFt
aWMgdXBkYXRlIHByZXJlcXVpc2l0ZXMgY291bGQgcHJvYmUgem9uZXMgdGhhdCByZWZ1c2UgcXVl
cmllcy4KICBgYDA0MjFhNjM3ODgwYGAKCiAgRHluYW1pYyB1cGRhdGUgcHJlcmVxdWlzaXRlcyBk
aWQgbm90IGhvbm9yIGBhbGxvdy1xdWVyeS1vbmAsIG5vcgogIGBhbGxvdy1xdWVyeWAgZm9yIGlu
bGluZS1zaWduZWQgem9uZXMsIHNvIGNsaWVudHMgdGhhdCB3ZXJlIHJlZnVzZWQKICBxdWVyaWVz
IGNvdWxkIHVzZSB0aGVtIHRvIGxlYXJuIHdoZXRoZXIgcmVjb3JkcyBleGlzdCBpbiB0aGUgem9u
ZS4KICBUaGVzZSBBQ0xzIGFyZSBub3cgZW5mb3JjZWQgZm9yIGR5bmFtaWMgdXBkYXRlcy4gOmds
OmAjNjIxNmAKICA6Z2w6YCM2MjE3YCA6Z2w6YCExMjkwNWAKCi0gRml4IGRlbHYgK25zIHZpZXcg
cmVmZXJlbmNlIGNvdW50aW5nLiBgYDEwOWM4MGM3NGU5YGAKCiAgRGVsdidzIG1hdGNodmlldyBk
b2Vzbid0IGF0dGFjaCB0byB0aGUgdmlldyBhcyBuYW1lZCBkb2VzIHdoZW4gY2FsbGVkCiAgd2l0
aCArbnMuIFRoaXMgY2FuIHJlc3VsdCBpbiBhIHZpZXcgcmVmZXJlbmNlIHVuZGVyZmxvdyBpZiBh
bgogIHVuZXhwZWN0ZWQgcmVxdWVzdCBpcyByZWNlaXZlZCBieSBkZWx2LiAgVGhpcyBoYXMgYmVl
biBmaXhlZC4KICA6Z2w6YCM2MjM2YCA6Z2w6YCExMjczN2AKCi0gTmFtZWQtam91cm5hbHByaW50
IC14IGNvdWxkIGRlcmVmZXJlbmNlIGEgTlVMTCBwb2ludGVyLgogIGBgMjZmODdiMzdhMjZgYAoK
ICBXaGVuIGEgam91cm5hbCBpcyBidWlsdCB3aXRob3V0IGFuIGluZGV4IHRhYmxlLCBuYW1lZC1q
b3VybmFscHJpbnQKICBjb3VsZCBkZXJlZmVyZW5jZSBhIE5VTEwgcG9pbnRlciB3aGVuIHByaW50
aW5nIGV4dGVuZGVkIGRpYWdub3N0aWNzCiAgKC14KS4gVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmds
OmAjNjIzOGAgOmdsOmAhMTI3MjFgCgotIEluaXRpYWxpc2UgZHN0aXAgaW4gbm90aWZ5X3NlbmRf
dG9hZGRyIGFuZCBjaGVja2RzX3NlbmRfdG9hZGRyLgogIGBgMzI2MGJmN2I1MTNgYAoKICBUaGUg
ZHN0aXAgc3RydWN0dXJlIHdhcyBub3QgaW5pdGlhbGlzZWQgb24gYWxsIHBhdGhzIGJlZm9yZSBp
dCB3YXMKICB1c2VkIGluIG5vdGlmeV9zZW5kX3RvYWRkciBhbmQgY2hlY2tkc19zZW5kX3RvYWRk
ci4gIFRoaXMgY291bGQgY2F1c2UKICBzZXJ2ZXIgY2xhdXNlcyB0byBiZSBpbmVmZmVjdGl2ZS4g
VGhpcyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNjIzOWAKICA6Z2w6YCExMjcyMmAKCi0gRml4IGEg
Y2F0YWxvZyB6b25lIHVwZGF0ZSBidWcuIGBgYTY5NDYwMWZhZmVgYAoKICBEdXJpbmcgYSBjYXRh
bG9nIHpvbmUgdXBkYXRlIHdpdGggYW4gdW51c3VhbCBjYXNlIHdoZW4gYSBuZXcgbWVtYmVyCiAg
em9uZSBhcHBlYXJlZCBpbiB0aGUgbmV3IHZlcnNpb24gb2YgdGhlIGNhdGFsb2cgem9uZSB1bmRl
ciB0aGUgc2FtZQogIGxhYmVsIGFzIHVzZWQgZm9yIGFub3RoZXIgbWVtYmVyIGluIHRoZSBvbGQg
dmVyc2lvbiBvZiB0aGUgY2F0YWxvZwogIHpvbmUsIHRoZSBvbGQgbWVtYmVyIHpvbmUgY291bGQg
cmVtYWluIGluIHRoZSB2aWV3IGFuZCBiZQogIGF1dGhvcml0YXRpdmVseSBzZXJ2ZWQgdW50aWwg
OmlzY21hbjpgbmFtZWRgIHdhcyByZWxvYWRlZCBvcgogIHJlc3RhcnRlZC4gVGhpcyBoYXMgYmVl
biBmaXhlZC4gOmdsOmAjNjMwNWAgOmdsOmAhMTI3NTFgCgotIEZpeCBlbXB0eSBTU0xLRVlMT0dG
SUxFIGVudmlyb25tZW50IHZhcmlhYmxlIGhhbmRsaW5nLiBgYGRhNTNkMzA5N2QzYGAKCiAgSWYg
bmFtZWQgaXMgc3RhcnRlZCB3aXRoIGFuIGVtcHR5IFNTTEtFWUxPR0ZJTEUgZW52aXJvbm1lbnQg
dmFyaWFibGUKICBpdCBjb3VsZCB0cmlnZ2VyIGEgUkVRVUlSRSBmYWlsdXJlLiAgVHJlYXQgYW4g
ZW1wdHkgU1NMS0VZTE9HRklMRQogIGVudmlyb25tZW50IHZhcmlhYmxlIGFzIGlmIGl0IGRvZXNu
J3QgZXhpc3QuIDpnbDpgIzYzMDZgIDpnbDpgITEyODczYAoKLSBEaWcgK2RuczY0cHJlZml4IGNv
dWxkIHByb2Nlc3Mgbm9uLUlOIEFBQUEgcmVjb3Jkcy4gYGA4YTA1YmQxZGIwNGBgCgogIGRpZyAr
ZG5zNjRwcmVmaXggY291bGQgcHJvY2VzcyBub24tSU4gQUFBQSByZWNvcmRzIGlmIHRoZXJlIHdh
cyBhCiAgaG9zdGlsZSByZXNvbHZlciByZXN1bHRpbmcgaW4gYW4gb3V0IG9mIGJvdW5kcyByZWFk
LiBUaGlzIGhhcyBiZWVuCiAgZml4ZWQuIDpnbDpgIzYzMTJgIDpnbDpgITEyNzkzYAoKLSBTYXZl
X2NvbW1hbmRfbGluZSBtaXNoYW5kbGVzIGJ5dGUgd2l0aCBoaWdoIGJpdCBzZXQuIGBgZmUzNWU2
OTQ1MzZgYAoKICBzYXZlX2NvbW1hbmRfbGluZSBmYWlscyB0byBoYW5kbGUgY2hhciB3aXRoIGhp
Z2ggYml0IHNldCBjb3JyZWN0bHkKICB3aGVuIGNoYXIgaXMgdHJlYXRlZCBhcyBzaWduZWQuICBU
aGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MzE2YAogIDpnbDpgITEyNzIwYAoKLSBBY2NvdW50
IGZvciBudWxsIHRlcm1pbmF0b3Igd2hlbiB1c2luZyBOQU1FX01BWC4gYGAyMjMwYzc4MTc2MWBg
CgogIFRoZSBgTkFNRV9NQVhgIHZhbHVlIGluIGBsaW1pdHMuaGAgaXMgbm90IGd1YXJhbnRlZWQg
dG8gaW5jbHVkZSBzcGFjZQogIGZvciB0aGUgdGVybWluYXRpbmcgbnVsbCBjaGFyYWN0ZXIgaW4g
YSBzdHJpbmcuIFRoaXMgY2FuIGNhdXNlCiAgdW5leHBlY3RlZCBiZWhhdmlvciBvbiBzb21lIHBs
YXRmb3Jtcywgc3VjaCBhcyBhIGRpcmVjdG9yeSBzY2FuCiAgc3RvcHBpbmcgdG9vIHNvb24gaWYg
YSAyNTUtY2hhcmFjdGVyIGZpbGVuYW1lIGlzIGVuY291bnRlcmVkLgoKICBCdWZmZXJzIGludGVu
ZGVkIHRvIGhvbGQgZmlsZW5hbWVzIGFyZSBub3cgYWxsb2NhdGVkIHdpdGggYE5BTUVfTUFYICsK
ICAxYCBieXRlcy4gOmdsOmAjNjMyNGAgOmdsOmAhMTI5MDNgCgotIFByZXZlbnQgZXhjZXNzaXZl
IFJSTCB0YWJsZSBzY2FucyB1bmRlciBsb2FkLiBgYDc2YWZkMmIyYjY1YGAKCiAgQm91bmQgUlJM
IGVudHJ5IHJlY3ljbGluZyB0byBwcmV2ZW50IGxhcmdlIHRhYmxlcyBmcm9tIGRlbGF5aW5nIG90
aGVyCiAgcmVzcG9uc2VzLiA6Z2w6YCM2MzUxYCA6Z2w6YCExMjc5NGAKCi0gTmFtZWQtY2hlY2tj
b25mIGV4aXRzIHdpdGhvdXQgcmV0dXJuaW5nIGEgZXJyb3Igd2l0aCBhIGJhZCBjb21tYW5kCiAg
bGluZS4gYGBmMTg3ZDkyZGRlN2BgCgogIE5hbWVkLWNoZWNrY29uZiB3YXMgZXhpdGluZyB3aXRo
IGEgMCBleGl0IHN0YXR1cyB3aGVuIHRoZXJlIHdhcyBhIGJhZAogIGNvbW1hbmQgbGluZSBhcmd1
bWVudC4gIFRoaXMgbWVhbnQgdGhhdCBgbmFtZWQtY2hlY2tjb25mICRBUkdTICYmCiAgcmVsb2Fk
YCBjb3VsZCBjYWxsIHJlbG9hZCB3aGVuICRBUkdTIHdhcyBiYWQuICBUaGlzIGhhcyBiZWVuIGZp
eGVkLgogIDpnbDpgIzY0MDBgIDpnbDpgITEyNzI3YAoKLSBVbmxpbmsgdGhlIHRlbXBvcmFyeSBm
aWxlIG9uIHJlbmFtZSBmYWlsdXJlIGluCiAgbWFzdGVyZHVtcC5jOmNsb3NlYW5kcmVuYW1lLiBg
YDlmZDIzMGQ3ZTA2YGAKCiAgSWYgdGhlIHJlbmFtZSBmYWlscyBpbiBtYXN0ZXJkdW1wLmM6Y2xv
c2VhbmRyZW5hbWUgdGhlcmUgaXMgbm8gdXNlZnVsCiAgcHVycG9zZSBrZWVwaW5nIHRoZSB0ZW1w
b3JhcnkgZmlsZS4gV2UgYWxyZWFkeSByZW1vdmUgaXQgb24gb3RoZXIKICBlcnJvciBjb25kaXRp
b25zIGluIHRoYXQgZnVuY3Rpb24uIDpnbDpgIzY0MDVgIDpnbDpgITEyNzQxYAoKLSBTdGF0aXN0
aWNzIGNoYW5uZWwgc2VydmVzIGRhdGEgb24gdW5yZWdpc3RlcmVkIFVSTCBwcmVmaXhlcy4KICBg
YDg5YWQ5OWQ1NTFkYGAKCiAgVGhlIGNvZGUgdG8gbWF0Y2ggdGhlIHJlcXVlc3RlZCBVUkwgd2l0
aCB0aGUgVVJMcyBuYW1lZCBzZXJ2ZXMgd2Fzbid0CiAgY29ycmVjdC4gIFRydW5jYXRlZCByZXF1
ZXN0IFVSTHMgd2hlcmUgYmVpbmcgbWF0Y2hlZCB3aGVuIHRoZXkKICBzaG91bGRuJ3QgaGF2ZSBi
ZWVuLiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gIDpnbDpgIzY0MTVgIDpnbDpgITEyNzg5YAoKLSBG
aXggYSBjcmFzaCBvbiBPcGVuQlNEIHdoZW4gYSBzaWduYWwgcmVhY2hlcyBhbiBpZGxlIHdvcmtl
ciB0aHJlYWQuCiAgYGAyZTc4NTViMTU3N2BgCgogIE9uIE9wZW5CU0QsIGEgc2lnbmFsIGRlbGl2
ZXJlZCB0byBuYW1lZCB3aGlsZSBvbmUgb2YgaXRzIHdvcmtlcgogIHRocmVhZHMgd2FzIGlkbGUg
Y291bGQgbWFrZSB0aGUgc2VydmVyIGFib3J0IHdpdGggYSBmYXRhbCAiT3BlcmF0aW9uCiAgY2Fu
Y2VsZWQiIGVycm9yLCBiZWNhdXNlIE9wZW5CU0QgcmVwb3J0cyBzdWNoIGFuIGludGVycnVwdGVk
IHdhaXQKICBkaWZmZXJlbnRseSBmcm9tIExpbnV4IGFuZCB0aGUgb3RoZXIgc3VwcG9ydGVkIHN5
c3RlbXMuIFRoZSB3YWl0IGlzCiAgbm93IHJlc3VtZWQgYWZ0ZXIgdGhlIHNpZ25hbCwgYXMgaXQg
YWxyZWFkeSB3YXMgZWxzZXdoZXJlLiA6Z2w6YCM2NDI3YAogIDpnbDpgITEyNzcxYAoKLSBSZXNv
bHZlIG5hbWVzIGluIGluc2VjdXJlIHpvbmVzIHdob3NlIGFwZXggYW5zd2VycyB3aXRoIGEgQ05B
TUUuCiAgYGBmZmExZWZhYmRkYmBgCgogIEEgdmFsaWRhdGluZyByZXNvbHZlciByZXR1cm5lZCBT
RVJWRkFJTCBmb3IgbmFtZXMgaW4gYW4gdW5zaWduZWQgem9uZQogIHdob3NlIGFwZXggYW5zd2Vy
cyB3aXRoIGEgQ05BTUUsIGJlY2F1c2UgdGhlIHZhbGlkYXRvciByZWZ1c2VkIHRvIGxvb2sKICB1
cCB0aGUgRFMgcHJvb2YgdGhhdCBzaG93cyB0aGUgem9uZSBpcyBpbnNlY3VyZS4gVGhhdCBsb29r
dXAgaXMgbm93CiAgYWxsb3dlZCwgYW5kIHRoZSBjYWNoZSBrZWVwcyBhIENOQU1FIG5leHQgdG8g
b3RoZXIgcmVjb3JkcyBhdCB0aGUgc2FtZQogIG5hbWUgKGluY2x1ZGluZyB0aGUgcGFyZW50J3Mg
ZGVsZWdhdGlvbiBkYXRhKSBpbnN0ZWFkIG9mIGRlbGV0aW5nIG9uZQogIGZvciB0aGUgb3RoZXIs
IGNob29zaW5nIHRoZSBmcmVzaGVyIHJlY29yZCBhdCBsb29rdXAgdGltZTsgdGhpcwogIHN1cGVy
c2VkZXMgdGhlIGVhcmxpZXIgZml4IGZvciBzdGFsZSBhbnN3ZXJzIGFmdGVyIGEgcmVjb3JkIGNo
YW5nZXMgdG8KICBvciBmcm9tIGEgQ05BTUUuIDpnbDpgIzY0MzVgIDpnbDpgITEyODkwYAoKLSBB
ZGQgc2lnbiBkZWxheSB0byBvZmZsaW5lIEtTSyBaUlJTSUcgc3RhdGUgdGltaW5nLiBgYDZhNGFj
ZmU1YTQzYGAKCiAgV2l0aCBvZmZsaW5lIEtTSywgdGhlIFpSUlNJRyBzdGF0ZSBvZiBhIFpTSyB3
YXMgZGVyaXZlZCBmcm9tIHRoZSBrZXkKICB0aW1pbmcgd2l0aG91dCB0aGUgc2lnbiBkZWxheSwg
YW5kIHJldGlyZS1zYWZldHkgb25seSBjb3VudGVkIHRvd2FyZHMKICB0aGUgbmV4dCByZWtleSB0
aW1lLCBzbyBkdXJpbmcgYSBaU0sgcm9sbG92ZXIgdGhlIHNpZ25hdHVyZXMgd2VyZQogIHJlcG9y
dGVkIG9tbmlwcmVzZW50IChvciBoaWRkZW4pIGRheXMgdG9vIGVhcmx5LiBTaWduaW5nIGl0c2Vs
ZiBpcyBub3QKICBhZmZlY3RlZC4gOmdsOmAhMTI4NjNgCgotIEZpeCBUU0lHIHNlc3Npb24gbG9z
cyBhY3Jvc3MgYSByZWxvYWQuIGBgNWI2M2ZmZjNlZmNgYAoKICBEeW5hbWljIFRTSUcgc2Vzc2lv
bnMgbmVnb3RpYXRlZCB0aHJvdWdoIFRLRVkgd2VyZSBzYXZlZCB0byBkaXNrIGJ5CiAgd2hpY2hl
dmVyIHZpZXcgcmVsZWFzZWQgdGhlIGtleSByaW5nIGZpcnN0LCB3aGljaCBkdXJpbmcgYSByZWxv
YWQgd2FzCiAgdGhlIG91dGdvaW5nIHZpZXcg4oCUIGNvbnN1bWluZyBzZXNzaW9ucyB0aGUgaW5j
b21pbmcgdmlldyB3YXMgc3RpbGwKICB1c2luZyBhbmQgZm9yY2luZyBjbGllbnRzIHRvIHJlbmVn
b3RpYXRlLiBTZXNzaW9ucyBhcmUgbm93IHNhdmVkIG9ubHkKICB3aGVuIHRoZSBsYXN0IHZpZXcg
cmVsZWFzZXMgdGhlbSwgYW5kIGEgZmFpbGVkIHNhdmUgbm8gbG9uZ2VyIHJlcGxhY2VzCiAgdGhl
IHN0b3JlZCBzZXNzaW9ucyB3aXRoIGEgdHJ1bmNhdGVkIGZpbGUuIDpnbDpgITEyODAyYAoKLSBH
U1MtVFNJRyBrZXlzIG5vdyBsYXN0IGFzIGxvbmcgYXMgdGhlIG5lZ290aWF0ZWQgY29udGV4dC4K
ICBgYGM5YWY1MTFhODY3YGAKCiAgV2hlbiBHU1MtVFNJRyBpcyBpbiB1c2UsIHRoZSBUU0lHIGtl
eSB0aGF0IG5hbWVkIGRlcml2ZXMgZnJvbSBhCiAgY29tcGxldGVkIFRLRVkgbmVnb3RpYXRpb24g
YWx3YXlzIGV4cGlyZWQgYWZ0ZXIgYXQgbW9zdCBvbmUgaG91ciwgZXZlbgogIHdoZW4gdGhlIG5l
Z290aWF0ZWQgc2VjdXJpdHkgY29udGV4dCB3YXMgdmFsaWQgZm9yIGZhciBsb25nZXIsIHNvCiAg
Y2xpZW50cyBoYWQgdG8gcmVwZWF0IHRoZSBUS0VZIGV4Y2hhbmdlIGV2ZXJ5IGhvdXIgdG8ga2Vl
cCBzZW5kaW5nCiAgZHluYW1pYyB1cGRhdGVzLiBuYW1lZCBub3cga2VlcHMgc3VjaCBhIGtleSBm
b3IgYXMgbG9uZyBhcyB0aGF0CiAgY29udGV4dCByZW1haW5zIHZhbGlkLCBhbmQgYXBwbGllcyB0
aGUgb25lLWhvdXIgbGltaXQgb25seSB3aGVuIGl0cwogIGxpZmV0aW1lIGNhbm5vdCBiZSBkZXRl
cm1pbmVkLiA6Z2w6YCExMjc4M2AKCi0gS2VlcCB0aGUgem9uZSB0YWJsZSByZWFkIHNlY3Rpb24g
b3BlbiB1bnRpbCB0aGUgem9uZSBpcyBhdHRhY2hlZC4KICBgYDVmMzVmZDZjNWM1YGAKCiAgZG5z
X3p0X2ZpbmQoKSBlbmRlZCBpdHMgcXAtdHJpZSByZWFkIHRyYW5zYWN0aW9uIGJlZm9yZSBjaGVj
a2luZyB0aGUKICB6b25lIHR5cGUgYW5kIGF0dGFjaGluZyB0byB0aGUgem9uZSwgd2hpY2ggaXMg
b25seSBzYWZlIGFzIGxvbmcgYXMgdGhlCiAgY2FsbGVycyBpbiB2aWV3LmMgaGFwcGVuIHRvIGhv
bGQgYW4gUkNVIHJlYWQgbG9jayBvZiB0aGVpciBvd24uIFRoZQogIHJlYWQgc2VjdGlvbiBpcyBu
b3cgY2xvc2VkIGFmdGVyIHRoZSByZWZlcmVuY2UgaGFzIGJlZW4gdGFrZW4sIHNvIHRoZQogIHpv
bmUgY2FuIG5vIGxvbmdlciBiZSByZWNsYWltZWQgb3V0IGZyb20gdW5kZXIgdGhlIGxvb2t1cC4K
ICA6Z2w6YCExMjc4MGAKCi0gUGFzcyB0aGUgbWVzc2FnZSBwb29scyB0byBkZXN0cm95cG9vbHMo
KSBpbiB0aGUgZGVjbGFyZWQgb3JkZXIuCiAgYGAyM2FlZjgyNGJmYmBgCgogIFRoZSBhcmd1bWVu
dHMgd2VyZSBzd2FwcGVkLCBzbyB0aGUgZW1wdGluZXNzIGFzc2VydGlvbiBuYW1lZCB0aGUgd3Jv
bmcKICBwb29sLiA6Z2w6YCExMjgxNGAKCi0gU3VwcG9ydCBwcm9ncmFtIHN1ZmZpeGVzIG9mIHRz
aWcta2V5Z2VuIGFuZCBkZG5zLWNvbmZnZW4uCiAgYGBiMmNkMGM1ZDBhN2BgCgogIFN1ZmZpeGVz
IGRpZmZlcmVudCB0aGFuIC5leGUgYXJlIHVzZWQgb24gRmVkb3JhLiBCdXQgdGhvc2UgY29tbWFu
ZHMKICByZXF1aXJlIGV4YWN0IG5hbWVzIG9ubHkuIEFsbG93IHN3aXRjaGluZyBiZXR3ZWVuIHR3
byB2YXJpYW50cyBvbmx5CiAgZnJvbSBwcmVmaXguIFRoYXQgc2hvdWxkIHdvcmsgb24gYWxsIHBs
YXRmb3Jtcy4gSXQgc2hvdWxkIHN1cHBvcnQgYWxzbwogIG5hbWVzIGxpa2UgdHNpZy1rZXlnZW4t
OS4xOCBvciB0c2lnLWtleWdlbi05LjIxLgoKICBUaGUgc2FtZSBjYXNlIGFwcGxpZXMgdG8gbmFt
ZWQtY2hlY2t6b25lIGFuZCBuYW1lZC1jb21waWxlem9uZS4KICA6Z2w6YCExMjkwMWAK

--===============3690457317252574938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/tm.h"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.29.so /usr/lib/libns-9.20.29.so /usr/lib/libdns-9.20.29.so /usr/lib/libisccc-9.20.29.so /usr/lib/libisc-9.20.29.so", added "/usr/lib/libns-9.20.30.so /usr/lib/libdns-9.20.30.so /usr/lib/libisccfg-9.20.30.so /usr/lib/libisccc-9.20.30.so /usr/lib/libisc-9.20.30.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.29.so to libdns-9.20.30.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.29.so to libisccc-9.20.30.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.29.so to libisccfg-9.20.30.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.29.so to libisc-9.20.30.so
  /usr/lib/libns.so changed symlink target from libns-9.20.29.so to libns-9.20.30.so
  /usr/lib/libdns-9.20.29.so moved to /usr/lib/libdns-9.20.30.so
  /usr/lib/libisc-9.20.29.so moved to /usr/lib/libisc-9.20.30.so
  /usr/lib/libisccc-9.20.29.so moved to /usr/lib/libisccc-9.20.30.so
  /usr/lib/libisccfg-9.20.29.so moved to /usr/lib/libisccfg-9.20.30.so
  /usr/lib/libns-9.20.29.so moved to /usr/lib/libns-9.20.30.so
  /usr/include/isc/tm.h was removed

--===============3690457317252574938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.29-9.20.30.patch"

RnJvbSA1ZjFiMjIzYTk5NDAxYTRiODhlZjk2ZTY2NDFjOThkNWE3ZjUyNjkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MDk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjkgLT4gOS4yMC4zMAoKQklORCA5LjIwLjI5Ci0tLS0tLS0tLS0t
LQoKU2VjdXJpdHkgRml4ZXMKfn5+fn5+fn5+fn5+fn4KCi0gW0NWRS0yMDI2LTE5NjY4XSBQcmV2
ZW50IGV4Y2Vzc2l2ZSBDUFUgdXNlIHZhbGlkYXRpbmcgY3JhZnRlZCBETlNTRUMKICByZXNwb25z
ZXMuIGBgYTBhNjFkYmE5ZWBgCgogIEEgbWFsaWNpb3VzIGF1dGhvcml0YXRpdmUgc2VydmVyIGNv
dWxkIHNlcnZlIGEgc2VjdXJlbHkgZGVsZWdhdGVkIHpvbmUKICB3aG9zZSBEUyBhbmQgRE5TS0VZ
IHJlY29yZHMgY2FycnkgbWFueSBkaXN0aW5jdCBrZXkgdGFncyBidXQgbm8gdmFsaWQKICBtYXRj
aCwgZm9yY2luZyBhIHZhbGlkYXRpbmcgcmVzb2x2ZXIgaW50byBleGNlc3NpdmUga2V5LXRhZyBt
YXRjaGluZwogIGFuZCBoaWdoIENQVSB1c2UgZm9yIGV2ZXJ5IHF1ZXJ5LiBCSU5EIG5vdyBib3Vu
ZHMgdGhpcyB3b3JrIHdpdGggdGhlCiAgcGVyLXF1ZXJ5IHZhbGlkYXRpb24gbGltaXQgKG1heC12
YWxpZGF0aW9ucy1wZXItZmV0Y2gpLiA6Z2w6YCM1MzQ5YAoKLSBbQ1ZFLTIwMjYtMTkwMzNdIFJl
cXVpcmUgYSBUU0lHIG9uIGV2ZXJ5IG1lc3NhZ2Ugb2YgaW5jb21pbmcgem9uZQogIHRyYW5zZmVy
cy4gYGA5NDA0Y2QyYjhjYGAKCiAgQklORCA5IHVzZWQgdG8gYWNjZXB0IFRTSUctc2lnbmVkIHpv
bmUgdHJhbnNmZXJzIGluIHdoaWNoIHNvbWUKICBtZXNzYWdlcyB3ZXJlIHVuc2lnbmVkLCBhbmQg
cHJvY2Vzc2VkIHRob3NlIG1lc3NhZ2VzIGJlZm9yZSB0aGUgbmV4dAogIHNpZ25hdHVyZSBjb3Vs
ZCB2b3VjaCBmb3IgdGhlbS4gSXQgbm93IHJlcXVpcmVzIGEgVFNJRyBvbiBldmVyeQogIG1lc3Nh
Z2Ugb2YgYW4gaW5jb21pbmcgQVhGUiBvciBJWEZSOyBhbGwgbW9kZXJuIG5hbWVzZXJ2ZXIgYWxy
ZWFkeQogIHNpZ24gZXZlcnkgbWVzc2FnZSwgc28gbm8gY2hhbmdlIGlzIGV4cGVjdGVkIGluIHBy
YWN0aWNlLiA6Z2w6YCM2MDYyYAoKLSBbQ1ZFLTIwMjYtNzcxMTldIFByZXZlbnQgYSBETlNTRUMg
ZG93bmdyYWRlIG9mIHNlY3VyZSBkZWxlZ2F0aW9ucyB2aWEKICB1bnJlbGF0ZWQgTlNFQzMuIGBg
M2JlZDljOGU5ZWBgCgogIEEgdmFsaWRhdGluZyByZXNvbHZlciBjb3VsZCBiZSB0cmlja2VkIGlu
dG8gdHJlYXRpbmcgYSBzZWN1cmUKICBkZWxlZ2F0aW9uIGFzIHVuc2lnbmVkIGFuZCBhY2NlcHRp
bmcgZm9yZ2VkIGFuc3dlcnMgZm9yIG5hbWVzIGJlbmVhdGgKICBpdCwgaWYgYW4gYXR0YWNrZXIg
Y291bGQgaW5qZWN0IHJlc3BvbnNlcyB0byBpdHMgcXVlcmllcy4gU3VjaCBmb3JnZWQKICBwcm9v
ZnMgYXJlIG5vdyByZWplY3RlZC4gOmdsOmAjNjIzNGAKCi0gW0NWRS0yMDI2LTE5OTQxXSBQcmV2
ZW50IGZvcmdlZCBETlNTRUMtdmFsaWRhdGVkIE5YRE9NQUlOIHJlc3BvbnNlcy4KICBgYGEzNmJm
NThkYWZgYAoKICBBIHZhbGlkYXRpbmcgcmVzb2x2ZXIgY291bGQgYWNjZXB0IGEgc2lnbmVkIE5T
RUMgcmVjb3JkIGZyb20gYW4KICB1bnJlbGF0ZWQgem9uZSBhcyBwcm9vZiB0aGF0IGEgd2lsZGNh
cmQgZGlkIG5vdCBleGlzdC4gQW4gb24tcGF0aAogIGF0dGFja2VyIG9yIG1hbGljaW91cyBmb3J3
YXJkZXIgY29udHJvbGxpbmcgYSBzaWduZWQgem9uZSBjb3VsZAogIHRoZXJlZm9yZSBmb3JnZSBh
biBhdXRoZW50aWNhdGVkIE5YRE9NQUlOIHJlc3BvbnNlIGZvciBhIG5hbWUgdGhhdAogIHNob3Vs
ZCByZXNvbHZlIHRocm91Z2ggYSB3aWxkY2FyZC4gQklORCBub3cgcmVxdWlyZXMgdGhlCiAgd2ls
ZGNhcmQtZGVuaWFsIGFuZCBuYW1lLW5vbmV4aXN0ZW5jZSBwcm9vZnMgdG8gYmUgc2lnbmVkIGJ5
IHRoZSBzYW1lCiAgem9uZS4gOmdsOmAjNjI1M2AKCi0gW0NWRS0yMDI2LTE5NjY2XSBETlM2NCB3
aXRoIGJyZWFrLWRuc3NlYyBjb3VsZCBjYXVzZSBhbiBhc3NlcnRpb24KICBmYWlsdXJlLiBgYDRj
ZWM0OTY1YzRgYAoKICBXaGVuIGEgImRuczY0IiBzdGF0ZW1lbnQgaXMgY29uZmlndXJlZCB3aXRo
ICJicmVhay1kbnNzZWMgeWVzIiBhbmQgaXRzCiAgImV4Y2x1ZGUiIGxpc3QgbWF0Y2hlcyBzb21l
IGJ1dCBub3QgYWxsIG9mIHRoZSBhZGRyZXNzZXMgaW4gYW4gQUFBQQogIFJSc2V0LCBuYW1lZCBy
ZW1vdmVzIHRoZSBleGNsdWRlZCBhZGRyZXNzZXMgZnJvbSB0aGUgYW5zd2VyIGluc3RlYWQgb2YK
ICBzeW50aGVzaXppbmcgbmV3IG9uZXMuIElmIHRoZSBhbnN3ZXIgYmVpbmcgZmlsdGVyZWQgaGFk
IGJlZW4gY2FjaGVkCiAgdG9nZXRoZXIgd2l0aCBhIHByb29mIHRoYXQgdGhlIHF1ZXJpZWQgbmFt
ZSBkb2VzIG5vdCBleGlzdCAtLSB3aGljaCBpcwogIHdoYXQgYSB3aWxkY2FyZCBtYXRjaCBwcm9k
dWNlcyAtLSBuYW1lZCB0ZXJtaW5hdGVkIHdpdGggYW4gYXNzZXJ0aW9uCiAgZmFpbHVyZS4KCiAg
T25seSByZWN1cnNpdmUgcmVzb2x2ZXJzIGFyZSBhZmZlY3RlZCwgYW5kIG9ubHkgd2hlbiAiYnJl
YWstZG5zc2VjCiAgeWVzIiBpcyBpbiB1c2U7IHRoZSBhbnN3ZXIgaGFzIHRvIGNvbWUgZnJvbSB0
aGUgY2FjaGUsIHNvIGEgc2VydmVyCiAgdGhhdCBpcyBvbmx5IGF1dGhvcml0YXRpdmUgY2Fubm90
IHJlYWNoIHRoaXMuIDpnbDpgIzYzMDFgCgotIFtDVkUtMjAyNi0xOTY2N10gUmVqZWN0IG5lZ2F0
aXZlIGNhY2hlIHJlY29yZHMgdGhhdCBkbyBub3QgZml0IGluIGEKICBkbnNfcmRhdGFfdC4gYGBk
YmYwOGM4NTgxYGAKCiAgQSBzaW5nbGUgY3JhZnRlZCByZXNwb25zZSBmcm9tIGEgc2VydmVyIGNv
dWxkIG1ha2UgYSByZXNvbHZlciBjYWNoZSBhCiAgbWFsZm9ybWVkIG5lZ2F0aXZlIGVudHJ5IGFu
ZCB0aGVuIHRlcm1pbmF0ZSB3aXRoIGFuIGFzc2VydGlvbiBmYWlsdXJlCiAgd2hlbiByZWFkaW5n
IGl0IGJhY2suIE9ubHkgcmVjdXJzaXZlIHJlc29sdmVycyBhcmUgYWZmZWN0ZWQsIG9uIGEKICBk
ZWZhdWx0IGNvbmZpZ3VyYXRpb24uIDpnbDpgIzYzMDJgCgotIFtDVkUtMjAyNi0xOTY2Ml0gUHJl
dmVudCByZXNvbHZlciBjcmFzaCB3aXRoIGNhY2hlZCBETlNTRUMgcHJvb2ZzLgogIGBgYzg4NGNj
MWJhMGBgCgogIFVuZGVyIGNlcnRhaW4gdGltaW5nIGNvbmRpdGlvbnMsIGNvbmN1cnJlbnQgcmVj
dXJzaXZlIHF1ZXJpZXMgY291bGQKICBjYXVzZSBuYW1lZCB0byBjcmFzaCB3aGVuIGNhY2hlZCBE
TlNTRUMgTk9RTkFNRSBwcm9vZiBkYXRhIHdhcwogIHJlcGxhY2VkIHdoaWxlIHN0aWxsIGluIHVz
ZS4gQ2FjaGVkIHByb29mIGRhdGEgaXMgbm93IHJldGFpbmVkIHVudGlsCiAgYWxsIHF1ZXJpZXMg
dXNpbmcgaXQgaGF2ZSBjb21wbGV0ZWQuIDpnbDpgIzYzMzNgCgotIFtDVkUtMjAyNi03NTAyOV0g
RGlzY2FyZCByZXBlYXRlZCBTT0EsIENOQU1FLCBhbmQgRE5BTUUgcmVjb3JkcyB3aGVuCiAgcGFy
c2luZyBETlMgbWVzc2FnZXMuIGBgMGQ2MzA3NThjMmBgCgogIEEgRE5TIG1lc3NhZ2UgY291bGQg
Y2FycnkgdGhlIHNhbWUgU09BLCBDTkFNRSwgb3IgRE5BTUUgcmVjb3JkIG1hbnkKICB0aW1lcywg
YW5kIG5hbWVkIGtlcHQgZXZlcnkgY29weSB3aGlsZSBwYXJzaW5nIGl0LiBXaXRoIG5hbWUKICBj
b21wcmVzc2lvbiB0aG9zZSBjb3BpZXMgdG9vayB1cCBmYXIgbW9yZSBtZW1vcnkgaW50ZXJuYWxs
eSB0aGFuIGluCiAgdGhlIG1lc3NhZ2UgaXRzZWxmLCBhbmQgZXZlcnkgbGF0ZXIgcHJvY2Vzc2lu
ZyBzdGVwIGhhZCB0byBoYW5kbGUgYWxsCiAgb2YgdGhlbS4gbmFtZWQgbm93IGtlZXBzIHRoZSBm
aXJzdCBjb3B5IG9mIHN1Y2ggYSByZWNvcmQgYW5kIGRpc2NhcmRzCiAgaWRlbnRpY2FsIHJlcGVh
dHMuIDpnbDpgIzYzMzVgCgotIFtDVkUtMjAyNi03NzY5Ml0gRml4IGFuIHVuYXV0aGVudGljYXRl
ZCBjcmFzaCBvbiBIVFRQUyB1c2luZyBTSUcoMCkKICBgYDVhMjQ0MDFjNWNgYAoKICBBIHNwZWNp
ZmljYWxseSBjcmFmdGVkIEhUVFBTIHF1ZXJ5IHVzaW5nIFNJRygwKSBhcyBhdXRoZW50aWNhdGlv
bgogIGNvdWxkIGNyYXNoIG5hbWVkIGlmIHRoZSBjbGllbnQgY2xvc2VzIHRoZSBjb25uZWN0aW9u
IGJlZm9yZSBuYW1lZAogIGFjdHVhbGx5IHZlcmlmaWVzIHRoZSBzaWduYXR1cmUuIFRoaXMgaXMg
bm93IGZpeGVkLiA6Z2w6YCM2MzQzYAoKLSBbQ1ZFLTIwMjYtODE3MzZdIENhY2hlZCBIVFRQUy9T
VkNCIGFsaWFzZXMgY291bGQgZXhoYXVzdCByZXNvbHZlciBDUFUuCiAgYGAyMGJiYjE2MzlhYGAK
CiAgQSByZWN1cnNpdmUgcmVzb2x2ZXIgdGhhdCBoYWQgY2FjaGVkIGEgbGFyZ2Ugc2V0IG9mIGlu
dGVybGlua2VkIEhUVFBTCiAgb3IgU1ZDQiByZWNvcmRzIGluIGFsaWFzIGZvcm0gY291bGQgYmUg
ZHJpdmVuIHRvIGRvIGFuIGV4Y2Vzc2l2ZQogIGFtb3VudCBvZiB3b3JrIGFzc2VtYmxpbmcgYSBz
aW5nbGUgcmVzcG9uc2UsIGJlY2F1c2UgaXQgZm9sbG93ZWQgZXZlcnkKICBjYWNoZWQgYWxpYXMg
dGFyZ2V0IHdoZW4gYnVpbGRpbmcgdGhlIGFkZGl0aW9uYWwgc2VjdGlvbi4gQSBjbGllbnQKICBw
ZXJtaXR0ZWQgdG8gdXNlIHJlY3Vyc2lvbiwgdG9nZXRoZXIgd2l0aCBhbiBhdHRhY2tlci1jb250
cm9sbGVkIHpvbmUKICB1c2VkIHRvIHBsYW50IHRoZSByZWNvcmRzLCBjb3VsZCByZXBlYXQgc21h
bGwgcXVlcmllcyB0byBjb25zdW1lCiAgZW5vdWdoIENQVSB0byBkZWxheSBvciBkZW55IHNlcnZp
Y2UgdG8gb3RoZXIgY2xpZW50cy4gVGhlIGFtb3VudCBvZgogIGFkZGl0aW9uYWwgcHJvY2Vzc2lu
ZyBkb25lIGZvciBvbmUgcXVlcnkgaXMgbm93IGJvdW5kZWQuIDpnbDpgIzYzNDdgCgotIFtDVkUt
MjAyNi03NjE2M10gUHJldmVudCBUS0VZIHF1ZXJpZXMgZnJvbSB0ZXJtaW5hdGluZyBuYW1lZCB3
aXRob3V0CiAgZ2xvYmFsIG9wdGlvbnMuIGBgNzY0NTEzODUzOGBgCgogIG5hbWVkIGNvdWxkIHRl
cm1pbmF0ZSB1bmV4cGVjdGVkbHkgd2hlbiBhIHJlbW90ZSBjbGllbnQgc2VudCBhIFRLRVkKICBx
dWVyeSBpZiB0aGUgY29uZmlndXJhdGlvbiBkaWQgbm90IGluY2x1ZGUgYSBnbG9iYWwgb3B0aW9u
cyBzdGF0ZW1lbnQuCiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4KCiAgSVNDIHRoYW5rcyBPd2FpcyBM
b25lICh0aGVzZWNndXkpIGYKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgNTAw
MCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFj
aG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEtYXZvaWQtc3Rh
cnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uLzAwMDEtbTQtQmFj
a3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoICAgICB8IDIgKy0KIC4u
LjAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0
Y2ggfCA0ICsrLS0KIC4uLmJpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kL2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAuLi4vYmluZC9iaW5kL2lu
aXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCAgIHwgMiArLQogLi4u
L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAg
ICB8IDIgKy0KIC4uLi9iaW5kL3tiaW5kXzkuMjAuMjkuYmIgPT4gYmluZF85LjIwLjMwLmJifSAg
ICAgICAgICAgICAgICAgfCAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97
YmluZF85LjIwLjI5LmJiID0+IGJpbmRfOS4yMC4zMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKaW5kZXgg
MTU3OTZhMTVmYi4uZDMwMmJjMTQ4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
OTUxNDFjZjk0OTQyOTJmYzU2NDUxNjVlZjNkNWU5ZTJlZDIyMDhjNiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMWMwODdjMjRlODE2MmM3YTA0MmNmMWYxOWFkMzEzZTBmM2EyMTE5NiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVy
LmNvbT4KIERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9n
X2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jv
cy5wYXRjaAppbmRleCA5OWU3ODE3OTlkLi5lYjBhZGNmYWJlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2Nf
Zm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jv
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDZlOTYyNGViN2U0NzRhMDhlZDdlMWE0NTZi
ZmU5NzU5YmEyMTFkYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWE5NzhhNDczMzI4
MTIzNTc1YWYwMjcwZGMxZGQyNzQwNTBiZGZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogRnJpLCAxMCBB
cHIgMjAyNiAyMzozMzo0OSArMDAwMAogU3ViamVjdDogW1BBVENIXSBtNDogQmFja3BvcnQgYXhf
cHJvZ19jY19mb3JfYnVpbGQubTQgbWFjcm9zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlk
ZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5w
YXRjaAppbmRleCA4MGE0ZjJhYmRlLi41ODcxZmI0MzNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1s
b2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxk
LW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGYyODkyMGE1OWI2NThmY2RhMjRl
ZmRlMWM0NTMyMmY3ODVhMGIwZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUyNTU3
MDc4MWI4NzNjMzQzNGRmNDlhYzc1M2FmY2E3YzFiZDk2MTMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBN
b24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9s
d3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0yMCw3ICsyMCw3
IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAwYmMzOTY1Li5lMWMyYjEyIDEw
MDY0NAoraW5kZXggNGQwMmM2ZS4uMjI1ZjU5YyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwog
KysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0Vf
VkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJh
IHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGlu
Zy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggMzIzOTg1YTQwMi4u
NzMzMDBiNDZlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3Vy
ZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmMDAzZjM5NjA2N2U2Y2MxZTJlYzYwOWIyOTZiYjY0MmI4ZGRmNDdiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0Mzg4YmVjOWE4ZWJkN2Q5ZGRlZDRiMTk0MmE1
NjcwY2RhZWMwNjRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFr
ZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUg
MTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBm
b3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcgQEAgU2lnbmVk
LW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDI2YzQ0MmEuLjBiYzM5NjUg
MTAwNjQ0CitpbmRleCA3NTA4OGU1Li40ZDAyYzZlIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NzIsNyArODcyLDcgQEAgQVNfQ0FTRShbJHdpdGhf
bG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9j
b25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRj
aAppbmRleCAyOGVlNGFlNzRkLi5mODhmOTM5NTFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVmYzNk
ZmQzZjk5NGI1ZmQ5N2U5NzgzN2VlZTJhZDgwOGNkOGFmOTMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDY1YzkwYjYwY2M5ZjMwYzM4M2I4ZTMwYjkwMGFiZDA0YmM5NzdiZDEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KIERh
dGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmlu
ZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1m
b3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCBiMzczMjUxYzQ3Li4zODgzMzViMjcxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRk
LXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9v
dGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MmMxMDkzMTcwNzBkMTlmZGE3MDYzNWI3
MDQzY2JjNmY5ZWMzNmVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNThlMTMwOWU4
MDQ0OWVjYzFmYTFmYTc5MzYzMGI1M2MwOGY5NThlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAyNyBNYXIg
MjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBzdXBwb3J0
IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13
b3JrLnBhdGNoCmluZGV4IDc0Y2Y5NDc3ODcuLmJkNmFkYTg4MjIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13
b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2Ut
ZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZTEz
MTRmMmU3MWJlMTU3MDRiYTE4NzU2MjUwMTg1YjM2YTVjMGRhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhZDljYjgyMWExMTlmNDQxZjYxMzFlMDE3MTVkNWUwZWFiMzY4ZmMwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3ViamVjdDogW1BB
VENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjkuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjMwLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
MjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
MzAuYmIKaW5kZXggYzI4MGQ1Yjk4ZC4uNDRmMDljZWFhOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjMwLmJiCkBAIC0yMSw3ICsyMSw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7UFZ9LnRh
ci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9y
X2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU4NzAyOTUwOGIzYjFiNDMyMjlmYWU0MTZjOTdlNTU0M2FiYTQ1ODA5Y2VmYWNhOThh
NTAwNGEwMmE1NzM2YzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWUxNDQzYTQwYTcyYTMwMjcy
Y2JjMzE5NmQwMjBhNmIyZTI2OTM3MTExYzgzZTU5ZTEwMWU4MmUxZTNiNGZlZiIKIAogVVBTVFJF
QU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93
IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============3690457317252574938==--
