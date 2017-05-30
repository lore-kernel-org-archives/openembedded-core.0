Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A193878190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:45:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 30 May 2017 14:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,420,1491289200"; d="scan'208";a="1154639990"
Received: from achiok-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.161.51])
	by fmsmga001.fm.intel.com with ESMTP; 30 May 2017 14:45:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 09:45:06 +1200
Message-ID: <4229420.r9OF2NBnRU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170530101631.29058-1-olani@axis.com>
References: <20170530101631.29058-1-olani@axis.com>
MIME-Version: 1.0
Subject: Re: [PATCH] devtool: Compare abspath of both B and S
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
X-List-Received-Date: Tue, 30 May 2017 21:45:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 30 May 2017 10:16:31 PM NZST Ola x Nilsson wrote:
> Either both or none of the paths must be passed through
> os.path.abspath or things like 'A//B', 'A/./B/', and 'A/B/' in S will
> cause unintentional mismatches even when B = "${S}".
> 
> Using os.path.abspath for both seems more likely to be correct as that
> will also handle the case where ${B} != ${S} but the abspaths are
> equal.
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  scripts/lib/devtool/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/
__init__.py
> index d646b0cf63..29c4c05071 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -191,7 +191,7 @@ def use_external_build(same_dir, no_same_dir, d):
>          logger.info('Using source tree as build directory since --same-dir 
specified')
>      elif bb.data.inherits_class('autotools-brokensep', d):
>          logger.info('Using source tree as build directory since recipe 
inherits autotools-brokensep')
> -    elif d.getVar('B') == os.path.abspath(d.getVar('S')):
> +    elif os.path.abspath(d.getVar('B')) == os.path.abspath(d.getVar('S')):
>          logger.info('Using source tree as build directory since that would 
be the default for this recipe')
>      else:
>          b_is_s = False
> 

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

