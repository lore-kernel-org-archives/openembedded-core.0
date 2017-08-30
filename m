Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.33])
	by mail.openembedded.org (Postfix) with ESMTP id B428F77FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:10:38 +0000 (UTC)
Received: from 1dmzxG-0003cf-V6 by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1dmzxG-0003cy-VT
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Aug 2017 03:10:38 -0700
Received: by emcmailer; Wed, 30 Aug 2017 03:10:38 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1dmzxG-0003cf-V6 for openembedded-core@lists.openembedded.org;
	Wed, 30 Aug 2017 03:10:38 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Wed, 30 Aug 2017 12:10:38 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Aug 2017 12:10:27 +0200
Message-ID: <1504087827-35456-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][pyro] connman: Fix for CVE-2017-12865
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
X-List-Received-Date: Wed, 30 Aug 2017 10:10:39 -0000
Content-Type: text/plain

dnsproxy: Fix crash on malformed DNS response
If the response query string is malformed, we might access memory
pass the end of "name" variable in parse_response().

[YOCTO #11959]

(From OE-Core rev: fb3e30e45eea2042fdb0b667cbc2c79ae3f5a1a9)

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Conflicts:
	meta/recipes-connectivity/connman/connman_1.33.bb
---
 .../connman/connman/CVE-2017-12865.patch           | 87 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch b/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
new file mode 100644
index 0000000..45f78f1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
@@ -0,0 +1,87 @@
+From 5c281d182ecdd0a424b64f7698f32467f8f67b71 Mon Sep 17 00:00:00 2001
+From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
+Date: Wed, 9 Aug 2017 10:16:46 +0300
+Subject: dnsproxy: Fix crash on malformed DNS response
+
+If the response query string is malformed, we might access memory
+pass the end of "name" variable in parse_response().
+
+CVE: CVE-2017-12865
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/patch/?id=5c281d182ecdd0a424b64f7698f32467f8f67b71]
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ src/dnsproxy.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 38ac5bf..40b4f15 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -838,7 +838,7 @@ static struct cache_entry *cache_check(gpointer request, int *qtype, int proto)
+ static int get_name(int counter,
+ 		unsigned char *pkt, unsigned char *start, unsigned char *max,
+ 		unsigned char *output, int output_max, int *output_len,
+-		unsigned char **end, char *name, int *name_len)
++		unsigned char **end, char *name, size_t max_name, int *name_len)
+ {
+ 	unsigned char *p;
+ 
+@@ -859,7 +859,7 @@ static int get_name(int counter,
+ 
+ 			return get_name(counter + 1, pkt, pkt + offset, max,
+ 					output, output_max, output_len, end,
+-					name, name_len);
++					name, max_name, name_len);
+ 		} else {
+ 			unsigned label_len = *p;
+ 
+@@ -869,6 +869,9 @@ static int get_name(int counter,
+ 			if (*output_len > output_max)
+ 				return -ENOBUFS;
+ 
++			if ((*name_len + 1 + label_len + 1) > max_name)
++				return -ENOBUFS;
++
+ 			/*
+ 			 * We need the original name in order to check
+ 			 * if this answer is the correct one.
+@@ -900,14 +903,14 @@ static int parse_rr(unsigned char *buf, unsigned char *start,
+ 			unsigned char *response, unsigned int *response_size,
+ 			uint16_t *type, uint16_t *class, int *ttl, int *rdlen,
+ 			unsigned char **end,
+-			char *name)
++			char *name, size_t max_name)
+ {
+ 	struct domain_rr *rr;
+ 	int err, offset;
+ 	int name_len = 0, output_len = 0, max_rsp = *response_size;
+ 
+ 	err = get_name(0, buf, start, max, response, max_rsp,
+-		&output_len, end, name, &name_len);
++			&output_len, end, name, max_name, &name_len);
+ 	if (err < 0)
+ 		return err;
+ 
+@@ -1033,7 +1036,8 @@ static int parse_response(unsigned char *buf, int buflen,
+ 		memset(rsp, 0, sizeof(rsp));
+ 
+ 		ret = parse_rr(buf, ptr, buf + buflen, rsp, &rsp_len,
+-			type, class, ttl, &rdlen, &next, name);
++			type, class, ttl, &rdlen, &next, name,
++			sizeof(name) - 1);
+ 		if (ret != 0) {
+ 			err = ret;
+ 			goto out;
+@@ -1099,7 +1103,7 @@ static int parse_response(unsigned char *buf, int buflen,
+ 			 */
+ 			ret = get_name(0, buf, next - rdlen, buf + buflen,
+ 					rsp, rsp_len, &output_len, &end,
+-					name, &name_len);
++					name, sizeof(name) - 1, &name_len);
+ 			if (ret != 0) {
+ 				/* just ignore the error at this point */
+ 				ptr = next;
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 4129b05..ee04d9b 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -6,6 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://no-version-scripts.patch \
             file://includes.patch \
             file://0003-stats-Fix-bad-file-descriptor-initialisation.patch \
+            file://CVE-2017-12865.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
-- 
1.9.1


