Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 29175780C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 00:07:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 17:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,416,1491289200"; d="scan'208";a="862574899"
Received: from iho2-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.82])
	by FMSMGA003.fm.intel.com with ESMTP; 29 May 2017 17:07:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 30 May 2017 12:07:43 +1200
Message-ID: <1601098.y1ZEXWJiEU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1496100696.25229.150.camel@linuxfoundation.org>
References: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1496034979-99713-2-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1496100696.25229.150.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] devshell.bbclass: ensure toolchains available for do_devshell
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
X-List-Received-Date: Tue, 30 May 2017 00:07:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Richard,

On Tuesday, 30 May 2017 11:31:36 AM NZST Richard Purdie wrote:
> On Mon, 2017-05-29 at 13:16 +0800, Chang Rebecca Swee Fun wrote:
> > Toolchains are required to be prepopulated in sysroot before
> > entering devshell.
> > 
> > [YOCTO #11464]
> > 
> > Signed-off-by: Chang Rebecca Swee Fun 
> > ---
> >  meta/classes/devshell.bbclass | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> This looks awfully complicated and I'm not sure this does much more
> than this would:
> 
> -addtask devshell after do_patch
> +addtask devshell after do_prepare_recipe_sysroot
> 
> Can someone explain to me why we want to do the below instead as I
> think the effect is the same?
> 
> I did read the bug too but that didn't help answer my question.
> 
> Yes, this does mean devshell will now trigger a lot of more
> dependencies and build but I think the change below would do the same
> thing too.

I'd suggested the method Rebecca is using in the bug, but you're right, I'm 
not sure why I didn't think of doing as you suggest instead. Presumably 
however since do_prepare_recipe_sysroot doesn't depend on do_patch we would 
still need to depend on that i.e.:

addtask devshell after do_patch do_prepare_recipe_sysroot

Right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

