Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9336.1795068806971320213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 22:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=u2+IZ6qw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=msXlIepS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1f2704375-00d28f91-55a9-48c1-b32c-9a8b3a026305-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795068806;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=yTWHZEq53+/HFZpjAkVDxan3bKNuvjUUzDUBwQTnggM=;
	b=u2+IZ6qwENNW2QtiKuuD95WGEW2Ttagb19fByOi2OXkIyJSHNuPx3PMAIbEFW51h
	DmUNkLaur1JrkwdN/n9pWz06iHf5h9BHX0k28PPWdIZVpc79eiCVQCpmi3w44crB4g5
	AlSIHB0TdblBODk04ltXuhfCwGaXohkevZYr4mic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795068806;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=yTWHZEq53+/HFZpjAkVDxan3bKNuvjUUzDUBwQTnggM=;
	b=msXlIepS2cJN/kiVyaqleaDtRcm/2db5woAsDPVqeWfn+93X2Lo1414734+WCWwl
	A6xI94nk6TCHlouah4Q+lZi5JZ+Dc0fATMEeXCnhSaGeIm04pxMwwuCnrSomrTepNa2
	qizwzJXn9u3O4C1GZC1ZVHkNOR+53hRMLq4KqaDc=
Content-Type: multipart/mixed; boundary="===============3961474565949116903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.20.31 SUCCEEDED
Message-ID: <010101a1f2704375-00d28f91-55a9-48c1-b32c-9a8b3a026305-000000@us-west-2.amazonses.com>
Date: Thu, 19 Nov 2026 06:13:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.19-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250643

--===============3961474565949116903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.30-9.20.31.patch
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
From 683a7525623f2ac111f1ad4491c77738983503e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 19 Nov 2026 05:14:02 +0000
Subject: [PATCH] bind: upgrade 9.20.30 -> 9.20.31

BIND 9.20.31
------------

Removed Features
~~~~~~~~~~~~~~~~

- Deprecate NXDOMAIN redirection. ``c8dfd310902``

  The `nxdomain-redirect` option and `type redirect` zones are now
  deprecated. A warning will be generated when these are encountered in
  `named.conf`.

  Related to #6451 :gl:`!12935`
- Remove the atomic_ptr() wrapper. ``5afda8f0450``

  The wrapper has a single user and saves nothing over spelling out
  `_Atomic(type *)`.  Coccinelle cannot parse its definition, so the
  header costs the semantic patches a few lines of coverage for no
  benefit.

  Assisted-by: Claude:claude-opus-5-5 coccinelle :gl:`!12915`

Feature Changes
~~~~~~~~~~~~~~~

- Faster IXFR for inline-signed zones. ``f1b35ff11a3``

  Previously, the implementation of dns_diff_appendminimal could lead to
  quadratic complexity when used in a loop. We introduce an
  dns_diff_appendlistminimal method for diffs that uses an hashmap to
  minimize the diff, leading to linear complexity.

  ISC would like to thank Qifan Zhang, of Palo Alto Networks, for
  reporting this issue. :gl:`#5980` :gl:`!12911`

- Keep accepting CN-only certificates for DoH with OpenSSL 4.1.
  ``1657680098a``

  OpenSSL 4.1 no longer falls back to the Subject Common Name when a
  server certificate has no SubjectAltName, so "dig +https" started
  rejecting such certificates with a hostname mismatch.

  Ask for the Subject explicitly on OpenSSL 4.1 and later, which is the
  only way to keep the Common Name in play there; OpenSSL then also
  consults it alongside any SubjectAltName, the closest to the previous
  behaviour it offers.  Older releases keep their default, and DoT is
  unaffected because it never consulted the Subject.

  Assisted-by: Claude:claude-fable-5-1 :gl:`!12944`

- Minimize ANY responses over TCP when minimal-any is enabled.
  ``ef55a6723ca``

  When :namedconf:ref:`minimal-any` was enabled, BIND minimized ANY
  responses over UDP but returned all available RRsets over TCP. BIND
  now returns a single RRset, with its covering RRSIGs when requested,
  and omits unnecessary authority and additional data regardless of
  transport. :gl:`!13056`

- Using NSEC3 salt is deprecated. ``ee01e77d24c``

  BCP 236 recommends not using salt and iterations. We have been
  disallowing extra iterations for a while now, we will now also
  deprecate salt. :gl:`!13036`

Bug Fixes
~~~~~~~~~

- Fix possible performance issue when issuing rndc commands very
  frequently. ``b1ceaee9f74``

  The :iscman:`rndc` command could get slow if large number of requests
  was made over a short period of time. This has been fixed. :gl:`#3698`
  :gl:`!12967`

- Replace SoftHSMv2 with Kryoptic in the PKCS#11 system tests.
  ``89703fa84ed``

  SoftHSMv2 made the enginepkcs11 and keyfromlabel system tests fail at
  random: key generation through pkcs11-provider returned
  CKR_GENERAL_ERROR when named created keys for many zones at once,
  after which named backed off for ten minutes. The tests now use
  Kryoptic as the software token, selected with the
  BIND9_TEST_KRYOPTIC_MODULE environment variable, and render their own
  OpenSSL and Kryoptic configuration, so OPENSSL_CONF and SOFTHSM2_CONF
  no longer have to be set to run them. PKCS#11 labels for key-store
  keys may now be as long as a private key file field, so a pin-source
  with an absolute path no longer makes key generation fail with "ran
  out of space". :gl:`#4695` :gl:`!12929`

- Fix Offline KSK signing when the KSK and a ZSK share a key tag.
  ``321d013627b``

  With dnssec-policy offline-ksk, the KSK and the ZSKs are generated
  separately, so a ZSK can have the same key tag as the KSK. named then
  mistook the ZSK for the KSK when signing the zone: the DNSKEY RRset
  was left without the KSK signature from the imported SKR, or,
  depending on the signing algorithm, importing the SKR failed with a
  "not exact" error. This has been fixed. :gl:`#5540` :gl:`!12917`

