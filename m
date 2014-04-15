Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B14A265E75;
	Tue, 15 Apr 2014 16:54:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2014 09:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,865,1389772800"; d="scan'208";a="521127911"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.134])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2014 09:54:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Apr 2014 17:54:29 +0100
Message-ID: <2000508.o5Wd2u71cb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <53482C0D.5000802@intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<53482AD6.3090205@windriver.com> <53482C0D.5000802@intel.com>
MIME-Version: 1.0
Cc: darren.hart@intel.com, Openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 15 Apr 2014 16:54:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 April 2014 10:53:17 Kamble, Nitin A wrote:
> On 4/11/2014 10:48 AM, Bruce Ashfield wrote:
> > On 14-04-11 01:05 PM, nitin.a.kamble@intel.com wrote:
> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> 
> >> Use machine overrides for variables for this skeleton recipe so that
> >> people following skeleton do it right at the beginning.
> >> 
> >> The machine overrides for the variables reduces pollution of name space
> >> and avoid unintentional influences on other layers.
> >> 
> >> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> ---
> >> 
> >>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> index c329106..76457ca 100644
> >> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> >> @@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
> >> 
> >>   # Override SRC_URI in a bbappend file to point at a different source
> >>   # tree if you do not want to build from Linus' tree.
> >> 
> >> -SRC_URI =
> >> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
> >> l=git;nocheckout=1;name=machine" +SRC_URI_machine =
> >> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
> >> l=git;nocheckout=1;name=machine"
> >> 
> >> -LINUX_VERSION ?= "3.4"
> >> -LINUX_VERSION_EXTENSION ?= "-custom"
> >> +LINUX_VERSION_machine ?= "3.4"
> >> +LINUX_VERSION_EXTENSION_machine ?= "-custom"
> > 
> > For some reason, I thought you meant ${MACHINE} instead of _machine ..
> > which is what I use for machine specific overrides.
> 
> I think macros can not used as overrides.

Variable references can be used in overrides, provided the expansion happens 
at the right time. However, it would not be appropriate to use ${MACHINE} here 
because if it were used verbatim in the recipe, it would not have the desired 
effect - the value of ${MACHINE} would change with whatever MACHINE was set to, 
and since ${MACHINE} is always in OVERRIDES it would always be applied.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

