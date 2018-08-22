Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2A40979406
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:37:15 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b15-v6so3121853oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tXxvtm4dAFgH9/q+gd2KCZWbVVAyANFyOzvqD4JGCk0=;
	b=BZ1ZGyX7ZTtMC2sC22cgQmwcbtCDv3dGvYcszKPQqpAk3bwzuzihhfdZW8nDfJPn4G
	XYnTbG1TJMSywxWMNFT5MAdCMrMQJP2+nuz2EFxiXw3iPZUCgA9V0jx2ChMKljT5ckJx
	o+e5w95/U9i5Tgqluq+3xIoz3aJnWXnLbFwqS7hV8Y73xblLALKAQj1WB94xysJ3ebm4
	mmoXfPbzDKSEc5DY8eIVKKn+oFKdPPlE0o8d4h1VsVLD95Ko7p2BsQzN2JgqUuviCvjs
	tIuti1pvnlOhvyGmfo+B3aznDl2XRAKZLEWYFsfSKwR+EKETHShUfscMXe1uxAjojUj/
	ECCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tXxvtm4dAFgH9/q+gd2KCZWbVVAyANFyOzvqD4JGCk0=;
	b=YyeHWl8sysQUYrHeRMu96Sey/7WslMISmCLy6wCLhaDcR51KeqWOWNqAI4dBjxgHA6
	VZ4cKfwlAqG8EI6ukueRDK87xJOhBZ4IqyHV/tsPg+8ttuvRtA9FDH3xRWtfOK2bDHJG
	YIXpBeyjCFKHuDI0AZ7g0pwJwebF4gLITdvR8xAQYy3cR0Nho8jwjdUSskr1joH02EKe
	KOASdI7seyohSZ8NwYrGLE7uOjcUFRivsedW4YH1ttr6QNUNe6Bqm2Vm/94O3hi65q2Z
	4vSxd21vSQ+vYqquRKth7+kYTaPodyI2lU52Lguu3AGQKIcWIOImri0lWWmJA0R6CKpR
	d1Fw==
X-Gm-Message-State: APzg51C84WJF7130CmQgviS0Gm4o/vu5UpEzO/C8YIl9BLMYvUHmQAGs
	LSzLkklCi7Xx4q+O5jyWh+RO8DnxaV4=
X-Google-Smtp-Source: ANB0VdaxmoTQrcJhd50BrBYhqY6bRnJkiLJ6payUNyImrvsFfYW826kYSTvEjbIROX5BYvyE2BgO0A==
X-Received: by 2002:aca:4914:: with SMTP id w20-v6mr4355739oia.5.1534945035837;
	Wed, 22 Aug 2018 06:37:15 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:37:15 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:37 +0530
Message-Id: <1534944940-21566-31-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 31/34] git: CVE-2018-11235
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
X-List-Received-Date: Wed, 22 Aug 2018 13:37:15 -0000

submodule-config: verify submodule names as paths

Submodule "names" come from the untrusted .gitmodules file,
but we blindly append them to $GIT_DIR/modules to create our
on-disk repo paths. This means you can do bad things by
putting "../" into the name (among other things).

