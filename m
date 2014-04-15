Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D39865E56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 23:41:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2014 16:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,867,1389772800"; d="scan'208";a="521648373"
Received: from smvidana-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.35])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2014 16:41:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Hart, Darren" <darren.hart@intel.com>
Date: Wed, 16 Apr 2014 00:41:31 +0100
Message-ID: <34091410.ZhZR5aYx9V@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <CF72C2F0.8411E%darren.hart@intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<2000508.o5Wd2u71cb@peggleto-mobl5.ger.corp.intel.com>
	<CF72C2F0.8411E%darren.hart@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Tue, 15 Apr 2014 23:41:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 April 2014 18:03:45 Hart, Darren wrote:
> On 4/15/14, 9:54, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:
> >On Friday 11 April 2014 10:53:17 Kamble, Nitin A wrote:
> >> On 4/11/2014 10:48 AM, Bruce Ashfield wrote:
> >> > On 14-04-11 01:05 PM, nitin.a.kamble@intel.com wrote:
> >> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> >> 
> >> >> Use machine overrides for variables for this skeleton recipe so that
> >> >> people following skeleton do it right at the beginning.
> >> >> 
> >> >> The machine overrides for the variables reduces pollution of name
> >>
> >>space
> >>
> >> >> and avoid unintentional influences on other layers.
> >> >> 
> >> >> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> >> ---
> >> >> 
> >> >>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8
> >>
> >>++++----
> >>
> >> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >> >> 
> >> >> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> >> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> >> index c329106..76457ca 100644
> >> >> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> >> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> >> @@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
> >> >> 
> >> >>   # Override SRC_URI in a bbappend file to point at a different
> >>
> >>source
> >>
> >> >>   # tree if you do not want to build from Linus' tree.
> >> >> 
> >> >> -SRC_URI =
> >>
> >>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
> >>
> >> >> l=git;nocheckout=1;name=machine" +SRC_URI_machine =
> >>
> >>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
> >>
> >> >> l=git;nocheckout=1;name=machine"
> >> >> 
> >> >> -LINUX_VERSION ?= "3.4"
> >> >> -LINUX_VERSION_EXTENSION ?= "-custom"
> >> >> +LINUX_VERSION_machine ?= "3.4"
> >> >> +LINUX_VERSION_EXTENSION_machine ?= "-custom"
> >> > 
> >> > For some reason, I thought you meant ${MACHINE} instead of _machine ..
> >> > which is what I use for machine specific overrides.
> >> 
> >> I think macros can not used as overrides.
> >
> >Variable references can be used in overrides, provided the expansion
> >happens
> >at the right time. However, it would not be appropriate to use ${MACHINE}
> >here
> >because if it were used verbatim in the recipe, it would not have the
> >desired
> >effect - the value of ${MACHINE} would change with whatever MACHINE was
> >set to,
> >and since ${MACHINE} is always in OVERRIDES it would always be applied.
> 
> I think we should just drop the overrides. The overrides are needed with
> linux-yocto bbappends so we don't pollute the namespace, but here there is
> nothing to polute. This is the only recipe, you don't use bbappends with
> it. It needs some documentation, but we should just drop all the overrides
> in this recipe.

I think you're probably right with the way this recipe is intended to be used, 
yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

