Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3611F6F8CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:10:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s319A47v015684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 02:10:04 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 1 Apr 2014 02:10:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 17:09:51 +0800
Message-ID: <26f22e4e2b8b1fa1eff604feac7088986d561eab.1396343261.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396343261.git.kai.kang@windriver.com>
References: <cover.1396343261.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/3] cmake: follow ptest output format
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
X-List-Received-Date: Tue, 01 Apr 2014 09:10:03 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

ptest output format is incorrect, according to yocto Development Manual
(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)

The test generates output in the format used by Automake:
<result>: <testname>
where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.

So we should change the test result format to match yocto ptest rules.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |   1 +
 .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1d5303f..254af45 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://aarch64-kwsys.patch \
            file://qt4-fail-silent.patch \
            file://cmake-2.8.11.2-FindFreetype.patch \
+           file://follow_ptest_output_format.patch \
            "
 
 inherit autotools-brokensep
diff --git a/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
new file mode 100644
index 0000000..5428df2
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
@@ -0,0 +1,118 @@
+cmake: follow ptest output format
+
+ptest output format is incorrect, according to yocto Development Manual
+(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
+5.10.6. Testing Packages With ptest
+The test generates output in the format used by Automake:
+<result>: <testname>
+where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
+So we should change the test result format to match yocto ptest rules.
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+--- a/Source/CTest/cmCTestRunTest.cxx
++++ b/Source/CTest/cmCTestRunTest.cxx
+@@ -145,8 +145,8 @@
+     this->CompressOutput();
+     }
+ 
+-  this->WriteLogOutputTop(completed, total);
+   std::string reason;
++  std::string result;
+   bool passed = true;
+   int res = started ? this->TestProcess->GetProcessStatus()
+                     : cmsysProcess_State_Error;
+@@ -208,57 +208,58 @@
+       || (!success && this->TestProperties->WillFail))
+       {
+       this->TestResult.Status = cmCTestTestHandler::COMPLETED;
+-      cmCTestLog(this->CTest, HANDLER_OUTPUT, "   Passed  " );
++      result = "           ";
+       }
+     else
+       {
+       this->TestResult.Status = cmCTestTestHandler::FAILED;
+-      cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Failed  " << reason );
++      result = "           " + reason;
+       outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
+       }
+     }
+   else if ( res == cmsysProcess_State_Expired )
+     {
+-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Timeout ");
++    result = "***Timeout ";
+     this->TestResult.Status = cmCTestTestHandler::TIMEOUT;
+     outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
+     }
+   else if ( res == cmsysProcess_State_Exception )
+     {
+     outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
+-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Exception: ");
++    result = "***Exception: ";
+     switch(this->TestProcess->GetExitException())
+       {
+       case cmsysProcess_Exception_Fault:
+-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "SegFault");
++        result += "SegFault";
+         this->TestResult.Status = cmCTestTestHandler::SEGFAULT;
+         break;
+       case cmsysProcess_Exception_Illegal:
+-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Illegal");
++        result += "Illegal";
+         this->TestResult.Status = cmCTestTestHandler::ILLEGAL;
+         break;
+       case cmsysProcess_Exception_Interrupt:
+-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Interrupt");
++        result += "Interrupt";
+         this->TestResult.Status = cmCTestTestHandler::INTERRUPT;
+         break;
+       case cmsysProcess_Exception_Numerical:
+-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Numerical");
++        result += "Numerical";
+         this->TestResult.Status = cmCTestTestHandler::NUMERICAL;
+         break;
+       default:
+-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Other");
++        result += "Other";
+         this->TestResult.Status = cmCTestTestHandler::OTHER_FAULT;
+       }
+     }
+   else //cmsysProcess_State_Error
+     {
+-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Not Run ");
++    result = "***Not Run ";
+     }
+ 
+   passed = this->TestResult.Status == cmCTestTestHandler::COMPLETED;
+   char buf[1024];
+   sprintf(buf, "%6.2f sec", this->TestProcess->GetTotalTime());
+-  cmCTestLog(this->CTest, HANDLER_OUTPUT, buf << "\n" );
++  this->WriteLogOutputTop(completed, total);
++  cmCTestLog(this->CTest, HANDLER_OUTPUT, result << buf << "\n" );
+ 
+   if ( outputTestErrorsToConsole )
+     {
+@@ -398,6 +399,7 @@
+ // Starts the execution of a test.  Returns once it has started
+ bool cmCTestRunTest::StartTest(size_t total)
+ {
++  cmCTestLog(this->CTest, HANDLER_OUTPUT, "      ");
+   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(2*getNumWidth(total) + 8)
+     << "Start "
+     << std::setw(getNumWidth(this->TestHandler->GetMaxIndex()))
+@@ -679,6 +681,15 @@
+ 
+ void cmCTestRunTest::WriteLogOutputTop(size_t completed, size_t total)
+ {
++  if ( this->TestResult.Status == cmCTestTestHandler::COMPLETED )
++    {
++    cmCTestLog(this->CTest, HANDLER_OUTPUT, "PASS: " );
++    }
++  else
++    {
++    cmCTestLog(this->CTest, HANDLER_OUTPUT, "FAIL: " );
++    }
++
+   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(getNumWidth(total))
+              << completed << "/");
+   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(getNumWidth(total))
-- 
1.8.1.2


