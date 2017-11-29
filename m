Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 081F36FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 16:30:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 08:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,338,1508828400"; d="scan'208";a="11047497"
Received: from swold-mobl2.jf.intel.com ([10.24.8.93])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 08:30:51 -0800
Message-ID: <1511973051.2714.120.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 29 Nov 2017 08:30:51 -0800
In-Reply-To: <2b2306eb-7a97-b1e1-918b-4a47438ecad2@windriver.com>
References: <20171129032818.2545-1-sgw@linux.intel.com>
	<2b2306eb-7a97-b1e1-918b-4a47438ecad2@windriver.com>
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] kernel-yocto: ensure sccs variable is set when using KBUILD_DEFCONFIG
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
X-List-Received-Date: Wed, 29 Nov 2017 16:30:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-11-29 at 09:23 -0500, Bruce Ashfield wrote:
> On 11/28/2017 10:28 PM, Saul Wold wrote:
> > When using KBUILD_DEFCONFIG, $sccs should be set to the
> > $WORKDIR/defconfig
> > regardless if it compares or is copied. Otherwise $sccs is not set
> > and the
> > defconfig is not found correctly.
> 
> Actually, looking at this more today, and this morning in my testing.
> This shouldn't be necessary .. it doesn't hurt anything (well,
> actually
> it could end up with two defconfigs in the variable, but that also
> should be ok).
> 
Ok, I understand, it's in find_sccs() where if you have "defconfig" in
the SRC_URI then with my change you could end up with two defconfigs.

The problem I saw was if one just sets KBUILD_DEFCONFIG and does not
set any config info on the SRC_URI then it's possible for $sccs to be
empty, which was bad.

Maybe a cleaning of multiple "defconfig" entries on $sccs is needed?

Sau!


> > 
> > Part of
> > [YOCTO #12162]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   meta/classes/kernel-yocto.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/kernel-yocto.bbclass
> > b/meta/classes/kernel-yocto.bbclass
> > index 1d447951c49..98ec78fb768 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -110,8 +110,8 @@ do_kernel_metadata() {
> >   				fi
> >   			else
> >   				cp -f
> > ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> > -				sccs="${WORKDIR}/defconfig"
> >   			fi
> > +			sccs="${WORKDIR}/defconfig"
> 
> The test that was protecting this assignment is:
> 
>     if [ -f "${WORKDIR}/defconfig" ]; then
> 
> and then:
> 
>    cmp "${WORKDIR}/defconfig" 
> "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
> 
> The only way that a defconfig can be in ${WORKDIR}/defconfig by
> the time this runs, is if the fetcher puts it there. Which means
> it is on the SRC_URI and comes from the recipe writer's layer.
> 
> There is existing code that already picks this up and adds it
> to the configuration queue:
> 
>          sccs="$sccs ${@" ".join(find_sccs(d))}"
> 
> So that defconfig, is already going to be picked up directly
> from the SRC_URI.
> 
> Bruce
> 
> 
> >   		else
> >   			bbfatal "A KBUILD_DEFCONFIG
> > '${KBUILD_DEFCONFIG}' was specified, but not present in the source
> > tree"
> >   		fi
> > 
> 
> 

