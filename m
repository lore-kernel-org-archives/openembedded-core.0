Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5263E79074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:59 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id c190-v6so3057025oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QlIa2H8m3xOipaXr0ZXEEHMG5r4uGSqCD/SsMWdT4sM=;
	b=pOzvGTWFpfBBNolfnkIBG2iHDKLxedxT653Q9M/5uVZUO7eiHetZyah30PeZHwR3hv
	WVlLOdkMs6jZx4cCyT5du6alvorunfqbOH8hpw9XKTXgxacBj/WDnXf1Zme1OupYZ7+K
	rC9DqObZ70RwmyPnzHAi22fYqtBV7/42gfAYgpdggXiz0IvwFjDhr7mM0p/Sid5tL3Pq
	GHOl+zTuvgFLF6HDkdScSsBgcon5GjY/b+LXE5P7fQWhw9duv7oQLWg4IqP9b7uLiBt8
	TdO8IfpeSmRtC8+P2WqoXU3jE0xLCbXtlnzf/XsuBTOwX6QHZ6wNdPZOdlOM+cN89HUJ
	wPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QlIa2H8m3xOipaXr0ZXEEHMG5r4uGSqCD/SsMWdT4sM=;
	b=ET41nPvBU1VnbQpwg6+NVBkjdiN7YCysbmN/kFYCiWFvazCp4eu5n3srSCJ8rtFgwN
	b3CDoEvt22rlnK0cFXRAHPt1Lm65Qs7AbDNImqV9gu5VNbQf8XgvHADfG6iv6F6SXcQu
	XMaZ6bR9CdEJtxBDveduTf1Ku1XVdhrCiLvXnMaxs9DfQFyF+EbcYB53mxpFqPn4CEtn
	dm123QnncxHP9ogKd/GA66NV9mTu3auhQKmkBtGoVWezHEQNNZ1NJcTtovJSWT+BlWwb
	4Vuh6oQ9IdWQLmADfg0EqTgFnGKincI/1RwZUNkHR9zJNGZowHkRNf0az6UR9cgkMAG4
	Okhg==
X-Gm-Message-State: APzg51AzI1io4G9YuEMEkCUApIODTKwDF/ogERBAmS4MCte4TPo+uUbU
	VyxEfMiU5oi6eGjPh/0l2uZHt5AwzsQ=
X-Google-Smtp-Source: ANB0VdYrufrpYnuV+7eP0bKFEPClxqEBAryesPlXls7gKhqrJ4wVGK9tIwdsy28AMVMfN2cRy8p80g==
X-Received: by 2002:aca:ed45:: with SMTP id
	l66-v6mr4128649oih.40.1534944059925; 
	Wed, 22 Aug 2018 06:20:59 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:59 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:06 +0530
Message-Id: <1534944009-21362-16-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 16/19] git: CVE-2018-11235
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:59 -0000

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
index 0000000..c272eac
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
+@@ -1480,6 +1480,29 @@ static int is_active(int argc, const cha
+ 	return !is_submodule_active(the_repository, argv[1]);
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
+@@ -1502,6 +1525,7 @@ static struct cmd_struct commands[] = {
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
+@@ -229,6 +229,11 @@ Use -f if you really want to add it." >&
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
+@@ -190,6 +190,31 @@ static struct submodule *cache_lookup_na
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
+@@ -201,6 +226,12 @@ static int name_and_item_from_var(const
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
+@@ -48,4 +48,11 @@ extern const struct submodule *submodule
+ 						    const char *key);
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
index dd9d792..bea23ec 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,8 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://CVE-2018-11235.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.7.4


