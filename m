Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 71B936F89F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:49:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31AnW3a015883; Tue, 1 Apr 2014 11:49:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ppFJe0OyCi8o; Tue,  1 Apr 2014 11:49:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31AnPcG015870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:49:26 +0100
Message-ID: <1396349360.1432.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Tue, 01 Apr 2014 11:49:20 +0100
In-Reply-To: <26f22e4e2b8b1fa1eff604feac7088986d561eab.1396343261.git.kai.kang@windriver.com>
References: <cover.1396343261.git.kai.kang@windriver.com>
	<26f22e4e2b8b1fa1eff604feac7088986d561eab.1396343261.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] cmake: follow ptest output format
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
X-List-Received-Date: Tue, 01 Apr 2014 10:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 17:09 +0800, Kai Kang wrote:
> From: Li Wang <li.wang@windriver.com>
> 
> ptest output format is incorrect, according to yocto Development Manual
> (http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
> 
> The test generates output in the format used by Automake:
> <result>: <testname>
> where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
> 
> So we should change the test result format to match yocto ptest rules.
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |   1 +
>  .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
> 
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 1d5303f..254af45 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -17,6 +17,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
>             file://aarch64-kwsys.patch \
>             file://qt4-fail-silent.patch \
>             file://cmake-2.8.11.2-FindFreetype.patch \
> +           file://follow_ptest_output_format.patch \
>             "
>  
>  inherit autotools-brokensep
> diff --git a/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
> new file mode 100644
> index 0000000..5428df2
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
> @@ -0,0 +1,118 @@
> +cmake: follow ptest output format
> +
> +ptest output format is incorrect, according to yocto Development Manual
> +(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
> +5.10.6. Testing Packages With ptest
> +The test generates output in the format used by Automake:
> +<result>: <testname>
> +where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
> +So we should change the test result format to match yocto ptest rules.
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>

No upstream status. Is there any chance of this going upstream? Might we
be better off postprocessing the output with a script to put it into the
right format?

Cheers,

Richard


> +---
> +--- a/Source/CTest/cmCTestRunTest.cxx
> ++++ b/Source/CTest/cmCTestRunTest.cxx
> +@@ -145,8 +145,8 @@
> +     this->CompressOutput();
> +     }
> + 
> +-  this->WriteLogOutputTop(completed, total);
> +   std::string reason;
> ++  std::string result;
> +   bool passed = true;
> +   int res = started ? this->TestProcess->GetProcessStatus()
> +                     : cmsysProcess_State_Error;
> +@@ -208,57 +208,58 @@
> +       || (!success && this->TestProperties->WillFail))
> +       {
> +       this->TestResult.Status = cmCTestTestHandler::COMPLETED;
> +-      cmCTestLog(this->CTest, HANDLER_OUTPUT, "   Passed  " );
> ++      result = "           ";
> +       }
> +     else
> +       {
> +       this->TestResult.Status = cmCTestTestHandler::FAILED;
> +-      cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Failed  " << reason );
> ++      result = "           " + reason;
> +       outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
> +       }
> +     }
> +   else if ( res == cmsysProcess_State_Expired )
> +     {
> +-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Timeout ");
> ++    result = "***Timeout ";
> +     this->TestResult.Status = cmCTestTestHandler::TIMEOUT;
> +     outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
> +     }
> +   else if ( res == cmsysProcess_State_Exception )
> +     {
> +     outputTestErrorsToConsole = this->CTest->OutputTestOutputOnTestFailure;
> +-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Exception: ");
> ++    result = "***Exception: ";
> +     switch(this->TestProcess->GetExitException())
> +       {
> +       case cmsysProcess_Exception_Fault:
> +-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "SegFault");
> ++        result += "SegFault";
> +         this->TestResult.Status = cmCTestTestHandler::SEGFAULT;
> +         break;
> +       case cmsysProcess_Exception_Illegal:
> +-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Illegal");
> ++        result += "Illegal";
> +         this->TestResult.Status = cmCTestTestHandler::ILLEGAL;
> +         break;
> +       case cmsysProcess_Exception_Interrupt:
> +-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Interrupt");
> ++        result += "Interrupt";
> +         this->TestResult.Status = cmCTestTestHandler::INTERRUPT;
> +         break;
> +       case cmsysProcess_Exception_Numerical:
> +-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Numerical");
> ++        result += "Numerical";
> +         this->TestResult.Status = cmCTestTestHandler::NUMERICAL;
> +         break;
> +       default:
> +-        cmCTestLog(this->CTest, HANDLER_OUTPUT, "Other");
> ++        result += "Other";
> +         this->TestResult.Status = cmCTestTestHandler::OTHER_FAULT;
> +       }
> +     }
> +   else //cmsysProcess_State_Error
> +     {
> +-    cmCTestLog(this->CTest, HANDLER_OUTPUT, "***Not Run ");
> ++    result = "***Not Run ";
> +     }
> + 
> +   passed = this->TestResult.Status == cmCTestTestHandler::COMPLETED;
> +   char buf[1024];
> +   sprintf(buf, "%6.2f sec", this->TestProcess->GetTotalTime());
> +-  cmCTestLog(this->CTest, HANDLER_OUTPUT, buf << "\n" );
> ++  this->WriteLogOutputTop(completed, total);
> ++  cmCTestLog(this->CTest, HANDLER_OUTPUT, result << buf << "\n" );
> + 
> +   if ( outputTestErrorsToConsole )
> +     {
> +@@ -398,6 +399,7 @@
> + // Starts the execution of a test.  Returns once it has started
> + bool cmCTestRunTest::StartTest(size_t total)
> + {
> ++  cmCTestLog(this->CTest, HANDLER_OUTPUT, "      ");
> +   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(2*getNumWidth(total) + 8)
> +     << "Start "
> +     << std::setw(getNumWidth(this->TestHandler->GetMaxIndex()))
> +@@ -679,6 +681,15 @@
> + 
> + void cmCTestRunTest::WriteLogOutputTop(size_t completed, size_t total)
> + {
> ++  if ( this->TestResult.Status == cmCTestTestHandler::COMPLETED )
> ++    {
> ++    cmCTestLog(this->CTest, HANDLER_OUTPUT, "PASS: " );
> ++    }
> ++  else
> ++    {
> ++    cmCTestLog(this->CTest, HANDLER_OUTPUT, "FAIL: " );
> ++    }
> ++
> +   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(getNumWidth(total))
> +              << completed << "/");
> +   cmCTestLog(this->CTest, HANDLER_OUTPUT, std::setw(getNumWidth(total))
> -- 
> 1.8.1.2
> 



