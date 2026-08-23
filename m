Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E7C5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:24:39 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14312.1787491472479731273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gAxxNtcP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202608231324302054f958a5000207d2-hvkthp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608231324302054f958a5000207d2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:24:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=I31X4Ra1pn4jQzFQRfmafqQNkhkmIcMepRBIbV0/H3s=;
 b=gAxxNtcPc7UJfT1APZUx7UApGRjasiOyKZqbHwDDmq01XdF7r1uJCRm4dMdSVKsfwHfrN7
 HNsyC59KML9RRAQWnLydvTnXmg4dzMl03ZzTmMhdA7DBHiAPEImuV/ZlwSNcXHmxgNy9P2Or
 G10jHZ+2a9fmyZ9RqV93MsSv/ijVtyD6fHCcJx/cihuu5KnzSAJ9GLEtwF98gMRGUhKjSUhI
 jkL2NZFFBYMkVmSaACYq5SYDFNqP6AvhducKuiyUewSw76o8P3XrfZZGXY6Kye32YDrRY9F5
 85z1Ms5LZvHUR/RADOKq5kKOtSpnvlxmY+Mm8cQUmuq9X+NsxC6SjPWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 1/2] libevent: upgrade 2.1.12 -> 2.1.13
Date: Sun, 23 Aug 2026 15:24:19 +0200
Message-ID: <20260823132420.2028476-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244030

From: Ross Burton <ross.burton@arm.com>

Security Fixes (evtag, evrpc):

  Fix an out-of-bounds read in decode_tag_internal.
  (Found by @Brubbish. GHSA-fj29-64w6-73h6)

  Fix an integer overflow in evtag_unmarshal_header.
  (Found by @Brubbish. GHSA-45c6-qx49-89m8)

Security Fixes (evhttp):

  Discard HTTP trailers, to prevent header smuggling attacks.
  (Found by @sebastianosrt. GHSA-2gmv-p5m7-98p6)

  Restrict HTTP header parsing to prevent request smuggling.
  (Originally reported by @xclow3n; and then by @kodareef5,
  @nstaller0490, @AsafMeizneer, and @yaotushaozhu.
  GHSA-q39v-w2g7-gr8j.)

  Treat CRLF and %00 more strictly in HTTP headers, to prevent
  parser mismatch attacks.
  (Reported by @xclow3n and @AsafMeizner. See GHSA-q39v-w2g7-gr8j,
  GHSA-jcwh-pvf2-73p2.)

  Fix a heap out-of-bound write that could occur when using
  AF_UNIX sockets and compiling libevent with -DNDEBUG.
  (Found by @mat-mo. GHSA-cvq5-vrvr-j338)

Security fixes (evbuffer, bufferevent):

  Fixed a dangling pointer in evbuffer_add_reference.
  (Found by @DarkaMaul. GHSA-c2pj-cg4r-88c8)

Security fixes (evdns):

  Fix an out-of-bounds write in dnsname_to_labels
  when building a DNS response of 2^16 bytes.
  (Found by @sectroyer. GHSA-58rx-7448-jw47)

Security fixes (example code):

  Avoid using strcpy() in sample/http-server.c.
  (Reported by @sectroyer. GHSA-5rgj-2c58-7jrc.)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 9ae7030db6f5c415de94b6d85eaac418ae1e0f7b)
Full release notes:
* https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
Unpatched CVE statuses will get fixed with backport of latest cve-tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...s_dns.c-patch-out-tests-that-require-a-wo.patch |  8 ++++----
 ...s.h-Increase-default-timeval-tolerance-50.patch | 10 +++++-----
 ...-util-monotonic_prc_fallback-as-retriable.patch | 11 ++++-------
 ...e-tests-are-marked-failed-only-when-all-a.patch |  9 +++------
 .../libevent/Makefile-missing-test-dir.patch       | 14 ++++++++++----
 .../{libevent_2.1.12.bb => libevent_2.1.13.bb}     |  2 +-
 6 files changed, 27 insertions(+), 27 deletions(-)
 rename meta/recipes-support/libevent/{libevent_2.1.12.bb => libevent_2.1.13.bb} (95%)

