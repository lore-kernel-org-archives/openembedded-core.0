Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC86C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:15:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.26729.1647267304863756239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LjUelAWo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id hw13so33166533ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HyGQ7EqjV/DijXtJNbX2g+hoGtGcO5SUSThT/7vAHKU=;
        b=LjUelAWoAPOwVc74Fod10FUnFYN5w0ERm6FfanYKsvLFsoyq66MjMnLAI5v0TG8EwT
         9JeBo+xZfsNMJRIIRPFvfASympukkifdphqqlLfZQa7qY46u5+jm7sG8pRAm0F5Vd7ad
         WXAHevkQUKVu+P+v8UcBtWOh4glFbfaMExM/7OkkE5t1UoIsf2TDRSDCK43TwSqjAv4T
         gNQFI1qr1dOv6rowIGKY5o4aZYpTgW2DdRQUrFeTQKe8jPtZYf69lCuid6bSEZY50ZDJ
         J274tEWW9XrBaf7Mw0ZmY3lmnN20MzbfNmNcW+o5zcxvJUBHDcnLIC5aAciGymV/YnG1
         9Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HyGQ7EqjV/DijXtJNbX2g+hoGtGcO5SUSThT/7vAHKU=;
        b=Sv75TIITySDaUKekoWx+TsActilrJ4fKXHYEnYv7PctT3/UPu/KKW2wE39pw/JIOmV
         oKIsccVAyjTlgm0f4L1iVZGnFKw6KPaoJ26kLP7xku5961Xbl1BDhSoi5ptcfHAGIydO
         Pkq0Pd7ZNTevdXFiyBBsQD76taHY0CVRVcdW7yHP79DN41IYga1gp1PoonxQ6vGH3rLL
         FAmOQyedtMETGrX+1Cx+tJxKs97iH0t8xkfdMIpgb8Rh/VNevojCJhsfMZ0sl4C+YoKz
         kUHMIvIy3KTon19k2XwiZn3iLFJI7hV9t4Zm7XrbupO1ek/52Jf/CFDJ9HbZdSjNeAX9
         ePLA==
X-Gm-Message-State: AOAM533yCLaOEYJSfXMLayDpwQKMHJ7N60xaJCcR8su782bDH+zokxoX
	kpqnAlRxUQ5uxVDiaOjdONG7vf3MYS0hhhxc3GglwQ==
X-Google-Smtp-Source: 
 ABdhPJzpjG0eCuiQ0qzlRMVhQSnZRireTqPNx6nymjq15UCxNBa6AOWndjzf4OBHLgYx+hCNeDNjE9eUhLd7fC1fNaQ=
X-Received: by 2002:a17:907:2cc6:b0:6db:7e92:e36 with SMTP id
 hg6-20020a1709072cc600b006db7e920e36mr17942780ejc.329.1647267298528; Mon, 14
 Mar 2022 07:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220314112006.478573-1-davide.gardenal@huawei.com>
In-Reply-To: <20220314112006.478573-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Mar 2022 04:14:46 -1000
Message-ID: 
 <CAOSpxdZXurirkTARsX9pA7nS-euk06jRfiXkFqoDA5wfi6oGaQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] re2c: backport of partial fix for CVE-2018-21232
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:15:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163142

On Mon, Mar 14, 2022 at 1:45 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Backport commits from the following issue (assigned CVE-2018-21232):
> https://github.com/skvadrik/re2c/issues/219
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  .../re2c/re2c/CVE-2018-21232-1.patch          | 345 ++++++++++++++++++
>  .../re2c/re2c/CVE-2018-21232-2.patch          | 241 ++++++++++++
>  .../re2c/re2c/CVE-2018-21232-3.patch          | 154 ++++++++
>  .../re2c/re2c/CVE-2018-21232-4.patch          | 164 +++++++++
>  meta/recipes-support/re2c/re2c_1.0.1.bb       |   6 +-
>  5 files changed, 909 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch
>
> diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch b/meta=
/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
> new file mode 100644
> index 0000000000..f9cdfb9c96
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
> @@ -0,0 +1,345 @@
> +From fd634998f813340768c333cdad638498602856e5 Mon Sep 17 00:00:00 2001
> +From: Ulya Trofimovich <skvadrik@gmail.com>
> +Date: Tue, 21 Apr 2020 21:28:32 +0100
> +Subject: [PATCH] Rewrite recursion into iteration (Tarjan's SCC algorith=
m and
> + YYFILL states).
> +
> +This is to avoid stack overflow on large RE (especially on instrumented
> +builds that have larger stack frames, like AddressSanitizer).
> +
> +Stack overflow reported by Agostino Sarubbo.
> +Related to #219 "overflow-1.re test fails on system with small stack".
> +
> +Upstram-Status: Backport:
> +https://github.com/skvadrik/re2c/commit/fd634998f813340768c333cdad638498=
602856e5
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>

I assume this is missing the CVE tag because this is only a partial fix?

Is this because it is too difficult/impossible to backport the
complete fix? Could you include in the commit message which parts of
the CVE are not fixed?  It will help folks understand what
vulnerability remains.

Thanks so much for helping with CVEs!

Steve

