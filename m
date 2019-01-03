Return-Path: <Haitao.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AAAE260745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 06:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x03666aO027421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 22:06:07 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 2 Jan 2019 22:06:06 -0800
From: Liu Haitao <haitao.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 13:48:38 +0800
Message-ID: <1546494518-131926-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] iw: fix parsing of WEP keys
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
X-List-Received-Date: Thu, 03 Jan 2019 06:06:06 -0000
Content-Type: text/plain

The current iw4.14 has a fatal bug that could casue a Segmentation fault
when parsing WEP keys. The issue has been fixed by upstream.
[https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit/?id=0e39f109c4b8155697a12ef090b59cdb304c8c44]


Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 ...0001-connect-fix-parsing-of-WEP-keys.patch | 194 ++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.14.bb       |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch

diff --git a/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch b/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch
new file mode 100644
index 0000000000..8cf8f7ab38
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw/0001-connect-fix-parsing-of-WEP-keys.patch
@@ -0,0 +1,194 @@
+From 2a6be4166fd718be0694fe8a6e3f1013c125dee2 Mon Sep 17 00:00:00 2001
+From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Date: Tue, 12 Jun 2018 09:01:56 +0300
+Subject: [PATCH] connect: fix parsing of WEP keys
+
+The introduction of MFP options added a bug that causes a
+segmentation fault when parsing WEP keys.
+Fix that.
+
+Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit/?id=0e39f109c4b8155697a12ef090b59cdb304c8c44]
+Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
+---
+ ap.c      |  2 +-
+ connect.c |  7 ++-----
+ ibss.c    |  2 +-
+ iw.h      |  3 ++-
+ util.c    | 36 ++++++++++++++++++------------------
+ 5 files changed, 24 insertions(+), 26 deletions(-)
+
+diff --git a/ap.c b/ap.c
+index 4bab5b9..dcce402 100644
+--- a/ap.c
++++ b/ap.c
+@@ -116,7 +116,7 @@ static int handle_start_ap(struct nl80211_state *state,
+ 	argv++;
+ 	argc--;
+ 
+-	return parse_keys(msg, argv, argc);
++	return parse_keys(msg, &argv, &argc);
+  nla_put_failure:
+ 	return -ENOSPC;
+ }
+diff --git a/connect.c b/connect.c
+index 339fc73..4a847a1 100644
+--- a/connect.c
++++ b/connect.c
+@@ -54,13 +54,10 @@ static int iw_conn(struct nl80211_state *state,
+ 	argv++;
+ 	argc--;
+ 
+-	ret = parse_keys(msg, argv, argc);
++	ret = parse_keys(msg, &argv, &argc);
+ 	if (ret)
+ 		return ret;
+ 
+-	argc -= 4;
+-	argv += 4;
+-
+ 	if (!argc)
+ 		return 0;
+ 
+@@ -228,7 +225,7 @@ static int iw_auth(struct nl80211_state *state,
+ 	argv++;
+ 	argc--;
+ 
+-	return parse_keys(msg, argv, argc);
++	return parse_keys(msg, &argv, &argc);
+  nla_put_failure:
+ 	return -ENOSPC;
+ }
+diff --git a/ibss.c b/ibss.c
+index 84f1e95..d77fc92 100644
+--- a/ibss.c
++++ b/ibss.c
+@@ -115,7 +115,7 @@ static int join_ibss(struct nl80211_state *state,
+ 	argv++;
+ 	argc--;
+ 
+-	return parse_keys(msg, argv, argc);
++	return parse_keys(msg, &argv, &argc);
+  nla_put_failure:
+ 	return -ENOSPC;
+ }
+diff --git a/iw.h b/iw.h
+index ee7ca20..8767ed3 100644
+--- a/iw.h
++++ b/iw.h
+@@ -180,7 +180,8 @@ int parse_hex_mask(char *hexmask, unsigned char **result, size_t *result_len,
+ 		   unsigned char **mask);
+ unsigned char *parse_hex(char *hex, size_t *outlen);
+ 
+-int parse_keys(struct nl_msg *msg, char **argv, int argc);
++
++int parse_keys(struct nl_msg *msg, char **argv[], int *argc);
+ int parse_freqchan(struct chandef *chandef, bool chan, int argc, char **argv, int *parsed);
+ enum nl80211_chan_width str_to_bw(const char *str);
+ int put_chandef(struct nl_msg *msg, struct chandef *chandef);
+diff --git a/util.c b/util.c
+index 6e0ddff..122c019 100644
+--- a/util.c
++++ b/util.c
+@@ -417,23 +417,23 @@ static int parse_cipher_suite(const char *cipher_str)
+ 	return -EINVAL;
+ }
+ 
+-int parse_keys(struct nl_msg *msg, char **argv, int argc)
++int parse_keys(struct nl_msg *msg, char **argv[], int *argc)
+ {
+ 	struct nlattr *keys;
+ 	int i = 0;
+ 	bool have_default = false;
+-	char *arg = *argv;
++	char *arg = **argv;
+ 	char keybuf[13];
+ 	int pos = 0;
+ 
+-	if (!argc)
++	if (!*argc)
+ 		return 1;
+ 
+ 	if (!memcmp(&arg[pos], "psk", 3)) {
+ 		char psk_keybuf[32];
+ 		int cipher_suite, akm_suite;
+ 
+-		if (argc < 4)
++		if (*argc < 4)
+ 			goto explain;
+ 
+ 		pos+=3;
+@@ -451,9 +451,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
+ 		NLA_PUT(msg, NL80211_ATTR_PMK, 32, psk_keybuf);
+ 		NLA_PUT_U32(msg, NL80211_ATTR_AUTH_TYPE, NL80211_AUTHTYPE_OPEN_SYSTEM);
+ 
+-		argv++;
+-		argc--;
+-		arg = *argv;
++		*argv += 1;
++		*argc -= 1;
++		arg = **argv;
+ 
+ 		akm_suite = parse_akm_suite(arg);
+ 		if (akm_suite < 0)
+@@ -461,9 +461,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
+ 
+ 		NLA_PUT_U32(msg, NL80211_ATTR_AKM_SUITES, akm_suite);
+ 
+-		argv++;
+-		argc--;
+-		arg = *argv;
++		*argv += 1;
++		*argc -= 1;
++		arg = **argv;
+ 
+ 		cipher_suite = parse_cipher_suite(arg);
+ 		if (cipher_suite < 0)
+@@ -471,9 +471,9 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
+ 
+ 		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITES_PAIRWISE, cipher_suite);
+ 
+-		argv++;
+-		argc--;
+-		arg = *argv;
++		*argv += 1;
++		*argc -= 1;
++		arg = **argv;
+ 
+ 		cipher_suite = parse_cipher_suite(arg);
+ 		if (cipher_suite < 0)
+@@ -495,7 +495,7 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
+ 		struct nlattr *key = nla_nest_start(msg, ++i);
+ 		char *keydata;
+ 
+-		arg = *argv;
++		arg = **argv;
+ 		pos = 0;
+ 
+ 		if (!key)
+@@ -537,15 +537,15 @@ int parse_keys(struct nl_msg *msg, char **argv, int argc)
+ 
+ 		NLA_PUT(msg, NL80211_KEY_DATA, keylen, keydata);
+ 
+-		argv++;
+-		argc--;
++		*argv += 1;
++		*argc -= 1;
+ 
+ 		/* one key should be TX key */
+-		if (!have_default && !argc)
++		if (!have_default && !*argc)
+ 			NLA_PUT_FLAG(msg, NL80211_KEY_DEFAULT);
+ 
+ 		nla_nest_end(msg, key);
+-	} while (argc);
++	} while (*argc);
+ 
+ 	nla_nest_end(msg, keys);
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/iw/iw_4.14.bb b/meta/recipes-connectivity/iw/iw_4.14.bb
index e1b17de4c3..f414a4b1dc 100644
--- a/meta/recipes-connectivity/iw/iw_4.14.bb
+++ b/meta/recipes-connectivity/iw/iw_4.14.bb
@@ -12,6 +12,7 @@ DEPENDS = "libnl"
 SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
            file://separate-objdir.patch \
+           file://0001-connect-fix-parsing-of-WEP-keys.patch \
 "
 
 SRC_URI[md5sum] = "2067516ca9940fdb8c091ee3250da374"
-- 
2.17.1


