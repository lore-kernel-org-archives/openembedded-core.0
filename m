Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.65.1588130056750187135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 20:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,329,1583164800"; 
   d="scan'208";a="90727503"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Apr 2020 11:14:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DDBDF4CE1CB4
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 11:14:07 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 29 Apr 2020 11:14:08 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 29 Apr 2020 11:14:15 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] icu: CVE-2020-10531
Date: Wed, 29 Apr 2020 04:13:55 -0700
Message-ID: <20200429111356.34973-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DDBDF4CE1CB4.A8AD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10531

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../icu/icu/CVE-2020-10531.patch              | 128 ++++++++++++++++++
 meta/recipes-support/icu/icu_66.1.bb          |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2020-10531.patch b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
new file mode 100644
index 0000000000..6697b27dc8
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
@@ -0,0 +1,128 @@
+From b7d08bc04a4296982fcef8b6b8a354a9e4e7afca Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Sat, 1 Feb 2020 02:39:04 +0000
+Subject: [PATCH] ICU-20958 Prevent SEGV_MAPERR in append
+
+See #971
+
+Upstream-Status: Accepted
+CVE: CVE-2020-10531
+
+Reference to upstream patch:
+https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca
+
+---
+ common/unistr.cpp          |  6 ++-
+ test/intltest/ustrtest.cpp | 62 +++++++++++++++++++++++++++++++
+ test/intltest/ustrtest.h   |  1 +
+ 3 files changed, 68 insertions(+), 1 deletion(-)
+
+diff --git a/common/unistr.cpp b/common/unistr.cpp
+index 901bb33..6ea0915 100644
+--- a/common/unistr.cpp
++++ b/common/unistr.cpp
+@@ -1563,7 +1563,11 @@ UnicodeString::doAppend(const UChar *srcChars, int32_t srcStart, int32_t srcLeng
+   }
+ 
+   int32_t oldLength = length();
+-  int32_t newLength = oldLength + srcLength;
++  int32_t newLength; 
++  if (uprv_add32_overflow(oldLength, srcLength, &newLength)) { 
++     setToBogus(); 
++     return *this; 
++  }
+ 
+   // Check for append onto ourself
+   const UChar* oldArray = getArrayStart();
+diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
+index b6515ea..ad38bdf 100644
+--- a/test/intltest/ustrtest.cpp
++++ b/test/intltest/ustrtest.cpp
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
+diff --git a/test/intltest/ustrtest.h b/test/intltest/ustrtest.h
+index 218befd..4a356a9 100644
+--- a/test/intltest/ustrtest.h
++++ b/test/intltest/ustrtest.h
+@@ -97,6 +97,7 @@ public:
+     void TestWCharPointers();
+     void TestNullPointers();
+     void TestUnicodeStringInsertAppendToSelf();
++    void TestLargeAppend();
+ };
+ 
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index f2bb344e33..a8096c1840 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch;apply=no \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2020-10531.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.17.1



