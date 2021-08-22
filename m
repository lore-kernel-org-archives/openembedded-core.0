Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.6595.1629603604054009378
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 20:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qhHCiFUr;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id a21so12278351pfh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 20:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FmO06lN9nkKrCx9bFPibI10PqgfAgnk1C9sFr1AahI=;
        b=qhHCiFUrDY58MbZ3e2TRkFTKDHFeMAw+uKMaq4JVqiOUaHwVjRddWigg1S5uydq4ip
         TwZkbmDvabOGm6dQTJLDqkmaITv+AiOwHUarpPFFb3r/Giv39kbGrxTiK3mnPzwkW+36
         ktB8koUwFKjA4ZyN+0sVh/J+6JrQ9JwFo+5MD5GMyy4PH/sss/1i6o9jTKJbgdgFVUn2
         2RMrJd2DHU6+P0IwyGpwX8ZzGQB5Ly41p1s+OmerAHKgiAprTJRqifxeq3bcgqxzueIT
         tdJ6Arr+pbhfT75mkX9iPIxCSOH4fvHdAIOTVaf5tZc/cTHRtWAdLXhtDHhLOve0Lizo
         DjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FmO06lN9nkKrCx9bFPibI10PqgfAgnk1C9sFr1AahI=;
        b=iLcz2QpSd7XxSFF+j4ozdgOPzJER2VYoJ5wCawC6YCWHXp0JX9cWFf2MXfGBXSADdi
         hFLvugzGJYD6ENvp3cmQCAqqg9Ft1aQ3h8d5yO7q5fFvwXlQWE1mno4WAbuD9Te6i0c7
         fjR0LMYLY2iDy1AAcesFSfX4g7f5wxkujHDTz9fxYoQHMuM0fISTpSB8nC3W6DrU10dR
         G0VPwNIUZ775m8nHMaSHuJzRQnn43eRU6M5BwSI7XKAXaadQ1oSI/qPAFG1msimS+xsE
         iSxWrIAwu2cubL8aY/svHtVVwvAW2hpf5BFeSV5Bu+TkPemSFycYS9+lvQS4XWl3RxyR
         xloA==
X-Gm-Message-State: AOAM532KUFsyYqTSM5Ak+k+QLwLS5A7TflPuy/krIT92bukqt9H8xYLK
	jqfOcVLiP6g1KJIA8LnFW82AG0cptJ4=
X-Google-Smtp-Source: ABdhPJxorl0/e3afErtShDdMJhOeEZnx0TS/Nbp1LdQuNn+W7ksLeUMpP41uk761yYagkmEZI6LP2Q==
X-Received: by 2002:a62:5ec6:0:b0:3e1:d20:957b with SMTP id s189-20020a625ec6000000b003e10d20957bmr26891986pfb.24.1629603603174;
        Sat, 21 Aug 2021 20:40:03 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:7b3d:18d5:b887:4ff9])
        by smtp.gmail.com with ESMTPSA id b8sm10139377pjo.51.2021.08.21.20.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 20:40:02 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/2] python3-hypothesis: enable ptest
Date: Sat, 21 Aug 2021 20:39:41 -0700
Message-Id: <20210822033941.1277996-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210822033941.1277996-1-timothy.t.orling@intel.com>
References: <20210822033941.1277996-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream "fast" tests (tests/cover and tests/pytest) take over
5 minutes to run and do not run cleanly. They also add dependency
on python3-pexpect and python3-ptyprocess (currently in meta-python).

The tests are also not included in the pypi tarball, so it would
require use of git fetcher and other invasive changes to the recipe,
including dropping the pypi inherit.

Instead, use two test suites from examples/

