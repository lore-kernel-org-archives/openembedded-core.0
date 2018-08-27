Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76622607DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 05:58:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7R5wmYs014473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 22:58:48 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 26 Aug 2018 22:58:47 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1525764187.git.Qi.Chen@windriver.com>
	<ca99a33e28d5c01cd0cd64f24373ac52a016f9af.1525764187.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <56aeef2d-3103-63f4-a9b6-74e4490d0cb7@windriver.com>
Date: Mon, 27 Aug 2018 14:03:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ca99a33e28d5c01cd0cd64f24373ac52a016f9af.1525764187.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] testsdkext: remove workspace/sources to avoid failure in case of multilib
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
X-List-Received-Date: Mon, 27 Aug 2018 05:58:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 05/08/2018 04:07 PM, Chen Qi wrote:
> When multilib is enabled, there are multiple environment scripts, and the
> test cases for eSDK are executed for each environment script.
>
> And we will have the following problem when executing test cases for the
> second environment script.
>
>    ERROR: Source tree path /.../workspace/sources/librdfa already exists and is not empty
>
> So after executing test cases for one environment, we clean up the sources
> diretory to avoid such failure.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/testsdk.bbclass | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
> index 2e43343..54719a1 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -183,6 +183,9 @@ def testsdkext_main(d):
>           if not result.wasSuccessful():
>               fail = True
>   
> +        # Clean the workspace/sources to avoid `devtool add' failure because of non-empty source directory
> +        bb.utils.remove(sdk_dir+'workspace/sources', True)
> +
>       if fail:
>           bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
>   



