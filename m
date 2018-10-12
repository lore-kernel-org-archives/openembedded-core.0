Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE44F745AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:10:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9CFAcDg020329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Oct 2018 16:10:39 +0100
Message-ID: <46619302b5ac197fcfa3216cfcbbbe6ecd853079.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 16:10:38 +0100
In-Reply-To: <1539325990-89780-3-git-send-email-ee.peng.yeoh@intel.com>
References: <1539325990-89780-1-git-send-email-ee.peng.yeoh@intel.com>
	<1539325990-89780-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] testimage.bbclass: write testresult to json files
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
X-List-Received-Date: Fri, 12 Oct 2018 15:10:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 14:33 +0800, Yeoh Ee Peng wrote:
> As part of the solution to replace Testopia to store testresult,
> OEQA testimage need to output testresult into json files, where
> these json testresult files will be stored into git repository
> by the future test-case-management tools.
> 
> By default, testimage will write json testresult, to disable
> this, specify OEQA_SKIP_OUTPUT_JSON="1" as configuration.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/classes/testimage.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 0e07afa..2901e10 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -306,6 +306,18 @@ def testimage_main(d):
>          bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
>      results.logDetails()
>      results.logSummary(pn)
> +    if (d.getVar('OEQA_SKIP_OUTPUT_JSON')) == '1':
> +        bb.debug(2, 'Skip the OEQA output json testresult as OEQA_SKIP_OUTPUT_JSON=1')
> +    else:

Please don't add OEQA_SKIP_OUTPUT_JSON, lets just write these files out
in all cases. They're small and useful and I having too many codepaths
without good reason just means there is more to test and more to break.

> +        workdir = d.getVar("WORKDIR")
> +        image_basename = d.getVar("IMAGE_BASENAME")
> +        json_result_dir = os.path.join(workdir,

Just use d.getVar("WORKDIR") instead of the intermediate variable here,
it only makes sense to use the intermediate one if there are multiple
uses of it.

Cheers,

Richard


