Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 027997F133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 07:35:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J7ZvYT026263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 00:35:57 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 19 Jul 2019 00:35:56 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 15:35:46 +0800
Message-ID: <1563521746-117517-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] iptables: Security Advisory - iptables - CVE-2019-11360
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
X-List-Received-Date: Fri, 19 Jul 2019 07:35:57 -0000
Content-Type: text/plain

Porting patch from <https://git.netfilter.org/iptables/commit/iptables/
xshared.c?id=2ae1099a42e6a0f06de305ca13a842ac83d4683e> to solve
CVE-2019-11360.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../iptables/iptables/CVE-2019-11360.patch         | 117 +++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.8.2.bb   |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch

diff --git a/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch b/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch
new file mode 100644
index 0000000..f67164f
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/CVE-2019-11360.patch
@@ -0,0 +1,117 @@
+From 2ae1099a42e6a0f06de305ca13a842ac83d4683e Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Mon, 22 Apr 2019 23:17:27 +0200
+Subject: [PATCH] xshared: check for maximum buffer length in
+ add_param_to_argv()
+
+Bail out if we go over the boundary, based on patch from Sebastian.
+
+Reported-by: Sebastian Neef <contact@0day.work>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-11360
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ iptables/xshared.c | 46 ++++++++++++++++++++++++++++------------------
+ 1 file changed, 28 insertions(+), 18 deletions(-)
+
+diff --git a/iptables/xshared.c b/iptables/xshared.c
+index fb186fb1..36a2ec5f 100644
+--- a/iptables/xshared.c
++++ b/iptables/xshared.c
+@@ -433,10 +433,24 @@ void save_argv(void)
+ 	}
+ }
+ 
++struct xt_param_buf {
++	char	buffer[1024];
++	int 	len;
++};
++
++static void add_param(struct xt_param_buf *param, const char *curchar)
++{
++	param->buffer[param->len++] = *curchar;
++	if (param->len >= sizeof(param->buffer))
++		xtables_error(PARAMETER_PROBLEM,
++			      "Parameter too long!");
++}
++
+ void add_param_to_argv(char *parsestart, int line)
+ {
+-	int quote_open = 0, escaped = 0, param_len = 0;
+-	char param_buffer[1024], *curchar;
++	int quote_open = 0, escaped = 0;
++	struct xt_param_buf param = {};
++	char *curchar;
+ 
+ 	/* After fighting with strtok enough, here's now
+ 	 * a 'real' parser. According to Rusty I'm now no
+@@ -445,7 +459,7 @@ void add_param_to_argv(char *parsestart, int line)
+ 	for (curchar = parsestart; *curchar; curchar++) {
+ 		if (quote_open) {
+ 			if (escaped) {
+-				param_buffer[param_len++] = *curchar;
++				add_param(&param, curchar);
+ 				escaped = 0;
+ 				continue;
+ 			} else if (*curchar == '\\') {
+@@ -455,7 +469,7 @@ void add_param_to_argv(char *parsestart, int line)
+ 				quote_open = 0;
+ 				*curchar = '"';
+ 			} else {
+-				param_buffer[param_len++] = *curchar;
++				add_param(&param, curchar);
+ 				continue;
+ 			}
+ 		} else {
+@@ -471,36 +485,32 @@ void add_param_to_argv(char *parsestart, int line)
+ 		case ' ':
+ 		case '\t':
+ 		case '\n':
+-			if (!param_len) {
++			if (!param.len) {
+ 				/* two spaces? */
+ 				continue;
+ 			}
+ 			break;
+ 		default:
+ 			/* regular character, copy to buffer */
+-			param_buffer[param_len++] = *curchar;
+-
+-			if (param_len >= sizeof(param_buffer))
+-				xtables_error(PARAMETER_PROBLEM,
+-					      "Parameter too long!");
++			add_param(&param, curchar);
+ 			continue;
+ 		}
+ 
+-		param_buffer[param_len] = '\0';
++		param.buffer[param.len] = '\0';
+ 
+ 		/* check if table name specified */
+-		if ((param_buffer[0] == '-' &&
+-		     param_buffer[1] != '-' &&
+-		     strchr(param_buffer, 't')) ||
+-		    (!strncmp(param_buffer, "--t", 3) &&
+-		     !strncmp(param_buffer, "--table", strlen(param_buffer)))) {
++		if ((param.buffer[0] == '-' &&
++		     param.buffer[1] != '-' &&
++		     strchr(param.buffer, 't')) ||
++		    (!strncmp(param.buffer, "--t", 3) &&
++		     !strncmp(param.buffer, "--table", strlen(param.buffer)))) {
+ 			xtables_error(PARAMETER_PROBLEM,
+ 				      "The -t option (seen in line %u) cannot be used in %s.\n",
+ 				      line, xt_params->program_name);
+ 		}
+ 
+-		add_argv(param_buffer, 0);
+-		param_len = 0;
++		add_argv(param.buffer, 0);
++		param.len = 0;
+ 	}
+ }
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/iptables/iptables_1.8.2.bb b/meta/recipes-extended/iptables/iptables_1.8.2.bb
index ad2c1a6..8d8483d 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
            file://0003-extensions-format-security-fixes-in-libipt_icmp.patch  \
+           file://CVE-2019-11360.patch \
 "
 
 SRC_URI[md5sum] = "944558e88ddcc3b9b0d9550070fa3599"
-- 
1.9.1


