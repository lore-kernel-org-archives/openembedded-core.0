Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9270278CC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:38:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8cX3d012307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:38:33 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 27 Jul 2018 01:38:32 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1532662132.git.liezhi.yang@windriver.com>
	<7797881de00cfa76404ed3c107b286f65f66af00.1532662132.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <eddbb77a-7751-0f7c-cf51-dfbfe2d3a27f@windriver.com>
Date: Fri, 27 Jul 2018 16:37:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7797881de00cfa76404ed3c107b286f65f66af00.1532662132.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] testsdk.bbclass: check python module testools and subunit
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
X-List-Received-Date: Fri, 27 Jul 2018 08:38:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/27/2018 11:29 AM, Robert Yang wrote:
> The testools or subunit is not part of python's standard library, so check them
> before use.
> 
> Fixed when they are not installed on host:
> $ bitbake core-image-minimal -ctestsdk
> Exception: ImportError: No module named 'testtools'
> 
> Now it can run with a warning:
> WARNING: core-image-minimal-1.0-r0 do_testsdk: Failed to import testools or subunit, the testcases will run serially
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/testsdk.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
> index 5df17bf..4f86998 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -43,6 +43,12 @@ def testsdk_main(d):
>           d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
>   
>       processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
> +    if processes:
> +        try:
> +            import testools, subunit
> +        except ImportError:
> +            bb.warn("Failed to import testools or subunit, the testcases will run serially")

Sorry, typos, they should be "testtools" (lacks of a t), I fixed them in
the repo, also fixed in the commit message.

// Robert

> +            processes = None
>   
>       sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
>       bb.utils.remove(sdk_dir, True)
> 