References:
https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python/tests
https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python/examples

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../python/python3-hypothesis/run-ptest       |  10 ++
 .../python3-hypothesis/test_binary_search.py  | 135 ++++++++++++++++++
 .../python/python3-hypothesis/test_rle.py     | 101 +++++++++++++
 .../python/python3-hypothesis_6.15.0.bb       |  18 ++-
 5 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis/test_binary_search.py
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis/test_rle.py

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3872bdc942..e0ae1dd971 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -48,6 +48,7 @@ PTESTS_FAST = "\
     pango-ptest \
     parted-ptest \
     python3-atomicwrites-ptest \
+    python3-hypothesis-ptest \
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
diff --git a/meta/recipes-devtools/python/python3-hypothesis/run-ptest b/meta/recipes-devtools/python/python3-hypothesis/run-ptest
new file mode 100644
index 0000000000..8d44d7c49a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Upstream "fast" tests take about 5 minutes and currently do not run cleanly
+# (tests/cover and tests/pytest)
+# https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python/tests
+# https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-python/scripts/basic-test.sh#L18
+#
+# Instead we run two test suites imported from examples/
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-hypothesis/test_binary_search.py b/meta/recipes-devtools/python/python3-hypothesis/test_binary_search.py
new file mode 100644
index 0000000000..21267c4ac2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis/test_binary_search.py
@@ -0,0 +1,135 @@
+# This file is part of Hypothesis, which may be found at
+# https://github.com/HypothesisWorks/hypothesis/
+#
+# Most of this work is copyright (C) 2013-2021 David R. MacIver
+# (david@drmaciver.com), but it contains contributions by others. See
+# CONTRIBUTING.rst for a full list of people who may hold copyright, and
+# consult the git log if you need to determine who owns an individual
+# contribution.
+#
+# This Source Code Form is subject to the terms of the Mozilla Public License,
+# v. 2.0. If a copy of the MPL was not distributed with this file, You can
+# obtain one at https://mozilla.org/MPL/2.0/.
+#
+# END HEADER
+#
+# SPDX-License-Identifier: MPL-2.0
+
+"""This file demonstrates testing a binary search.
+
+It's a useful example because the result of the binary search is so clearly
+determined by the invariants it must satisfy, so we can simply test for those
+invariants.
+
+It also demonstrates the useful testing technique of testing how the answer
+should change (or not) in response to movements in the underlying data.
+"""
+
+from hypothesis import given, strategies as st
+
+
+def binary_search(ls, v):
+    """Take a list ls and a value v such that ls is sorted and v is comparable
+    with the elements of ls.
+
+    Return an index i such that 0 <= i <= len(v) with the properties:
+
+    1. ls.insert(i, v) is sorted
+    2. ls.insert(j, v) is not sorted for j < i
+    """
+    # Without this check we will get an index error on the next line when the
+    # list is empty.
+    if not ls:
+        return 0
+
+    # Without this check we will miss the case where the insertion point should
+    # be zero: The invariant we maintain in the next section is that lo is
+    # always strictly lower than the insertion point.
+    if v <= ls[0]:
+        return 0
+
+    # Invariant: There is no insertion point i with i <= lo
+    lo = 0
+
+    # Invariant: There is an insertion point i with i <= hi
+    hi = len(ls)
+    while lo + 1 < hi:
+        mid = (lo + hi) // 2
+        if v > ls[mid]:
+            # Inserting v anywhere below mid would result in an unsorted list
+            # because it's > the value at mid. Therefore mid is a valid new lo
+            lo = mid
+        # Uncommenting the following lines will cause this to return a valid
+        # insertion point which is not always minimal.
+        # elif v == ls[mid]:
+        #   return mid
+        else:
+            # Either v == ls[mid] in which case mid is a valid insertion point
+            # or v < ls[mid], in which case all valid insertion points must be
+            # < hi. Either way, mid is a valid new hi.
+            hi = mid
+    assert lo + 1 == hi
+    # We now know that there is a valid insertion point <= hi and there is no
+    # valid insertion point < hi because hi - 1 is lo. Therefore hi is the
+    # answer we were seeking
+    return hi
+
+
+def is_sorted(ls):
+    """Is this list sorted?"""
+    for i in range(len(ls) - 1):
+        if ls[i] > ls[i + 1]:
+            return False
+    return True
+
+
+Values = st.integers()
+
+# We generate arbitrary lists and turn this into generating sorting lists
+# by just sorting them.
+SortedLists = st.lists(Values).map(sorted)
+
+# We could also do it this way, but that would be a bad idea:
+# SortedLists = st.lists(Values).filter(is_sorted)
+# The problem is that Hypothesis will only generate long sorted lists with very
+# low probability, so we are much better off post-processing values into the
+# form we want than filtering them out.
+
+
+@given(ls=SortedLists, v=Values)
+def test_insert_is_sorted(ls, v):
+    """We test the first invariant: binary_search should return an index such
+    that inserting the value provided at that index would result in a sorted
+    set."""
+    ls.insert(binary_search(ls, v), v)
+    assert is_sorted(ls)
+
+
+@given(ls=SortedLists, v=Values)
+def test_is_minimal(ls, v):
+    """We test the second invariant: binary_search should return an index such
+    that no smaller index is a valid insertion point for v."""
+    for i in range(binary_search(ls, v)):
+        ls2 = list(ls)
+        ls2.insert(i, v)
+        assert not is_sorted(ls2)
+
+
+@given(ls=SortedLists, v=Values)
+def test_inserts_into_same_place_twice(ls, v):
+    """In this we test a *consequence* of the second invariant: When we insert
+    a value into a list twice, the insertion point should be the same both
+    times. This is because we know that v is > the previous element and == the
+    next element.
+
+    In theory if the former passes, this should always pass. In practice,
+    failures are detected by this test with much higher probability because it
+    deliberately puts the data into a shape that is likely to trigger a
+    failure.
+
+    This is an instance of a good general category of test: Testing how the
+    function moves in responses to changes in the underlying data.
+    """
+    i = binary_search(ls, v)
+    ls.insert(i, v)
+    assert binary_search(ls, v) == i
diff --git a/meta/recipes-devtools/python/python3-hypothesis/test_rle.py b/meta/recipes-devtools/python/python3-hypothesis/test_rle.py
new file mode 100644
index 0000000000..4d618865ac
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis/test_rle.py
@@ -0,0 +1,101 @@
+# This file is part of Hypothesis, which may be found at
+# https://github.com/HypothesisWorks/hypothesis/
+#
+# Most of this work is copyright (C) 2013-2021 David R. MacIver
+# (david@drmaciver.com), but it contains contributions by others. See
+# CONTRIBUTING.rst for a full list of people who may hold copyright, and
+# consult the git log if you need to determine who owns an individual
+# contribution.
+#
+# This Source Code Form is subject to the terms of the Mozilla Public License,
+# v. 2.0. If a copy of the MPL was not distributed with this file, You can
+# obtain one at https://mozilla.org/MPL/2.0/.
+#
+# END HEADER
+#
+# SPDX-License-Identifier: MPL-2.0
+
+"""This example demonstrates testing a run length encoding scheme. That is, we
+take a sequence and represent it by a shorter sequence where each 'run' of
+consecutive equal elements is represented as a single element plus a count. So
+e.g.
+
+[1, 1, 1, 1, 2, 1] is represented as [[1, 4], [2, 1], [1, 1]]
+
+This demonstrates the useful decode(encode(x)) == x invariant that is often
+a fruitful source of testing with Hypothesis.
+
+It also has an example of testing invariants in response to changes in the
+underlying data.
+"""
+
+from hypothesis import assume, given, strategies as st
+
+
+def run_length_encode(seq):
+    """Encode a sequence as a new run-length encoded sequence."""
+    if not seq:
+        return []
+    # By starting off the count at zero we simplify the iteration logic
+    # slightly.
+    result = [[seq[0], 0]]
+    for s in seq:
+        if (
+            # If you uncomment this line this branch will be skipped and we'll
+            # always append a new run of length 1. Note which tests fail.
+            # False and
+            s
+            == result[-1][0]
+            # Try uncommenting this line and see what problems occur:
+            # and result[-1][-1] < 2
+        ):
+            result[-1][1] += 1
+        else:
+            result.append([s, 1])
+    return result
+
+
+def run_length_decode(seq):
+    """Take a previously encoded sequence and reconstruct the original from
+    it."""
+    result = []
+    for s, i in seq:
+        for _ in range(i):
+            result.append(s)
+    return result
+
+
+# We use lists of a type that should have a relatively high duplication rate,
+# otherwise we'd almost never get any runs.
+Lists = st.lists(st.integers(0, 10))
+
+
+@given(Lists)
+def test_decodes_to_starting_sequence(ls):
+    """If we encode a sequence and then decode the result, we should get the
+    original sequence back.
+
+    Otherwise we've done something very wrong.
+    """
+    assert run_length_decode(run_length_encode(ls)) == ls
+
+
+@given(Lists, st.data())
+def test_duplicating_an_element_does_not_increase_length(ls, data):
+    """The previous test could be passed by simply returning the input sequence
+    so we need something that tests the compression property of our encoding.
+
+    In this test we deliberately introduce or extend a run and assert
+    that this does not increase the length of our encoding, because they
+    should be part of the same run in the final result.
+    """
+    # We use assume to get a valid index into the list. We could also have used
+    # e.g. flatmap, but this is relatively straightforward and will tend to
+    # perform better.
+    assume(ls)
+    i = data.draw(st.integers(0, len(ls) - 1))
+    ls2 = list(ls)
+    # duplicating the value at i right next to it guarantees they are part of
+    # the same run in the resulting compression.
+    ls2.insert(i, ls2[i])
+    assert len(run_length_encode(ls2)) == len(run_length_encode(ls))
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
index 9f0b7eaf3d..1ea6bb56e6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.15.0.bb
@@ -5,7 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
 
 PYPI_PACKAGE = "hypothesis"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+    file://run-ptest \
+    file://test_binary_search.py \
+    file://test_rle.py \
+    "
 
 SRC_URI[sha256sum] = "10699f595eebb9410fd902908aa13aece19be5c437b405092be34f60f69f7999"
 
@@ -19,4 +25,14 @@ RDEPENDS:${PN} += " \
     python3-unittest \
     "
 
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/examples
+    install -m 0755 ${WORKDIR}/test_binary_search.py ${D}${PTEST_PATH}/examples/
+    install -m 0755 ${WORKDIR}/test_rle.py ${D}${PTEST_PATH}/examples/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