Let's sanity-check these names to avoid building a path that
can be exploited. There are two main decisions:

  1. What should the allowed syntax be?

     It's tempting to reuse verify_path(), since submodule
     names typically come from in-repo paths. But there are
     two reasons not to:

       a. It's technically more strict than what we need, as
          we really care only about breaking out of the
          $GIT_DIR/modules/ hierarchy.  E.g., having a
          submodule named "foo/.git" isn't actually
          dangerous, and it's possible that somebody has
          manually given such a funny name.

       b. Since we'll eventually use this checking logic in
          fsck to prevent downstream repositories, it should
          be consistent across platforms. Because
          verify_path() relies on is_dir_sep(), it wouldn't
          block "foo\..\bar" on a non-Windows machine.

  2. Where should we enforce it? These days most of the
     .gitmodules reads go through submodule-config.c, so
     I've put it there in the reading step. That should
     cover all of the C code.

     We also construct the name for "git submodule add"
     inside the git-submodule.sh script. This is probably
     not a big deal for security since the name is coming
     from the user anyway, but it would be polite to remind
     them if the name they pick is invalid (and we need to
     expose the name-checker to the shell anyway for our
     test scripts).

     This patch issues a warning when reading .gitmodules
     and just ignores the related config entry completely.
     This will generally end up producing a sensible error,
     as it works the same as a .gitmodules file which is
     missing a submodule entry (so "submodule update" will
     barf, but "git clone --recurse-submodules" will print
     an error but not abort the clone.

     There is one minor oddity, which is that we print the
     warning once per malformed config key (since that's how
     the config subsystem gives us the entries). So in the
     new test, for example, the user would see three
     warnings. That's OK, since the intent is that this case
     should never come up outside of malicious repositories
     (and then it might even benefit the user to see the
     message multiple times).

Credit for finding this vulnerability and the proof of
concept from which the test script was adapted goes to
Etienne Stalmans.

Affects: git < 2.13.7 and  git < 2.14.4 and git < 2.15.2 and git < 2.16.4 and
         git < 2.17.1

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../git/files/CVE-2018-11235.patch                 | 288 +++++++++++++++++++++
 meta/recipes-devtools/git/git.inc                  |   3 +-
 2 files changed, 290 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2018-11235.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2018-11235.patch b/meta/recipes-devtools/git/files/CVE-2018-11235.patch
new file mode 100644
index 0000000..b774d2f
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2018-11235.patch
@@ -0,0 +1,288 @@
+From 0383bbb9015898cbc79abd7b64316484d7713b44 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Mon, 30 Apr 2018 03:25:25 -0400
+Subject: [PATCH] submodule-config: verify submodule names as paths
+
+Submodule "names" come from the untrusted .gitmodules file,
+but we blindly append them to $GIT_DIR/modules to create our
+on-disk repo paths. This means you can do bad things by
+putting "../" into the name (among other things).
+
+Let's sanity-check these names to avoid building a path that
+can be exploited. There are two main decisions:
+
+  1. What should the allowed syntax be?
+
+     It's tempting to reuse verify_path(), since submodule
+     names typically come from in-repo paths. But there are
+     two reasons not to:
+
+       a. It's technically more strict than what we need, as
+          we really care only about breaking out of the
+          $GIT_DIR/modules/ hierarchy.  E.g., having a
+          submodule named "foo/.git" isn't actually
+          dangerous, and it's possible that somebody has
+          manually given such a funny name.
+
+       b. Since we'll eventually use this checking logic in
+          fsck to prevent downstream repositories, it should
+          be consistent across platforms. Because
+          verify_path() relies on is_dir_sep(), it wouldn't
+          block "foo\..\bar" on a non-Windows machine.
+
+  2. Where should we enforce it? These days most of the
+     .gitmodules reads go through submodule-config.c, so
+     I've put it there in the reading step. That should
+     cover all of the C code.
+
+     We also construct the name for "git submodule add"
+     inside the git-submodule.sh script. This is probably
+     not a big deal for security since the name is coming
+     from the user anyway, but it would be polite to remind
+     them if the name they pick is invalid (and we need to
+     expose the name-checker to the shell anyway for our
+     test scripts).
+
+     This patch issues a warning when reading .gitmodules
+     and just ignores the related config entry completely.
+     This will generally end up producing a sensible error,
+     as it works the same as a .gitmodules file which is
+     missing a submodule entry (so "submodule update" will
+     barf, but "git clone --recurse-submodules" will print
+     an error but not abort the clone.
+
+     There is one minor oddity, which is that we print the
+     warning once per malformed config key (since that's how
+     the config subsystem gives us the entries). So in the
+     new test, for example, the user would see three
+     warnings. That's OK, since the intent is that this case
+     should never come up outside of malicious repositories
+     (and then it might even benefit the user to see the
+     message multiple times).
+
+Credit for finding this vulnerability and the proof of
+concept from which the test script was adapted goes to
+Etienne Stalmans.
+
+CVE: CVE-2018-11235
+Upstream-Status: Backport [https://github.com/gitster/git/commit/0383bbb9015898cbc79abd7b64316484d7713b44#diff-1772b951776d1647ca31a2256f7fe88f]
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ builtin/submodule--helper.c | 24 ++++++++++++++
+ git-submodule.sh            |  5 +++
+ submodule-config.c          | 31 ++++++++++++++++++
+ submodule-config.h          |  7 +++++
+ t/t7415-submodule-names.sh  | 76 +++++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 143 insertions(+)
+ create mode 100755 t/t7415-submodule-names.sh
+
+diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
+index cbb17a902..b4b4d29d8 100644
+--- a/builtin/submodule--helper.c
++++ b/builtin/submodule--helper.c
+@@ -1195,6 +1195,29 @@ static int is_active(int argc, const char **argv, const char *prefix)
+ 	return !is_submodule_initialized(argv[1]);
+ }
+ 
++/*
++ * Exit non-zero if any of the submodule names given on the command line is
++ * invalid. If no names are given, filter stdin to print only valid names
++ * (which is primarily intended for testing).
++ */
++static int check_name(int argc, const char **argv, const char *prefix)
++{
++	if (argc > 1) {
++		while (*++argv) {
++			if (check_submodule_name(*argv) < 0)
++				return 1;
++		}
++	} else {
++		struct strbuf buf = STRBUF_INIT;
++		while (strbuf_getline(&buf, stdin) != EOF) {
++			if (!check_submodule_name(buf.buf))
++				printf("%s\n", buf.buf);
++		}
++		strbuf_release(&buf);
++	}
++	return 0;
++}
++
+ #define SUPPORT_SUPER_PREFIX (1<<0)
+ 
+ struct cmd_struct {
+@@ -1216,6 +1239,7 @@ static struct cmd_struct commands[] = {
+ 	{"push-check", push_check, 0},
+ 	{"absorb-git-dirs", absorb_git_dirs, SUPPORT_SUPER_PREFIX},
+ 	{"is-active", is_active, 0},
++	{"check-name", check_name, 0},
+ };
+ 
+ int cmd_submodule__helper(int argc, const char **argv, const char *prefix)
+diff --git a/git-submodule.sh b/git-submodule.sh
+index c0d0e9a4c..92750b9e2 100755
+--- a/git-submodule.sh
++++ b/git-submodule.sh
+@@ -228,6 +228,11 @@ Use -f if you really want to add it." >&2
+ 		sm_name="$sm_path"
+ 	fi
+ 
++	if ! git submodule--helper check-name "$sm_name"
++	then
++		die "$(eval_gettext "'$sm_name' is not a valid submodule name")"
++	fi
++
+ 	# perhaps the path exists and is already a git repo, else clone it
+ 	if test -e "$sm_path"
+ 	then
+diff --git a/submodule-config.c b/submodule-config.c
+index 4f58491dd..de54351c6 100644
+--- a/submodule-config.c
++++ b/submodule-config.c
+@@ -163,6 +163,31 @@ static struct submodule *cache_lookup_name(struct submodule_cache *cache,
+ 	return NULL;
+ }
+ 
++int check_submodule_name(const char *name)
++{
++	/* Disallow empty names */
++	if (!*name)
++		return -1;
++
++	/*
++	 * Look for '..' as a path component. Check both '/' and '\\' as
++	 * separators rather than is_dir_sep(), because we want the name rules
++	 * to be consistent across platforms.
++	 */
++	goto in_component; /* always start inside component */
++	while (*name) {
++		char c = *name++;
++		if (c == '/' || c == '\\') {
++in_component:
++			if (name[0] == '.' && name[1] == '.' &&
++			    (!name[2] || name[2] == '/' || name[2] == '\\'))
++				return -1;
++		}
++	}
++
++	return 0;
++}
++
+ static int name_and_item_from_var(const char *var, struct strbuf *name,
+ 				  struct strbuf *item)
+ {
+@@ -174,6 +199,12 @@ static int name_and_item_from_var(const char *var, struct strbuf *name,
+ 		return 0;
+ 
+ 	strbuf_add(name, subsection, subsection_len);
++	if (check_submodule_name(name->buf) < 0) {
++		warning(_("ignoring suspicious submodule name: %s"), name->buf);
++		strbuf_release(name);
++		return 0;
++	}
++
+ 	strbuf_addstr(item, key);
+ 
+ 	return 1;
+diff --git a/submodule-config.h b/submodule-config.h
+index d434ecdb4..103cc79dd 100644
+--- a/submodule-config.h
++++ b/submodule-config.h
+@@ -35,4 +35,11 @@ extern int gitmodule_sha1_from_commit(const unsigned char *commit_sha1,
+ 				      struct strbuf *rev);
+ extern void submodule_free(void);
+ 
++/*
++ * Returns 0 if the name is syntactically acceptable as a submodule "name"
++ * (e.g., that may be found in the subsection of a .gitmodules file) and -1
++ * otherwise.
++ */
++int check_submodule_name(const char *name);
++
+ #endif /* SUBMODULE_CONFIG_H */
+diff --git a/t/t7415-submodule-names.sh b/t/t7415-submodule-names.sh
+new file mode 100755
+index 000000000..75fa071c6
+--- /dev/null
++++ b/t/t7415-submodule-names.sh
+@@ -0,0 +1,76 @@
++#!/bin/sh
++
++test_description='check handling of .. in submodule names
++
++Exercise the name-checking function on a variety of names, and then give a
++real-world setup that confirms we catch this in practice.
++'
++. ./test-lib.sh
++
++test_expect_success 'check names' '
++	cat >expect <<-\EOF &&
++	valid
++	valid/with/paths
++	EOF
++
++	git submodule--helper check-name >actual <<-\EOF &&
++	valid
++	valid/with/paths
++
++	../foo
++	/../foo
++	..\foo
++	\..\foo
++	foo/..
++	foo/../
++	foo\..
++	foo\..\
++	foo/../bar
++	EOF
++
++	test_cmp expect actual
++'
++
++test_expect_success 'create innocent subrepo' '
++	git init innocent &&
++	git -C innocent commit --allow-empty -m foo
++'
++
++test_expect_success 'submodule add refuses invalid names' '
++	test_must_fail \
++		git submodule add --name ../../modules/evil "$PWD/innocent" evil
++'
++
++test_expect_success 'add evil submodule' '
++	git submodule add "$PWD/innocent" evil &&
++
++	mkdir modules &&
++	cp -r .git/modules/evil modules &&
++	write_script modules/evil/hooks/post-checkout <<-\EOF &&
++	echo >&2 "RUNNING POST CHECKOUT"
++	EOF
++
++	git config -f .gitmodules submodule.evil.update checkout &&
++	git config -f .gitmodules --rename-section \
++		submodule.evil submodule.../../modules/evil &&
++	git add modules &&
++	git commit -am evil
++'
++
++# This step seems like it shouldn't be necessary, since the payload is
++# contained entirely in the evil submodule. But due to the vagaries of the
++# submodule code, checking out the evil module will fail unless ".git/modules"
++# exists. Adding another submodule (with a name that sorts before "evil") is an
++# easy way to make sure this is the case in the victim clone.
++test_expect_success 'add other submodule' '
++	git submodule add "$PWD/innocent" another-module &&
++	git add another-module &&
++	git commit -am another
++'
++
++test_expect_success 'clone evil superproject' '
++	git clone --recurse-submodules . victim >output 2>&1 &&
++	! grep "RUNNING POST CHECKOUT" output
++'
++
++test_done
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 1ffc41d..d668277 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -8,7 +8,8 @@ PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
-           file://CVE-2017-15298.patch"
+           file://CVE-2017-15298.patch \
+           file://CVE-2018-11235.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.7.4


