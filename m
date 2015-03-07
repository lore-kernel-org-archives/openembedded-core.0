Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE9A7378D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 19:32:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2015 11:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,359,1422950400"; d="scan'208";a="676686882"
Received: from gustyuzh-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.6.78])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2015 11:32:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 07 Mar 2015 19:32:26 +0000
Message-ID: <95053983.gSqlKBTLmC@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1503070931520.19814@Device-040570>
References: <alpine.LFD.2.11.1503070931520.19814@Device-040570>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proper "style" for VAR_append_override?
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
X-List-Received-Date: Sat, 07 Mar 2015 19:32:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 07 March 2015 09:43:34 Robert P. J. Day wrote:
>   more nitpickery, but i've noticed a couple different ways in the OE
> code base and documentation for conditionally appending based on an
> override, and it might just be that i'm confused about the underlying
> mechanics of the append operators.
> 
>   first, there's this from qemu.inc:
> 
> KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> 
> i've always read that as, "if override of linux-yocto package is in
> effect, then add this feature to KERNEL_FEATURES using the "append"
> operator, which will leave the appending to the end and, in addition,
> *requires* that we explicitly have that leading space given that we're
> using _append.
> 
>   it's also my understanding that i can have multiple assignments like
> that (possibly based on different overrides), and they will all be
> processed properly and finally appended to (in this case)
> KERNEL_FEATURES. so far, so good?
> 
>   but if i check the YP ref manual, i see documentation like this:
> 
> ref-variables.xml:     KERNEL_FEATURES_append_cedartrail +=
> "bsp/cedartrail/cedartrail-pvr-merge.scc" ref-variables.xml:    
> KERNEL_FEATURES_append_cedartrail += "cfg/efi-ext.scc" ref-variables.xml:  
>   KERNEL_FEATURES_append_cedartrail-nopvr += " cfg/smp.scc"
> 
> which looks a bit weird -- combining "_append" with "+=" (and even
> inconsistently adding that leading space).
> 
>   is there some difference between the above approaches i've never
> understood? is there a preferred style?

IMO, '..._append +=' shouldn't be used. It might be assumed that the += 
accomplishes more than just adding a leading space, which it doesn't. It's 
much simpler to just include the leading space in the value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

