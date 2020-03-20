Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE0B1618F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 01:56:25 +0000 (UTC)
IronPort-SDR: bwn0zoe24NDKopy9li1z5nsSr8ZN6aaKqcz+v/QQrB3fiw4Bd5qbZYsNBRwW9T0iWYH2f8lySY
	m39lv+BmJT8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Mar 2020 18:56:26 -0700
IronPort-SDR: Jnw6o1xFbOS80NzBLoQcgTsbO8KvATHe3vp98VU5Uknlns6UKXkah5WcPqHXDgRSYf5q9TjjS6
	RjLnwFaK+lYQ==
X-IronPort-AV: E=Sophos;i="5.72,282,1580803200"; d="scan'208";a="392001800"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.77.159])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 18:56:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 09:56:19 +0800
Message-Id: <20200320015620.125128-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [zeus][PATCH 1/2] icu: fix CVE-2020-10531
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
X-List-Received-Date: Fri, 20 Mar 2020 01:56:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../icu/icu/CVE-2020-10531.patch              | 122 ++++++++++++++++++
 meta/recipes-support/icu/icu_64.2.bb          |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2020-10531.patch b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
new file mode 100644
index 0000000000..56303fc0f2
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
@@ -0,0 +1,122 @@
+From b7d08bc04a4296982fcef8b6b8a354a9e4e7afca Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Sat, 1 Feb 2020 02:39:04 +0000
+Subject: [PATCH] ICU-20958 Prevent SEGV_MAPERR in append
+
+See #971
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca]
+CVE: CVE-2020-10531
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ icu4c/source/common/unistr.cpp          |  6 ++-
+ icu4c/source/test/intltest/ustrtest.cpp | 62 +++++++++++++++++++++++++
+ icu4c/source/test/intltest/ustrtest.h   |  1 +
+ 3 files changed, 68 insertions(+), 1 deletion(-)
+
+diff --git a/icu4c/source/common/unistr.cpp b/icu4c/source/common/unistr.cpp
+index 901bb3358ba..077b4d6ef20 100644
+--- a/icu4c/source/common/unistr.cpp
++++ b/icu4c/source/common/unistr.cpp
+@@ -1563,7 +1563,11 @@ UnicodeString::doAppend(const UChar *srcChars, int32_t srcStart, int32_t srcLeng
+   }
+ 
+   int32_t oldLength = length();
+-  int32_t newLength = oldLength + srcLength;
++  int32_t newLength;
++  if (uprv_add32_overflow(oldLength, srcLength, &newLength)) {
++    setToBogus();
++    return *this;
++  }
+ 
+   // Check for append onto ourself
+   const UChar* oldArray = getArrayStart();
+diff --git a/icu4c/source/test/intltest/ustrtest.cpp b/icu4c/source/test/intltest/ustrtest.cpp
+index b6515ea813c..ad38bdf53a3 100644
+--- a/icu4c/source/test/intltest/ustrtest.cpp
++++ b/icu4c/source/test/intltest/ustrtest.cpp
+@@ -67,6 +67,7 @@ void UnicodeStringTest::runIndexedTest( int32_t index, UBool exec, const char* &
+     TESTCASE_AUTO(TestWCharPointers);
+     TESTCASE_AUTO(TestNullPointers);
+     TESTCASE_AUTO(TestUnicodeStringInsertAppendToSelf);
++    TESTCASE_AUTO(TestLargeAppend);
+     TESTCASE_AUTO_END;
+ }
+ 
+@@ -2310,3 +2311,64 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+     str.insert(2, sub);
+     assertEquals("", u"abbcdcde", str);
+ }
++
++void UnicodeStringTest::TestLargeAppend() {
++    if(quick) return;
++
++    IcuTestErrorCode status(*this, "TestLargeAppend");
++    // Make a large UnicodeString
++    int32_t len = 0xAFFFFFF;
++    UnicodeString str;
++    char16_t *buf = str.getBuffer(len);
++    // A fast way to set buffer to valid Unicode.
++    // 4E4E is a valid unicode character
++    uprv_memset(buf, 0x4e, len * 2);
++    str.releaseBuffer(len);
++    UnicodeString dest;
++    // Append it 16 times
++    // 0xAFFFFFF times 16 is 0xA4FFFFF1,
++    // which is greater than INT32_MAX, which is 0x7FFFFFFF.
++    int64_t total = 0;
++    for (int32_t i = 0; i < 16; i++) {
++        dest.append(str);
++        total += len;
++        if (total <= INT32_MAX) {
++            assertFalse("dest is not bogus", dest.isBogus());
++        } else {
++            assertTrue("dest should be bogus", dest.isBogus());
++        }
++    }
++    dest.remove();
++    total = 0;
++    for (int32_t i = 0; i < 16; i++) {
++        dest.append(str);
++        total += len;
++        if (total + len <= INT32_MAX) {
++            assertFalse("dest is not bogus", dest.isBogus());
++        } else if (total <= INT32_MAX) {
++            // Check that a string of exactly the maximum size works
++            UnicodeString str2;
++            int32_t remain = INT32_MAX - total;
++            char16_t *buf2 = str2.getBuffer(remain);
++            if (buf2 == nullptr) {
++                // if somehow memory allocation fail, return the test
++                return;
++            }
++            uprv_memset(buf2, 0x4e, remain * 2);
++            str2.releaseBuffer(remain);
++            dest.append(str2);
++            total += remain;
++            assertEquals("When a string of exactly the maximum size works", (int64_t)INT32_MAX, total);
++            assertEquals("When a string of exactly the maximum size works", INT32_MAX, dest.length());
++            assertFalse("dest is not bogus", dest.isBogus());
++
++            // Check that a string size+1 goes bogus
++            str2.truncate(1);
++            dest.append(str2);
++            total++;
++            assertTrue("dest should be bogus", dest.isBogus());
++        } else {
++            assertTrue("dest should be bogus", dest.isBogus());
++        }
++    }
++}
+diff --git a/icu4c/source/test/intltest/ustrtest.h b/icu4c/source/test/intltest/ustrtest.h
+index 218befdcc68..4a356a92c7a 100644
+--- a/icu4c/source/test/intltest/ustrtest.h
++++ b/icu4c/source/test/intltest/ustrtest.h
+@@ -97,6 +97,7 @@ class UnicodeStringTest: public IntlTest {
+     void TestWCharPointers();
+     void TestNullPointers();
+     void TestUnicodeStringInsertAppendToSelf();
++    void TestLargeAppend();
+ };
+ 
+ #endif
diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_64.2.bb
index 10bac7aac0..2ed807787d 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2020-10531.patch;striplevel=3 \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.25.1


