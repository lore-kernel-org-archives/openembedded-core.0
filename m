Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D69C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 15:21:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.27229.1647271289147815962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LrIoSqSB;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id g20so20420020edw.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Dn96fx8hX5J/HES+WOq/cJRCZTbQ7ubQh3wmUwhibM=;
        b=LrIoSqSBGN0AkQ44LjciALfpYYIM2OH58hhK5xybnEkppplh8XCLrDJpmrSjMEdwmK
         H9g9irp4b/t/y2DQ/3NMTl6oVpqFEdIWbi0hQ21ufyV/6n/rv8IZvCktyWH3PzCeQP5W
         wtgQqfOpuOSLHy0a/lx8twW+5u3hfn7KNFtEK77Px8gNMNIaOr1zHGjvog67GniYZ2Fy
         8/T7bxKNhzeWhR2KIXDu7nXrbwNcZW/x6iwHkjqEbsmEngqckomCe1+rjx/H2XL9xjBn
         TdGA0renqcYRvIhUGRaCVRZgX5wvlZ3Wr1GHZSyzPrPqfBHkNkh5Qghddg1IIxOpkFBq
         Iy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Dn96fx8hX5J/HES+WOq/cJRCZTbQ7ubQh3wmUwhibM=;
        b=fVffLoj7HP7Rx+aU1S40bDxjorQ58gi1yw2hWY0P68S/eVKgsEXzI+SyeWlVxEfnGC
         QZGxT1lIjJY2r9Gzg6lL/tLkNt61OHXrRrBQTJ0MJed7emEobGlD8lDxP/7Xe8SNAYxZ
         7TgnZs5iGH0DejpG2QSvolamRwxoNfQw+pcH5a/0sCCSeECQEYM7QMAqBdDfW5oCLcVI
         K5HcGXbBnQSR5JSr+PLmpBS0d4Cq5XySJt+lSnGJvF8YjbU4CFrRLHQAYixZPiPSGgn5
         ZYkdnk5gQVJE5ac2WskMKcAQ2ewpKkHLhkBD9B699HQQZ6mAylsbftck0ChmSJrTuAlO
         gLTw==
X-Gm-Message-State: AOAM5316b4gTGkpDQuQjftR1fYtkzKgTt11Q9oLM90EDcRUBIukwT/AM
	0CNNjWhuUC5+qShYVxBrnX7evoseYKs6KQ==
X-Google-Smtp-Source: 
 ABdhPJz3iRpS8hgkuhj1N6HaGAXHtCMFFpkOtIH9jfqU7vPsIGkSG3e+i7phxgKSKrWv1lhrGuqV/Q==
X-Received: by 2002:a05:6402:354a:b0:416:68b4:5f2 with SMTP id
 f10-20020a056402354a00b0041668b405f2mr20654017edd.85.1647271286638;
        Mon, 14 Mar 2022 08:21:26 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-30.retail.telecomitalia.it. [87.5.19.30])
        by smtp.gmail.com with ESMTPSA id
 p14-20020aa7cc8e000000b0040f13865fa9sm8237631edt.3.2022.03.14.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 08:21:26 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][PATCH v2] re2c: backport fix for CVE-2018-21232
Date: Mon, 14 Mar 2022 16:21:13 +0100
Message-Id: <20220314152113.60668-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 15:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163153

Backport commits from the following issue:
https://github.com/skvadrik/re2c/issues/219

CVE: CVE-2018-21232

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../re2c/re2c/CVE-2018-21232-1.patch          | 347 ++++++++++++++++++
 .../re2c/re2c/CVE-2018-21232-2.patch          | 243 ++++++++++++
 .../re2c/re2c/CVE-2018-21232-3.patch          | 156 ++++++++
 .../re2c/re2c/CVE-2018-21232-4.patch          | 166 +++++++++
 meta/recipes-support/re2c/re2c_1.0.1.bb       |   6 +-
 5 files changed, 917 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch

diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch b/meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
new file mode 100644
index 0000000000..b7dcaefad3
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
@@ -0,0 +1,347 @@
+From fd634998f813340768c333cdad638498602856e5 Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Tue, 21 Apr 2020 21:28:32 +0100
+Subject: [PATCH] Rewrite recursion into iteration (Tarjan's SCC algorithm and
+ YYFILL states).
+
+This is to avoid stack overflow on large RE (especially on instrumented
+builds that have larger stack frames, like AddressSanitizer).
+
+Stack overflow reported by Agostino Sarubbo.
+Related to #219 "overflow-1.re test fails on system with small stack".
+
+Upstram-Status: Backport:
+https://github.com/skvadrik/re2c/commit/fd634998f813340768c333cdad638498602856e5
+
+CVE: CVE-2018-21232
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+diff --git a/src/dfa/fillpoints.cc b/src/dfa/fillpoints.cc
+--- a/src/dfa/fillpoints.cc	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/dfa/fillpoints.cc	(date 1646929180243)
+@@ -5,151 +5,186 @@
+ 
+ #include "src/dfa/dfa.h"
+ 
+-namespace re2c
+-{
++
++/*
++ * note [finding strongly connected components of DFA]
++ *
++ * A slight modification of Tarjan's algorithm.
++ *
++ * The algorithm traverses the DFA in depth-first order. It maintains a stack
++ * of states that have already been visited but haven't been assigned to an SCC
++ * yet. For each state the algorithm calculates 'lowlink': index of the highest
++ * ancestor state reachable in one step from a descendant of this state.
++ * Lowlink is used to determine when a set of states should be popped off stack
++ * into a new SCC.
++ *
++ * We use lowlink to hold different kinds of information:
++ *   - values in range [0 .. stack size] mean that the state is on stack (a
++ *     link to a state with the smallest index reachable from this one)
++ *   - SCC_UND means that this state has not been visited yet
++ *   - SCC_INF means that this state has already been popped off stack
++ *
++ * We use stack size (rather than topological sort index) as a unique index of
++ * the state on stack. This is safe because the indices of states on stack are
++ * unique and less than the indices of states that have been popped off stack
++ * (SCC_INF).
++ */
++
++namespace re2c {
++    namespace {
+ 
+-static const size_t SCC_INF = std::numeric_limits<size_t>::max();
+-static const size_t SCC_UND = SCC_INF - 1;
++        static const size_t SCC_INF = std::numeric_limits<size_t>::max();
++        static const size_t SCC_UND = SCC_INF - 1;
+ 
+-static bool loopback(size_t node, size_t narcs, const size_t *arcs)
+-{
+-	for (size_t i = 0; i < narcs; ++i)
+-	{
+-		if (arcs[i] == node)
+-		{
+-			return true;
+-		}
+-	}
+-	return false;
+-}
++        static bool loopback(size_t state, size_t narcs, const size_t *arcs)
++        {
++            for (size_t i = 0; i < narcs; ++i) {
++                if (arcs[i] == state) return true;
++            }
++            return false;
++        }
+ 
+-/*
+- * node [finding strongly connected components of DFA]
+- *
+- * A slight modification of Tarjan's algorithm.
+- *
+- * The algorithm walks graph in deep-first order. It maintains a stack
+- * of nodes that have already been visited but haven't been assigned to
+- * SCC yet. For each node the algorithm calculates 'lowlink': index of
+- * the highest ancestor node reachable in one step from a descendant of
+- * the node. Lowlink is used to determine when a set of nodes should be
+- * popped off the stack into a new SCC.
+- *
+- * We use lowlink to hold different kinds of information:
+- *   - values in range [0 .. stack size] mean that this node is on stack
+- *     (link to a node with the smallest index reachable from this one)
+- *   - SCC_UND means that this node has not been visited yet
+- *   - SCC_INF means that this node has already been popped off stack
+- *
+- * We use stack size (rather than topological sort index) as unique index
+- * of a node on stack. This is safe because indices of nodes on stack are
+- * still unique and less than indices of nodes that have been popped off
+- * stack (SCC_INF).
+- *
+- */
+-static void scc(
+-	const dfa_t &dfa,
+-	std::stack<size_t> &stack,
+-	std::vector<size_t> &lowlink,
+-	std::vector<bool> &trivial,
+-	size_t i)
+-{
+-	const size_t link = stack.size();
+-	lowlink[i] = link;
+-	stack.push(i);
++        struct StackItem {
++            size_t state;  // current state
++            size_t symbol; // next arc to be visited in this state
++            size_t link;   // Tarjan's "lowlink"
++        };
++
++// Tarjan's algorithm
++        static void scc(const dfa_t &dfa, std::vector<bool> &trivial,
++                        std::vector<StackItem> &stack_dfs)
++        {
++            std::vector<size_t> lowlink(dfa.states.size(), SCC_UND);
++            std::stack<size_t> stack;
++
++            StackItem x0 = {0, 0, 0};
++            stack_dfs.push_back(x0);
++
++            while (!stack_dfs.empty()) {
++                const size_t i = stack_dfs.back().state;
++                size_t c = stack_dfs.back().symbol;
++                size_t link = stack_dfs.back().link;
++                stack_dfs.pop_back();
++
++                const size_t *arcs = dfa.states[i]->arcs;
++
++                if (c == 0) {
++                    // DFS recursive enter
++                    //DASSERT(lowlink[i] == SCC_UND);
++                    link = lowlink[i] = stack.size();
++                    stack.push(i);
++                }
++                else {
++                    // DFS recursive return (from one of successor states)
++                    const size_t j = arcs[c - 1];
++                    //DASSERT(lowlink[j] != SCC_UND);
++                    lowlink[i] = std::min(lowlink[i], lowlink[j]);
++                }
+ 
+-	const size_t *arcs = dfa.states[i]->arcs;
+-	for (size_t c = 0; c < dfa.nchars; ++c)
+-	{
+-		const size_t j = arcs[c];
+-		if (j != dfa_t::NIL)
+-		{
+-			if (lowlink[j] == SCC_UND)
+-			{
+-				scc(dfa, stack, lowlink, trivial, j);
+-			}
+-			if (lowlink[j] < lowlink[i])
+-			{
+-				lowlink[i] = lowlink[j];
+-			}
+-		}
+-	}
++                // find the next successor state that hasn't been visited yet
++                for (; c < dfa.nchars; ++c) {
++                    const size_t j = arcs[c];
++                    if (j != dfa_t::NIL) {
++                        if (lowlink[j] == SCC_UND) {
++                            break;
++                        }
++                        lowlink[i] = std::min(lowlink[i], lowlink[j]);
++                    }
++                }
+ 
+-	if (lowlink[i] == link)
+-	{
+-		// SCC is non-trivial (has loops) iff it either:
+-		//   - consists of multiple nodes (they all must be interconnected)
+-		//   - consists of single node which loops back to itself
+-		trivial[i] = i == stack.top()
+-			&& !loopback(i, dfa.nchars, arcs);
++                if (c < dfa.nchars) {
++                    // recurse into the next successor state
++                    StackItem x1 = {i, c + 1, link};
++                    stack_dfs.push_back(x1);
++                    StackItem x2 = {arcs[c], 0, SCC_UND};
++                    stack_dfs.push_back(x2);
++                }
++                else if (lowlink[i] == link) {
++                    // all successors have been visited
++                    // SCC is non-trivial (has loops) if either:
++                    //   - it contains multiple interconnected states
++                    //   - it contains a single self-looping state
++                    trivial[i] = i == stack.top() && !loopback(i, dfa.nchars, arcs);
+ 
+-		size_t j;
+-		do
+-		{
+-			j = stack.top();
+-			stack.pop();
+-			lowlink[j] = SCC_INF;
+-		}
+-		while (j != i);
+-	}
+-}
++                    for (;;) {
++                        const size_t j = stack.top();
++                        stack.pop();
++                        lowlink[j] = SCC_INF;
++                        if (i == j) break;
++                    }
++                }
++            }
++        }
+ 
+-static void calc_fill(
+-	const dfa_t &dfa,
+-	const std::vector<bool> &trivial,
+-	std::vector<size_t> &fill,
+-	size_t i)
+-{
+-	if (fill[i] == SCC_UND)
+-	{
+-		fill[i] = 0;
+-		const size_t *arcs = dfa.states[i]->arcs;
+-		for (size_t c = 0; c < dfa.nchars; ++c)
+-		{
+-			const size_t j = arcs[c];
+-			if (j != dfa_t::NIL)
+-			{
+-				calc_fill(dfa, trivial, fill, j);
+-				size_t max = 1;
+-				if (trivial[j])
+-				{
+-					max += fill[j];
+-				}
+-				if (max > fill[i])
+-				{
+-					fill[i] = max;
+-				}
+-			}
+-		}
+-	}
+-}
+-
+-void fillpoints(const dfa_t &dfa, std::vector<size_t> &fill)
+-{
+-	const size_t size = dfa.states.size();
+-
+-	// find DFA states that belong to non-trivial SCC
+-	std::stack<size_t> stack;
+-	std::vector<size_t> lowlink(size, SCC_UND);
+-	std::vector<bool> trivial(size, false);
+-	scc(dfa, stack, lowlink, trivial, 0);
+-
+-	// for each DFA state, calculate YYFILL argument:
+-	// maximal path length to the next YYFILL state
+-	fill.resize(size, SCC_UND);
+-	calc_fill(dfa, trivial, fill, 0);
++        static void calc_fill(const dfa_t &dfa, const std::vector<bool> &trivial,
++                              std::vector<StackItem> &stack_dfs, std::vector<size_t> &fill)
++        {
++            const size_t nstates = dfa.states.size();
++            fill.resize(nstates, SCC_UND);
++
++            StackItem x0 = {0, 0, SCC_INF};
++            stack_dfs.push_back(x0);
++
++            while (!stack_dfs.empty()) {
++                const size_t i = stack_dfs.back().state;
++                size_t c = stack_dfs.back().symbol;
++                stack_dfs.pop_back();
++
++                const size_t *arcs = dfa.states[i]->arcs;
++
++                if (c == 0) {
++                    // DFS recursive enter
++                    if (fill[i] != SCC_UND) continue;
++                    fill[i] = 0;
++                }
++                else {
++                    // DFS recursive return (from one of successor states)
++                    const size_t j = arcs[c - 1];
++                    //DASSERT(fill[i] != SCC_UND && fill[j] != SCC_UND);
++                    fill[i] = std::max(fill[i], 1 + (trivial[j] ? fill[j] : 0));
++                }
++
++                // find the next successor state that hasn't been visited yet
++                for (; c < dfa.nchars; ++c) {
++                    const size_t j = arcs[c];
++                    if (j != dfa_t::NIL) break;
++                }
++
++                if (c < dfa.nchars) {
++                    // recurse into the next successor state
++                    StackItem x1 = {i, c + 1, SCC_INF};
++                    stack_dfs.push_back(x1);
++                    StackItem x2 = {arcs[c], 0, SCC_INF};
++                    stack_dfs.push_back(x2);
++                }
++            }
+ 
+-	// The following states must trigger YYFILL:
+-	//   - inital state
+-	//   - all states in non-trivial SCCs
+-	// for other states, reset YYFILL argument to zero
+-	for (size_t i = 1; i < size; ++i)
+-	{
+-		if (trivial[i])
+-		{
+-			fill[i] = 0;
+-		}
+-	}
+-}
++            // The following states must trigger YYFILL:
++            //   - inital state
++            //   - all states in non-trivial SCCs
++            // for other states, reset YYFILL argument to zero
++            for (size_t i = 1; i < nstates; ++i) {
++                if (trivial[i]) {
++                    fill[i] = 0;
++                }
++            }
++        }
+ 
++    } // anonymous namespace
++
++    void fillpoints(const dfa_t &dfa, std::vector<size_t> &fill)
++    {
++        const size_t nstates = dfa.states.size();
++        std::vector<bool> trivial(nstates, false);
++        std::vector<StackItem> stack_dfs;
++        stack_dfs.reserve(nstates);
++
++        // find DFA states that belong to non-trivial SCC
++        scc(dfa, trivial, stack_dfs);
++
++        // for each DFA state, calculate YYFILL argument:
++        // maximal path length to the next YYFILL state
++        calc_fill(dfa, trivial, stack_dfs, fill);
++    }
++
+ } // namespace re2c
diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch b/meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
new file mode 100644
index 0000000000..820a6decbc
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
@@ -0,0 +1,243 @@
+From 7b5643476bd99c994c4f51b8143f942982d85521 Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Wed, 22 Apr 2020 22:37:24 +0100
+Subject: [PATCH] Rewrite recursion into iteration (fixed tags computation).
+
+This is to avoid stack overflow on large RE (especially on instrumented
+builds that have larger stack frames, like AddressSanitizer).
+
+Partial fix for #219 "overflow-1.re test fails on system with small stack".
+
+Upstream-Stauts: Backport:
+https://github.com/skvadrik/re2c/commit/7b5643476bd99c994c4f51b8143f942982d85521
+
+CVE: CVE-2018-21232
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+diff --git a/src/re/tag.cc b/src/re/tag.cc
+--- a/src/re/tag.cc	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/re/tag.cc	(date 1646986908580)
+@@ -6,7 +6,7 @@
+ {
+ 
+ const size_t Tag::RIGHTMOST = std::numeric_limits<size_t>::max();
+-const size_t Tag::VARDIST = std::numeric_limits<size_t>::max();
++const uint32_t Tag::VARDIST = std::numeric_limits<uint32_t>::max();
+ const size_t Tag::FICTIVE = Tag::RIGHTMOST - 1;
+ 
+ } // namespace re2c
+
+
+diff --git a/src/re/tag.h b/src/re/tag.h
+--- a/src/re/tag.h	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/re/tag.h	(date 1646986922376)
+@@ -19,7 +19,7 @@
+ struct Tag
+ {
+ 	static const size_t RIGHTMOST;
+-	static const size_t VARDIST;
++    static const uint32_t VARDIST;
+ 	static const size_t FICTIVE;
+ 
+ 	const std::string *name;
+
+
+diff --git a/src/re/fixed_tags.cc b/src/re/fixed_tags.cc
+--- a/src/re/fixed_tags.cc	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/re/fixed_tags.cc	(date 1646991137317)
+@@ -7,78 +7,131 @@
+ #include "src/re/tag.h"
+ 
+ namespace re2c {
++namespace {
+ 
+ /* note [fixed and variable tags]
+  *
+- * If distance between two tags is constant (equal for all strings that
+- * match the given regexp), then lexer only needs to track one of them:
+- * the second tag equals the first tag plus static offset.
++ * If distance between two tags is constant (equal for all strings that match
++ * the given regexp), then lexer only needs to track one of them: the second
++ * tag equals the first tag plus static offset.
+  *
+- * However, this optimization is applied only to tags in top-level
+- * concatenation, because other tags may be uninitialized and we don't
+- * want to mess with conditional calculation of fixed tags.
+- *
++ * This optimization is applied only to tags in top-level concatenation,
++ * because in other cases the base tag may be NULL, and the calculation of
++ * the fixed tag value is not as simple as substracting a fixed offset.
+  * Furthermore, fixed tags are fobidden with generic API because it cannot
+- * express fixed offsets.
+- *
+- * Tags with history also cannot be fixed.
++ * express fixed offsets. M-tags (with history) also cannot be fixed.
+  *
+  * Another special case is fictive tags (those that exist only to impose
+- * hierarchical laws of POSIX disambiguation). We treat them as fixed
+- * in order to suppress code generation.
++ * hierarchical laws of POSIX disambiguation). We treat them as fixed in order
++ * to suppress code generation.
+  */
+ 
+-static void find_fixed_tags(RE *re, std::vector<Tag> &tags,
+-	size_t &dist, size_t &base, bool toplevel)
++struct StackItem {
++    RE       *re;       // current sub-RE
++    uint32_t  dist;     // distance backup for alternative, unused for other RE
++    uint8_t   succ;     // index of the next successor to be visited
++    bool      toplevel; // if this sub-RE is in top-level concatenation
++};
++
++static void find_fixed_tags(RESpec &spec, std::vector<StackItem> &stack, RE *re0)
+ {
+-	switch (re->type) {
+-		case RE::NIL: break;
+-		case RE::SYM:
+-			if (dist != Tag::VARDIST) ++dist;
+-			break;
+-		case RE::ALT: {
+-			size_t d1 = dist, d2 = dist;
+-			find_fixed_tags(re->alt.re1, tags, d1, base, false);
+-			find_fixed_tags(re->alt.re2, tags, d2, base, false);
+-			dist = (d1 == d2) ? d1 : Tag::VARDIST;
+-			break;
+-		}
+-		case RE::CAT:
+-			find_fixed_tags(re->cat.re2, tags, dist, base, toplevel);
+-			find_fixed_tags(re->cat.re1, tags, dist, base, toplevel);
+-			break;
+-		case RE::ITER:
+-			find_fixed_tags(re->iter.re, tags, dist, base, false);
+-			dist = Tag::VARDIST;
+-			break;
+-		case RE::TAG: {
+-			// see note [fixed and variable tags]
+-			Tag &tag = tags[re->tag.idx];
+-			if (fictive(tag)) {
+-				tag.base = tag.dist = 0;
+-			} else if (toplevel && dist != Tag::VARDIST && !history(tag)) {
+-				tag.base = base;
+-				tag.dist = dist;
+-			} else if (toplevel) {
+-				base = re->tag.idx;
+-				dist = 0;
+-			}
+-			if (trailing(tag)) dist = 0;
+-			break;
+-		}
+-	}
++    static const uint32_t VARDIST = Tag::VARDIST;
++    bool toplevel = spec.opts->input_api != INPUT_CUSTOM;
++
++    // base tag, intially the fake "rightmost tag" (the end of RE)
++    size_t base = Tag::RIGHTMOST;
++
++    // the distance to the nearest top-level tag to the right (base tag)
++    uint32_t dist = 0;
++
++    const StackItem i0 = {re0, VARDIST, 0, toplevel};
++    stack.push_back(i0);
++
++    while (!stack.empty()) {
++        const StackItem i = stack.back();
++        stack.pop_back();
++        RE *re = i.re;
++
++        if (re->type == RE::SYM) {
++            if (dist != VARDIST) ++dist;
++        }
++        else if (re->type == RE::ALT) {
++            if (i.succ == 0) {
++                // save the current distance on stack (from the alternative end
++                // to base) and recurse into the left sub-RE
++                StackItem k = {re, dist, 1, i.toplevel};
++                stack.push_back(k);
++                StackItem j = {re->alt.re1, VARDIST, 0, false};
++                stack.push_back(j);
++            }
++            else if (i.succ == 1) {
++                // save the current distance on stack (from the left sub-RE to
++                // base), reset distance to the distance popped from stack (from
++                // the alternative end to base), recurse into the right sub-RE
++                StackItem k = {re, dist, 2, i.toplevel};
++                stack.push_back(k);
++                StackItem j = {re->alt.re2, VARDIST, 0, false};
++                stack.push_back(j);
++                dist = i.dist;
++            }
++            else {
++                // both sub-RE visited, compare the distance on stack (from the
++                // left sub-RE to base) to the current distance (from the right
++                // sub-RE to base), if not equal set variable distance
++                dist = (i.dist == dist) ? i.dist : VARDIST;
++            }
++        }
++        else if (re->type == RE::ITER) {
++            if (i.succ == 0) {
++                // recurse into the sub-RE
++                StackItem k = {re, VARDIST, 1, i.toplevel};
++                stack.push_back(k);
++                StackItem j = {re->iter.re, VARDIST, 0, false};
++                stack.push_back(j);
++            }
++            else {
++                // sub-RE visited, assume unknown number of iterations
++                // TODO: find precise distance for fixed repetition counter
++                dist = VARDIST;
++            }
++        }
++        else if (re->type == RE::CAT) {
++            // the right sub-RE is pushed on stack after the left sub-RE and
++            // visited earlier (because distance is computed from right to left)
++            StackItem j1 = {re->cat.re1, VARDIST, 0, i.toplevel};
++            stack.push_back(j1);
++            StackItem j2 = {re->cat.re2, VARDIST, 0, i.toplevel};
++            stack.push_back(j2);
++        }
++        else if (re->type == RE::TAG) {
++            // see note [fixed and variable tags]
++            Tag &tag = spec.tags[re->tag.idx];
++            if (fictive(tag)) {
++                tag.base = tag.dist = 0;
++            }
++            else if (i.toplevel && dist != VARDIST && !history(tag)) {
++                tag.base = base;
++                tag.dist = dist;
++            }
++            else if (i.toplevel) {
++                base = re->tag.idx;
++                dist = 0;
++            }
++            if (trailing(tag)) {
++                dist = 0;
++            }
++        }
++    }
+ }
++
++} // anonymous namespace
+ 
+-void find_fixed_tags(RESpec &spec)
+-{
+-	const bool generic = spec.opts->input_api == INPUT_CUSTOM;
+-	std::vector<RE*>::iterator
+-		i = spec.res.begin(),
+-		e = spec.res.end();
+-	for (; i != e; ++i) {
+-		size_t base = Tag::RIGHTMOST, dist = 0;
+-		find_fixed_tags(*i, spec.tags, dist, base, !generic);
+-	}
+-}
++    void find_fixed_tags(RESpec &spec)
++    {
++        std::vector<StackItem> stack;
++        for (std::vector<RE*>::iterator i = spec.res.begin(); i != spec.res.end(); ++i) {
++            find_fixed_tags(spec, stack, *i);
++        }
++    }
+ 
+-} // namespace re2c
++} // namespace re2c
+\ No newline at end of file
diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch b/meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
new file mode 100644
index 0000000000..f942e21cba
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
@@ -0,0 +1,156 @@
+From 4d9c809355b574f2a58eac119f5e076c48e4d1e2 Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Thu, 23 Apr 2020 22:16:51 +0100
+Subject: [PATCH] Rewrite recursion into iteration (nullable RE).
+
+This is to avoid stack overflow on large RE (especially on instrumented
+builds that have larger stack frames, like AddressSanitizer).
+
+Partial fix for #219 "overflow-1.re test fails on system with small stack".
+
+Upstream-Status: Backport:
+https://github.com/skvadrik/re2c/commit/4d9c809355b574f2a58eac119f5e076c48e4d1e2
+
+CVE: CVE-2018-21232
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+diff --git a/src/re/nullable.cc b/src/re/nullable.cc
+--- a/src/re/nullable.cc	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/re/nullable.cc	(date 1647253886226)
+@@ -9,43 +9,100 @@
+ #include "src/re/tag.h"
+ 
+ namespace re2c {
++    namespace {
++
++        struct StackItem {
++            const RE *re;   // current sub-RE
++            uint8_t   succ; // index of the next sucessor to be visited
++        };
+ 
+-static bool nullable(const RESpec &spec, const RE *re, bool &trail)
+-{
+-	if (trail) return true;
++        static bool nullable(const RESpec &spec, std::vector<StackItem> &stack, const RE *re0)
++        {
++            // the "nullable" status of the last sub-RE visited by DFS
++            bool null = false;
+ 
+-	switch (re->type) {
+-		case RE::NIL: return true;
+-		case RE::SYM: return false;
+-		case RE::ITER:
+-			return nullable(spec, re->iter.re, trail);
+-		case RE::TAG:
+-			trail |= trailing(spec.tags[re->tag.idx]);
+-			return true;
+-		case RE::ALT:
+-			return nullable(spec, re->alt.re1, trail)
+-				|| nullable(spec, re->alt.re2, trail);
+-		case RE::CAT:
+-			return nullable(spec, re->cat.re1, trail)
+-				&& nullable(spec, re->cat.re2, trail);
+-	}
+-	return false; /* unreachable */
+-}
++            const StackItem i0 = {re0, 0};
++            stack.push_back(i0);
++
++            while (!stack.empty()) {
++                const StackItem i = stack.back();
++                stack.pop_back();
++
++                const RE *re = i.re;
++                if (re->type == RE::NIL) {
++                    null = true;
++                }
++                else if (re->type == RE::SYM) {
++                    null = false;
++                }
++                else if (re->type == RE::TAG) {
++                    null = true;
+ 
+-/*
+- * warn about rules that match empty string
+- * (including rules with nonempty trailing context)
+- * false positives on partially self-shadowed rules like [^]?
+- */
+-void warn_nullable(const RESpec &spec, const std::string &cond)
+-{
+-	const size_t nre = spec.res.size();
+-	for (size_t i = 0; i < nre; ++i) {
+-		bool trail = false;
+-		if (nullable(spec, spec.res[i], trail)) {
+-			spec.warn.match_empty_string(spec.rules[i].code->fline, cond);
+-		}
+-	}
+-}
++                    // Trailing context is always in top-level concatenation, and sub-RE
++                    // are visited from left to right. Since we are here, sub-RE to the
++                    // left of the trailing context is nullable (otherwise we would not
++                    // recurse into the right sub-RE), therefore the whole RE is nullable.
++                    if (trailing(spec.tags[re->tag.idx])) {
++                        //DASSERT(stack.size() == 1 && stack.back().re->type == RE::CAT);
++                        stack.pop_back();
++                        break;
++                    }
++                }
++                else if (re->type == RE::ALT) {
++                    if (i.succ == 0) {
++                        // recurse into the left sub-RE
++                        StackItem k = {re, 1};
++                        stack.push_back(k);
++                        StackItem j = {re->alt.re1, 0};
++                        stack.push_back(j);
++                    }
++                    else if (!null) {
++                        // if the left sub-RE is nullable, so is alternative, so stop
++                        // recursion; otherwise recurse into the right sub-RE
++                        StackItem j = {re->alt.re2, 0};
++                        stack.push_back(j);
++                    }
++                }
++                else if (re->type == RE::CAT) {
++                    if (i.succ == 0) {
++                        // recurse into the left sub-RE
++                        StackItem k = {re, 1};
++                        stack.push_back(k);
++                        StackItem j = {re->cat.re1, 0};
++                        stack.push_back(j);
++                    }
++                    else if (null) {
++                        // if the left sub-RE is not nullable, neither is concatenation,
++                        // so stop recursion; otherwise recurse into the right sub-RE
++                        StackItem j = {re->cat.re2, 0};
++                        stack.push_back(j);
++                    }
++                }
++                else if (re->type == RE::ITER) {
++                    // iteration is nullable if the sub-RE is nullable
++                    // (zero repetitions is represented with alternative)
++                    StackItem j = {re->iter.re, 0};
++                    stack.push_back(j);
++                }
++            }
++
++            //DASSERT(stack.empty());
++            return null;
++        }
++
++    } // anonymous namespace
++
++// Warn about rules that match empty string (including rules with nonempty
++// trailing context). False positives on partially self-shadowed rules like [^]?
++    void warn_nullable(const RESpec &spec, const std::string &cond)
++    {
++        std::vector<StackItem> stack;
++        const size_t nre = spec.res.size();
++        for (size_t i = 0; i < nre; ++i) {
++            if (nullable(spec, stack, spec.res[i])) {
++                spec.warn.match_empty_string(spec.rules[i].code->fline, cond);
++            }
++        }
++    }
+ 
+ } // namespace re2c
diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch b/meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch
new file mode 100644
index 0000000000..ee8d84b1bc
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch
@@ -0,0 +1,166 @@
+From 89be91f3df00657261870adbc590209fdb2bc405 Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Thu, 23 Apr 2020 23:02:21 +0100
+Subject: [PATCH] Rewrite recursion into iteration (estimation of NFA size for
+ RE).
+
+This is to avoid stack overflow on large RE (especially on instrumented
+builds that have larger stack frames, like AddressSanitizer).
+
+Partial fix for #219 "overflow-1.re test fails on system with small stack".
+
+Upstram-Status: Backport:
+https://github.com/skvadrik/re2c/commit/89be91f3df00657261870adbc590209fdb2bc405
+
+CVE: CVE-2018-21232
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+diff --git a/src/nfa/estimate_size.cc b/src/nfa/estimate_size.cc
+--- a/src/nfa/estimate_size.cc	(revision e58939b34bb4c37cd990f82dc286f21cb405743e)
++++ b/src/nfa/estimate_size.cc	(date 1647005399735)
+@@ -6,41 +6,113 @@
+ #include "src/re/re.h"
+ 
+ namespace re2c {
++namespace {
++
++struct StackItem {
++    const RE *re;   // current sub-RE
++    uint32_t  size; // size of the sub-RE (only for alternative and concatenation)
++    uint8_t   succ; // index of the next sucessor to be visited
++};
+ 
+-static size_t estimate(const RE *re)
++static uint32_t estimate_re_size(const RE *re0, std::vector<StackItem> &stack)
+ {
+-	switch (re->type) {
+-		case RE::NIL: return 0;
+-		case RE::SYM: return 1;
+-		case RE::TAG: return 1;
+-		case RE::ALT:
+-			return estimate(re->alt.re1)
+-				+ estimate(re->alt.re2)
+-				+ 1;
+-		case RE::CAT:
+-			return estimate(re->cat.re1)
+-				+ estimate(re->cat.re2);
+-		case RE::ITER: {
+-			const size_t
+-				iter = estimate(re->iter.re),
+-				min = re->iter.min,
+-				max = re->iter.max;
+-			return max == AST::MANY
+-				? iter * min + 1
+-				: iter * max + (max - min);
+-		}
+-	}
+-	return 0; /* unreachable */
+-}
++    // the estimated size of the last sub-RE visited by DFS
++    uint32_t size = 0;
++
++    const StackItem i0 = {re0, 0, 0};
++    stack.push_back(i0);
++
++    while (!stack.empty()) {
++        const StackItem i = stack.back();
++        stack.pop_back();
++
++        const RE *re = i.re;
++        if (re->type == RE::NIL) {
++            size = 0;
++        }
++        else if (re->type == RE::SYM || re->type == RE::TAG) {
++            size = 1;
++        }
++        else if (re->type == RE::ALT) {
++            if (i.succ == 0) {
++                // recurse into the left sub-RE
++                StackItem k = {re, 0, 1};
++                stack.push_back(k);
++                StackItem j = {re->alt.re1, 0, 0};
++                stack.push_back(j);
++            }
++            else if (i.succ == 1) {
++                // recurse into the right sub-RE
++                StackItem k = {re, size, 2};
++                stack.push_back(k);
++                StackItem j = {re->alt.re2, 0, 0};
++                stack.push_back(j);
++            }
++            else {
++                // both sub-RE visited, recursive return
++                size = i.size // left sub-RE (saved on stack)
++                       + size    // right sub-RE (just visited by DFS)
++                       + 1;      // additional state for alternative
++            }
++        }
++        else if (re->type == RE::CAT) {
++            if (i.succ == 0) {
++                // recurse into the left sub-RE
++                StackItem k = {re, 0, 1};
++                stack.push_back(k);
++                StackItem j = {re->cat.re1, 0, 0};
++                stack.push_back(j);
++            }
++            else if (i.succ == 1) {
++                // recurse into the right sub-RE
++                StackItem k = {re, size, 2};
++                stack.push_back(k);
++                StackItem j = {re->cat.re2, 0, 0};
++                stack.push_back(j);
++            }
++            else {
++                // both sub-RE visited, recursive return
++                size = i.size // left sub-RE (saved on stack)
++                       + size;   // right sub-RE (just visited by DFS)
++            }
++        }
++        else if (re->type == RE::ITER) {
++            if (i.succ == 0) {
++                // recurse into the sub-RE
++                StackItem k = {re, 0, 1};
++                stack.push_back(k);
++                StackItem j = {re->iter.re, 0, 0};
++                stack.push_back(j);
++            }
++            else {
++                // sub-RE visited, recursive return
++                const uint32_t min = re->iter.min, max = re->iter.max;
++                size = max == AST::MANY
++                       ? size * min + 1
++                       : size * max + (max - min);
++            }
++        }
++    }
++
++    //DASSERT(stack.empty());
++    return size;
++}
++
++} // anonymous namespace
+ 
+ size_t estimate_size(const std::vector<RE*> &res)
+ {
+-	const size_t nre = res.size();
+-	size_t size = nre - 1;
+-	for (size_t i = 0; i < nre; ++i) {
+-		size += estimate(res[i]) + 1;
+-	}
+-	return size;
++    std::vector<StackItem> stack;
++
++    const size_t nre = res.size();
++    //DASSERT(nre > 0);
++    size_t size = nre - 1;
++
++    for (size_t i = 0; i < nre; ++i) {
++        size += estimate_re_size(res[i], stack) + 1;
++    }
++
++    return size;
+ }
+ 
+ } // namespace re2c
+
diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-support/re2c/re2c_1.0.1.bb
index faeb496a1a..ca5c33f151 100644
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
@@ -7,7 +7,11 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
 
-SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.gz \
+file://CVE-2018-21232-1.patch \
+file://CVE-2018-21232-2.patch \
+file://CVE-2018-21232-3.patch \
+file://CVE-2018-21232-4.patch"
 SRC_URI[md5sum] = "e2c6cf52fc6a21595f21bc82db5324f8"
 SRC_URI[sha256sum] = "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c90843afab2c66c7c"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
-- 
2.32.0


