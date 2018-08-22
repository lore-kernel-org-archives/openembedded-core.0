Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB8137926B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:07 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r69-v6so1918107oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eG7pATp4CTP5/Ef8LkTSmctrHMM6Gi7thWoZ23M+8O8=;
	b=rX4R02fvIfir7HaGwa77xePzBTsUwdOjGHHTY2p2bWltrRyoym3ozY8XI1N7g3lYjP
	b6pu3e7K6j4T0vQjP7QBFtkPh0KKLAbityQYe2ryB5VAktZKEvlRXpFWS4Aa8+fmwksS
	2VnJCAxEcdiSZoa9p1pIWxbCYKiQ7aLnrgY09w3IwMZO3ygoGlCkDNVAxSgZMIpFMX3J
	yCKU9JyD9NRlebOGp9aBgjEYPYa6lUTukMtp3ZWSLc44ypT1+MTP3eJKlIuidfbV3E6u
	JhGvuwnXe77aMNAO58C7wc/XKmtGenp7uJK6yQ+Y2lQPavbkhDSt4NITyv8grfqrW6Rv
	JO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eG7pATp4CTP5/Ef8LkTSmctrHMM6Gi7thWoZ23M+8O8=;
	b=Uta/N8v6yPBdpBP14nSCJPOKRjGMsjo+ZqBcHjSHTM4nsgxOzeQtTIEEugWAnNc2US
	QIGRrCwqN2dMc3138n5+Zax/fqb5KAQGrwu+HhkDjREFmn33SyIbZmJ0GVRVvu/TzEXD
	tgT/qhL9x80lEmY1g0yqZi/oDKEBG02SuHKcgwxawmJAk8lE0Kde48sr7M24EC2cvM4R
	yx2D0e2wO62wmGnBh01doyKTO5iANi/IvgvIaCFEPOpBnw7n6GyUk0w1PlGtAPKMZrFg
	7Ag01qcoe8lr4/Pel8j426Lzx+vvS0dCSU6YU8ZyYu9RO3v0zJ75foSaZJav8KR7Lo4l
	7V2w==
X-Gm-Message-State: APzg51DSq3VTb07Bn4GDCiuabswFOTALIvblwao71JaSnKNXD/TL33Tu
	sey/bGAcj38BysEhMYs4dWWAB8Jlg04=
X-Google-Smtp-Source: ANB0VdYAsLYN7tbSSUmaXyw3PJ8KszdJgbbjJc1Z2CS+u7lZAM6zvw0wz2Lwt0hrrtIiQ0aE/+kB4w==
X-Received: by 2002:aca:f383:: with SMTP id
	r125-v6mr3615740oih.6.1534936748478; 
	Wed, 22 Aug 2018 04:19:08 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:08 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:58 +0530
Message-Id: <1534936692-11736-20-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 20/34] git: CVE-2017-15298
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:07 -0000

revision: quit pruning diff more quickly when possible
When the revision traversal machinery is given a pathspec,
we must compute the parent-diff for each commit to determine
which ones are TREESAME. We set the QUICK diff flag to avoid
looking at more entries than we need; we really just care
whether there are any changes at all.

But there is one case where we want to know a bit more: if
--remove-empty is set, we care about finding cases where the
change consists only of added entries (in which case we may
prune the parent in try_to_simplify_commit()). To cover that
case, our file_add_remove() callback does not quit the diff
upon seeing an added entry; it keeps looking for other types
of entries.

But this means when --remove-empty is not set (and it is not
by default), we compute more of the diff than is necessary.
You can see this in a pathological case where a commit adds
a very large number of entries, and we limit based on a
broad pathspec. E.g.:

  perl -e '
    chomp(my $blob = `git hash-object -w --stdin </dev/null`);
    for my $a (1..1000) {
      for my $b (1..1000) {
        print "100644 $blob\t$a/$b\n";
      }
    }
  ' | git update-index --index-info
  git commit -qm add

  git rev-list HEAD -- .

This case takes about 100ms now, but after this patch only
needs 6ms. That's not a huge improvement, but it's easy to
get and it protects us against even more pathological cases
(e.g., going from 1 million to 10 million files would take
ten times as long with the current code, but not increase at
all after this patch).

This is reported to minorly speed-up pathspec limiting in
real world repositories (like the 100-million-file Windows
repository), but probably won't make a noticeable difference
outside of pathological setups.

This patch actually covers the case without --remove-empty,
and the case where we see only deletions. See the in-code
comment for details.

Note that we have to add a new member to the diff_options
struct so that our callback can see the value of
revs->remove_empty_trees. This callback parameter could be
passed to the "add_remove" and "change" callbacks, but
there's not much point. They already receive the
diff_options struct, and doing it this way avoids having to
update the function signature of the other callbacks
(arguably the format_callback and output_prefix functions
could benefit from the same simplification).

