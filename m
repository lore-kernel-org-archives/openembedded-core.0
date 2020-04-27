Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2389.1587979134872889553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 02:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03R9IMjk027125
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 02:18:43 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 27 Apr
 2020 02:18:26 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH] git: Security Advisory - git - CVE-2020-11008
Date: Mon, 27 Apr 2020 17:17:49 +0800
Message-ID: <1587979069-210997-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport the 1st -- 9th patches listed by
<https://github.com/git/git/compare/v2.17.4...v2.17.5>
to solve CVE-2020-11008.

Also backport the 2nd -- 4th patches listed by
<https://github.com/git/git/compare/v2.17.3...v2.17.4>
for CVE-2020-5260 (not necessary, and only the 1st patch is necessary
for this CVE), because some of the above 9 patches are based on them.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/git/git.inc                  |  12 +
 ...edential-use-test_i18ncmp-to-check-stderr.patch |  35 +++
 ...detect-unrepresentable-values-when-parsin.patch | 156 +++++++++++
 ...ct-gitmodules-URLs-with-embedded-newlines.patch | 103 ++++++++
 .../git/git/CVE-2020-11008-1.patch                 |  70 +++++
 .../git/git/CVE-2020-11008-2.patch                 | 292 +++++++++++++++++++++
 .../git/git/CVE-2020-11008-3.patch                 |  97 +++++++
 .../git/git/CVE-2020-11008-4.patch                 | 173 ++++++++++++
 .../git/git/CVE-2020-11008-5.patch                 | 211 +++++++++++++++
 .../git/git/CVE-2020-11008-6.patch                 |  84 ++++++
 .../git/git/CVE-2020-11008-7.patch                 | 206 +++++++++++++++
 .../git/git/CVE-2020-11008-8.patch                 | 114 ++++++++
 .../git/git/CVE-2020-11008-9.patch                 | 114 ++++++++
 13 files changed, 1667 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch
 create mode 100644 meta/recipes-devtools/git/git/0002-credential-detect-unrepresentable-values-when-parsin.patch
 create mode 100644 meta/recipes-devtools/git/git/0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-2.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-3.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-4.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-5.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-6.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-7.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-8.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-11008-9.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 176423e..a0ce162 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -9,6 +9,18 @@ PROVIDES_append_class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
            file://CVE-2020-5260.patch \
+           file://0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch \
+           file://0002-credential-detect-unrepresentable-values-when-parsin.patch \
+           file://0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch \
+           file://CVE-2020-11008-1.patch \
+           file://CVE-2020-11008-2.patch \
+           file://CVE-2020-11008-3.patch \
+           file://CVE-2020-11008-4.patch \
+           file://CVE-2020-11008-5.patch \
+           file://CVE-2020-11008-6.patch \
+           file://CVE-2020-11008-7.patch \
+           file://CVE-2020-11008-8.patch \
+           file://CVE-2020-11008-9.patch \
           "
 
 S = "${WORKDIR}/git-${PV}"
