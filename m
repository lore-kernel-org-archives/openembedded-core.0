Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8426E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:46:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 24 Apr 2015 01:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,638,1422950400"; d="scan'208";a="714850874"
Received: from jevens-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.46])
	by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2015 01:46:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2015 09:46:54 +0100
Message-ID: <2342632.nQof25CdNW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <5539FB6C.3010301@windriver.com>
References: <cover.1429858183.git.Qi.Chen@windriver.com>
	<1429860029.26983.127.camel@linuxfoundation.org>
	<5539FB6C.3010301@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] populate_sdk_base: avoid executing empty function
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
X-List-Received-Date: Fri, 24 Apr 2015 08:46:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 April 2015 16:14:36 ChenQi wrote:
> On 04/24/2015 03:20 PM, Richard Purdie wrote:
> > On Fri, 2015-04-24 at 14:50 +0800, Chen Qi wrote:
> >> `bitbake uninative-tarball' raises the following warning.
> >> 
> >>      WARNING: Function  doesn't exist
> >> 
> >> This is because SDK_PACKAGING_FUNC is set to "" in its recipe.
> >> Anyway, we need to check this variable to avoid executing empty function.
> >> 
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >> 
> >>   meta/classes/populate_sdk_base.bbclass | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/meta/classes/populate_sdk_base.bbclass
> >> b/meta/classes/populate_sdk_base.bbclass index 5c07693..6e3e84f 100644
> >> --- a/meta/classes/populate_sdk_base.bbclass
> >> +++ b/meta/classes/populate_sdk_base.bbclass
> >> @@ -94,7 +94,11 @@ fakeroot python do_populate_sdk() {
> >> 
> >>       bb.build.exec_func("tar_sdk", d)
> >> 
> >> -    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
> >> +    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True)
> >> +    if sdk_packaging_func:
> >> +        sdk_packaging_func = sdk_packaging_func.strip()
> >> +        if sdk_packaging_func != "":
> >> +            bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
> > 
> > This is slightly overcomplicated. You can just do something like:
> > 
> > sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
> > 
> > if sdk_packaging_func.strip():
> >      bb.build.exec_func(sdk_packaging_func, d)
>
> 
> Thanks a lot.
> I'll send out V2.

Could you also please add [YOCTO #7598] to the commit message since that 
covers this issue:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7598

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