- Omit pending data from type-ANY cache responses. ``baddcc46b19``

  When answering a type-ANY query from the cache, data that hasn't been
  validated yet should only be included in the response if the query has
  the CD bit set. :gl:`#5984` :gl:`!13023`

- Rndc accepts stale or mismatched signed responses. ``ea32f5baac7``

  The :iscman:`rndc` command could accept reflected requests as answers.
  Additionally, replayed responses could be accepted. This has been
  fixed. :gl:`#6101` :gl:`!12922`

- Make "rndc -r" work when "rndc" and "named" are from different builds.
  ``a71804862f5``

  Previously :option:`rndc -r` was only guaranteed to display the right
  value when rndc and named were from the same build.  This has been
  fixed. :gl:`#6102` :gl:`!13012`

- DoH client Content-Type validation accepted invalid values.
  ``392cb00d808``

  The Content-Type validation accepted any value that started with
  `application/dns-message`.  This has been fixed. :gl:`#6137`
  :gl:`!12910`

- Send TSIG when NOTIFY is retried over TCP. ``0825aae3a68``

  NOTIFY mes

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
 .../bind/{bind_9.20.30.bb => bind_9.20.31.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.30.bb => bind_9.20.31.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index d302bc1481..3a38cf93f1 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 1c087c24e8162c7a042cf1f19ad313e0f3a21196 Mon Sep 17 00:00:00 2001
+From afe4b5d9a541f5efeb8011742cf3b93fb27dc21e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index eb0adcfabe..d8fff6ffb7 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From aa978a473328123575af0270dc1dd274050bdfc0 Mon Sep 17 00:00:00 2001
+From 1e61b2de8a8b08d189008fca9ddb06b6e841bcca Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 5871fb433c..7302c78614 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 525570781b873c3434df49ac753afca7c1bd9613 Mon Sep 17 00:00:00 2001
+From baad654564c727f12528783f4921f323c6cf578c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4d02c6e..225f59c 100644
+index 86ebf44..bfef855 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 73300b46e8..4779ca7589 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 4388bec9a8ebd7d9dded4b1942a5670cdaec064f Mon Sep 17 00:00:00 2001
+From f28e5124ddc30a24f2ef31e0bab1fbbd19b6dab7 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 75088e5..4d02c6e 100644
+index 9993b41..86ebf44 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index f88f93951f..ec45a611fd 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 65c90b60cc9f30c383b8e30b900abd04bc977bd1 Mon Sep 17 00:00:00 2001
+From d2634205b11e4831d62b27ccaf382c1a3ddb2439 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 388335b271..7716731396 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From c58e1309e80449ecc1fa1fa793630b53c08f958e Mon Sep 17 00:00:00 2001
+From 045016c1e720c91c5e0821a8d64e550de1c823af Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index bd6ada8822..2d59a54b8d 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ad9cb821a119f441f6131e01715d5e0eab368fc0 Mon Sep 17 00:00:00 2001
+From 198caf2507a3b51b11e3abc3a3ac27cd75152dab Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.30.bb b/meta/recipes-connectivity/bind/bind_9.20.31.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.30.bb
rename to meta/recipes-connectivity/bind/bind_9.20.31.bb
index 44f09ceaa8..d982b1f6fc 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.30.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.31.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef"
+SRC_URI[sha256sum] = "9bfecd503ec79209d321053689c794da9f8dba993a24e9cd6bd7aa87cdf4122f"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============3961474565949116903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bind-changelog.txt"

BIND 9.20.31
------------

Removed Features
~~~~~~~~~~~~~~~~

- Deprecate NXDOMAIN redirection. ``c8dfd310902``

  The `nxdomain-redirect` option and `type redirect` zones are now
  deprecated. A warning will be generated when these are encountered in
  `named.conf`.

  Related to #6451 :gl:`!12935`
- Remove the atomic_ptr() wrapper. ``5afda8f0450``

  The wrapper has a single user and saves nothing over spelling out
  `_Atomic(type *)`.  Coccinelle cannot parse its definition, so the
  header costs the semantic patches a few lines of coverage for no
  benefit.

  Assisted-by: Claude:claude-opus-5-5 coccinelle :gl:`!12915`

Feature Changes
~~~~~~~~~~~~~~~

- Faster IXFR for inline-signed zones. ``f1b35ff11a3``

  Previously, the implementation of dns_diff_appendminimal could lead to
  quadratic complexity when used in a loop. We introduce an
  dns_diff_appendlistminimal method for diffs that uses an hashmap to
  minimize the diff, leading to linear complexity.

  ISC would like to thank Qifan Zhang, of Palo Alto Networks, for
  reporting this issue. :gl:`#5980` :gl:`!12911`

- Keep accepting CN-only certificates for DoH with OpenSSL 4.1.
  ``1657680098a``

  OpenSSL 4.1 no longer falls back to the Subject Common Name when a
  server certificate has no SubjectAltName, so "dig +https" started
  rejecting such certificates with a hostname mismatch.

  Ask for the Subject explicitly on OpenSSL 4.1 and later, which is the
  only way to keep the Common Name in play there; OpenSSL then also
  consults it alongside any SubjectAltName, the closest to the previous
  behaviour it offers.  Older releases keep their default, and DoT is
  unaffected because it never consulted the Subject.

  Assisted-by: Claude:claude-fable-5-1 :gl:`!12944`

- Minimize ANY responses over TCP when minimal-any is enabled.
  ``ef55a6723ca``

  When :namedconf:ref:`minimal-any` was enabled, BIND minimized ANY
  responses over UDP but returned all available RRsets over TCP. BIND
  now returns a single RRset, with its covering RRSIGs when requested,
  and omits unnecessary authority and additional data regardless of
  transport. :gl:`!13056`

- Using NSEC3 salt is deprecated. ``ee01e77d24c``

  BCP 236 recommends not using salt and iterations. We have been
  disallowing extra iterations for a while now, we will now also
  deprecate salt. :gl:`!13036`

Bug Fixes
~~~~~~~~~

- Fix possible performance issue when issuing rndc commands very
  frequently. ``b1ceaee9f74``

  The :iscman:`rndc` command could get slow if large number of requests
  was made over a short period of time. This has been fixed. :gl:`#3698`
  :gl:`!12967`

- Replace SoftHSMv2 with Kryoptic in the PKCS#11 system tests.
  ``89703fa84ed``

  SoftHSMv2 made the enginepkcs11 and keyfromlabel system tests fail at
  random: key generation through pkcs11-provider returned
  CKR_GENERAL_ERROR when named created keys for many zones at once,
  after which named backed off for ten minutes. The tests now use
  Kryoptic as the software token, selected with the
  BIND9_TEST_KRYOPTIC_MODULE environment variable, and render their own
  OpenSSL and Kryoptic configuration, so OPENSSL_CONF and SOFTHSM2_CONF
  no longer have to be set to run them. PKCS#11 labels for key-store
  keys may now be as long as a private key file field, so a pin-source
  with an absolute path no longer makes key generation fail with "ran
  out of space". :gl:`#4695` :gl:`!12929`

- Fix Offline KSK signing when the KSK and a ZSK share a key tag.
  ``321d013627b``

  With dnssec-policy offline-ksk, the KSK and the ZSKs are generated
  separately, so a ZSK can have the same key tag as the KSK. named then
  mistook the ZSK for the KSK when signing the zone: the DNSKEY RRset
  was left without the KSK signature from the imported SKR, or,
  depending on the signing algorithm, importing the SKR failed with a
  "not exact" error. This has been fixed. :gl:`#5540` :gl:`!12917`

- Omit pending data from type-ANY cache responses. ``baddcc46b19``

  When answering a type-ANY query from the cache, data that hasn't been
  validated yet should only be included in the response if the query has
  the CD bit set. :gl:`#5984` :gl:`!13023`

- Rndc accepts stale or mismatched signed responses. ``ea32f5baac7``

  The :iscman:`rndc` command could accept reflected requests as answers.
  Additionally, replayed responses could be accepted. This has been
  fixed. :gl:`#6101` :gl:`!12922`

- Make "rndc -r" work when "rndc" and "named" are from different builds.
  ``a71804862f5``

  Previously :option:`rndc -r` was only guaranteed to display the right
  value when rndc and named were from the same build.  This has been
  fixed. :gl:`#6102` :gl:`!13012`

- DoH client Content-Type validation accepted invalid values.
  ``392cb00d808``

  The Content-Type validation accepted any value that started with
  `application/dns-message`.  This has been fixed. :gl:`#6137`
  :gl:`!12910`

- Send TSIG when NOTIFY is retried over TCP. ``0825aae3a68``

  NOTIFY messages were not TSIG-signed when retried over TCP. This has
  been fixed. :gl:`#6240` :gl:`!12948`

- Try the next server instead of aborting the zone transfer.
  ``95ca5485deb``

  In some cases of a misconfigured primary server, for example, when it
  returned a zone with too many records or a zone that failed
  verification, the zone transfer could get aborted altogether on the
  secondary server instead of trying the next configured primary. This
  has been fixed. :gl:`#6352` :gl:`!13027`

- Automatic interface scanning could stop after a burst of address
  changes. ``690475cb14c``

  When many addresses were removed and added again in quick succession,
  as happens with "netplan apply", the kernel could drop some of the
  resulting interface change notifications. named then gave up on
  automatic interface scanning, logging "automatic interface scanning
  terminated: not enough free resources", and stopped listening on some
  addresses until it was restarted. Lost notifications now trigger a
  fresh scan of the interfaces once the burst is over, and named asks
  the kernel to report only address changes and to queue more of them,
  so that notifications are lost less often in the first place.
  :gl:`#6389` :gl:`!13073`

- DS queries for CNAME names were fetched upstream on every query.
  ``24efa7d5065``

  A resolver answering a DS query for a name that is a CNAME (for
  example www.example.com pointing to example.com) ignored the CNAME it
  had already cached and sent the query upstream every time, so such
  answers were never served from the cache. The cached CNAME is now used
  for DS queries as for any other type, while a DS record or a negative
  DS answer cached at the same name still takes precedence. :gl:`#6455`
  :gl:`!13055`

- Reopening or rolling the dnstap output no longer stalls the server.
  ``1302befabf0``

  Every rndc dnstap -reopen, rndc dnstap -roll and every automatic roll
  of a size-limited dnstap-output file stopped all of named's processing
  until whatever was already running, such as an RPZ zone update, had
  finished and the old output had been flushed, closed and replaced. The
  output is now switched over while the server keeps running; the few
  dnstap messages produced during the switch itself are dropped and
  counted in the dnstap statistics. Logging to a size-limited output
  also no longer checks the file on disk for every message. :gl:`#6461`
  :gl:`!13074`

- Fix ECDHE (forward-secret) cipher suites when building with OpenSSL
  1.0.x. ``e97d015348f``

  SSL_CTX_set_ecdh_auto() (required on OpenSSL 1.0.2 to enable ECDHE) is
  only called for the ephemeral context in isc_tlsctx_createserver(),
  not for contexts loaded from key-file/cert-file. On OpenSSL >= 1.1.0
  ECDHE is on by default and the macro is a no-op, which is why this
  only shows with 1.0.2.

  Call SSL_CTX_set_ecdh_auto(ctx, 1) for every server context.
  :gl:`#6466` :gl:`#6465` :gl:`!12962`

- Align the checkconf root KSK cutoff with named-checkconf.
  ``b8312f2fda8``

  The checkconf system test stopped expecting a warning for a root trust
  anchor containing only the 2026 KSK at 00:00 UTC on 11 October 2026,
  while named-checkconf keeps warning until 23:59 UTC that day, so every
  pipeline failed the test for that one day. The test now uses the same
  cutoff as the checker. :gl:`!12927`

- Fix the UDP receive buffer size for libuv recvmmsg. ``34e4af77cb9``

  libuv splits the UDP receive buffer into UV__UDP_DGRAM_MAXSIZE (64 *
  1024) byte chunks, so a buffer of 20 * UINT16_MAX bytes only holds 19
  chunks and the last datagram slot of every recvmmsg call went unused.
  Size the buffer as 20 * 64 KiB so that all 20 slots are usable.
  :gl:`!12964`

- Update the Extended DNS Error codes. ``be6ee7abe99``

  IANA has registered several new EDE codes since the last time the list
  was updated; we can now display them correctly. :gl:`!12937`

--===============3961474565949116903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.30.so /usr/lib/libdns-9.20.30.so /usr/lib/libisc-9.20.30.so /usr/lib/libisccfg-9.20.30.so /usr/lib/libns-9.20.30.so", added "/usr/lib/libdns-9.20.31.so /usr/lib/libisc-9.20.31.so /usr/lib/libisccfg-9.20.31.so /usr/lib/libisccc-9.20.31.so /usr/lib/libns-9.20.31.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.30.so to libdns-9.20.31.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.30.so to libisccc-9.20.31.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.30.so to libisccfg-9.20.31.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.30.so to libisc-9.20.31.so
  /usr/lib/libns.so changed symlink target from libns-9.20.30.so to libns-9.20.31.so
  /usr/lib/libdns-9.20.30.so moved to /usr/lib/libdns-9.20.31.so
  /usr/lib/libisc-9.20.30.so moved to /usr/lib/libisc-9.20.31.so
  /usr/lib/libisccc-9.20.30.so moved to /usr/lib/libisccc-9.20.31.so
  /usr/lib/libisccfg-9.20.30.so moved to /usr/lib/libisccfg-9.20.31.so
  /usr/lib/libns-9.20.30.so moved to /usr/lib/libns-9.20.31.so

--===============3961474565949116903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16254392 to 16301928 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.20.30.so /usr/lib/.debug/libisc-9.20.30.so /usr/lib/.debug/libisccfg-9.20.30.so /usr/lib/.debug/libisccc-9.20.30.so /usr/lib/.debug/libns-9.20.30.so", added "/usr/lib/.debug/libdns-9.20.31.so /usr/lib/.debug/libisc-9.20.31.so /usr/lib/.debug/libns-9.20.31.so /usr/lib/.debug/libisccc-9.20.31.so /usr/lib/.debug/libisccfg-9.20.31.so"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1614128 to 1615449 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.30.so /usr/lib/libisccfg-9.20.30.so /usr/lib/libns-9.20.30.so /usr/lib/libdns-9.20.30.so /usr/lib/libisc-9.20.30.so", added "/usr/lib/libns-9.20.31.so /usr/lib/libdns-9.20.31.so /usr/lib/libisccc-9.20.31.so /usr/lib/libisc-9.20.31.so /usr/lib/libisccfg-9.20.31.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.30.so", added "/usr/lib/*-9.20.31.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10194651 to 10205492 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.30/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.31/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.30/bin/rndc -> /usr/src/debug/bind/9.20.31/bin/rndc, directory renamed /usr/src/debug/bind/9.20.30/bin/plugins -> /usr/src/debug/bind/9.20.31/bin/plugins, directory renamed /usr/src/debug/bind/9.20.30/lib/dns -> /usr/src/debug/bind/9.20.31/lib/dns, directory renamed /usr/src/debug/bind/9.20.30/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.31/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.31/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.30/bin/named -> /usr/src/debug/bind/9.20.31/bin/named, directory renamed /usr/src/debug/bind/9.20.30/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.31/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.30/lib/isc -> /usr
 /src/debug/bind/9.20.31/lib/isc, directory renamed /usr/src/debug/bind/9.20.30/bin/named/include/named -> /usr/src/debug/bind/9.20.31/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.30/lib/isc/include/isc -> /usr/src/debug/bind/9.20.31/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.30/bin/tools -> /usr/src/debug/bind/9.20.31/bin/tools, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.31/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.30/bin/nsupdate -> /usr/src/debug/bind/9.20.31/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.30/bin/dig -> /usr/src/debug/bind/9.20.31/bin/dig, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/include/irs -> /usr/src/debug/bind/9.20.31/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.30/lib/ns -> /usr/src/debug/bind/9.20.31/lib/ns, directory renamed /usr/src/debug/bind/9.20.30/bin/confgen -> /usr/src/debug/bind/9.20.31/bin
 /confgen, directory renamed /usr/src/debug/bind/9.20.30/lib/isccc -> /usr/src/debug/bind/9.20.31/lib/isccc, directory renamed /usr/src/debug/bind/9.20.30/bin/delv -> /usr/src/debug/bind/9.20.31/bin/delv, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.31/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.30/lib/ns/include/ns -> /usr/src/debug/bind/9.20.31/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/include/dst -> /usr/src/debug/bind/9.20.31/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.30/lib/isccfg -> /usr/src/debug/bind/9.20.31/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.31/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.30/bin/named/include/dlz -> /usr/src/debug/bind/9.20.31/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.30/bin/dnssec -> /usr/src/debug/bind/9.20.31/bin/dnssec, d
 irectory renamed /usr/src/debug/bind/9.20.30/bin/check -> /usr/src/debug/bind/9.20.31/bin/check, directory renamed /usr/src/debug/bind/9.20.30/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.31/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.30/lib/dns/include/dns -> /usr/src/debug/bind/9.20.31/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.30/lib/isc/netmgr -> /usr/src/debug/bind/9.20.31/lib/isc/netmgr
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.30" to "9.20.31"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.31/bind-9.20.31.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.30 [default] to 9.20.31 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.30" to "9.20.31"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.30.so to libdns-9.20.31.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.30.so to libisccc-9.20.31.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.30.so to libisccfg-9.20.31.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.30.so to libisc-9.20.31.so
  /usr/lib/libns.so changed symlink target from libns-9.20.30.so to libns-9.20.31.so
  /usr/lib/libdns-9.20.30.so moved to /usr/lib/libdns-9.20.31.so
  /usr/lib/libisc-9.20.30.so moved to /usr/lib/libisc-9.20.31.so
  /usr/lib/libisccc-9.20.30.so moved to /usr/lib/libisccc-9.20.31.so
  /usr/lib/libisccfg-9.20.30.so moved to /usr/lib/libisccfg-9.20.31.so
  /usr/lib/libns-9.20.30.so moved to /usr/lib/libns-9.20.31.so

--===============3961474565949116903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.30-9.20.31.patch"

RnJvbSA2ODNhNzUyNTYyM2YyYWMxMTFmMWFkNDQ5MWM3NzczODk4MzUwM2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMDU6MTQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMzAgLT4gOS4yMC4zMQoKQklORCA5LjIwLjMxCi0tLS0tLS0tLS0t
LQoKUmVtb3ZlZCBGZWF0dXJlcwp+fn5+fn5+fn5+fn5+fn5+CgotIERlcHJlY2F0ZSBOWERPTUFJ
TiByZWRpcmVjdGlvbi4gYGBjOGRmZDMxMDkwMmBgCgogIFRoZSBgbnhkb21haW4tcmVkaXJlY3Rg
IG9wdGlvbiBhbmQgYHR5cGUgcmVkaXJlY3RgIHpvbmVzIGFyZSBub3cKICBkZXByZWNhdGVkLiBB
IHdhcm5pbmcgd2lsbCBiZSBnZW5lcmF0ZWQgd2hlbiB0aGVzZSBhcmUgZW5jb3VudGVyZWQgaW4K
ICBgbmFtZWQuY29uZmAuCgogIFJlbGF0ZWQgdG8gIzY0NTEgOmdsOmAhMTI5MzVgCi0gUmVtb3Zl
IHRoZSBhdG9taWNfcHRyKCkgd3JhcHBlci4gYGA1YWZkYThmMDQ1MGBgCgogIFRoZSB3cmFwcGVy
IGhhcyBhIHNpbmdsZSB1c2VyIGFuZCBzYXZlcyBub3RoaW5nIG92ZXIgc3BlbGxpbmcgb3V0CiAg
YF9BdG9taWModHlwZSAqKWAuICBDb2NjaW5lbGxlIGNhbm5vdCBwYXJzZSBpdHMgZGVmaW5pdGlv
biwgc28gdGhlCiAgaGVhZGVyIGNvc3RzIHRoZSBzZW1hbnRpYyBwYXRjaGVzIGEgZmV3IGxpbmVz
IG9mIGNvdmVyYWdlIGZvciBubwogIGJlbmVmaXQuCgogIEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xh
dWRlLW9wdXMtNS01IGNvY2NpbmVsbGUgOmdsOmAhMTI5MTVgCgpGZWF0dXJlIENoYW5nZXMKfn5+
fn5+fn5+fn5+fn5+CgotIEZhc3RlciBJWEZSIGZvciBpbmxpbmUtc2lnbmVkIHpvbmVzLiBgYGYx
YjM1ZmYxMWEzYGAKCiAgUHJldmlvdXNseSwgdGhlIGltcGxlbWVudGF0aW9uIG9mIGRuc19kaWZm
X2FwcGVuZG1pbmltYWwgY291bGQgbGVhZCB0bwogIHF1YWRyYXRpYyBjb21wbGV4aXR5IHdoZW4g
dXNlZCBpbiBhIGxvb3AuIFdlIGludHJvZHVjZSBhbgogIGRuc19kaWZmX2FwcGVuZGxpc3RtaW5p
bWFsIG1ldGhvZCBmb3IgZGlmZnMgdGhhdCB1c2VzIGFuIGhhc2htYXAgdG8KICBtaW5pbWl6ZSB0
aGUgZGlmZiwgbGVhZGluZyB0byBsaW5lYXIgY29tcGxleGl0eS4KCiAgSVNDIHdvdWxkIGxpa2Ug
dG8gdGhhbmsgUWlmYW4gWmhhbmcsIG9mIFBhbG8gQWx0byBOZXR3b3JrcywgZm9yCiAgcmVwb3J0
aW5nIHRoaXMgaXNzdWUuIDpnbDpgIzU5ODBgIDpnbDpgITEyOTExYAoKLSBLZWVwIGFjY2VwdGlu
ZyBDTi1vbmx5IGNlcnRpZmljYXRlcyBmb3IgRG9IIHdpdGggT3BlblNTTCA0LjEuCiAgYGAxNjU3
NjgwMDk4YWBgCgogIE9wZW5TU0wgNC4xIG5vIGxvbmdlciBmYWxscyBiYWNrIHRvIHRoZSBTdWJq
ZWN0IENvbW1vbiBOYW1lIHdoZW4gYQogIHNlcnZlciBjZXJ0aWZpY2F0ZSBoYXMgbm8gU3ViamVj
dEFsdE5hbWUsIHNvICJkaWcgK2h0dHBzIiBzdGFydGVkCiAgcmVqZWN0aW5nIHN1Y2ggY2VydGlm
aWNhdGVzIHdpdGggYSBob3N0bmFtZSBtaXNtYXRjaC4KCiAgQXNrIGZvciB0aGUgU3ViamVjdCBl
eHBsaWNpdGx5IG9uIE9wZW5TU0wgNC4xIGFuZCBsYXRlciwgd2hpY2ggaXMgdGhlCiAgb25seSB3
YXkgdG8ga2VlcCB0aGUgQ29tbW9uIE5hbWUgaW4gcGxheSB0aGVyZTsgT3BlblNTTCB0aGVuIGFs
c28KICBjb25zdWx0cyBpdCBhbG9uZ3NpZGUgYW55IFN1YmplY3RBbHROYW1lLCB0aGUgY2xvc2Vz
dCB0byB0aGUgcHJldmlvdXMKICBiZWhhdmlvdXIgaXQgb2ZmZXJzLiAgT2xkZXIgcmVsZWFzZXMg
a2VlcCB0aGVpciBkZWZhdWx0LCBhbmQgRG9UIGlzCiAgdW5hZmZlY3RlZCBiZWNhdXNlIGl0IG5l
dmVyIGNvbnN1bHRlZCB0aGUgU3ViamVjdC4KCiAgQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUt
ZmFibGUtNS0xIDpnbDpgITEyOTQ0YAoKLSBNaW5pbWl6ZSBBTlkgcmVzcG9uc2VzIG92ZXIgVENQ
IHdoZW4gbWluaW1hbC1hbnkgaXMgZW5hYmxlZC4KICBgYGVmNTVhNjcyM2NhYGAKCiAgV2hlbiA6
bmFtZWRjb25mOnJlZjpgbWluaW1hbC1hbnlgIHdhcyBlbmFibGVkLCBCSU5EIG1pbmltaXplZCBB
TlkKICByZXNwb25zZXMgb3ZlciBVRFAgYnV0IHJldHVybmVkIGFsbCBhdmFpbGFibGUgUlJzZXRz
IG92ZXIgVENQLiBCSU5ECiAgbm93IHJldHVybnMgYSBzaW5nbGUgUlJzZXQsIHdpdGggaXRzIGNv
dmVyaW5nIFJSU0lHcyB3aGVuIHJlcXVlc3RlZCwKICBhbmQgb21pdHMgdW5uZWNlc3NhcnkgYXV0
aG9yaXR5IGFuZCBhZGRpdGlvbmFsIGRhdGEgcmVnYXJkbGVzcyBvZgogIHRyYW5zcG9ydC4gOmds
OmAhMTMwNTZgCgotIFVzaW5nIE5TRUMzIHNhbHQgaXMgZGVwcmVjYXRlZC4gYGBlZTAxZTc3ZDI0
Y2BgCgogIEJDUCAyMzYgcmVjb21tZW5kcyBub3QgdXNpbmcgc2FsdCBhbmQgaXRlcmF0aW9ucy4g
V2UgaGF2ZSBiZWVuCiAgZGlzYWxsb3dpbmcgZXh0cmEgaXRlcmF0aW9ucyBmb3IgYSB3aGlsZSBu
b3csIHdlIHdpbGwgbm93IGFsc28KICBkZXByZWNhdGUgc2FsdC4gOmdsOmAhMTMwMzZgCgpCdWcg
Rml4ZXMKfn5+fn5+fn5+CgotIEZpeCBwb3NzaWJsZSBwZXJmb3JtYW5jZSBpc3N1ZSB3aGVuIGlz
c3Vpbmcgcm5kYyBjb21tYW5kcyB2ZXJ5CiAgZnJlcXVlbnRseS4gYGBiMWNlYWVlOWY3NGBgCgog
IFRoZSA6aXNjbWFuOmBybmRjYCBjb21tYW5kIGNvdWxkIGdldCBzbG93IGlmIGxhcmdlIG51bWJl
ciBvZiByZXF1ZXN0cwogIHdhcyBtYWRlIG92ZXIgYSBzaG9ydCBwZXJpb2Qgb2YgdGltZS4gVGhp
cyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjMzY5OGAKICA6Z2w6YCExMjk2N2AKCi0gUmVwbGFjZSBT
b2Z0SFNNdjIgd2l0aCBLcnlvcHRpYyBpbiB0aGUgUEtDUyMxMSBzeXN0ZW0gdGVzdHMuCiAgYGA4
OTcwM2ZhODRlZGBgCgogIFNvZnRIU012MiBtYWRlIHRoZSBlbmdpbmVwa2NzMTEgYW5kIGtleWZy
b21sYWJlbCBzeXN0ZW0gdGVzdHMgZmFpbCBhdAogIHJhbmRvbToga2V5IGdlbmVyYXRpb24gdGhy
b3VnaCBwa2NzMTEtcHJvdmlkZXIgcmV0dXJuZWQKICBDS1JfR0VORVJBTF9FUlJPUiB3aGVuIG5h
bWVkIGNyZWF0ZWQga2V5cyBmb3IgbWFueSB6b25lcyBhdCBvbmNlLAogIGFmdGVyIHdoaWNoIG5h
bWVkIGJhY2tlZCBvZmYgZm9yIHRlbiBtaW51dGVzLiBUaGUgdGVzdHMgbm93IHVzZQogIEtyeW9w
dGljIGFzIHRoZSBzb2Z0d2FyZSB0b2tlbiwgc2VsZWN0ZWQgd2l0aCB0aGUKICBCSU5EOV9URVNU
X0tSWU9QVElDX01PRFVMRSBlbnZpcm9ubWVudCB2YXJpYWJsZSwgYW5kIHJlbmRlciB0aGVpciBv
d24KICBPcGVuU1NMIGFuZCBLcnlvcHRpYyBjb25maWd1cmF0aW9uLCBzbyBPUEVOU1NMX0NPTkYg
YW5kIFNPRlRIU00yX0NPTkYKICBubyBsb25nZXIgaGF2ZSB0byBiZSBzZXQgdG8gcnVuIHRoZW0u
IFBLQ1MjMTEgbGFiZWxzIGZvciBrZXktc3RvcmUKICBrZXlzIG1heSBub3cgYmUgYXMgbG9uZyBh
cyBhIHByaXZhdGUga2V5IGZpbGUgZmllbGQsIHNvIGEgcGluLXNvdXJjZQogIHdpdGggYW4gYWJz
b2x1dGUgcGF0aCBubyBsb25nZXIgbWFrZXMga2V5IGdlbmVyYXRpb24gZmFpbCB3aXRoICJyYW4K
ICBvdXQgb2Ygc3BhY2UiLiA6Z2w6YCM0Njk1YCA6Z2w6YCExMjkyOWAKCi0gRml4IE9mZmxpbmUg
S1NLIHNpZ25pbmcgd2hlbiB0aGUgS1NLIGFuZCBhIFpTSyBzaGFyZSBhIGtleSB0YWcuCiAgYGAz
MjFkMDEzNjI3YmBgCgogIFdpdGggZG5zc2VjLXBvbGljeSBvZmZsaW5lLWtzaywgdGhlIEtTSyBh
bmQgdGhlIFpTS3MgYXJlIGdlbmVyYXRlZAogIHNlcGFyYXRlbHksIHNvIGEgWlNLIGNhbiBoYXZl
IHRoZSBzYW1lIGtleSB0YWcgYXMgdGhlIEtTSy4gbmFtZWQgdGhlbgogIG1pc3Rvb2sgdGhlIFpT
SyBmb3IgdGhlIEtTSyB3aGVuIHNpZ25pbmcgdGhlIHpvbmU6IHRoZSBETlNLRVkgUlJzZXQKICB3
YXMgbGVmdCB3aXRob3V0IHRoZSBLU0sgc2lnbmF0dXJlIGZyb20gdGhlIGltcG9ydGVkIFNLUiwg
b3IsCiAgZGVwZW5kaW5nIG9uIHRoZSBzaWduaW5nIGFsZ29yaXRobSwgaW1wb3J0aW5nIHRoZSBT
S1IgZmFpbGVkIHdpdGggYQogICJub3QgZXhhY3QiIGVycm9yLiBUaGlzIGhhcyBiZWVuIGZpeGVk
LiA6Z2w6YCM1NTQwYCA6Z2w6YCExMjkxN2AKCi0gT21pdCBwZW5kaW5nIGRhdGEgZnJvbSB0eXBl
LUFOWSBjYWNoZSByZXNwb25zZXMuIGBgYmFkZGNjNDZiMTlgYAoKICBXaGVuIGFuc3dlcmluZyBh
IHR5cGUtQU5ZIHF1ZXJ5IGZyb20gdGhlIGNhY2hlLCBkYXRhIHRoYXQgaGFzbid0IGJlZW4KICB2
YWxpZGF0ZWQgeWV0IHNob3VsZCBvbmx5IGJlIGluY2x1ZGVkIGluIHRoZSByZXNwb25zZSBpZiB0
aGUgcXVlcnkgaGFzCiAgdGhlIENEIGJpdCBzZXQuIDpnbDpgIzU5ODRgIDpnbDpgITEzMDIzYAoK
LSBSbmRjIGFjY2VwdHMgc3RhbGUgb3IgbWlzbWF0Y2hlZCBzaWduZWQgcmVzcG9uc2VzLiBgYGVh
MzJmNWJhYWM3YGAKCiAgVGhlIDppc2NtYW46YHJuZGNgIGNvbW1hbmQgY291bGQgYWNjZXB0IHJl
ZmxlY3RlZCByZXF1ZXN0cyBhcyBhbnN3ZXJzLgogIEFkZGl0aW9uYWxseSwgcmVwbGF5ZWQgcmVz
cG9uc2VzIGNvdWxkIGJlIGFjY2VwdGVkLiBUaGlzIGhhcyBiZWVuCiAgZml4ZWQuIDpnbDpgIzYx
MDFgIDpnbDpgITEyOTIyYAoKLSBNYWtlICJybmRjIC1yIiB3b3JrIHdoZW4gInJuZGMiIGFuZCAi
bmFtZWQiIGFyZSBmcm9tIGRpZmZlcmVudCBidWlsZHMuCiAgYGBhNzE4MDQ4NjJmNWBgCgogIFBy
ZXZpb3VzbHkgOm9wdGlvbjpgcm5kYyAtcmAgd2FzIG9ubHkgZ3VhcmFudGVlZCB0byBkaXNwbGF5
IHRoZSByaWdodAogIHZhbHVlIHdoZW4gcm5kYyBhbmQgbmFtZWQgd2VyZSBmcm9tIHRoZSBzYW1l
IGJ1aWxkLiAgVGhpcyBoYXMgYmVlbgogIGZpeGVkLiA6Z2w6YCM2MTAyYCA6Z2w6YCExMzAxMmAK
Ci0gRG9IIGNsaWVudCBDb250ZW50LVR5cGUgdmFsaWRhdGlvbiBhY2NlcHRlZCBpbnZhbGlkIHZh
bHVlcy4KICBgYDM5MmNiMDBkODA4YGAKCiAgVGhlIENvbnRlbnQtVHlwZSB2YWxpZGF0aW9uIGFj
Y2VwdGVkIGFueSB2YWx1ZSB0aGF0IHN0YXJ0ZWQgd2l0aAogIGBhcHBsaWNhdGlvbi9kbnMtbWVz
c2FnZWAuICBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MTM3YAogIDpnbDpgITEyOTEwYAoK
LSBTZW5kIFRTSUcgd2hlbiBOT1RJRlkgaXMgcmV0cmllZCBvdmVyIFRDUC4gYGAwODI1YWFlM2E2
OGBgCgogIE5PVElGWSBtZXMKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgNTAw
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
ICB8IDIgKy0KIC4uLi9iaW5kL3tiaW5kXzkuMjAuMzAuYmIgPT4gYmluZF85LjIwLjMxLmJifSAg
ICAgICAgICAgICAgICAgfCAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97
YmluZF85LjIwLjMwLmJiID0+IGJpbmRfOS4yMC4zMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKaW5kZXgg
ZDMwMmJjMTQ4MS4uM2EzOGNmOTNmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MWMwODdjMjRlODE2MmM3YTA0MmNmMWYxOWFkMzEzZTBmM2EyMTE5NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYWZlNGI1ZDlhNTQxZjVlZmViODAxMTc0MmNmM2I5M2ZiMjdkYzIxZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVy
LmNvbT4KIERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9n
X2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jv
cy5wYXRjaAppbmRleCBlYjBhZGNmYWJlLi5kOGZmZjZmZmI3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2Nf
Zm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jv
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWE5NzhhNDczMzI4MTIzNTc1YWYwMjcwZGMx
ZGQyNzQwNTBiZGZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWU2MWIyZGU4YThi
MDhkMTg5MDA4ZmNhOWRkYjA2YjZlODQxYmNjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogRnJpLCAxMCBB
cHIgMjAyNiAyMzozMzo0OSArMDAwMAogU3ViamVjdDogW1BBVENIXSBtNDogQmFja3BvcnQgYXhf
cHJvZ19jY19mb3JfYnVpbGQubTQgbWFjcm9zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlk
ZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5w
YXRjaAppbmRleCA1ODcxZmI0MzNjLi43MzAyYzc4NjE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1s
b2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxk
LW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUyNTU3MDc4MWI4NzNjMzQzNGRm
NDlhYzc1M2FmY2E3YzFiZDk2MTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJhYWQ2
NTQ1NjRjNzI3ZjEyNTI4NzgzZjQ5MjFmMzIzYzZjZjU3OGMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBN
b24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9s
d3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0yMCw3ICsyMCw3
IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA0ZDAyYzZlLi4yMjVmNTljIDEw
MDY0NAoraW5kZXggODZlYmY0NC4uYmZlZjg1NSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwog
KysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0Vf
VkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJh
IHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGlu
Zy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggNzMzMDBiNDZlOC4u
NDc3OWNhNzU4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3Vy
ZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0Mzg4YmVjOWE4ZWJkN2Q5ZGRlZDRiMTk0MmE1NjcwY2RhZWMwNjRmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMjhlNTEyNGRkYzMwYTI0ZjJlZjMxZTBiYWIx
ZmJiZDE5YjZkYWI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFr
ZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUg
MTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBm
b3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcgQEAgU2lnbmVk
LW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDc1MDg4ZTUuLjRkMDJjNmUg
MTAwNjQ0CitpbmRleCA5OTkzYjQxLi44NmViZjQ0IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NzIsNyArODcyLDcgQEAgQVNfQ0FTRShbJHdpdGhf
bG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9j
b25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRj
aAppbmRleCBmODhmOTM5NTFmLi5lYzQ1YTYxMWZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1Yzkw
YjYwY2M5ZjMwYzM4M2I4ZTMwYjkwMGFiZDA0YmM5NzdiZDEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGQyNjM0MjA1YjExZTQ4MzFkNjJiMjdjY2FmMzgyYzFhM2RkYjI0MzkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KIERh
dGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmlu
ZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1m
b3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCAzODgzMzViMjcxLi43NzE2NzMxMzk2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRk
LXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9v
dGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNThlMTMwOWU4MDQ0OWVjYzFmYTFmYTc5
MzYzMGI1M2MwOGY5NThlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNDUwMTZjMWU3
MjBjOTFjNWUwODIxYThkNjRlNTUwZGUxYzgyM2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAyNyBNYXIg
MjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBzdXBwb3J0
IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13
b3JrLnBhdGNoCmluZGV4IGJkNmFkYTg4MjIuLjJkNTlhNTRiOGQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13
b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2Ut
ZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhZDlj
YjgyMWExMTlmNDQxZjYxMzFlMDE3MTVkNWUwZWFiMzY4ZmMwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAxOThjYWYyNTA3YTNiNTFiMTFlM2FiYzNhM2FjMjdjZDc1MTUyZGFiIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3ViamVjdDogW1BB
VENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMzAuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjMxLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
MzAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
MzEuYmIKaW5kZXggNDRmMDljZWFhOC4uZDk4MmIxZjZmYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4zMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjMxLmJiCkBAIC0yMSw3ICsyMSw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7UFZ9LnRh
ci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9y
X2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjllMTQ0M2E0MGE3MmEzMDI3MmNiYzMxOTZkMDIwYTZiMmUyNjkzNzExMWM4M2U1OWUx
MDFlODJlMWUzYjRmZWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWJmZWNkNTAzZWM3OTIwOWQz
MjEwNTM2ODljNzk0ZGE5ZjhkYmE5OTNhMjRlOWNkNmJkN2FhODdjZGY0MTIyZiIKIAogVVBTVFJF
QU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93
IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============3961474565949116903==--
