Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4528774AEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:25:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9F8PJkR029882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Oct 2018 09:25:20 +0100
Message-ID: <9d6783fcc08d063e63a44f8dc5b9048ce2a698f2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 09:25:19 +0100
In-Reply-To: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/5] oeqa/core/runner: refactor for OEQA to write json testresult
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
X-List-Received-Date: Mon, 15 Oct 2018 08:25:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-15 at 15:24 +0800, Yeoh Ee Peng wrote:
> Refactor the original _getDetailsNotPassed method to return
> testresult details (test status and log), which will be reused
> by future OEQA code to write json testresult.
> 
> Take the opportunity to consolidate and simplify the logic used
> to gather test status and log within the TestResult instance.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/core/runner.py | 70 ++++++++++++++++++--------------------------
>  1 file changed, 29 insertions(+), 41 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index eeb625b..56666ee 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -76,40 +76,43 @@ class OETestResult(_TestResult):
>          else:
>              msg = "%s - FAIL - Required tests failed" % component
>          skipped = len(self.skipped)
> -        if skipped: 
> +        if skipped:
>              msg += " (skipped=%d)" % skipped
>          self.tc.logger.info(msg)
>  
> -    def _getDetailsNotPassed(self, case, type, desc):
> -        found = False
> +    def _getTestResultDetails(self, case):
> +        result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
> +        result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']

This patch is much better thanks! 

It could still do with one more minor tweak. You can use a dict above
to simplfy this code and avoid using indexes which is not very
pythonic, for example


result_types = {'failures' : 'FAILED', 'errors' : 'ERROR'}

then

for rtype in result_types:
    [...]
    return result_types[rtype], msg


The rest of the patch looks like a nice simplification now though!

Cheers,

Richard


