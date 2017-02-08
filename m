Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E42B065CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 22:11:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 14:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="1092493467"
Received: from vpadodar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.133.23])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 14:10:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 09 Feb 2017 11:10:52 +1300
Message-ID: <2163188.vp3pErinyH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/5.3.3 (Linux/4.9.7-201.fc25.x86_64; KDE/5.29.0; x86_64; ; )
In-Reply-To: <1486534673-18706-1-git-send-email-mike.looijmans@topic.nl>
References: <9b8f8f39-aa5f-cbdf-8d45-9bd0e27c9404@topic.nl>
	<1486534673-18706-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [bitbake][PATCH] lib/bb/build.py: Raise proper KeyError if function does not exist
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
X-List-Received-Date: Wed, 08 Feb 2017 22:11:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Wednesday, 8 February 2017 7:17:53 AM NZDT Mike Looijmans wrote:
> If one adds the following line to an image recipe without defining
> the function:
> ROOTFS_POSTPROCESS_COMMAND += "rootfs_funky_stuff;"
> bitbake will terminate with a cryptic error message:
> AttributeError: 'NoneType' object has no attribute 'get'
> 
> To inform the user of what bitbake wasn't able to find, raise a KeyError
> exception denoting the function name before that happens. This changes the
> message to the much more useful:
> KeyError: 'rootfs_funky_stuff'
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  lib/bb/build.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/bb/build.py b/lib/bb/build.py
> index c4c8aeb..5bc18c1 100644
> --- a/lib/bb/build.py
> +++ b/lib/bb/build.py
> @@ -194,6 +194,8 @@ def exec_func(func, d, dirs = None,
> pythonexception=False): oldcwd = None
> 
>      flags = d.getVarFlags(func)
> +    if flags is None:
> +        raise KeyError(func)
>      cleandirs = flags.get('cleandirs')
>      if cleandirs:
>          for cdir in d.expand(cleandirs).split():

This should got to the bitbake-devel list.

Whilst I agree this is an improvement, since we're trying to print a more 
reasonable error message, wouldn't we be better off explicitly saying 
"Function %s not defined" or similar?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

