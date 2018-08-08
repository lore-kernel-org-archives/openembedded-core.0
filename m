Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA82678D6F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:28:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w78HREFb018343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Aug 2018 10:27:55 -0700
Received: from [128.224.56.212] (128.224.56.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 8 Aug 2018 10:27:49 -0700
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <20180728085316.13484-1-anuj.mittal@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9d148729-8b92-e208-ae5d-3432d693affb@windriver.com>
Date: Wed, 8 Aug 2018 13:27:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180728085316.13484-1-anuj.mittal@intel.com>
X-Originating-IP: [128.224.56.212]
Subject: Re: [PATCH] oeqa/selftest: check if rm_work is enabled
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
X-List-Received-Date: Wed, 08 Aug 2018 17:28:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/28/2018 04:53 AM, Anuj Mittal wrote:
> rm_work if enabled leads to some tests failing that rely on artifacts
> being present. Check if rm_work.bbclass is included and show an error
> and exit if it is.
> 
> Fixes [YOCTO #12694]
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   meta/lib/oeqa/selftest/context.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index 16812ba96e..3a70f9e77b 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -187,6 +187,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>               self.tc.logger.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
>               raise OEQAPreRun
>   
> +        if "rm_work.bbclass" in self.tc.td["BBINCLUDED"]:
> +            self.tc.logger.error("You have rm_work enabled which isn't recommended while running oe-selftest. Please disable it before continuing.")
> +            raise OEQAPreRun
> +
>           if "PRSERV_HOST" in self.tc.td:
>               self.tc.logger.error("Please unset PRSERV_HOST in order to run oe-selftest")
>               raise OEQAPreRun
> 

Enabling rm_work should NOT be an error, and eventually it should not
trigger any warnings. OEQA should only test the results of a build not
how the build was done.

I reviewed some of the rm_work related defects:

1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12647
   The warning was intentional based on Paul's comment.

2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12655
   The logs seem to only say that the error goes away when
   rm_work is NOT enabled. I'd prefer to understand what it is
   that's causing the failure and perhaps add to the packages
   recipe so that the output passes the OEQA tests.

3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12694
   Title was: oe-selftest should warn if rm_work is enabled
   but the commit makes it an error.

Any disagreement about making it be a warning?

rm_work saves lots of storage space so I'm reluctant to make
OEQA require that it is NOT used.


-- 
# Randy MacLeod
# Wind River Linux