diff --git a/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
index 505153d285..bab94a17ec 100644
--- a/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
+++ b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
@@ -1,4 +1,4 @@
-From 7c17967b8fd2d18b74a8934fd9bb8212ebd6a271 Mon Sep 17 00:00:00 2001
+From 3444b04844a0cd75050d16e9382427f0f431a948 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 13:22:46 +0100
 Subject: [PATCH] test/regress_dns.c: patch out tests that require a working
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/test/regress_dns.c b/test/regress_dns.c
-index d2084b7..a1a8f3b 100644
+index 9a8bff4..7449e94 100644
 --- a/test/regress_dns.c
 +++ b/test/regress_dns.c
-@@ -2394,8 +2394,6 @@ struct testcase_t dns_testcases[] = {
+@@ -2459,8 +2459,6 @@ struct testcase_t dns_testcases[] = {
  	{ "reissue_disable_when_inactive", dns_reissue_disable_when_inactive_test,
  	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
  	{ "inflight", dns_inflight_test, TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
@@ -26,7 +26,7 @@ index d2084b7..a1a8f3b 100644
  #ifdef EVENT__HAVE_SETRLIMIT
  	{ "bufferevent_connect_hostname_emfile", test_bufferevent_connect_hostname,
  	  TT_FORK|TT_NEED_BASE, &basic_setup, (char*)"emfile" },
-@@ -2405,8 +2403,6 @@ struct testcase_t dns_testcases[] = {
+@@ -2470,8 +2468,6 @@ struct testcase_t dns_testcases[] = {
  	{ "disable_when_inactive_no_ns", dns_disable_when_inactive_no_ns_test,
  	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
  
diff --git a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
index 0b20eda3c0..effb825f31 100644
--- a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
+++ b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
@@ -1,4 +1,4 @@
-From dff8fd27edb23bc1486809186c6a4fe1f75f2179 Mon Sep 17 00:00:00 2001
+From 64f2b035a1073c9f594036b46521e19dac029ec2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 22 Apr 2021 22:35:59 -0400
 Subject: [PATCH] test/regress.h: Increase default timeval tolerance 50 ms ->
@@ -11,7 +11,7 @@ related tests in arm64 QEMU.
 See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14163
 (The root cause seems to be a heavy load)
 
-Upstream-Status: Submitted [https://github.com/libevent/libevent/pull/1157]
+Upstream-Status: Backport [https://github.com/libevent/libevent/pull/1157]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
@@ -19,10 +19,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/regress.h b/test/regress.h
-index f06a7669..829af4a7 100644
+index 43cb4ea..21cfb5f 100644
 --- a/test/regress.h
 +++ b/test/regress.h
-@@ -127,7 +127,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
+@@ -123,7 +123,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
  	tt_int_op(labs(timeval_msec_diff((tv1), (tv2)) - diff), <=, tolerance)
  
  #define test_timeval_diff_eq(tv1, tv2, diff)				\
@@ -30,4 +30,4 @@ index f06a7669..829af4a7 100644
 +	test_timeval_diff_leq((tv1), (tv2), (diff), 100)
  
  long timeval_msec_diff(const struct timeval *start, const struct timeval *end);
-
+ 
diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
index ddc19c495f..aa0d4f9ef1 100644
--- a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
@@ -1,20 +1,20 @@
-From d01a57a998798da977c470f3b8d6a457c1adb144 Mon Sep 17 00:00:00 2001
+From 9ad27391a97157eb8cee84a7e9cc3dc93df34cbb Mon Sep 17 00:00:00 2001
 From: Azat Khuzhin <azat@libevent.org>
 Date: Sun, 19 Sep 2021 00:57:31 +0300
 Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
 
 Refs: #1193
 
-Upstream-Status: Backport
+Upstream-Status: Backport [https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934]
 ---
  test/regress_util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/regress_util.c b/test/regress_util.c
-index 45caa2700a40..a9e80db20149 100644
+index fd149b3..10244d6 100644
 --- a/test/regress_util.c
 +++ b/test/regress_util.c
-@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
+@@ -1674,7 +1674,7 @@ struct testcase_t util_testcases[] = {
  	{ "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
  	{ "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
  	{ "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
@@ -23,6 +23,3 @@ index 45caa2700a40..a9e80db20149 100644
  	{ "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
  	{ "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
  	{ "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
--- 
-2.31.1
-
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
index 26b707ad31..4cb2a6d7bc 100644
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -1,4 +1,4 @@
-From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00 2001
+From 59ab048f0fe32fb8d8e43214f93c32b53148419c Mon Sep 17 00:00:00 2001
 From: Thomas Perrot <thomas.perrot@bootlin.com>
 Date: Wed, 29 Sep 2021 13:50:35 +0200
 Subject: [PATCH] test: retriable tests are marked failed only when all
@@ -15,7 +15,7 @@ Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
  2 files changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/test/tinytest.c b/test/tinytest.c
-index 85dfe74a720e..bf2882418eb6 100644
+index 85dfe74..bf28824 100644
 --- a/test/tinytest.c
 +++ b/test/tinytest.c
 @@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t *group,
@@ -64,7 +64,7 @@ index 85dfe74a720e..bf2882418eb6 100644
  
  			switch (test_ret_err) {
 diff --git a/test/tinytest.h b/test/tinytest.h
-index d321dd467542..c276b5339331 100644
+index d321dd4..c276b53 100644
 --- a/test/tinytest.h
 +++ b/test/tinytest.h
 @@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned long);
@@ -76,6 +76,3 @@ index d321dd467542..c276b5339331 100644
  
  void tinytest_set_aliases(const struct testlist_alias_t *aliases);
  
--- 
-2.31.1
-
diff --git a/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
index 8880bd0407..c54a2b7bb0 100644
--- a/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
+++ b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
@@ -1,4 +1,7 @@
-Fix missing test directory creation.
+From c16d91420b94701065d3bdfdf96c41e0710c3bc8 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Tue, 25 Apr 2017 08:11:48 +0200
+Subject: [PATCH] Fix missing test directory creation.
 
 GCC used in OE-core has "dependency tracking" disabled and
 libevent has problem with this.
@@ -12,12 +15,15 @@ Workaround specific to our build system.
 
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ test/include.am | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/libevent-2.1.8-stable/test/include.am b/libevent-2.1.8-stable/test/include.am
-index eea249f..d323dff 100644
+diff --git a/test/include.am b/test/include.am
+index 0437524..48c7307 100644
 --- a/test/include.am
 +++ b/test/include.am
-@@ -161,6 +161,7 @@ test_bench_httpclient_LDADD = $(LIBEVENT_GC_SECTIONS) libevent_core.la
+@@ -162,6 +162,7 @@ test_bench_httpclient_LDADD = $(LIBEVENT_GC_SECTIONS) libevent_core.la
  test/regress.gen.c test/regress.gen.h: test/rpcgen-attempted
  
  test/rpcgen-attempted: test/regress.rpc event_rpcgen.py test/rpcgen_wrapper.sh
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
similarity index 95%
rename from meta/recipes-support/libevent/libevent_2.1.12.bb
rename to meta/recipes-support/libevent/libevent_2.1.13.bb
index 8bb6d90d70..431018f0f3 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}-stable/${BP}-stable.tar.gz
            file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch \
            "
 
-SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
+SRC_URI[sha256sum] = "f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c"
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>.+)-stable"
 
 S = "${UNPACKDIR}/${BPN}-${PV}-stable"