diff --git a/meta/recipes-devtools/git/git/0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch b/meta/recipes-devtools/git/git/0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch
new file mode 100644
index 0000000..6eb3c16
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0001-t-lib-credential-use-test_i18ncmp-to-check-stderr.patch
@@ -0,0 +1,35 @@
+From 70ef9c6ce884b2d466d3d36563f1d2aa31b56443 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Wed, 11 Mar 2020 18:11:37 -0400
+Subject: [PATCH 01/12] t/lib-credential: use test_i18ncmp to check stderr
+
+The credential tests have a "check" function which feeds some input to
+git-credential and checks the stdout and stderr. We look for exact
+matches in the output. For stdout, this makes sense; the output is
+the credential protocol. But for stderr, we may be showing various
+diagnostic messages, or the prompts fed to the askpass program, which
+could be translated. Let's mark them as such.
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ t/lib-credential.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/lib-credential.sh b/t/lib-credential.sh
+index 937b831..bb88cc0 100755
+--- a/t/lib-credential.sh
++++ b/t/lib-credential.sh
+@@ -19,7 +19,7 @@ check() {
+ 		false
+ 	fi &&
+ 	test_cmp expect-stdout stdout &&
+-	test_cmp expect-stderr stderr
++	test_i18ncmp expect-stderr stderr
+ }
+ 
+ read_chunk() {
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/0002-credential-detect-unrepresentable-values-when-parsin.patch b/meta/recipes-devtools/git/git/0002-credential-detect-unrepresentable-values-when-parsin.patch
new file mode 100644
index 0000000..a9b7348
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0002-credential-detect-unrepresentable-values-when-parsin.patch
@@ -0,0 +1,156 @@
+From 43803880b954a020dbffa5250a5b7fd893442c7c Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Thu, 12 Mar 2020 01:31:11 -0400
+Subject: [PATCH 02/12] credential: detect unrepresentable values when parsing
+ urls
+
+The credential protocol can't represent newlines in values, but URLs can
+embed percent-encoded newlines in various components. A previous commit
+taught the low-level writing routines to die() when encountering this,
+but we can be a little friendlier to the user by detecting them earlier
+and handling them gracefully.
+
+This patch teaches credential_from_url() to notice such components,
+issue a warning, and blank the credential (which will generally result
+in prompting the user for a username and password). We blank the whole
+credential in this case. Another option would be to blank only the
+invalid component. However, we're probably better off not feeding a
+partially-parsed URL result to a credential helper. We don't know how a
+given helper would handle it, so we're better off to err on the side of
+matching nothing rather than something unexpected.
+
+The die() call in credential_write() is _probably_ impossible to reach
+after this patch. Values should end up in credential structs only by URL
+parsing (which is covered here), or by reading credential protocol input
+(which by definition cannot read a newline into a value). But we should
+definitely keep the low-level check, as it's our final and most accurate
+line of defense against protocol injection attacks. Arguably it could
+become a BUG(), but it probably doesn't matter much either way.
+
+Note that the public interface of credential_from_url() grows a little
+more than we need here. We'll use the extra flexibility in a future
+patch to help fsck catch these cases.
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c           | 36 ++++++++++++++++++++++++++++++++++--
+ credential.h           | 16 ++++++++++++++++
+ t/t0300-credentials.sh | 12 ++++++++++--
+ 3 files changed, 60 insertions(+), 4 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index a79aff0..2482382 100644
+--- a/credential.c
++++ b/credential.c
+@@ -324,7 +324,22 @@ void credential_reject(struct credential *c)
+ 	c->approved = 0;
+ }
+ 
+-void credential_from_url(struct credential *c, const char *url)
++static int check_url_component(const char *url, int quiet,
++			       const char *name, const char *value)
++{
++	if (!value)
++		return 0;
++	if (!strchr(value, '\n'))
++		return 0;
++
++	if (!quiet)
++		warning(_("url contains a newline in its %s component: %s"),
++			name, url);
++	return -1;
++}
++
++int credential_from_url_gently(struct credential *c, const char *url,
++			       int quiet)
+ {
+ 	const char *at, *colon, *cp, *slash, *host, *proto_end;
+ 
+@@ -338,7 +353,7 @@ void credential_from_url(struct credential *c, const char *url)
+ 	 */
+ 	proto_end = strstr(url, "://");
+ 	if (!proto_end)
+-		return;
++		return 0;
+ 	cp = proto_end + 3;
+ 	at = strchr(cp, '@');
+ 	colon = strchr(cp, ':');
+@@ -373,4 +388,21 @@ void credential_from_url(struct credential *c, const char *url)
+ 		while (p > c->path && *p == '/')
+ 			*p-- = '\0';
+ 	}
++
++	if (check_url_component(url, quiet, "username", c->username) < 0 ||
++	    check_url_component(url, quiet, "password", c->password) < 0 ||
++	    check_url_component(url, quiet, "protocol", c->protocol) < 0 ||
++	    check_url_component(url, quiet, "host", c->host) < 0 ||
++	    check_url_component(url, quiet, "path", c->path) < 0)
++		return -1;
++
++	return 0;
++}
++
++void credential_from_url(struct credential *c, const char *url)
++{
++	if (credential_from_url_gently(c, url, 0) < 0) {
++		warning(_("skipping credential lookup for url: %s"), url);
++		credential_clear(c);
++	}
+ }
+diff --git a/credential.h b/credential.h
+index 6b0cd16..122a23c 100644
+--- a/credential.h
++++ b/credential.h
+@@ -28,7 +28,23 @@ struct credential {
+ 
+ int credential_read(struct credential *, FILE *);
+ void credential_write(const struct credential *, FILE *);
++
++/*
++ * Parse a url into a credential struct, replacing any existing contents.
++ *
++ * Ifthe url can't be parsed (e.g., a missing "proto://" component), the
++ * resulting credential will be empty but we'll still return success from the
++ * "gently" form.
++ *
++ * If we encounter a component which cannot be represented as a credential
++ * value (e.g., because it contains a newline), the "gently" form will return
++ * an error but leave the broken state in the credential object for further
++ * examination.  The non-gentle form will issue a warning to stderr and return
++ * an empty credential.
++ */
+ void credential_from_url(struct credential *, const char *url);
++int credential_from_url_gently(struct credential *, const char *url, int quiet);
++
+ int credential_match(const struct credential *have,
+ 		     const struct credential *want);
+ 
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 26f3c3a..b9c0f1f 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -308,9 +308,17 @@ test_expect_success 'empty helper spec resets helper list' '
+ 	EOF
+ '
+ 
+-test_expect_success 'url parser rejects embedded newlines' '
+-	test_must_fail git credential fill <<-\EOF
++test_expect_success 'url parser ignores embedded newlines' '
++	check fill <<-EOF
+ 	url=https://one.example.com?%0ahost=two.example.com/
++	--
++	username=askpass-username
++	password=askpass-password
++	--
++	warning: url contains a newline in its host component: https://one.example.com?%0ahost=two.example.com/
++	warning: skipping credential lookup for url: https://one.example.com?%0ahost=two.example.com/
++	askpass: Username:
++	askpass: Password:
+ 	EOF
+ '
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch b/meta/recipes-devtools/git/git/0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch
new file mode 100644
index 0000000..23931e6
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0003-fsck-detect-gitmodules-URLs-with-embedded-newlines.patch
@@ -0,0 +1,103 @@
+From 1c9f8cedd34302575db40016231bdf502f17901e Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 27 Apr 2020 13:49:39 +0800
+Subject: [PATCH 03/12] fsck: detect gitmodules URLs with embedded newlines
+
+The credential protocol can't handle values with newlines. We already
+detect and block any such URLs from being used with credential helpers,
+but let's also add an fsck check to detect and block gitmodules files
+with such URLs. That will let us notice the problem earlier when
+transfer.fsckObjects is turned on. And in particular it will prevent bad
+objects from spreading, which may protect downstream users running older
+versions of Git.
+
+We'll file this under the existing gitmodulesUrl flag, which covers URLs
+with option injection. There's really no need to distinguish the exact
+flaw in the URL in this context. Likewise, I've expanded the description
+of t7416 to cover all types of bogus URLs.
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ fsck.c                        | 16 +++++++++++++++-
+ t/t7416-submodule-dash-url.sh | 18 +++++++++++++++++-
+ 2 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/fsck.c b/fsck.c
+index ef8b343..ea46eea 100644
+--- a/fsck.c
++++ b/fsck.c
+@@ -15,6 +15,7 @@
+ #include "packfile.h"
+ #include "submodule-config.h"
+ #include "config.h"
++#include "credential.h"
+ #include "help.h"
+ 
+ static struct oidset gitmodules_found = OIDSET_INIT;
+@@ -947,6 +948,19 @@ static int fsck_tag(struct tag *tag, const char *data,
+ 	return fsck_tag_buffer(tag, data, size, options);
+ }
+ 
++static int check_submodule_url(const char *url)
++{
++	struct credential c = CREDENTIAL_INIT;
++	int ret;
++
++	if (looks_like_command_line_option(url))
++		return -1;
++
++	ret = credential_from_url_gently(&c, url, 1);
++	credential_clear(&c);
++	return ret;
++}
++
+ struct fsck_gitmodules_data {
+ 	struct object *obj;
+ 	struct fsck_options *options;
+@@ -971,7 +985,7 @@ static int fsck_gitmodules_fn(const char *var, const char *value, void *vdata)
+ 				    "disallowed submodule name: %s",
+ 				    name);
+ 	if (!strcmp(key, "url") && value &&
+-	    looks_like_command_line_option(value))
++	    check_submodule_url(value) < 0)
+ 		data->ret |= report(data->options, data->obj,
+ 				    FSCK_MSG_GITMODULES_URL,
+ 				    "disallowed submodule url: %s",
+diff --git a/t/t7416-submodule-dash-url.sh b/t/t7416-submodule-dash-url.sh
+index 5ba041f..41431b1 100755
+--- a/t/t7416-submodule-dash-url.sh
++++ b/t/t7416-submodule-dash-url.sh
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ 
+-test_description='check handling of .gitmodule url with dash'
++test_description='check handling of disallowed .gitmodule urls'
+ . ./test-lib.sh
+ 
+ test_expect_success 'create submodule with protected dash in url' '
+@@ -60,4 +60,20 @@ test_expect_success 'trailing backslash is handled correctly' '
+ 	test_i18ngrep ! "unknown option" err
+ '
+ 
++test_expect_success 'fsck rejects embedded newline in url' '
++	# create an orphan branch to avoid existing .gitmodules objects
++	git checkout --orphan newline &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++	url = "https://one.example.com?%0ahost=two.example.com/foo.git"
++	EOF
++	git add .gitmodules &&
++	git commit -m "gitmodules with newline" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
+ test_done
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-1.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-1.patch
new file mode 100644
index 0000000..9cf98ea
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-1.patch
@@ -0,0 +1,70 @@
+From 863f8067d8b4012904ca3bb881c659ac9894df97 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 27 Apr 2020 14:36:03 +0800
+Subject: [PATCH 04/12] t0300: make "quit" helper more realistic
+
+We test a toy credential helper that writes "quit=1" and confirms that
+we stop running other helpers. However, that helper is unrealistic in
+that it does not bother to read its stdin at all.
+
+For now we don't send any input to it, because we feed git-credential a
+blank credential. But that will change in the next patch, which will
+cause this test to racily fail, as git-credential will get SIGPIPE
+writing to the helper rather than exiting because it was asked to.
+
+Let's make this one-off helper more like our other sample helpers, and
+have it source the "dump" script. That will read stdin, fixing the
+SIGPIPE problem. But it will also write what it sees to stderr. We can
+make the test more robust by checking that output, which confirms that
+we do run the quit helper, don't run any other helpers, and exit for the
+reason we expected.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (1)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ t/t0300-credentials.sh | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index b9c0f1f..0206b3b 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -22,6 +22,11 @@ test_expect_success 'setup helper scripts' '
+ 	exit 0
+ 	EOF
+ 
++	write_script git-credential-quit <<-\EOF &&
++	. ./dump
++	echo quit=1
++	EOF
++
+ 	write_script git-credential-verbatim <<-\EOF &&
+ 	user=$1; shift
+ 	pass=$1; shift
+@@ -291,10 +296,16 @@ test_expect_success 'http paths can be part of context' '
+ 
+ test_expect_success 'helpers can abort the process' '
+ 	test_must_fail git \
+-		-c credential.helper="!f() { echo quit=1; }; f" \
++		-c credential.helper=quit \
+ 		-c credential.helper="verbatim foo bar" \
+-		credential fill >stdout &&
+-	test_must_be_empty stdout
++		credential fill >stdout 2>stderr &&
++	>expect &&
++	test_cmp expect stdout &&
++	cat >expect <<-\EOF &&
++	quit: get
++	fatal: credential helper '\''quit'\'' told us to quit
++	EOF
++	test_i18ncmp expect stderr
+ '
+ 
+ test_expect_success 'empty helper spec resets helper list' '
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-2.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-2.patch
new file mode 100644
index 0000000..c752e3d
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-2.patch
@@ -0,0 +1,292 @@
+From 5588659069214aa0f7fea75a69687078e2f7a817 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Sat, 18 Apr 2020 20:47:30 -0700
+Subject: [PATCH 05/12] t0300: use more realistic inputs
+
+Many of the tests in t0300 give partial inputs to git-credential,
+omitting a protocol or hostname. We're checking only high-level things
+like whether and how helpers are invoked at all, and we don't care about
+specific hosts. However, in preparation for tightening up the rules
+about when we're willing to run a helper, let's start using input that's
+a bit more realistic: pretend as if http://example.com is being
+examined.
+
+This shouldn't change the point of any of the tests, but do note we have
+to adjust the expected output to accommodate this (filling a credential
+will repeat back the protocol/host fields to stdout, and the helper
+debug messages and askpass prompt will change on stderr).
+
+Signed-off-by: Jeff King <peff@peff.net>
+Reviewed-by: Taylor Blau <me@ttaylorr.com>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (2)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ t/t0300-credentials.sh | 89 +++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 85 insertions(+), 4 deletions(-)
+
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 0206b3b..f4c5d7f 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -40,43 +40,71 @@ test_expect_success 'setup helper scripts' '
+ 
+ test_expect_success 'credential_fill invokes helper' '
+ 	check fill "verbatim foo bar" <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=bar
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	EOF
+ '
+ 
+ test_expect_success 'credential_fill invokes multiple helpers' '
+ 	check fill useless "verbatim foo bar" <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=bar
+ 	--
+ 	useless: get
++	useless: protocol=http
++	useless: host=example.com
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	EOF
+ '
+ 
+ test_expect_success 'credential_fill stops when we get a full response' '
+ 	check fill "verbatim one two" "verbatim three four" <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=one
+ 	password=two
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	EOF
+ '
+ 
+ test_expect_success 'credential_fill continues through partial response' '
+ 	check fill "verbatim one \"\"" "verbatim two three" <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=two
+ 	password=three
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: username=one
+ 	EOF
+ '
+@@ -102,14 +130,20 @@ test_expect_success 'credential_fill passes along metadata' '
+ 
+ test_expect_success 'credential_approve calls all helpers' '
+ 	check approve useless "verbatim one two" <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=bar
+ 	--
+ 	--
+ 	useless: store
++	useless: protocol=http
++	useless: host=example.com
+ 	useless: username=foo
+ 	useless: password=bar
+ 	verbatim: store
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: username=foo
+ 	verbatim: password=bar
+ 	EOF
+@@ -117,6 +151,8 @@ test_expect_success 'credential_approve calls all helpers' '
+ 
+ test_expect_success 'do not bother storing password-less credential' '
+ 	check approve useless <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	--
+ 	--
+@@ -126,14 +162,20 @@ test_expect_success 'do not bother storing password-less credential' '
+ 
+ test_expect_success 'credential_reject calls all helpers' '
+ 	check reject useless "verbatim one two" <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=bar
+ 	--
+ 	--
+ 	useless: erase
++	useless: protocol=http
++	useless: host=example.com
+ 	useless: username=foo
+ 	useless: password=bar
+ 	verbatim: erase
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: username=foo
+ 	verbatim: password=bar
+ 	EOF
+@@ -141,33 +183,49 @@ test_expect_success 'credential_reject calls all helpers' '
+ 
+ test_expect_success 'usernames can be preserved' '
+ 	check fill "verbatim \"\" three" <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=one
+ 	--
++	protocol=http
++	host=example.com
+ 	username=one
+ 	password=three
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: username=one
+ 	EOF
+ '
+ 
+ test_expect_success 'usernames can be overridden' '
+ 	check fill "verbatim two three" <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=one
+ 	--
++	protocol=http
++	host=example.com
+ 	username=two
+ 	password=three
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	verbatim: username=one
+ 	EOF
+ '
+ 
+ test_expect_success 'do not bother completing already-full credential' '
+ 	check fill "verbatim three four" <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=one
+ 	password=two
+ 	--
++	protocol=http
++	host=example.com
+ 	username=one
+ 	password=two
+ 	--
+@@ -179,23 +237,31 @@ test_expect_success 'do not bother completing already-full credential' '
+ # askpass helper is run, we know the internal getpass is working.
+ test_expect_success 'empty helper list falls back to internal getpass' '
+ 	check fill <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=askpass-username
+ 	password=askpass-password
+ 	--
+-	askpass: Username:
+-	askpass: Password:
++	askpass: Username for '\''http://example.com'\'':
++	askpass: Password for '\''http://askpass-username@example.com'\'':
+ 	EOF
+ '
+ 
+ test_expect_success 'internal getpass does not ask for known username' '
+ 	check fill <<-\EOF
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	--
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=askpass-password
+ 	--
+-	askpass: Password:
++	askpass: Password for '\''http://foo@example.com'\'':
+ 	EOF
+ '
+ 
+@@ -207,7 +273,11 @@ HELPER="!f() {
+ test_expect_success 'respect configured credentials' '
+ 	test_config credential.helper "$HELPER" &&
+ 	check fill <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=foo
+ 	password=bar
+ 	--
+@@ -298,11 +368,16 @@ test_expect_success 'helpers can abort the process' '
+ 	test_must_fail git \
+ 		-c credential.helper=quit \
+ 		-c credential.helper="verbatim foo bar" \
+-		credential fill >stdout 2>stderr &&
++		credential fill >stdout 2>stderr <<-\EOF &&
++	protocol=http
++	host=example.com
++	EOF
+ 	>expect &&
+ 	test_cmp expect stdout &&
+ 	cat >expect <<-\EOF &&
+ 	quit: get
++	quit: protocol=http
++	quit: host=example.com
+ 	fatal: credential helper '\''quit'\'' told us to quit
+ 	EOF
+ 	test_i18ncmp expect stderr
+@@ -311,11 +386,17 @@ test_expect_success 'helpers can abort the process' '
+ test_expect_success 'empty helper spec resets helper list' '
+ 	test_config credential.helper "verbatim file file" &&
+ 	check fill "" "verbatim cmdline cmdline" <<-\EOF
++	protocol=http
++	host=example.com
+ 	--
++	protocol=http
++	host=example.com
+ 	username=cmdline
+ 	password=cmdline
+ 	--
+ 	verbatim: get
++	verbatim: protocol=http
++	verbatim: host=example.com
+ 	EOF
+ '
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-3.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-3.patch
new file mode 100644
index 0000000..c17e883
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-3.patch
@@ -0,0 +1,97 @@
+From 22f28251ae575dd7a60f7a46853469025d004ca7 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Sat, 18 Apr 2020 20:48:05 -0700
+Subject: [PATCH 06/12] credential: parse URL without host as empty host, not
+ unset
+
+We may feed a URL like "cert:///path/to/cert.pem" into the credential
+machinery to get the key for a client-side certificate. That
+credential has no hostname field, which is about to be disallowed (to
+avoid confusion with protocols where a helper _would_ expect a
+hostname).
+
+This means as of the next patch, credential helpers won't work for
+unlocking certs. Let's fix that by doing two things:
+
+  - when we parse a url with an empty host, set the host field to the
+    empty string (asking only to match stored entries with an empty
+    host) rather than NULL (asking to match _any_ host).
+
+  - when we build a cert:// credential by hand, similarly assign an
+    empty string
+
+It's the latter that is more likely to impact real users in practice,
+since it's what's used for http connections. But we don't have good
+infrastructure to test it.
+
+The url-parsing version will help anybody using git-credential in a
+script, and is easy to test.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Reviewed-by: Taylor Blau <me@ttaylorr.com>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (3)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c           |  3 +--
+ http.c                 |  1 +
+ t/t0300-credentials.sh | 17 +++++++++++++++++
+ 3 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index 2482382..f2413ce 100644
+--- a/credential.c
++++ b/credential.c
+@@ -376,8 +376,7 @@ int credential_from_url_gently(struct credential *c, const char *url,
+ 
+ 	if (proto_end - url > 0)
+ 		c->protocol = xmemdupz(url, proto_end - url);
+-	if (slash - host > 0)
+-		c->host = url_decode_mem(host, slash - host);
++	c->host = url_decode_mem(host, slash - host);
+ 	/* Trim leading and trailing slashes from path */
+ 	while (*slash == '/')
+ 		slash++;
+diff --git a/http.c b/http.c
+index 27aa0a3..c4dfdac 100644
+--- a/http.c
++++ b/http.c
+@@ -558,6 +558,7 @@ static int has_cert_password(void)
+ 		return 0;
+ 	if (!cert_auth.password) {
+ 		cert_auth.protocol = xstrdup("cert");
++		cert_auth.host = xstrdup("");
+ 		cert_auth.username = xstrdup("");
+ 		cert_auth.path = xstrdup(ssl_cert);
+ 		credential_fill(&cert_auth);
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index f4c5d7f..1c1010b 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -414,4 +414,21 @@ test_expect_success 'url parser ignores embedded newlines' '
+ 	EOF
+ '
+ 
++test_expect_success 'host-less URLs are parsed as empty host' '
++	check fill "verbatim foo bar" <<-\EOF
++	url=cert:///path/to/cert.pem
++	--
++	protocol=cert
++	host=
++	path=path/to/cert.pem
++	username=foo
++	password=bar
++	--
++	verbatim: get
++	verbatim: protocol=cert
++	verbatim: host=
++	verbatim: path=path/to/cert.pem
++	EOF
++'
++
+ test_done
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-4.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-4.patch
new file mode 100644
index 0000000..14e2346
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-4.patch
@@ -0,0 +1,173 @@
+From f8bf7099379990ad974c1ca8f51e1f28bf18cf2a Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Sat, 18 Apr 2020 20:50:48 -0700
+Subject: [PATCH 07/12] credential: refuse to operate when missing host or
+ protocol
+
+The credential helper protocol was designed to be very flexible: the
+fields it takes as input are treated as a pattern, and any missing
+fields are taken as wildcards. This allows unusual things like:
+
+  echo protocol=https | git credential reject
+
+to delete all stored https credentials (assuming the helpers themselves
+treat the input that way). But when helpers are invoked automatically by
+Git, this flexibility works against us. If for whatever reason we don't
+have a "host" field, then we'd match _any_ host. When you're filling a
+credential to send to a remote server, this is almost certainly not what
+you want.
+
+Prevent this at the layer that writes to the credential helper. Add a
+check to the credential API that the host and protocol are always passed
+in, and add an assertion to the credential_write function that speaks
+credential helper protocol to be doubly sure.
+
+There are a few ways this can be triggered in practice:
+
+  - the "git credential" command passes along arbitrary credential
+    parameters it reads from stdin.
+
+  - until the previous patch, when the host field of a URL is empty, we
+    would leave it unset (rather than setting it to the empty string)
+
+  - a URL like "example.com/foo.git" is treated by curl as if "http://"
+    was present, but our parser sees it as a non-URL and leaves all
+    fields unset
+
+  - the recent fix for URLs with embedded newlines blanks the URL but
+    otherwise continues. Rather than having the desired effect of
+    looking up no credential at all, many helpers will return _any_
+    credential
+
+Our earlier test for an embedded newline didn't catch this because it
+only checked that the credential was cleared, but didn't configure an
+actual helper. Configuring the "verbatim" helper in the test would show
+that it is invoked (it's obviously a silly helper which doesn't look at
+its input, but the point is that it shouldn't be run at all). Since
+we're switching this case to die(), we don't need to bother with a
+helper. We can see the new behavior just by checking that the operation
+fails.
+
+We'll add new tests covering partial input as well (these can be
+triggered through various means with url-parsing, but it's simpler to
+just check them directly, as we know we are covered even if the url
+parser changes behavior in the future).
+
+[jn: changed to die() instead of logging and showing a manual
+ username/password prompt]
+
+Reported-by: Carlo Arenas <carenas@gmail.com>
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (4)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c           | 20 ++++++++++++++------
+ t/t0300-credentials.sh | 34 ++++++++++++++++++++++++++--------
+ 2 files changed, 40 insertions(+), 14 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index f2413ce..e08ed84 100644
+--- a/credential.c
++++ b/credential.c
+@@ -89,6 +89,11 @@ static int proto_is_http(const char *s)
+ 
+ static void credential_apply_config(struct credential *c)
+ {
++	if (!c->host)
++		die(_("refusing to work with credential missing host field"));
++	if (!c->protocol)
++		die(_("refusing to work with credential missing protocol field"));
++
+ 	if (c->configured)
+ 		return;
+ 	git_config(credential_config_callback, c);
+@@ -191,8 +196,11 @@ int credential_read(struct credential *c, FILE *fp)
+ 	return 0;
+ }
+ 
+-static void credential_write_item(FILE *fp, const char *key, const char *value)
++static void credential_write_item(FILE *fp, const char *key, const char *value,
++				  int required)
+ {
++	if (!value && required)
++		BUG("credential value for %s is missing", key);
+ 	if (!value)
+ 		return;
+ 	if (strchr(value, '\n'))
+@@ -202,11 +210,11 @@ static void credential_write_item(FILE *fp, const char *key, const char *value)
+ 
+ void credential_write(const struct credential *c, FILE *fp)
+ {
+-	credential_write_item(fp, "protocol", c->protocol);
+-	credential_write_item(fp, "host", c->host);
+-	credential_write_item(fp, "path", c->path);
+-	credential_write_item(fp, "username", c->username);
+-	credential_write_item(fp, "password", c->password);
++	credential_write_item(fp, "protocol", c->protocol, 1);
++	credential_write_item(fp, "host", c->host, 1);
++	credential_write_item(fp, "path", c->path, 0);
++	credential_write_item(fp, "username", c->username, 0);
++	credential_write_item(fp, "password", c->password, 0);
+ }
+ 
+ static int run_credential_helper(struct credential *c,
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 1c1010b..646f845 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -400,18 +400,16 @@ test_expect_success 'empty helper spec resets helper list' '
+ 	EOF
+ '
+ 
+-test_expect_success 'url parser ignores embedded newlines' '
+-	check fill <<-EOF
++test_expect_success 'url parser rejects embedded newlines' '
++	test_must_fail git credential fill 2>stderr <<-\EOF &&
+ 	url=https://one.example.com?%0ahost=two.example.com/
+-	--
+-	username=askpass-username
+-	password=askpass-password
+-	--
++	EOF
++	cat >expect <<-\EOF &&
+ 	warning: url contains a newline in its host component: https://one.example.com?%0ahost=two.example.com/
+ 	warning: skipping credential lookup for url: https://one.example.com?%0ahost=two.example.com/
+-	askpass: Username:
+-	askpass: Password:
++	fatal: refusing to work with credential missing host field
+ 	EOF
++	test_i18ncmp expect stderr
+ '
+ 
+ test_expect_success 'host-less URLs are parsed as empty host' '
+@@ -431,4 +429,24 @@ test_expect_success 'host-less URLs are parsed as empty host' '
+ 	EOF
+ '
+ 
++test_expect_success 'credential system refuses to work with missing host' '
++	test_must_fail git credential fill 2>stderr <<-\EOF &&
++	protocol=http
++	EOF
++	cat >expect <<-\EOF &&
++	fatal: refusing to work with credential missing host field
++	EOF
++	test_i18ncmp expect stderr
++'
++
++test_expect_success 'credential system refuses to work with missing protocol' '
++	test_must_fail git credential fill 2>stderr <<-\EOF &&
++	host=example.com
++	EOF
++	cat >expect <<-\EOF &&
++	fatal: refusing to work with credential missing protocol field
++	EOF
++	test_i18ncmp expect stderr
++'
++
+ test_done
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-5.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-5.patch
new file mode 100644
index 0000000..60f8d59
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-5.patch
@@ -0,0 +1,211 @@
+From 3431abe8c0f64f4049a31298c0b1056baa7d81dc Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 27 Apr 2020 14:45:49 +0800
+Subject: [PATCH 08/12] fsck: convert gitmodules url to URL passed to curl
+
+In 07259e74ec1 (fsck: detect gitmodules URLs with embedded newlines,
+2020-03-11), git fsck learned to check whether URLs in .gitmodules could
+be understood by the credential machinery when they are handled by
+git-remote-curl.
+
+However, the check is overbroad: it checks all URLs instead of only
+URLs that would be passed to git-remote-curl. In principle a git:// or
+file:/// URL does not need to follow the same conventions as an http://
+URL; in particular, git:// and file:// protocols are not succeptible to
+issues in the credential API because they do not support attaching
+credentials.
+
+In the HTTP case, the URL in .gitmodules does not always match the URL
+that would be passed to git-remote-curl and the credential machinery:
+Git's URL syntax allows specifying a remote helper followed by a "::"
+delimiter and a URL to be passed to it, so that
+
+	git ls-remote http::https://example.com/repo.git
+
+invokes git-remote-http with https://example.com/repo.git as its URL
+argument. With today's checks, that distinction does not make a
+difference, but for a check we are about to introduce (for empty URL
+schemes) it will matter.
+
+.gitmodules files also support relative URLs. To ensure coverage for the
+https based embedded-newline attack, urldecode and check them directly
+for embedded newlines.
+
+Helped-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Reviewed-by: Jeff King <peff@peff.net>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (5)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ fsck.c                        | 94 ++++++++++++++++++++++++++++++++++++++++---
+ t/t7416-submodule-dash-url.sh | 29 +++++++++++++
+ 2 files changed, 118 insertions(+), 5 deletions(-)
+
+diff --git a/fsck.c b/fsck.c
+index ea46eea..0f21eb1 100644
+--- a/fsck.c
++++ b/fsck.c
+@@ -9,6 +9,7 @@
+ #include "tag.h"
+ #include "fsck.h"
+ #include "refs.h"
++#include "url.h"
+ #include "utf8.h"
+ #include "decorate.h"
+ #include "oidset.h"
+@@ -948,17 +949,100 @@ static int fsck_tag(struct tag *tag, const char *data,
+ 	return fsck_tag_buffer(tag, data, size, options);
+ }
+ 
++/*
++ * Like builtin/submodule--helper.c's starts_with_dot_slash, but without
++ * relying on the platform-dependent is_dir_sep helper.
++ *
++ * This is for use in checking whether a submodule URL is interpreted as
++ * relative to the current directory on any platform, since \ is a
++ * directory separator on Windows but not on other platforms.
++ */
++static int starts_with_dot_slash(const char *str)
++{
++	return str[0] == '.' && (str[1] == '/' || str[1] == '\\');
++}
++
++/*
++ * Like starts_with_dot_slash, this is a variant of submodule--helper's
++ * helper of the same name with the twist that it accepts backslash as a
++ * directory separator even on non-Windows platforms.
++ */
++static int starts_with_dot_dot_slash(const char *str)
++{
++	return str[0] == '.' && starts_with_dot_slash(str + 1);
++}
++
++static int submodule_url_is_relative(const char *url)
++{
++	return starts_with_dot_slash(url) || starts_with_dot_dot_slash(url);
++}
++
++/*
++ * Check whether a transport is implemented by git-remote-curl.
++ *
++ * If it is, returns 1 and writes the URL that would be passed to
++ * git-remote-curl to the "out" parameter.
++ *
++ * Otherwise, returns 0 and leaves "out" untouched.
++ *
++ * Examples:
++ *   http::https://example.com/repo.git -> 1, https://example.com/repo.git
++ *   https://example.com/repo.git -> 1, https://example.com/repo.git
++ *   git://example.com/repo.git -> 0
++ *
++ * This is for use in checking for previously exploitable bugs that
++ * required a submodule URL to be passed to git-remote-curl.
++ */
++static int url_to_curl_url(const char *url, const char **out)
++{
++	/*
++	 * We don't need to check for case-aliases, "http.exe", and so
++	 * on because in the default configuration, is_transport_allowed
++	 * prevents URLs with those schemes from being cloned
++	 * automatically.
++	 */
++	if (skip_prefix(url, "http::", out) ||
++	    skip_prefix(url, "https::", out) ||
++	    skip_prefix(url, "ftp::", out) ||
++	    skip_prefix(url, "ftps::", out))
++		return 1;
++	if (starts_with(url, "http://") ||
++	    starts_with(url, "https://") ||
++	    starts_with(url, "ftp://") ||
++	    starts_with(url, "ftps://")) {
++		*out = url;
++		return 1;
++	}
++	return 0;
++}
++
+ static int check_submodule_url(const char *url)
+ {
+-	struct credential c = CREDENTIAL_INIT;
+-	int ret;
++	const char *curl_url;
+ 
+ 	if (looks_like_command_line_option(url))
+ 		return -1;
+ 
+-	ret = credential_from_url_gently(&c, url, 1);
+-	credential_clear(&c);
+-	return ret;
++	if (submodule_url_is_relative(url)) {
++		/*
++		 * This could be appended to an http URL and url-decoded;
++		 * check for malicious characters.
++		 */
++		char *decoded = url_decode(url);
++		int has_nl = !!strchr(decoded, '\n');
++		free(decoded);
++		if (has_nl)
++			return -1;
++	}
++
++	else if (url_to_curl_url(url, &curl_url)) {
++		struct credential c = CREDENTIAL_INIT;
++		int ret = credential_from_url_gently(&c, curl_url, 1);
++		credential_clear(&c);
++		return ret;
++	}
++
++	return 0;
+ }
+ 
+ struct fsck_gitmodules_data {
+diff --git a/t/t7416-submodule-dash-url.sh b/t/t7416-submodule-dash-url.sh
+index 41431b1..afdd255 100755
+--- a/t/t7416-submodule-dash-url.sh
++++ b/t/t7416-submodule-dash-url.sh
+@@ -60,6 +60,20 @@ test_expect_success 'trailing backslash is handled correctly' '
+ 	test_i18ngrep ! "unknown option" err
+ '
+ 
++test_expect_success 'fsck permits embedded newline with unrecognized scheme' '
++	git checkout --orphan newscheme &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = "data://acjbkd%0akajfdickajkd"
++	EOF
++	git add .gitmodules &&
++	git commit -m "gitmodules with unrecognized scheme" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	git push dst HEAD
++'
++
+ test_expect_success 'fsck rejects embedded newline in url' '
+ 	# create an orphan branch to avoid existing .gitmodules objects
+ 	git checkout --orphan newline &&
+@@ -76,4 +90,19 @@ test_expect_success 'fsck rejects embedded newline in url' '
+ 	grep gitmodulesUrl err
+ '
+ 
++test_expect_success 'fsck rejects embedded newline in relative url' '
++	git checkout --orphan relative-newline &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = "./%0ahost=two.example.com/foo.git"
++	EOF
++	git add .gitmodules &&
++	git commit -m "relative url with newline" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
+ test_done
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-6.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-6.patch
new file mode 100644
index 0000000..6b36893
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-6.patch
@@ -0,0 +1,84 @@
+From 883508bcebe87fbe7fb7392272e930c27c30fdc2 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Sat, 18 Apr 2020 20:53:09 -0700
+Subject: [PATCH 09/12] credential: die() when parsing invalid urls
+
+When we try to initialize credential loading by URL and find that the
+URL is invalid, we set all fields to NULL in order to avoid acting on
+malicious input. Later when we request credentials, we diagonse the
+erroneous input:
+
+	fatal: refusing to work with credential missing host field
+
+This is problematic in two ways:
+
+- The message doesn't tell the user *why* we are missing the host
+  field, so they can't tell from this message alone how to recover.
+  There can be intervening messages after the original warning of
+  bad input, so the user may not have the context to put two and two
+  together.
+
+- The error only occurs when we actually need to get a credential.  If
+  the URL permits anonymous access, the only encouragement the user gets
+  to correct their bogus URL is a quiet warning.
+
+  This is inconsistent with the check we perform in fsck, where any use
+  of such a URL as a submodule is an error.
+
+When we see such a bogus URL, let's not try to be nice and continue
+without helpers. Instead, die() immediately. This is simpler and
+obviously safe. And there's very little chance of disrupting a normal
+workflow.
+
+It's _possible_ that somebody has a legitimate URL with a raw newline in
+it. It already wouldn't work with credential helpers, so this patch
+steps that up from an inconvenience to "we will refuse to work with it
+at all". If such a case does exist, we should figure out a way to work
+with it (especially if the newline is only in the path component, which
+we normally don't even pass to helpers). But until we see a real report,
+we're better off being defensive.
+
+Reported-by: Carlo Arenas <carenas@gmail.com>
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (6)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c           | 6 ++----
+ t/t0300-credentials.sh | 3 +--
+ 2 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index e08ed84..22649d5 100644
+--- a/credential.c
++++ b/credential.c
+@@ -408,8 +408,6 @@ int credential_from_url_gently(struct credential *c, const char *url,
+ 
+ void credential_from_url(struct credential *c, const char *url)
+ {
+-	if (credential_from_url_gently(c, url, 0) < 0) {
+-		warning(_("skipping credential lookup for url: %s"), url);
+-		credential_clear(c);
+-	}
++	if (credential_from_url_gently(c, url, 0) < 0)
++		die(_("credential url cannot be parsed: %s"), url);
+ }
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 646f845..efed3ea 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -406,8 +406,7 @@ test_expect_success 'url parser rejects embedded newlines' '
+ 	EOF
+ 	cat >expect <<-\EOF &&
+ 	warning: url contains a newline in its host component: https://one.example.com?%0ahost=two.example.com/
+-	warning: skipping credential lookup for url: https://one.example.com?%0ahost=two.example.com/
+-	fatal: refusing to work with credential missing host field
++	fatal: credential url cannot be parsed: https://one.example.com?%0ahost=two.example.com/
+ 	EOF
+ 	test_i18ncmp expect stderr
+ '
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-7.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-7.patch
new file mode 100644
index 0000000..5e3b6f1
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-7.patch
@@ -0,0 +1,206 @@
+From 68acf8724e9cb2f67664dd980581c0022401daf0 Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Sat, 18 Apr 2020 20:54:13 -0700
+Subject: [PATCH 10/12] credential: treat URL without scheme as invalid
+
+libcurl permits making requests without a URL scheme specified.  In
+this case, it guesses the URL from the hostname, so I can run
+
+	git ls-remote http::ftp.example.com/path/to/repo
+
+and it would make an FTP request.
+
+Any user intentionally using such a URL is likely to have made a typo.
+Unfortunately, credential_from_url is not able to determine the host and
+protocol in order to determine appropriate credentials to send, and
+until "credential: refuse to operate when missing host or protocol",
+this resulted in another host's credentials being leaked to the named
+host.
+
+Teach credential_from_url_gently to consider such a URL to be invalid
+so that fsck can detect and block gitmodules files with such URLs,
+allowing server operators to avoid serving them to downstream users
+running older versions of Git.
+
+This also means that when such URLs are passed on the command line, Git
+will print a clearer error so affected users can switch to the simpler
+URL that explicitly specifies the host and protocol they intend.
+
+One subtlety: .gitmodules files can contain relative URLs, representing
+a URL relative to the URL they were cloned from.  The relative URL
+resolver used for .gitmodules can follow ".." components out of the path
+part and past the host part of a URL, meaning that such a relative URL
+can be used to traverse from a https://foo.example.com/innocent
+superproject to a https::attacker.example.com/exploit submodule.
+Fortunately a leading ':' in the first path component after a series of
+leading './' and '../' components is unlikely to show up in other
+contexts, so we can catch this by detecting that pattern.
+
+Reported-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Reviewed-by: Jeff King <peff@peff.net>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (7)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c                  |  7 +++++--
+ fsck.c                        | 47 +++++++++++++++++++++++++++++++++++++++++--
+ t/t5550-http-fetch-dumb.sh    |  7 ++-----
+ t/t7416-submodule-dash-url.sh | 32 +++++++++++++++++++++++++++++
+ 4 files changed, 84 insertions(+), 9 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index 22649d5..1e1aed5 100644
+--- a/credential.c
++++ b/credential.c
+@@ -360,8 +360,11 @@ int credential_from_url_gently(struct credential *c, const char *url,
+ 	 *   (3) proto://<user>:<pass>@<host>/...
+ 	 */
+ 	proto_end = strstr(url, "://");
+-	if (!proto_end)
+-		return 0;
++	if (!proto_end) {
++		if (!quiet)
++			warning(_("url has no scheme: %s"), url);
++		return -1;
++	}
+ 	cp = proto_end + 3;
+ 	at = strchr(cp, '@');
+ 	colon = strchr(cp, ':');
+diff --git a/fsck.c b/fsck.c
+index 0f21eb1..30eac29 100644
+--- a/fsck.c
++++ b/fsck.c
+@@ -978,6 +978,34 @@ static int submodule_url_is_relative(const char *url)
+ }
+ 
+ /*
++ * Count directory components that a relative submodule URL should chop
++ * from the remote_url it is to be resolved against.
++ *
++ * In other words, this counts "../" components at the start of a
++ * submodule URL.
++ *
++ * Returns the number of directory components to chop and writes a
++ * pointer to the next character of url after all leading "./" and
++ * "../" components to out.
++ */
++static int count_leading_dotdots(const char *url, const char **out)
++{
++	int result = 0;
++	while (1) {
++		if (starts_with_dot_dot_slash(url)) {
++			result++;
++			url += strlen("../");
++			continue;
++		}
++		if (starts_with_dot_slash(url)) {
++			url += strlen("./");
++			continue;
++		}
++		*out = url;
++		return result;
++	}
++}
++/*
+  * Check whether a transport is implemented by git-remote-curl.
+  *
+  * If it is, returns 1 and writes the URL that would be passed to
+@@ -1024,15 +1052,30 @@ static int check_submodule_url(const char *url)
+ 		return -1;
+ 
+ 	if (submodule_url_is_relative(url)) {
++		char *decoded;
++		const char *next;
++		int has_nl;
++
+ 		/*
+ 		 * This could be appended to an http URL and url-decoded;
+ 		 * check for malicious characters.
+ 		 */
+-		char *decoded = url_decode(url);
+-		int has_nl = !!strchr(decoded, '\n');
++		decoded = url_decode(url);
++		has_nl = !!strchr(decoded, '\n');
++
+ 		free(decoded);
+ 		if (has_nl)
+ 			return -1;
++
++		/*
++		 * URLs which escape their root via "../" can overwrite
++		 * the host field and previous components, resolving to
++		 * URLs like https::example.com/submodule.git that were
++		 * susceptible to CVE-2020-11008.
++		 */
++		if (count_leading_dotdots(url, &next) > 0 &&
++		    *next == ':')
++			return -1;
+ 	}
+ 
+ 	else if (url_to_curl_url(url, &curl_url)) {
+diff --git a/t/t5550-http-fetch-dumb.sh b/t/t5550-http-fetch-dumb.sh
+index b811d89..1c9e5d3 100755
+--- a/t/t5550-http-fetch-dumb.sh
++++ b/t/t5550-http-fetch-dumb.sh
+@@ -321,11 +321,8 @@ test_expect_success 'git client does not send an empty Accept-Language' '
+ '
+ 
+ test_expect_success 'remote-http complains cleanly about malformed urls' '
+-	# do not actually issue "list" or other commands, as we do not
+-	# want to rely on what curl would actually do with such a broken
+-	# URL. This is just about making sure we do not segfault during
+-	# initialization.
+-	test_must_fail git remote-http http::/example.com/repo.git
++	test_must_fail git remote-http http::/example.com/repo.git 2>stderr &&
++	test_i18ngrep "url has no scheme" stderr
+ '
+ 
+ test_expect_success 'redirects can be forbidden/allowed' '
+diff --git a/t/t7416-submodule-dash-url.sh b/t/t7416-submodule-dash-url.sh
+index afdd255..249dc3d 100755
+--- a/t/t7416-submodule-dash-url.sh
++++ b/t/t7416-submodule-dash-url.sh
+@@ -60,6 +60,38 @@ test_expect_success 'trailing backslash is handled correctly' '
+ 	test_i18ngrep ! "unknown option" err
+ '
+ 
++test_expect_success 'fsck rejects missing URL scheme' '
++	git checkout --orphan missing-scheme &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = http::one.example.com/foo.git
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "gitmodules with missing URL scheme" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
++test_expect_success 'fsck rejects relative URL resolving to missing scheme' '
++	git checkout --orphan relative-missing-scheme &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = "..\\../.\\../:one.example.com/foo.git"
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "gitmodules with relative URL that strips off scheme" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
+ test_expect_success 'fsck permits embedded newline with unrecognized scheme' '
+ 	git checkout --orphan newscheme &&
+ 	cat >.gitmodules <<-\EOF &&
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-8.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-8.patch
new file mode 100644
index 0000000..935d477
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-8.patch
@@ -0,0 +1,114 @@
+From 5e06d0781a963d62413ae7eab4eb78cc7195af8b Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Sat, 18 Apr 2020 20:54:57 -0700
+Subject: [PATCH 11/12] credential: treat URL with empty scheme as invalid
+
+Until "credential: refuse to operate when missing host or protocol",
+Git's credential handling code interpreted URLs with empty scheme to
+mean "give me credentials matching this host for any protocol".
+
+Luckily libcurl does not recognize such URLs (it tries to look for a
+protocol named "" and fails). Just in case that changes, let's reject
+them within Git as well. This way, credential_from_url is guaranteed to
+always produce a "struct credential" with protocol and host set.
+
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (8)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c                  |  5 ++---
+ t/t5550-http-fetch-dumb.sh    |  9 +++++++++
+ t/t7416-submodule-dash-url.sh | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 43 insertions(+), 3 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index 1e1aed5..cf11cc9 100644
+--- a/credential.c
++++ b/credential.c
+@@ -360,7 +360,7 @@ int credential_from_url_gently(struct credential *c, const char *url,
+ 	 *   (3) proto://<user>:<pass>@<host>/...
+ 	 */
+ 	proto_end = strstr(url, "://");
+-	if (!proto_end) {
++	if (!proto_end || proto_end == url) {
+ 		if (!quiet)
+ 			warning(_("url has no scheme: %s"), url);
+ 		return -1;
+@@ -385,8 +385,7 @@ int credential_from_url_gently(struct credential *c, const char *url,
+ 		host = at + 1;
+ 	}
+ 
+-	if (proto_end - url > 0)
+-		c->protocol = xmemdupz(url, proto_end - url);
++	c->protocol = xmemdupz(url, proto_end - url);
+ 	c->host = url_decode_mem(host, slash - host);
+ 	/* Trim leading and trailing slashes from path */
+ 	while (*slash == '/')
+diff --git a/t/t5550-http-fetch-dumb.sh b/t/t5550-http-fetch-dumb.sh
+index 1c9e5d3..ea2688b 100755
+--- a/t/t5550-http-fetch-dumb.sh
++++ b/t/t5550-http-fetch-dumb.sh
+@@ -325,6 +325,15 @@ test_expect_success 'remote-http complains cleanly about malformed urls' '
+ 	test_i18ngrep "url has no scheme" stderr
+ '
+ 
++# NEEDSWORK: Writing commands to git-remote-curl can race against the latter
++# erroring out, producing SIGPIPE. Remove "ok=sigpipe" once transport-helper has
++# learned to handle early remote helper failures more cleanly.
++test_expect_success 'remote-http complains cleanly about empty scheme' '
++	test_must_fail ok=sigpipe git ls-remote \
++		http::${HTTPD_URL#http}/dumb/repo.git 2>stderr &&
++	test_i18ngrep "url has no scheme" stderr
++'
++
+ test_expect_success 'redirects can be forbidden/allowed' '
+ 	test_must_fail git -c http.followRedirects=false \
+ 		clone $HTTPD_URL/dumb-redir/repo.git dumb-redir &&
+diff --git a/t/t7416-submodule-dash-url.sh b/t/t7416-submodule-dash-url.sh
+index 249dc3d..9309040 100755
+--- a/t/t7416-submodule-dash-url.sh
++++ b/t/t7416-submodule-dash-url.sh
+@@ -92,6 +92,38 @@ test_expect_success 'fsck rejects relative URL resolving to missing scheme' '
+ 	grep gitmodulesUrl err
+ '
+ 
++test_expect_success 'fsck rejects empty URL scheme' '
++	git checkout --orphan empty-scheme &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = http::://one.example.com/foo.git
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "gitmodules with empty URL scheme" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
++test_expect_success 'fsck rejects relative URL resolving to empty scheme' '
++	git checkout --orphan relative-empty-scheme &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = ../../../:://one.example.com/foo.git
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "relative gitmodules URL resolving to empty scheme" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
+ test_expect_success 'fsck permits embedded newline with unrecognized scheme' '
+ 	git checkout --orphan newscheme &&
+ 	cat >.gitmodules <<-\EOF &&
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2020-11008-9.patch b/meta/recipes-devtools/git/git/CVE-2020-11008-9.patch
new file mode 100644
index 0000000..22292db
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-11008-9.patch
@@ -0,0 +1,114 @@
+From 2e084e25fa454c58a600c9434f776f2150037a76 Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Sat, 18 Apr 2020 20:57:22 -0700
+Subject: [PATCH 12/12] fsck: reject URL with empty host in .gitmodules
+
+Git's URL parser interprets
+
+	https:///example.com/repo.git
+
+to have no host and a path of "example.com/repo.git".  Curl, on the
+other hand, internally redirects it to https://example.com/repo.git.  As
+a result, until "credential: parse URL without host as empty host, not
+unset", tricking a user into fetching from such a URL would cause Git to
+send credentials for another host to example.com.
+
+Teach fsck to block and detect .gitmodules files using such a URL to
+prevent sharing them with Git versions that are not yet protected.
+
+A relative URL in a .gitmodules file could also be used to trigger this.
+The relative URL resolver used for .gitmodules does not normalize
+sequences of slashes and can follow ".." components out of the path part
+and to the host part of a URL, meaning that such a relative URL can be
+used to traverse from a https://foo.example.com/innocent superproject to
+a https:///attacker.example.com/exploit submodule. Fortunately,
+redundant extra slashes in .gitmodules are rare, so we can catch this by
+detecting one after a leading sequence of "./" and "../" components.
+
+Helped-by: Jeff King <peff@peff.net>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Reviewed-by: Jeff King <peff@peff.net>
+
+Upstream-Status: Backport
+CVE: CVE-2020-11008 (9)
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ fsck.c                        | 10 +++++++---
+ t/t7416-submodule-dash-url.sh | 32 ++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 3 deletions(-)
+
+diff --git a/fsck.c b/fsck.c
+index 30eac29..00077b1 100644
+--- a/fsck.c
++++ b/fsck.c
+@@ -1070,17 +1070,21 @@ static int check_submodule_url(const char *url)
+ 		/*
+ 		 * URLs which escape their root via "../" can overwrite
+ 		 * the host field and previous components, resolving to
+-		 * URLs like https::example.com/submodule.git that were
++		 * URLs like https::example.com/submodule.git and
++		 * https:///example.com/submodule.git that were
+ 		 * susceptible to CVE-2020-11008.
+ 		 */
+ 		if (count_leading_dotdots(url, &next) > 0 &&
+-		    *next == ':')
++		    (*next == ':' || *next == '/'))
+ 			return -1;
+ 	}
+ 
+ 	else if (url_to_curl_url(url, &curl_url)) {
+ 		struct credential c = CREDENTIAL_INIT;
+-		int ret = credential_from_url_gently(&c, curl_url, 1);
++		int ret = 0;
++		if (credential_from_url_gently(&c, curl_url, 1) ||
++		    !*c.host)
++			ret = -1;
+ 		credential_clear(&c);
+ 		return ret;
+ 	}
+diff --git a/t/t7416-submodule-dash-url.sh b/t/t7416-submodule-dash-url.sh
+index 9309040..eec96e0 100755
+--- a/t/t7416-submodule-dash-url.sh
++++ b/t/t7416-submodule-dash-url.sh
+@@ -124,6 +124,38 @@ test_expect_success 'fsck rejects relative URL resolving to empty scheme' '
+ 	grep gitmodulesUrl err
+ '
+ 
++test_expect_success 'fsck rejects empty hostname' '
++	git checkout --orphan empty-host &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = http:///one.example.com/foo.git
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "gitmodules with extra slashes" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
++test_expect_success 'fsck rejects relative url that produced empty hostname' '
++	git checkout --orphan messy-relative &&
++	cat >.gitmodules <<-\EOF &&
++	[submodule "foo"]
++		url = ../../..//one.example.com/foo.git
++	EOF
++	git add .gitmodules &&
++	test_tick &&
++	git commit -m "gitmodules abusing relative_path" &&
++	test_when_finished "rm -rf dst" &&
++	git init --bare dst &&
++	git -C dst config transfer.fsckObjects true &&
++	test_must_fail git push dst HEAD 2>err &&
++	grep gitmodulesUrl err
++'
++
+ test_expect_success 'fsck permits embedded newline with unrecognized scheme' '
+ 	git checkout --orphan newscheme &&
+ 	cat >.gitmodules <<-\EOF &&
+-- 
+1.9.1
+
-- 
1.9.1

