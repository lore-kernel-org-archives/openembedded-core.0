Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9140A731D1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 21:07:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Sep 2016 14:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,319,1470726000"; d="scan'208";a="1028466060"
Received: from tbui5-mobl2.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.152.213])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2016 14:07:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 09:07:33 +1200
Message-ID: <1891963.rDEoGGKz2S@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.2-101.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1473167586-11640-1-git-send-email-amarnath.valluri@intel.com>
References: <1473167586-11640-1-git-send-email-amarnath.valluri@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] classes/populate_sdk_ext: exclude image tasks from locked signatures
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
X-List-Received-Date: Sun, 11 Sep 2016 21:07:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 06 Sep 2016 16:13:06 Amarnath Valluri wrote:
> Tasks for image recipes cannot be locked and should be excluded from eSDK
> generated locked-sigs.inc. get_sdk_install_targets() was not returning right
> image targets to be excluded incase of 'minimal' sdk. This change fixes the
> issue.
> 
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index d8d123a..1a15d2a 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -43,7 +43,7 @@ SDK_TARGETS ?= "${PN}"
> 
>  def get_sdk_install_targets(d, images_only=False):
>      sdk_install_targets = ''
> -    if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
> +    if images_only or d.getVar('SDK_EXT_TYPE', True) != 'minimal':
>          sdk_install_targets = d.getVar('SDK_TARGETS', True)
> 
>          depd = d.getVar('BB_TASKDEPDATA', False)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

(The original naming of the parameter probably makes this a little confusing 
now, but we can tidy that up later.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

