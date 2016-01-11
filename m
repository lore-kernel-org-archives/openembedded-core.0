Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB5ED6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:56:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 Jan 2016 21:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,551,1444719600"; d="scan'208";a="890576710"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2016 21:56:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Date: Mon, 11 Jan 2016 18:56:36 +1300
Message-ID: <16141142.xZ3Cl9sKM9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <2907273.zL3xaeCVSY@peggleto-mobl.ger.corp.intel.com>
References: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
	<d1316b64c02b7e6263fb292f4fc30bff7200a71a.1452194521.git.randy.e.witt@linux.intel.com>
	<2907273.zL3xaeCVSY@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] populate_sdk_ext: Don't put nativesdk and crosssdk items in ext sdk
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
X-List-Received-Date: Mon, 11 Jan 2016 05:56:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 11 Jan 2016 11:19:37 Paul Eggleton wrote:
> On Thu, 07 Jan 2016 11:24:27 Randy Witt wrote:
> > The nativesdk and crosssdk targets were only getting pulled into the
> > extensible sdk due to buildtools dependencies being in BB_TASKDEPDATA.
> > However the nativesdk and crosssdk targets are not needed for the
> > extensible sdk to be used.
> > 
> > This patch therefore removes them since it reduces the size of the
> > extensible sdks that include sstate by ~300MB.
> > 
> > Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> > ---
> > 
> >  meta/classes/populate_sdk_ext.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/classes/populate_sdk_ext.bbclass
> > b/meta/classes/populate_sdk_ext.bbclass index 5c99bd0..ef014b8 100644
> > --- a/meta/classes/populate_sdk_ext.bbclass
> > +++ b/meta/classes/populate_sdk_ext.bbclass
> > @@ -173,6 +173,12 @@ python copy_buildsystem () {
> > 
> >      # Filter the locked signatures file to just the sstate tasks we are
> > 
> > interested in allowed_tasks = ['do_populate_lic', 'do_populate_sysroot',
> > 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm',
> > 'do_package_write_deb', 'do_package_qa', 'do_deploy'] excluded_targets =
> > d.getVar('SDK_TARGETS', True)
> > +
> > +    # Since buildtools is included in the sdk, the nativesdk items and
> > +    # crosssdk end up in the tasks in locked-sigs.inc. However, the
> > nativesdk
> > +    # and crosssdk items aren't needed for the extensible sdk to
> > function so
> > +    # remove them from the list.
> > +    excluded_targets += 'nativesdk crosssdk'
> 
> You need a leading space here to make this work (or alternatively split the
> excluded_targets value in the previous patch when you first set it, and add
> the items as list items here).

Actually I think I have an alternative fix which we need to do anyway - create 
a separate task for the recursive dependencies, and then the issue goes away. 
I'll send out some patches to do this once I've finished testing.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

