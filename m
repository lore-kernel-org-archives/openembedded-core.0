Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 761FF719C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C6VW3k007692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 23:31:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 23:31:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 23:31:27 -0700
Message-ID: <7130742f174b1f88e06417cdf0ed09834b5febfc.1476253865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476253865.git.liezhi.yang@windriver.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] xcb-proto: fix for python3
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
X-List-Received-Date: Wed, 12 Oct 2016 06:31:32 -0000
Content-Type: text/plain

Backport two patches to make it py3 friendly.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-Make-whitespace-use-consistent.patch      | 215 +++++++++++++++++++++
 ...print-is-a-function-and-needs-parentheses.patch |  75 +++++++
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb |   5 +-
 3 files changed, 294 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
new file mode 100644
index 0000000..89ec666
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
@@ -0,0 +1,215 @@
+From ea7a3ac6c658164690e0febb55f4467cb9e0bcac Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Thu, 19 May 2016 17:30:04 +0200
+Subject: [PATCH 1/2] Make whitespace use consistent.
+
+At least python-3.5.x complains about this forcefully.
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Signed-off-by: Uli Schlachter <psychon@znc.in>
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ xcbgen/align.py | 96 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 48 insertions(+), 48 deletions(-)
+
+diff --git a/xcbgen/align.py b/xcbgen/align.py
+index 5e31838..d4c12ee 100644
+--- a/xcbgen/align.py
++++ b/xcbgen/align.py
+@@ -16,12 +16,12 @@ class Alignment(object):
+         return self.align == other.align and self.offset == other.offset
+ 
+     def __str__(self):
+-	return "(align=%d, offset=%d)" % (self.align, self.offset)
++        return "(align=%d, offset=%d)" % (self.align, self.offset)
+ 
+     @staticmethod
+     def for_primitive_type(size):
+-	# compute the required start_alignment based on the size of the type
+-	if size % 8 == 0:
++        # compute the required start_alignment based on the size of the type
++        if size % 8 == 0:
+             # do 8-byte primitives require 8-byte alignment in X11?
+             return Alignment(8,0)
+         elif size % 4 == 0:
+@@ -33,7 +33,7 @@ class Alignment(object):
+ 
+ 
+     def align_after_fixed_size(self, size):
+-	new_offset = (self.offset + size) % self.align
++        new_offset = (self.offset + size) % self.align
+         return Alignment(self.align, new_offset)
+ 
+ 
+@@ -41,7 +41,7 @@ class Alignment(object):
+         '''
+         Assuming the given external_align, checks whether
+         self is fulfilled for all cases.
+-	Returns True if yes, False otherwise.
++        Returns True if yes, False otherwise.
+         '''
+         if self.align == 1 and self.offset == 0:
+             # alignment 1 with offset 0 is always fulfilled
+@@ -55,9 +55,9 @@ class Alignment(object):
+             # the external align guarantees less alignment -> not guaranteed
+             return False
+ 
+-	if external_align.align % self.align != 0:
++        if external_align.align % self.align != 0:
+             # the external align cannot be divided by our align
+-	    # -> not guaranteed
++            # -> not guaranteed
+             # (this can only happen if there are alignments that are not
+             # a power of 2, which is highly discouraged. But better be
+             # safe and check for it)
+@@ -72,7 +72,7 @@ class Alignment(object):
+ 
+     def combine_with(self, other):
+         # returns the alignment that is guaranteed when
+-	# both, self or other, can happen
++        # both, self or other, can happen
+         new_align = gcd(self.align, other.align)
+         new_offset_candidate1 = self.offset % new_align
+         new_offset_candidate2 = other.offset % new_align
+@@ -83,8 +83,8 @@ class Alignment(object):
+             new_align = gcd(new_align, offset_diff)
+             new_offset_candidate1 = self.offset % new_align
+             new_offset_candidate2 = other.offset % new_align
+-	    assert new_offset_candidate1 == new_offset_candidate2
+-	    new_offset = new_offset_candidate1
++            assert new_offset_candidate1 == new_offset_candidate2
++            new_offset = new_offset_candidate1
+         # return the result
+         return Alignment(new_align, new_offset)
+ 
+@@ -92,44 +92,44 @@ class Alignment(object):
+ class AlignmentLog(object):
+ 
+     def __init__(self):
+-	self.ok_list = []
+-	self.fail_list = []
+-	self.verbosity = 1
++        self.ok_list = []
++        self.fail_list = []
++        self.verbosity = 1
+ 
+     def __str__(self):
+-	result = ""
++        result = ""
+ 
+-	# output the OK-list
+-	for (align_before, field_name, type_obj, callstack, align_after) in self.ok_list:
+-	    stacksize = len(callstack)
++        # output the OK-list
++        for (align_before, field_name, type_obj, callstack, align_after) in self.ok_list:
++            stacksize = len(callstack)
+             indent = '  ' * stacksize
+-	    if self.ok_callstack_is_relevant(callstack):
++            if self.ok_callstack_is_relevant(callstack):
+                 if field_name is None or field_name == "":
+-	            result += ("    %sok: %s:\n\t%sbefore: %s, after: %s\n"
+-		        % (indent, str(type_obj), indent, str(align_before), str(align_after)))
+-	        else:
+-		    result += ("    %sok: field \"%s\" in %s:\n\t%sbefore: %s, after: %s\n"
+-		        % (indent, str(field_name), str(type_obj),
+-		           indent, str(align_before), str(align_after)))
++                    result += ("    %sok: %s:\n\t%sbefore: %s, after: %s\n"
++                        % (indent, str(type_obj), indent, str(align_before), str(align_after)))
++                else:
++                    result += ("    %sok: field \"%s\" in %s:\n\t%sbefore: %s, after: %s\n"
++                        % (indent, str(field_name), str(type_obj),
++                           indent, str(align_before), str(align_after)))
+                 if self.verbosity >= 1:
+-		    result += self.callstack_to_str(indent, callstack)
++                    result += self.callstack_to_str(indent, callstack)
+ 
+-	# output the fail-list
+-	for (align_before, field_name, type_obj, callstack, reason) in self.fail_list:
+-	    stacksize = len(callstack)
++        # output the fail-list
++        for (align_before, field_name, type_obj, callstack, reason) in self.fail_list:
++            stacksize = len(callstack)
+             indent = '  ' * stacksize
+-	    if field_name is None or field_name == "":
+-	        result += ("    %sfail: align %s is incompatible with\n\t%s%s\n\t%sReason: %s\n"
+-		    % (indent, str(align_before), indent, str(type_obj), indent, reason))
+-	    else:
+-		result += ("    %sfail: align %s is incompatible with\n\t%sfield \"%s\" in %s\n\t%sReason: %s\n"
+-		    % (indent, str(align_before), indent, str(field_name), str(type_obj), indent, reason))
++            if field_name is None or field_name == "":
++                result += ("    %sfail: align %s is incompatible with\n\t%s%s\n\t%sReason: %s\n"
++                    % (indent, str(align_before), indent, str(type_obj), indent, reason))
++            else:
++                result += ("    %sfail: align %s is incompatible with\n\t%sfield \"%s\" in %s\n\t%sReason: %s\n"
++                    % (indent, str(align_before), indent, str(field_name), str(type_obj), indent, reason))
+ 
+             if self.verbosity >= 1:
+-	        result += self.callstack_to_str(indent, callstack)
++                result += self.callstack_to_str(indent, callstack)
+ 
+ 
+-	return result
++        return result
+ 
+ 
+     def callstack_to_str(self, indent, callstack):
+@@ -137,41 +137,41 @@ class AlignmentLog(object):
+         for stack_elem in callstack:
+             result += "\t  %s%s\n" % (indent, str(stack_elem))
+         result += "\t%s]\n" % indent
+-	return result
++        return result
+ 
+ 
+     def ok_callstack_is_relevant(self, ok_callstack):
+         # determine whether an ok callstack is relevant for logging
+-	if self.verbosity >= 2:
+-	    return True
++        if self.verbosity >= 2:
++            return True
+ 
+         # empty callstacks are always relevant
+-	if len(ok_callstack) == 0:
++        if len(ok_callstack) == 0:
+             return True
+ 
+-	# check whether the ok_callstack is a subset or equal to a fail_callstack
++        # check whether the ok_callstack is a subset or equal to a fail_callstack
+         for (align_before, field_name, type_obj, fail_callstack, reason) in self.fail_list:
+             if len(ok_callstack) <= len(fail_callstack):
+                 zipped = zip(ok_callstack, fail_callstack[:len(ok_callstack)])
+-		is_subset = all([i == j for i, j in zipped])
+-		if is_subset:
++                is_subset = all([i == j for i, j in zipped])
++                if is_subset:
+                     return True
+ 
+         return False
+ 
+ 
+     def ok(self, align_before, field_name, type_obj, callstack, align_after):
+-	self.ok_list.append((align_before, field_name, type_obj, callstack, align_after))
++        self.ok_list.append((align_before, field_name, type_obj, callstack, align_after))
+ 
+     def fail(self, align_before, field_name, type_obj, callstack, reason):
+-	self.fail_list.append((align_before, field_name, type_obj, callstack, reason))
++        self.fail_list.append((align_before, field_name, type_obj, callstack, reason))
+ 
+     def append(self, other):
+-	self.ok_list.extend(other.ok_list)
+-	self.fail_list.extend(other.fail_list)
++        self.ok_list.extend(other.ok_list)
++        self.fail_list.extend(other.fail_list)
+ 
+     def ok_count(self):
+-	return len(self.ok_list)
++        return len(self.ok_list)
+ 
+ 
+ 
+-- 
+2.9.0
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
new file mode 100644
index 0000000..542acb8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
@@ -0,0 +1,75 @@
+From bea5e1c85bdc0950913790364e18228f20395a3d Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Thu, 19 May 2016 17:30:05 +0200
+Subject: [PATCH 2/2] print() is a function and needs parentheses.
+
+Fixes build with python-3.x.
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Signed-off-by: Uli Schlachter <psychon@znc.in>
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ xcbgen/xtypes.py | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/xcbgen/xtypes.py b/xcbgen/xtypes.py
+index c3b5758..b83b119 100644
+--- a/xcbgen/xtypes.py
++++ b/xcbgen/xtypes.py
+@@ -501,7 +501,7 @@ class ComplexType(Type):
+                 int(required_start_align_element.get('align', "4"), 0),
+                 int(required_start_align_element.get('offset', "0"), 0))
+             if verbose_align_log:
+-                print "Explicit start-align for %s: %s\n" % (self, self.required_start_align)
++                print ("Explicit start-align for %s: %s\n" % (self, self.required_start_align))
+ 
+     def resolve(self, module):
+         if self.resolved:
+@@ -592,7 +592,7 @@ class ComplexType(Type):
+                 if verbose_align_log:
+                     print ("calc_required_start_align: %s has start-align %s"
+                         % (str(self), str(self.required_start_align)))
+-                    print "Details:\n" + str(log)
++                    print ("Details:\n" + str(log))
+                 if self.required_start_align.offset != 0:
+                     print (("WARNING: %s\n\thas start-align with non-zero offset: %s"
+                         + "\n\tsuggest to add explicit definition with:"
+@@ -619,12 +619,12 @@ class ComplexType(Type):
+             for offset in range(0,align):
+                 align_candidate = Alignment(align, offset)
+                 if verbose_align_log:
+-                    print "trying %s for %s" % (str(align_candidate), str(self))
++                    print ("trying %s for %s" % (str(align_candidate), str(self)))
+                 my_log = AlignmentLog()
+                 if self.is_possible_start_align(align_candidate, callstack, my_log):
+                     log.append(my_log)
+                     if verbose_align_log:
+-                        print "found start-align %s for %s" % (str(align_candidate), str(self))
++                        print ("found start-align %s for %s" % (str(align_candidate), str(self)))
+                     return align_candidate
+                 else:
+                     my_ok_count = my_log.ok_count()
+@@ -641,7 +641,7 @@ class ComplexType(Type):
+         # none of the candidates applies
+         # this type has illegal internal aligns for all possible start_aligns
+         if verbose_align_log:
+-            print "didn't find start-align for %s" % str(self)
++            print ("didn't find start-align for %s" % str(self))
+         log.append(best_log)
+         return None
+ 
+@@ -900,7 +900,7 @@ class SwitchType(ComplexType):
+     # aux function for unchecked_get_alignment_after
+     def get_align_for_selected_case_field(self, case_field, start_align, callstack, log):
+         if verbose_align_log:
+-            print "get_align_for_selected_case_field: %s, case_field = %s" % (str(self), str(case_field))
++            print ("get_align_for_selected_case_field: %s, case_field = %s" % (str(self), str(case_field)))
+         total_align = start_align
+         for field in self.bitcases:
+             my_callstack = callstack[:]
+-- 
+2.9.0
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 54988fc..bbb3173 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://no-python-native.patch"
+           file://no-python-native.patch \
+           file://0001-Make-whitespace-use-consistent.patch \
+           file://0002-print-is-a-function-and-needs-parentheses.patch \
+           "
 SRC_URI[md5sum] = "14e60919f859560f28426a685a555962"
 SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c480a4906"
 
-- 
2.9.0