Affects git <= 2.14.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../git/files/CVE-2017-15298.patch                 | 132 +++++++++++++++++++++
 meta/recipes-devtools/git/git.inc                  |   3 +-
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2017-15298.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2017-15298.patch b/meta/recipes-devtools/git/files/CVE-2017-15298.patch
new file mode 100644
index 0000000..0d349dd
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2017-15298.patch
@@ -0,0 +1,132 @@
+From a937b37e766479c8e780b17cce9c4b252fd97e40 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Fri, 13 Oct 2017 11:27:45 -0400
+Subject: revision: quit pruning diff more quickly when possible
+
+When the revision traversal machinery is given a pathspec,
+we must compute the parent-diff for each commit to determine
+which ones are TREESAME. We set the QUICK diff flag to avoid
+looking at more entries than we need; we really just care
+whether there are any changes at all.
+
+But there is one case where we want to know a bit more: if
+--remove-empty is set, we care about finding cases where the
+change consists only of added entries (in which case we may
+prune the parent in try_to_simplify_commit()). To cover that
+case, our file_add_remove() callback does not quit the diff
+upon seeing an added entry; it keeps looking for other types
+of entries.
+
+But this means when --remove-empty is not set (and it is not
+by default), we compute more of the diff than is necessary.
+You can see this in a pathological case where a commit adds
+a very large number of entries, and we limit based on a
+broad pathspec. E.g.:
+
+  perl -e '
+    chomp(my $blob = `git hash-object -w --stdin </dev/null`);
+    for my $a (1..1000) {
+      for my $b (1..1000) {
+        print "100644 $blob\t$a/$b\n";
+      }
+    }
+  ' | git update-index --index-info
+  git commit -qm add
+
+  git rev-list HEAD -- .
+
+This case takes about 100ms now, but after this patch only
+needs 6ms. That's not a huge improvement, but it's easy to
+get and it protects us against even more pathological cases
+(e.g., going from 1 million to 10 million files would take
+ten times as long with the current code, but not increase at
+all after this patch).
+
+This is reported to minorly speed-up pathspec limiting in
+real world repositories (like the 100-million-file Windows
+repository), but probably won't make a noticeable difference
+outside of pathological setups.
+
+This patch actually covers the case without --remove-empty,
+and the case where we see only deletions. See the in-code
+comment for details.
+
+Note that we have to add a new member to the diff_options
+struct so that our callback can see the value of
+revs->remove_empty_trees. This callback parameter could be
+passed to the "add_remove" and "change" callbacks, but
+there's not much point. They already receive the
+diff_options struct, and doing it this way avoids having to
+update the function signature of the other callbacks
+(arguably the format_callback and output_prefix functions
+could benefit from the same simplification).
+
+CVE: CVE-2017-15298
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/git/git.git/commit/?id=a937b37e76]
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ diff.h     |  1 +
+ revision.c | 16 +++++++++++++---
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/diff.h b/diff.h
+index e9ccb38c26..fe5c287a70 100644
+--- a/diff.h
++++ b/diff.h
+@@ -180,6 +180,7 @@ struct diff_options {
+ 	pathchange_fn_t pathchange;
+ 	change_fn_t change;
+ 	add_remove_fn_t add_remove;
++	void *change_fn_data;
+ 	diff_format_fn_t format_callback;
+ 	void *format_callback_data;
+ 	diff_prefix_fn_t output_prefix;
+diff --git a/revision.c b/revision.c
+index 771d079f6e..7c23ab7afe 100644
+--- a/revision.c
++++ b/revision.c
+@@ -394,8 +394,16 @@ static struct commit *one_relevant_parent(const struct rev_info *revs,
+  * if the whole diff is removal of old data, and otherwise
+  * REV_TREE_DIFFERENT (of course if the trees are the same we
+  * want REV_TREE_SAME).
+- * That means that once we get to REV_TREE_DIFFERENT, we do not
+- * have to look any further.
++ *
++ * The only time we care about the distinction is when
++ * remove_empty_trees is in effect, in which case we care only about
++ * whether the whole change is REV_TREE_NEW, or if there's another type
++ * of change. Which means we can stop the diff early in either of these
++ * cases:
++ *
++ *   1. We're not using remove_empty_trees at all.
++ *
++ *   2. We saw anything except REV_TREE_NEW.
+  */
+ static int tree_difference = REV_TREE_SAME;
+ 
+@@ -406,9 +414,10 @@ static void file_add_remove(struct diff_options *options,
+ 		    const char *fullpath, unsigned dirty_submodule)
+ {
+ 	int diff = addremove == '+' ? REV_TREE_NEW : REV_TREE_OLD;
++	struct rev_info *revs = options->change_fn_data;
+ 
+ 	tree_difference |= diff;
+-	if (tree_difference == REV_TREE_DIFFERENT)
++	if (!revs->remove_empty_trees || tree_difference != REV_TREE_NEW)
+ 		DIFF_OPT_SET(options, HAS_CHANGES);
+ }
+ 
+@@ -1346,6 +1355,7 @@ void init_revisions(struct rev_info *revs, const char *prefix)
+ 	DIFF_OPT_SET(&revs->pruning, QUICK);
+ 	revs->pruning.add_remove = file_add_remove;
+ 	revs->pruning.change = file_change;
++	revs->pruning.change_fn_data = revs;
+ 	revs->sort_order = REV_SORT_IN_GRAPH_ORDER;
+ 	revs->dense = 1;
+ 	revs->prefix = prefix;
+-- 
+cgit 1.2-0.3.lf.el7
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9b4c128..1ffc41d 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,8 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://CVE-2017-15298.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.7.4


