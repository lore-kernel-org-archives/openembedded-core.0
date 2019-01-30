Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 855F16BE21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:01:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U91X7K027869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jan 2019 01:01:33 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 30 Jan 2019 01:01:32 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1548667130.git.liezhi.yang@windriver.com>
	<8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9c2e4334-e452-6ca4-f7ef-5845c5abae52@windriver.com>
Date: Wed, 30 Jan 2019 17:06:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted for HOSTTOOLS
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
X-List-Received-Date: Wed, 30 Jan 2019 09:01:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, this patch doesn't work, it breaks fresh  build's sanity check since
the hosttools are bot ready when run sanity check.

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker 
(see sanity.conf).
     Following is the list of potential problems / advisories:

     Please install the following missing utilities: GNU make,C Compiler (gcc 
),C++ Compiler (g++ 
),patch,diffstat,makeinfo,git,bzip2,tar,gzip,gawk,chrpath,wget,cpio,perl,file,which


Please ignore this patch.

// Robert

On 1/28/19 5:19 PM, Robert Yang wrote:
> Fixed:
> $ export BB_SERVER_TIMEOUT=-1
> $ bitbake quilt-native
> $ rm -fr tmp
> $ bitbake quilt-native
> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
> 
> This is because bb.event.ParseStarted fires only once when server is running,
> but bb.event.ParseStarted fires every time when build configs are changed, so
> use bb.event.ParseStarted to fix the problem.
> 
> [YOCTO #13022]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/base.bbclass | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f1a3c0e..c273a29 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -220,11 +220,18 @@ def buildcfg_neededvars(d):
>           bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
>   
>   addhandler base_eventhandler
> -base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
> +base_eventhandler[eventmask] = "\
> +	bb.event.ParseStarted \
> +	bb.event.MultiConfigParsed \
> +	bb.event.BuildStarted \
> +	bb.event.RecipePreFinalise \
> +	bb.runqueue.sceneQueueComplete \
> +	bb.event.RecipeParsed \
> +"
>   python base_eventhandler() {
>       import bb.runqueue
>   
> -    if isinstance(e, bb.event.ConfigParsed):
> +    if isinstance(e, bb.event.ParseStarted):
>           if not d.getVar("NATIVELSBSTRING", False):
>               d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>           d.setVar('BB_VERSION', bb.__version__)
> 

