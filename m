Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D310C78239
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:38:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jun 2017 16:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,380,1493708400"; d="scan'208";a="100988043"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.133.197])
	by orsmga004.jf.intel.com with ESMTP; 23 Jun 2017 16:38:26 -0700
Message-ID: <1498261106.13914.248.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 16:38:26 -0700
In-Reply-To: <1498229267.24449.132.camel@linuxfoundation.org>
References: <1497448981-8637-1-git-send-email-sgw@linux.intel.com>
	<1498229267.24449.132.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] pkg-config: allow kernel to be build with esdk
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
X-List-Received-Date: Fri, 23 Jun 2017 23:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-23 at 15:47 +0100, Richard Purdie wrote:
> On Wed, 2017-06-14 at 07:03 -0700, Saul Wold wrote:
> > 
> > When the kernel's menuconfig target is called while using the esdk
> > or
> > an esdk-based container, the pkg-config info that is found is not
> > correct.
> > The pkg-config info is for the target, but we need the eSDK's
> > information in order to build the host based menuconfig.
> > 
> > The new pkg-config script checks both that it's in SDK and being
> > called from the check-lxdialog script in order to limit the scope
> > of
> > when the pkg-config automagically switches to pkg-config-native.
> > 
> > This script also replaces the default pkg-config-native script.
> > 
> > [YOCTO #11155]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> 
> To be honest, I'm scared of adding this kind of complexity to the
> system. I appreciate the problem you're trying to solve but I worry
> adding this kind of change is complex, invasive and introduces too
> much
> risk.
> 
> I have some specific worries with this implementation too, in
> particular that it changes on target pkg-config, it really should
> only
> change nativesdk-pkgconfig? If we have risk, we want to minimise that
> risk and adding this wrapper everywhere doesn't seem to do that...
> 
There is no nativesdk-pkgconfig, but I had some confusion around the
pkg-config-native and it's usage of a pkg-config binary.  I was getting
some recursion initially and my feeble brain thought it was the target
version :-(.

I have rebuilt this patch and will send a V2 that ONLY affects the pkg-
config-native, basically expands the script to check if it's being
called as -native or from the Kernel's check-lxdialog.

I am also going to change the script such that it checks it's base name
of pkg-config and only then add the parent pid name checking. 

I hope that will mitigate the risk.

Sau!


> Cheers,
> 
> Richard
> 
> 