> +---
> +diff --git a/src/dfa/fillpoints.cc b/src/dfa/fillpoints.cc
> +--- a/src/dfa/fillpoints.cc    (revision e58939b34bb4c37cd990f82dc286f21=
cb405743e)
> ++++ b/src/dfa/fillpoints.cc    (date 1646929180243)
> +@@ -5,151 +5,186 @@
> +
> + #include "src/dfa/dfa.h"
> +
> +-namespace re2c
> +-{
> ++
> ++/*
> ++ * note [finding strongly connected components of DFA]
> ++ *
> ++ * A slight modification of Tarjan's algorithm.
> ++ *
> ++ * The algorithm traverses the DFA in depth-first order. It maintains a=
 stack
> ++ * of states that have already been visited but haven't been assigned t=
o an SCC
> ++ * yet. For each state the algorithm calculates 'lowlink': index of the=
 highest
> ++ * ancestor state reachable in one step from a descendant of this state=
.
> ++ * Lowlink is used to determine when a set of states should be popped o=
ff stack
> ++ * into a new SCC.
> ++ *
> ++ * We use lowlink to hold different kinds of information:
> ++ *   - values in range [0 .. stack size] mean that the state is on stac=
k (a
> ++ *     link to a state with the smallest index reachable from this one)
> ++ *   - SCC_UND means that this state has not been visited yet
> ++ *   - SCC_INF means that this state has already been popped off stack
> ++ *
> ++ * We use stack size (rather than topological sort index) as a unique i=
ndex of
> ++ * the state on stack. This is safe because the indices of states on st=
ack are
> ++ * unique and less than the indices of states that have been popped off=
 stack
> ++ * (SCC_INF).
> ++ */
> ++
> ++namespace re2c {
> ++    namespace {
> +
> +-static const size_t SCC_INF =3D std::numeric_limits<size_t>::max();
> +-static const size_t SCC_UND =3D SCC_INF - 1;
> ++        static const size_t SCC_INF =3D std::numeric_limits<size_t>::ma=
x();
> ++        static const size_t SCC_UND =3D SCC_INF - 1;
> +
> +-static bool loopback(size_t node, size_t narcs, const size_t *arcs)
> +-{
> +-      for (size_t i =3D 0; i < narcs; ++i)
> +-      {
> +-              if (arcs[i] =3D=3D node)
> +-              {
> +-                      return true;
> +-              }
> +-      }
> +-      return false;
> +-}
> ++        static bool loopback(size_t state, size_t narcs, const size_t *=
arcs)
> ++        {
> ++            for (size_t i =3D 0; i < narcs; ++i) {
> ++                if (arcs[i] =3D=3D state) return true;
> ++            }
> ++            return false;
> ++        }
> +
> +-/*
> +- * node [finding strongly connected components of DFA]
> +- *
> +- * A slight modification of Tarjan's algorithm.
> +- *
> +- * The algorithm walks graph in deep-first order. It maintains a stack
> +- * of nodes that have already been visited but haven't been assigned to
> +- * SCC yet. For each node the algorithm calculates 'lowlink': index of
> +- * the highest ancestor node reachable in one step from a descendant of
> +- * the node. Lowlink is used to determine when a set of nodes should be
> +- * popped off the stack into a new SCC.
> +- *
> +- * We use lowlink to hold different kinds of information:
> +- *   - values in range [0 .. stack size] mean that this node is on stac=
k
> +- *     (link to a node with the smallest index reachable from this one)
> +- *   - SCC_UND means that this node has not been visited yet
> +- *   - SCC_INF means that this node has already been popped off stack
> +- *
> +- * We use stack size (rather than topological sort index) as unique ind=
ex
> +- * of a node on stack. This is safe because indices of nodes on stack a=
re
> +- * still unique and less than indices of nodes that have been popped of=
f
> +- * stack (SCC_INF).
> +- *
> +- */
> +-static void scc(
> +-      const dfa_t &dfa,
> +-      std::stack<size_t> &stack,
> +-      std::vector<size_t> &lowlink,
> +-      std::vector<bool> &trivial,
> +-      size_t i)
> +-{
> +-      const size_t link =3D stack.size();
> +-      lowlink[i] =3D link;
> +-      stack.push(i);
> ++        struct StackItem {
> ++            size_t state;  // current state
> ++            size_t symbol; // next arc to be visited in this state
> ++            size_t link;   // Tarjan's "lowlink"
> ++        };
> ++
> ++// Tarjan's algorithm
> ++        static void scc(const dfa_t &dfa, std::vector<bool> &trivial,
> ++                        std::vector<StackItem> &stack_dfs)
> ++        {
> ++            std::vector<size_t> lowlink(dfa.states.size(), SCC_UND);
> ++            std::stack<size_t> stack;
> ++
> ++            StackItem x0 =3D {0, 0, 0};
> ++            stack_dfs.push_back(x0);
> ++
> ++            while (!stack_dfs.empty()) {
> ++                const size_t i =3D stack_dfs.back().state;
> ++                size_t c =3D stack_dfs.back().symbol;
> ++                size_t link =3D stack_dfs.back().link;
> ++                stack_dfs.pop_back();
> ++
> ++                const size_t *arcs =3D dfa.states[i]->arcs;
> ++
> ++                if (c =3D=3D 0) {
> ++                    // DFS recursive enter
> ++                    //DASSERT(lowlink[i] =3D=3D SCC_UND);
> ++                    link =3D lowlink[i] =3D stack.size();
> ++                    stack.push(i);
> ++                }
> ++                else {
> ++                    // DFS recursive return (from one of successor stat=
es)
> ++                    const size_t j =3D arcs[c - 1];
> ++                    //DASSERT(lowlink[j] !=3D SCC_UND);
> ++                    lowlink[i] =3D std::min(lowlink[i], lowlink[j]);
> ++                }
> +
> +-      const size_t *arcs =3D dfa.states[i]->arcs;
> +-      for (size_t c =3D 0; c < dfa.nchars; ++c)
> +-      {
> +-              const size_t j =3D arcs[c];
> +-              if (j !=3D dfa_t::NIL)
> +-              {
> +-                      if (lowlink[j] =3D=3D SCC_UND)
> +-                      {
> +-                              scc(dfa, stack, lowlink, trivial, j);
> +-                      }
> +-                      if (lowlink[j] < lowlink[i])
> +-                      {
> +-                              lowlink[i] =3D lowlink[j];
> +-                      }
> +-              }
> +-      }
> ++                // find the next successor state that hasn't been visit=
ed yet
> ++                for (; c < dfa.nchars; ++c) {
> ++                    const size_t j =3D arcs[c];
> ++                    if (j !=3D dfa_t::NIL) {
> ++                        if (lowlink[j] =3D=3D SCC_UND) {
> ++                            break;
> ++                        }
> ++                        lowlink[i] =3D std::min(lowlink[i], lowlink[j])=
;
> ++                    }
> ++                }
> +
> +-      if (lowlink[i] =3D=3D link)
> +-      {
> +-              // SCC is non-trivial (has loops) iff it either:
> +-              //   - consists of multiple nodes (they all must be inter=
connected)
> +-              //   - consists of single node which loops back to itself
> +-              trivial[i] =3D i =3D=3D stack.top()
> +-                      && !loopback(i, dfa.nchars, arcs);
> ++                if (c < dfa.nchars) {
> ++                    // recurse into the next successor state
> ++                    StackItem x1 =3D {i, c + 1, link};
> ++                    stack_dfs.push_back(x1);
> ++                    StackItem x2 =3D {arcs[c], 0, SCC_UND};
> ++                    stack_dfs.push_back(x2);
> ++                }
> ++                else if (lowlink[i] =3D=3D link) {
> ++                    // all successors have been visited
> ++                    // SCC is non-trivial (has loops) if either:
> ++                    //   - it contains multiple interconnected states
> ++                    //   - it contains a single self-looping state
> ++                    trivial[i] =3D i =3D=3D stack.top() && !loopback(i,=
 dfa.nchars, arcs);
> +
> +-              size_t j;
> +-              do
> +-              {
> +-                      j =3D stack.top();
> +-                      stack.pop();
> +-                      lowlink[j] =3D SCC_INF;
> +-              }
> +-              while (j !=3D i);
> +-      }
> +-}
> ++                    for (;;) {
> ++                        const size_t j =3D stack.top();
> ++                        stack.pop();
> ++                        lowlink[j] =3D SCC_INF;
> ++                        if (i =3D=3D j) break;
> ++                    }
> ++                }
> ++            }
> ++        }
> +
> +-static void calc_fill(
> +-      const dfa_t &dfa,
> +-      const std::vector<bool> &trivial,
> +-      std::vector<size_t> &fill,
> +-      size_t i)
> +-{
> +-      if (fill[i] =3D=3D SCC_UND)
> +-      {
> +-              fill[i] =3D 0;
> +-              const size_t *arcs =3D dfa.states[i]->arcs;
> +-              for (size_t c =3D 0; c < dfa.nchars; ++c)
> +-              {
> +-                      const size_t j =3D arcs[c];
> +-                      if (j !=3D dfa_t::NIL)
> +-                      {
> +-                              calc_fill(dfa, trivial, fill, j);
> +-                              size_t max =3D 1;
> +-                              if (trivial[j])
> +-                              {
> +-                                      max +=3D fill[j];
> +-                              }
> +-                              if (max > fill[i])
> +-                              {
> +-                                      fill[i] =3D max;
> +-                              }
> +-                      }
> +-              }
> +-      }
> +-}
> +-
> +-void fillpoints(const dfa_t &dfa, std::vector<size_t> &fill)
> +-{
> +-      const size_t size =3D dfa.states.size();
> +-
> +-      // find DFA states that belong to non-trivial SCC
> +-      std::stack<size_t> stack;
> +-      std::vector<size_t> lowlink(size, SCC_UND);
> +-      std::vector<bool> trivial(size, false);
> +-      scc(dfa, stack, lowlink, trivial, 0);
> +-
> +-      // for each DFA state, calculate YYFILL argument:
> +-      // maximal path length to the next YYFILL state
> +-      fill.resize(size, SCC_UND);
> +-      calc_fill(dfa, trivial, fill, 0);
> ++        static void calc_fill(const dfa_t &dfa, const std::vector<bool>=
 &trivial,
> ++                              std::vector<StackItem> &stack_dfs, std::v=
ector<size_t> &fill)
> ++        {
> ++            const size_t nstates =3D dfa.states.size();
> ++            fill.resize(nstates, SCC_UND);
> ++
> ++            StackItem x0 =3D {0, 0, SCC_INF};
> ++            stack_dfs.push_back(x0);
> ++
> ++            while (!stack_dfs.empty()) {
> ++                const size_t i =3D stack_dfs.back().state;
> ++                size_t c =3D stack_dfs.back().symbol;
> ++                stack_dfs.pop_back();
> ++
> ++                const size_t *arcs =3D dfa.states[i]->arcs;
> ++
> ++                if (c =3D=3D 0) {
> ++                    // DFS recursive enter
> ++                    if (fill[i] !=3D SCC_UND) continue;
> ++                    fill[i] =3D 0;
> ++                }
> ++                else {
> ++                    // DFS recursive return (from one of successor stat=
es)
> ++                    const size_t j =3D arcs[c - 1];
> ++                    //DASSERT(fill[i] !=3D SCC_UND && fill[j] !=3D SCC_=
UND);
> ++                    fill[i] =3D std::max(fill[i], 1 + (trivial[j] ? fil=
l[j] : 0));
> ++                }
> ++
> ++                // find the next successor state that hasn't been visit=
ed yet
> ++                for (; c < dfa.nchars; ++c) {
> ++                    const size_t j =3D arcs[c];
> ++                    if (j !=3D dfa_t::NIL) break;
> ++                }
> ++
> ++                if (c < dfa.nchars) {
> ++                    // recurse into the next successor state
> ++                    StackItem x1 =3D {i, c + 1, SCC_INF};
> ++                    stack_dfs.push_back(x1);
> ++                    StackItem x2 =3D {arcs[c], 0, SCC_INF};
> ++                    stack_dfs.push_back(x2);
> ++                }
> ++            }
> +
> +-      // The following states must trigger YYFILL:
> +-      //   - inital state
> +-      //   - all states in non-trivial SCCs
> +-      // for other states, reset YYFILL argument to zero
> +-      for (size_t i =3D 1; i < size; ++i)
> +-      {
> +-              if (trivial[i])
> +-              {
> +-                      fill[i] =3D 0;
> +-              }
> +-      }
> +-}
> ++            // The following states must trigger YYFILL:
> ++            //   - inital state
> ++            //   - all states in non-trivial SCCs
> ++            // for other states, reset YYFILL argument to zero
> ++            for (size_t i =3D 1; i < nstates; ++i) {
> ++                if (trivial[i]) {
> ++                    fill[i] =3D 0;
> ++                }
> ++            }
> ++        }
> +
> ++    } // anonymous namespace
> ++
> ++    void fillpoints(const dfa_t &dfa, std::vector<size_t> &fill)
> ++    {
> ++        const size_t nstates =3D dfa.states.size();
> ++        std::vector<bool> trivial(nstates, false);
> ++        std::vector<StackItem> stack_dfs;
> ++        stack_dfs.reserve(nstates);
> ++
> ++        // find DFA states that belong to non-trivial SCC
> ++        scc(dfa, trivial, stack_dfs);
> ++
> ++        // for each DFA state, calculate YYFILL argument:
> ++        // maximal path length to the next YYFILL state
> ++        calc_fill(dfa, trivial, stack_dfs, fill);
> ++    }
> ++
> + } // namespace re2c
> diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch b/meta=
/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
> new file mode 100644
> index 0000000000..baab6d2882
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
> @@ -0,0 +1,241 @@
> +From 7b5643476bd99c994c4f51b8143f942982d85521 Mon Sep 17 00:00:00 2001
> +From: Ulya Trofimovich <skvadrik@gmail.com>
> +Date: Wed, 22 Apr 2020 22:37:24 +0100
> +Subject: [PATCH] Rewrite recursion into iteration (fixed tags computatio=
n).
> +
> +This is to avoid stack overflow on large RE (especially on instrumented
> +builds that have larger stack frames, like AddressSanitizer).
> +
> +Partial fix for #219 "overflow-1.re test fails on system with small stac=
k".
> +
> +Upstream-Stauts: Backport:
> +https://github.com/skvadrik/re2c/commit/7b5643476bd99c994c4f51b8143f9429=
82d85521
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> +diff --git a/src/re/tag.cc b/src/re/tag.cc
> +--- a/src/re/tag.cc    (revision e58939b34bb4c37cd990f82dc286f21cb405743=
e)
> ++++ b/src/re/tag.cc    (date 1646986908580)
> +@@ -6,7 +6,7 @@
> + {
> +
> + const size_t Tag::RIGHTMOST =3D std::numeric_limits<size_t>::max();
> +-const size_t Tag::VARDIST =3D std::numeric_limits<size_t>::max();
> ++const uint32_t Tag::VARDIST =3D std::numeric_limits<uint32_t>::max();
> + const size_t Tag::FICTIVE =3D Tag::RIGHTMOST - 1;
> +
> + } // namespace re2c
> +
> +
> +diff --git a/src/re/tag.h b/src/re/tag.h
> +--- a/src/re/tag.h     (revision e58939b34bb4c37cd990f82dc286f21cb405743=
e)
> ++++ b/src/re/tag.h     (date 1646986922376)
> +@@ -19,7 +19,7 @@
> + struct Tag
> + {
> +       static const size_t RIGHTMOST;
> +-      static const size_t VARDIST;
> ++    static const uint32_t VARDIST;
> +       static const size_t FICTIVE;
> +
> +       const std::string *name;
> +
> +
> +diff --git a/src/re/fixed_tags.cc b/src/re/fixed_tags.cc
> +--- a/src/re/fixed_tags.cc     (revision e58939b34bb4c37cd990f82dc286f21=
cb405743e)
> ++++ b/src/re/fixed_tags.cc     (date 1646991137317)
> +@@ -7,78 +7,131 @@
> + #include "src/re/tag.h"
> +
> + namespace re2c {
> ++namespace {
> +
> + /* note [fixed and variable tags]
> +  *
> +- * If distance between two tags is constant (equal for all strings that
> +- * match the given regexp), then lexer only needs to track one of them:
> +- * the second tag equals the first tag plus static offset.
> ++ * If distance between two tags is constant (equal for all strings that=
 match
> ++ * the given regexp), then lexer only needs to track one of them: the s=
econd
> ++ * tag equals the first tag plus static offset.
> +  *
> +- * However, this optimization is applied only to tags in top-level
> +- * concatenation, because other tags may be uninitialized and we don't
> +- * want to mess with conditional calculation of fixed tags.
> +- *
> ++ * This optimization is applied only to tags in top-level concatenation=
,
> ++ * because in other cases the base tag may be NULL, and the calculation=
 of
> ++ * the fixed tag value is not as simple as substracting a fixed offset.
> +  * Furthermore, fixed tags are fobidden with generic API because it can=
not
> +- * express fixed offsets.
> +- *
> +- * Tags with history also cannot be fixed.
> ++ * express fixed offsets. M-tags (with history) also cannot be fixed.
> +  *
> +  * Another special case is fictive tags (those that exist only to impos=
e
> +- * hierarchical laws of POSIX disambiguation). We treat them as fixed
> +- * in order to suppress code generation.
> ++ * hierarchical laws of POSIX disambiguation). We treat them as fixed i=
n order
> ++ * to suppress code generation.
> +  */
> +
> +-static void find_fixed_tags(RE *re, std::vector<Tag> &tags,
> +-      size_t &dist, size_t &base, bool toplevel)
> ++struct StackItem {
> ++    RE       *re;       // current sub-RE
> ++    uint32_t  dist;     // distance backup for alternative, unused for =
other RE
> ++    uint8_t   succ;     // index of the next successor to be visited
> ++    bool      toplevel; // if this sub-RE is in top-level concatenation
> ++};
> ++
> ++static void find_fixed_tags(RESpec &spec, std::vector<StackItem> &stack=
, RE *re0)
> + {
> +-      switch (re->type) {
> +-              case RE::NIL: break;
> +-              case RE::SYM:
> +-                      if (dist !=3D Tag::VARDIST) ++dist;
> +-                      break;
> +-              case RE::ALT: {
> +-                      size_t d1 =3D dist, d2 =3D dist;
> +-                      find_fixed_tags(re->alt.re1, tags, d1, base, fals=
e);
> +-                      find_fixed_tags(re->alt.re2, tags, d2, base, fals=
e);
> +-                      dist =3D (d1 =3D=3D d2) ? d1 : Tag::VARDIST;
> +-                      break;
> +-              }
> +-              case RE::CAT:
> +-                      find_fixed_tags(re->cat.re2, tags, dist, base, to=
plevel);
> +-                      find_fixed_tags(re->cat.re1, tags, dist, base, to=
plevel);
> +-                      break;
> +-              case RE::ITER:
> +-                      find_fixed_tags(re->iter.re, tags, dist, base, fa=
lse);
> +-                      dist =3D Tag::VARDIST;
> +-                      break;
> +-              case RE::TAG: {
> +-                      // see note [fixed and variable tags]
> +-                      Tag &tag =3D tags[re->tag.idx];
> +-                      if (fictive(tag)) {
> +-                              tag.base =3D tag.dist =3D 0;
> +-                      } else if (toplevel && dist !=3D Tag::VARDIST && =
!history(tag)) {
> +-                              tag.base =3D base;
> +-                              tag.dist =3D dist;
> +-                      } else if (toplevel) {
> +-                              base =3D re->tag.idx;
> +-                              dist =3D 0;
> +-                      }
> +-                      if (trailing(tag)) dist =3D 0;
> +-                      break;
> +-              }
> +-      }
> ++    static const uint32_t VARDIST =3D Tag::VARDIST;
> ++    bool toplevel =3D spec.opts->input_api !=3D INPUT_CUSTOM;
> ++
> ++    // base tag, intially the fake "rightmost tag" (the end of RE)
> ++    size_t base =3D Tag::RIGHTMOST;
> ++
> ++    // the distance to the nearest top-level tag to the right (base tag=
)
> ++    uint32_t dist =3D 0;
> ++
> ++    const StackItem i0 =3D {re0, VARDIST, 0, toplevel};
> ++    stack.push_back(i0);
> ++
> ++    while (!stack.empty()) {
> ++        const StackItem i =3D stack.back();
> ++        stack.pop_back();
> ++        RE *re =3D i.re;
> ++
> ++        if (re->type =3D=3D RE::SYM) {
> ++            if (dist !=3D VARDIST) ++dist;
> ++        }
> ++        else if (re->type =3D=3D RE::ALT) {
> ++            if (i.succ =3D=3D 0) {
> ++                // save the current distance on stack (from the alterna=
tive end
> ++                // to base) and recurse into the left sub-RE
> ++                StackItem k =3D {re, dist, 1, i.toplevel};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->alt.re1, VARDIST, 0, false};
> ++                stack.push_back(j);
> ++            }
> ++            else if (i.succ =3D=3D 1) {
> ++                // save the current distance on stack (from the left su=
b-RE to
> ++                // base), reset distance to the distance popped from st=
ack (from
> ++                // the alternative end to base), recurse into the right=
 sub-RE
> ++                StackItem k =3D {re, dist, 2, i.toplevel};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->alt.re2, VARDIST, 0, false};
> ++                stack.push_back(j);
> ++                dist =3D i.dist;
> ++            }
> ++            else {
> ++                // both sub-RE visited, compare the distance on stack (=
from the
> ++                // left sub-RE to base) to the current distance (from t=
he right
> ++                // sub-RE to base), if not equal set variable distance
> ++                dist =3D (i.dist =3D=3D dist) ? i.dist : VARDIST;
> ++            }
> ++        }
> ++        else if (re->type =3D=3D RE::ITER) {
> ++            if (i.succ =3D=3D 0) {
> ++                // recurse into the sub-RE
> ++                StackItem k =3D {re, VARDIST, 1, i.toplevel};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->iter.re, VARDIST, 0, false};
> ++                stack.push_back(j);
> ++            }
> ++            else {
> ++                // sub-RE visited, assume unknown number of iterations
> ++                // TODO: find precise distance for fixed repetition cou=
nter
> ++                dist =3D VARDIST;
> ++            }
> ++        }
> ++        else if (re->type =3D=3D RE::CAT) {
> ++            // the right sub-RE is pushed on stack after the left sub-R=
E and
> ++            // visited earlier (because distance is computed from right=
 to left)
> ++            StackItem j1 =3D {re->cat.re1, VARDIST, 0, i.toplevel};
> ++            stack.push_back(j1);
> ++            StackItem j2 =3D {re->cat.re2, VARDIST, 0, i.toplevel};
> ++            stack.push_back(j2);
> ++        }
> ++        else if (re->type =3D=3D RE::TAG) {
> ++            // see note [fixed and variable tags]
> ++            Tag &tag =3D spec.tags[re->tag.idx];
> ++            if (fictive(tag)) {
> ++                tag.base =3D tag.dist =3D 0;
> ++            }
> ++            else if (i.toplevel && dist !=3D VARDIST && !history(tag)) =
{
> ++                tag.base =3D base;
> ++                tag.dist =3D dist;
> ++            }
> ++            else if (i.toplevel) {
> ++                base =3D re->tag.idx;
> ++                dist =3D 0;
> ++            }
> ++            if (trailing(tag)) {
> ++                dist =3D 0;
> ++            }
> ++        }
> ++    }
> + }
> ++
> ++} // anonymous namespace
> +
> +-void find_fixed_tags(RESpec &spec)
> +-{
> +-      const bool generic =3D spec.opts->input_api =3D=3D INPUT_CUSTOM;
> +-      std::vector<RE*>::iterator
> +-              i =3D spec.res.begin(),
> +-              e =3D spec.res.end();
> +-      for (; i !=3D e; ++i) {
> +-              size_t base =3D Tag::RIGHTMOST, dist =3D 0;
> +-              find_fixed_tags(*i, spec.tags, dist, base, !generic);
> +-      }
> +-}
> ++    void find_fixed_tags(RESpec &spec)
> ++    {
> ++        std::vector<StackItem> stack;
> ++        for (std::vector<RE*>::iterator i =3D spec.res.begin(); i !=3D =
spec.res.end(); ++i) {
> ++            find_fixed_tags(spec, stack, *i);
> ++        }
> ++    }
> +
> +-} // namespace re2c
> ++} // namespace re2c
> +\ No newline at end of file
> diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch b/meta=
/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
> new file mode 100644
> index 0000000000..70c02667b8
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
> @@ -0,0 +1,154 @@
> +From 4d9c809355b574f2a58eac119f5e076c48e4d1e2 Mon Sep 17 00:00:00 2001
> +From: Ulya Trofimovich <skvadrik@gmail.com>
> +Date: Thu, 23 Apr 2020 22:16:51 +0100
> +Subject: [PATCH] Rewrite recursion into iteration (nullable RE).
> +
> +This is to avoid stack overflow on large RE (especially on instrumented
> +builds that have larger stack frames, like AddressSanitizer).
> +
> +Partial fix for #219 "overflow-1.re test fails on system with small stac=
k".
> +
> +Upstream-Status: Backport:
> +https://github.com/skvadrik/re2c/commit/4d9c809355b574f2a58eac119f5e076c=
48e4d1e2
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> +diff --git a/src/re/nullable.cc b/src/re/nullable.cc
> +--- a/src/re/nullable.cc       (revision e58939b34bb4c37cd990f82dc286f21=
cb405743e)
> ++++ b/src/re/nullable.cc       (date 1647253886226)
> +@@ -9,43 +9,100 @@
> + #include "src/re/tag.h"
> +
> + namespace re2c {
> ++    namespace {
> ++
> ++        struct StackItem {
> ++            const RE *re;   // current sub-RE
> ++            uint8_t   succ; // index of the next sucessor to be visited
> ++        };
> +
> +-static bool nullable(const RESpec &spec, const RE *re, bool &trail)
> +-{
> +-      if (trail) return true;
> ++        static bool nullable(const RESpec &spec, std::vector<StackItem>=
 &stack, const RE *re0)
> ++        {
> ++            // the "nullable" status of the last sub-RE visited by DFS
> ++            bool null =3D false;
> +
> +-      switch (re->type) {
> +-              case RE::NIL: return true;
> +-              case RE::SYM: return false;
> +-              case RE::ITER:
> +-                      return nullable(spec, re->iter.re, trail);
> +-              case RE::TAG:
> +-                      trail |=3D trailing(spec.tags[re->tag.idx]);
> +-                      return true;
> +-              case RE::ALT:
> +-                      return nullable(spec, re->alt.re1, trail)
> +-                              || nullable(spec, re->alt.re2, trail);
> +-              case RE::CAT:
> +-                      return nullable(spec, re->cat.re1, trail)
> +-                              && nullable(spec, re->cat.re2, trail);
> +-      }
> +-      return false; /* unreachable */
> +-}
> ++            const StackItem i0 =3D {re0, 0};
> ++            stack.push_back(i0);
> ++
> ++            while (!stack.empty()) {
> ++                const StackItem i =3D stack.back();
> ++                stack.pop_back();
> ++
> ++                const RE *re =3D i.re;
> ++                if (re->type =3D=3D RE::NIL) {
> ++                    null =3D true;
> ++                }
> ++                else if (re->type =3D=3D RE::SYM) {
> ++                    null =3D false;
> ++                }
> ++                else if (re->type =3D=3D RE::TAG) {
> ++                    null =3D true;
> +
> +-/*
> +- * warn about rules that match empty string
> +- * (including rules with nonempty trailing context)
> +- * false positives on partially self-shadowed rules like [^]?
> +- */
> +-void warn_nullable(const RESpec &spec, const std::string &cond)
> +-{
> +-      const size_t nre =3D spec.res.size();
> +-      for (size_t i =3D 0; i < nre; ++i) {
> +-              bool trail =3D false;
> +-              if (nullable(spec, spec.res[i], trail)) {
> +-                      spec.warn.match_empty_string(spec.rules[i].code->=
fline, cond);
> +-              }
> +-      }
> +-}
> ++                    // Trailing context is always in top-level concaten=
ation, and sub-RE
> ++                    // are visited from left to right. Since we are her=
e, sub-RE to the
> ++                    // left of the trailing context is nullable (otherw=
ise we would not
> ++                    // recurse into the right sub-RE), therefore the wh=
ole RE is nullable.
> ++                    if (trailing(spec.tags[re->tag.idx])) {
> ++                        //DASSERT(stack.size() =3D=3D 1 && stack.back()=
.re->type =3D=3D RE::CAT);
> ++                        stack.pop_back();
> ++                        break;
> ++                    }
> ++                }
> ++                else if (re->type =3D=3D RE::ALT) {
> ++                    if (i.succ =3D=3D 0) {
> ++                        // recurse into the left sub-RE
> ++                        StackItem k =3D {re, 1};
> ++                        stack.push_back(k);
> ++                        StackItem j =3D {re->alt.re1, 0};
> ++                        stack.push_back(j);
> ++                    }
> ++                    else if (!null) {
> ++                        // if the left sub-RE is nullable, so is altern=
ative, so stop
> ++                        // recursion; otherwise recurse into the right =
sub-RE
> ++                        StackItem j =3D {re->alt.re2, 0};
> ++                        stack.push_back(j);
> ++                    }
> ++                }
> ++                else if (re->type =3D=3D RE::CAT) {
> ++                    if (i.succ =3D=3D 0) {
> ++                        // recurse into the left sub-RE
> ++                        StackItem k =3D {re, 1};
> ++                        stack.push_back(k);
> ++                        StackItem j =3D {re->cat.re1, 0};
> ++                        stack.push_back(j);
> ++                    }
> ++                    else if (null) {
> ++                        // if the left sub-RE is not nullable, neither =
is concatenation,
> ++                        // so stop recursion; otherwise recurse into th=
e right sub-RE
> ++                        StackItem j =3D {re->cat.re2, 0};
> ++                        stack.push_back(j);
> ++                    }
> ++                }
> ++                else if (re->type =3D=3D RE::ITER) {
> ++                    // iteration is nullable if the sub-RE is nullable
> ++                    // (zero repetitions is represented with alternativ=
e)
> ++                    StackItem j =3D {re->iter.re, 0};
> ++                    stack.push_back(j);
> ++                }
> ++            }
> ++
> ++            //DASSERT(stack.empty());
> ++            return null;
> ++        }
> ++
> ++    } // anonymous namespace
> ++
> ++// Warn about rules that match empty string (including rules with nonem=
pty
> ++// trailing context). False positives on partially self-shadowed rules =
like [^]?
> ++    void warn_nullable(const RESpec &spec, const std::string &cond)
> ++    {
> ++        std::vector<StackItem> stack;
> ++        const size_t nre =3D spec.res.size();
> ++        for (size_t i =3D 0; i < nre; ++i) {
> ++            if (nullable(spec, stack, spec.res[i])) {
> ++                spec.warn.match_empty_string(spec.rules[i].code->fline,=
 cond);
> ++            }
> ++        }
> ++    }
> +
> + } // namespace re2c
> diff --git a/meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch b/meta=
/recipes-support/re2c/re2c/CVE-2018-21232-4.patch
> new file mode 100644
> index 0000000000..86c5e98e9f
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch
> @@ -0,0 +1,164 @@
> +From 89be91f3df00657261870adbc590209fdb2bc405 Mon Sep 17 00:00:00 2001
> +From: Ulya Trofimovich <skvadrik@gmail.com>
> +Date: Thu, 23 Apr 2020 23:02:21 +0100
> +Subject: [PATCH] Rewrite recursion into iteration (estimation of NFA siz=
e for
> + RE).
> +
> +This is to avoid stack overflow on large RE (especially on instrumented
> +builds that have larger stack frames, like AddressSanitizer).
> +
> +Partial fix for #219 "overflow-1.re test fails on system with small stac=
k".
> +
> +Upstram-Status: Backport:
> +https://github.com/skvadrik/re2c/commit/89be91f3df00657261870adbc590209f=
db2bc405
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> +diff --git a/src/nfa/estimate_size.cc b/src/nfa/estimate_size.cc
> +--- a/src/nfa/estimate_size.cc (revision e58939b34bb4c37cd990f82dc286f21=
cb405743e)
> ++++ b/src/nfa/estimate_size.cc (date 1647005399735)
> +@@ -6,41 +6,113 @@
> + #include "src/re/re.h"
> +
> + namespace re2c {
> ++namespace {
> ++
> ++struct StackItem {
> ++    const RE *re;   // current sub-RE
> ++    uint32_t  size; // size of the sub-RE (only for alternative and con=
catenation)
> ++    uint8_t   succ; // index of the next sucessor to be visited
> ++};
> +
> +-static size_t estimate(const RE *re)
> ++static uint32_t estimate_re_size(const RE *re0, std::vector<StackItem> =
&stack)
> + {
> +-      switch (re->type) {
> +-              case RE::NIL: return 0;
> +-              case RE::SYM: return 1;
> +-              case RE::TAG: return 1;
> +-              case RE::ALT:
> +-                      return estimate(re->alt.re1)
> +-                              + estimate(re->alt.re2)
> +-                              + 1;
> +-              case RE::CAT:
> +-                      return estimate(re->cat.re1)
> +-                              + estimate(re->cat.re2);
> +-              case RE::ITER: {
> +-                      const size_t
> +-                              iter =3D estimate(re->iter.re),
> +-                              min =3D re->iter.min,
> +-                              max =3D re->iter.max;
> +-                      return max =3D=3D AST::MANY
> +-                              ? iter * min + 1
> +-                              : iter * max + (max - min);
> +-              }
> +-      }
> +-      return 0; /* unreachable */
> +-}
> ++    // the estimated size of the last sub-RE visited by DFS
> ++    uint32_t size =3D 0;
> ++
> ++    const StackItem i0 =3D {re0, 0, 0};
> ++    stack.push_back(i0);
> ++
> ++    while (!stack.empty()) {
> ++        const StackItem i =3D stack.back();
> ++        stack.pop_back();
> ++
> ++        const RE *re =3D i.re;
> ++        if (re->type =3D=3D RE::NIL) {
> ++            size =3D 0;
> ++        }
> ++        else if (re->type =3D=3D RE::SYM || re->type =3D=3D RE::TAG) {
> ++            size =3D 1;
> ++        }
> ++        else if (re->type =3D=3D RE::ALT) {
> ++            if (i.succ =3D=3D 0) {
> ++                // recurse into the left sub-RE
> ++                StackItem k =3D {re, 0, 1};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->alt.re1, 0, 0};
> ++                stack.push_back(j);
> ++            }
> ++            else if (i.succ =3D=3D 1) {
> ++                // recurse into the right sub-RE
> ++                StackItem k =3D {re, size, 2};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->alt.re2, 0, 0};
> ++                stack.push_back(j);
> ++            }
> ++            else {
> ++                // both sub-RE visited, recursive return
> ++                size =3D i.size // left sub-RE (saved on stack)
> ++                       + size    // right sub-RE (just visited by DFS)
> ++                       + 1;      // additional state for alternative
> ++            }
> ++        }
> ++        else if (re->type =3D=3D RE::CAT) {
> ++            if (i.succ =3D=3D 0) {
> ++                // recurse into the left sub-RE
> ++                StackItem k =3D {re, 0, 1};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->cat.re1, 0, 0};
> ++                stack.push_back(j);
> ++            }
> ++            else if (i.succ =3D=3D 1) {
> ++                // recurse into the right sub-RE
> ++                StackItem k =3D {re, size, 2};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->cat.re2, 0, 0};
> ++                stack.push_back(j);
> ++            }
> ++            else {
> ++                // both sub-RE visited, recursive return
> ++                size =3D i.size // left sub-RE (saved on stack)
> ++                       + size;   // right sub-RE (just visited by DFS)
> ++            }
> ++        }
> ++        else if (re->type =3D=3D RE::ITER) {
> ++            if (i.succ =3D=3D 0) {
> ++                // recurse into the sub-RE
> ++                StackItem k =3D {re, 0, 1};
> ++                stack.push_back(k);
> ++                StackItem j =3D {re->iter.re, 0, 0};
> ++                stack.push_back(j);
> ++            }
> ++            else {
> ++                // sub-RE visited, recursive return
> ++                const uint32_t min =3D re->iter.min, max =3D re->iter.m=
ax;
> ++                size =3D max =3D=3D AST::MANY
> ++                       ? size * min + 1
> ++                       : size * max + (max - min);
> ++            }
> ++        }
> ++    }
> ++
> ++    //DASSERT(stack.empty());
> ++    return size;
> ++}
> ++
> ++} // anonymous namespace
> +
> + size_t estimate_size(const std::vector<RE*> &res)
> + {
> +-      const size_t nre =3D res.size();
> +-      size_t size =3D nre - 1;
> +-      for (size_t i =3D 0; i < nre; ++i) {
> +-              size +=3D estimate(res[i]) + 1;
> +-      }
> +-      return size;
> ++    std::vector<StackItem> stack;
> ++
> ++    const size_t nre =3D res.size();
> ++    //DASSERT(nre > 0);
> ++    size_t size =3D nre - 1;
> ++
> ++    for (size_t i =3D 0; i < nre; ++i) {
> ++        size +=3D estimate_re_size(res[i], stack) + 1;
> ++    }
> ++
> ++    return size;
> + }
> +
> + } // namespace re2c
> +
> diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-suppo=
rt/re2c/re2c_1.0.1.bb
> index faeb496a1a..5806478d73 100644
> --- a/meta/recipes-support/re2c/re2c_1.0.1.bb
> +++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
> @@ -5,7 +5,11 @@ BUGTRACKER =3D "https://github.com/skvadrik/re2c/issues"
>  AUTHOR =3D "Marcus B=C3=B6rger <helly@users.sourceforge.net>"
>  SECTION =3D "devel"
>  LICENSE =3D "PD"
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D146;md5=3D881056c9add17f=
8019ccd8c382ba963a"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D146;md5=3D881056c9add17f=
8019ccd8c382ba963a \
> +file://CVE-2018-21232-1.patch \
> +file://CVE-2018-21232-2.patch \
> +file://CVE-2018-21232-3.patch \
> +file://CVE-2018-21232-4.patch"
>
>  SRC_URI =3D "https://github.com/skvadrik/re2c/releases/download/${PV}/${=
BPN}-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "e2c6cf52fc6a21595f21bc82db5324f8"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163136): https://lists.openembedded.org/g/openembedde=
d-core/message/163136
> Mute This Topic: https://lists.openembedded.org/mt/89771178/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

