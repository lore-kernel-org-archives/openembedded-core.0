Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 55D297EF45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:23:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2019 17:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,292,1559545200"; d="scan'208";a="169105913"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2019 17:23:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 08:22:56 +0800
Message-Id: <20190722002257.12494-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] iptables: upgrade 1.8.2 -> 1.8.3
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
X-List-Received-Date: Mon, 22 Jul 2019 00:23:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Remove upstreamed patches and manually package symlinks which aren't
handled by do_split_package.

Changelog:
http://git.netfilter.org/iptables/log/?qt=range&q=v1.8.3...v1.8.2

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...format-security-fixes-in-libipt_icmp.patch |  61 ---------
 .../iptables/iptables/CVE-2019-11360.patch    | 117 ------------------
 .../{iptables_1.8.2.bb => iptables_1.8.3.bb}  |  13 +-
 3 files changed, 9 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.2.bb => iptables_1.8.3.bb} (84%)

diff --git a/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch b/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
deleted file mode 100644
index e26594d19b..0000000000
--- a/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 907e429d7548157016cd51aba4adc5d0c7d9f816 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Adam=20Go=C5=82=C4=99biowski?= <adamg@pld-linux.org>
-Date: Wed, 14 Nov 2018 07:35:28 +0100
-Subject: extensions: format-security fixes in libip[6]t_icmp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-commit 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
-introduced support for gcc feature to check format string against passed
-argument.  This commit adds missing bits to extenstions's libipt_icmp.c
-and libip6t_icmp6.c that were causing build to fail.
-
-Fixes: 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
-Signed-off-by: Adam Gołębiowski <adamg@pld-linux.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
----
- extensions/libip6t_icmp6.c | 4 ++--
- extensions/libipt_icmp.c   | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/extensions/libip6t_icmp6.c b/extensions/libip6t_icmp6.c
-index 45a71875..cc7bfaeb 100644
---- a/extensions/libip6t_icmp6.c
-+++ b/extensions/libip6t_icmp6.c
-@@ -230,7 +230,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 	type_name = icmp6_type_xlate(icmptype);
- 
- 	if (type_name) {
--		xt_xlate_add(xl, type_name);
-+		xt_xlate_add(xl, "%s", type_name);
- 	} else {
- 		for (i = 0; i < ARRAY_SIZE(icmpv6_codes); ++i)
- 			if (icmpv6_codes[i].type == icmptype &&
-@@ -239,7 +239,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 				break;
- 
- 		if (i != ARRAY_SIZE(icmpv6_codes))
--			xt_xlate_add(xl, icmpv6_codes[i].name);
-+			xt_xlate_add(xl, "%s", icmpv6_codes[i].name);
- 		else
- 			return 0;
- 	}
-diff --git a/extensions/libipt_icmp.c b/extensions/libipt_icmp.c
-index 54189976..e76257c5 100644
---- a/extensions/libipt_icmp.c
-+++ b/extensions/libipt_icmp.c
-@@ -236,7 +236,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
- 			if (icmp_codes[i].type == icmptype &&
- 			    icmp_codes[i].code_min == code_min &&
- 			    icmp_codes[i].code_max == code_max) {
--				xt_xlate_add(xl, icmp_codes[i].name);
-+				xt_xlate_add(xl, "%s", icmp_codes[i].name);
- 				return 1;
- 			}
- 	}
--- 
-cgit v1.2.1
-
diff --git a/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch b/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch
deleted file mode 100644
index f67164fbcc..0000000000
--- a/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 2ae1099a42e6a0f06de305ca13a842ac83d4683e Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Mon, 22 Apr 2019 23:17:27 +0200
-Subject: [PATCH] xshared: check for maximum buffer length in
- add_param_to_argv()
-
-Bail out if we go over the boundary, based on patch from Sebastian.
-
-Reported-by: Sebastian Neef <contact@0day.work>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
-CVE: CVE-2019-11360
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- iptables/xshared.c | 46 ++++++++++++++++++++++++++++------------------
- 1 file changed, 28 insertions(+), 18 deletions(-)
-
-diff --git a/iptables/xshared.c b/iptables/xshared.c
-index fb186fb1..36a2ec5f 100644
---- a/iptables/xshared.c
-+++ b/iptables/xshared.c
-@@ -433,10 +433,24 @@ void save_argv(void)
- 	}
- }
- 
-+struct xt_param_buf {
-+	char	buffer[1024];
-+	int 	len;
-+};
-+
-+static void add_param(struct xt_param_buf *param, const char *curchar)
-+{
-+	param->buffer[param->len++] = *curchar;
-+	if (param->len >= sizeof(param->buffer))
-+		xtables_error(PARAMETER_PROBLEM,
-+			      "Parameter too long!");
-+}
-+
- void add_param_to_argv(char *parsestart, int line)
- {
--	int quote_open = 0, escaped = 0, param_len = 0;
--	char param_buffer[1024], *curchar;
-+	int quote_open = 0, escaped = 0;
-+	struct xt_param_buf param = {};
-+	char *curchar;
- 
- 	/* After fighting with strtok enough, here's now
- 	 * a 'real' parser. According to Rusty I'm now no
-@@ -445,7 +459,7 @@ void add_param_to_argv(char *parsestart, int line)
- 	for (curchar = parsestart; *curchar; curchar++) {
- 		if (quote_open) {
- 			if (escaped) {
--				param_buffer[param_len++] = *curchar;
-+				add_param(&param, curchar);
- 				escaped = 0;
- 				continue;
- 			} else if (*curchar == '\\') {
-@@ -455,7 +469,7 @@ void add_param_to_argv(char *parsestart, int line)
- 				quote_open = 0;
- 				*curchar = '"';
- 			} else {
--				param_buffer[param_len++] = *curchar;
-+				add_param(&param, curchar);
- 				continue;
- 			}
- 		} else {
-@@ -471,36 +485,32 @@ void add_param_to_argv(char *parsestart, int line)
- 		case ' ':
- 		case '\t':
- 		case '\n':
--			if (!param_len) {
-+			if (!param.len) {
- 				/* two spaces? */
- 				continue;
- 			}
- 			break;
- 		default:
- 			/* regular character, copy to buffer */
--			param_buffer[param_len++] = *curchar;
--
--			if (param_len >= sizeof(param_buffer))
--				xtables_error(PARAMETER_PROBLEM,
--					      "Parameter too long!");
-+			add_param(&param, curchar);
- 			continue;
- 		}
- 
--		param_buffer[param_len] = '\0';
-+		param.buffer[param.len] = '\0';
- 
- 		/* check if table name specified */
--		if ((param_buffer[0] == '-' &&
--		     param_buffer[1] != '-' &&
--		     strchr(param_buffer, 't')) ||
--		    (!strncmp(param_buffer, "--t", 3) &&
--		     !strncmp(param_buffer, "--table", strlen(param_buffer)))) {
-+		if ((param.buffer[0] == '-' &&
-+		     param.buffer[1] != '-' &&
-+		     strchr(param.buffer, 't')) ||
-+		    (!strncmp(param.buffer, "--t", 3) &&
-+		     !strncmp(param.buffer, "--table", strlen(param.buffer)))) {
- 			xtables_error(PARAMETER_PROBLEM,
- 				      "The -t option (seen in line %u) cannot be used in %s.\n",
- 				      line, xt_params->program_name);
- 		}
- 
--		add_argv(param_buffer, 0);
--		param_len = 0;
-+		add_argv(param.buffer, 0);
-+		param.len = 0;
- 	}
- }
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/iptables/iptables_1.8.2.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
similarity index 84%
rename from meta/recipes-extended/iptables/iptables_1.8.2.bb
rename to meta/recipes-extended/iptables/iptables_1.8.3.bb
index 8d8483d95c..6ac3fc60c5 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-           file://0003-extensions-format-security-fixes-in-libipt_icmp.patch  \
-           file://CVE-2019-11360.patch \
 "
 
-SRC_URI[md5sum] = "944558e88ddcc3b9b0d9550070fa3599"
-SRC_URI[sha256sum] = "a3778b50ed1a3256f9ca975de82c2204e508001fc2471238c8c97f3d1c4c12af"
+SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
+SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
 
 inherit autotools pkgconfig
 
@@ -49,6 +47,13 @@ python populate_packages_prepend() {
 
 FILES_${PN} += "${datadir}/xtables"
 
+# Include the symlinks as well in respective packages
+FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
+FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
+
+INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
+INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
+
 ALLOW_EMPTY_${PN}-modules = "1"
 
 RDEPENDS_${PN} = "${PN}-module-xt-standard"
-- 
2.20.1


