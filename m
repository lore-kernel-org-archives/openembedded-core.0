Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@intel.com>) id 1QUo93-0006lx-Kh
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 00:56:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jun 2011 15:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,343,1304319600"; d="scan'208";a="10351535"
Received: from unknown (HELO [10.255.16.211]) ([10.255.16.211])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2011 15:51:41 -0700
From: Richard Purdie <richard.purdie@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF14BE9.7080704@intel.com>
References: <4DE850E8.2050701@windriver.com>  <4DF14BE9.7080704@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Date: Thu, 09 Jun 2011 23:51:30 +0100
Message-ID: <1307659890.15712.197.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Mailman-Approved-At: Fri, 10 Jun 2011 08:44:50 +0200
Cc: wenzong fan <wenzong.fan@windriver.com>
Subject: Re: [Yocto] The design document for ccache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2011 22:56:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 15:40 -0700, Saul Wold wrote:
> On 06/02/2011 08:11 PM, wenzong fan wrote:
> > Hi Folks,
> >
> > Please help me to review the design document for ccache-native, and
> > I also have two questions about it, any answers or suggestions are
> > appreciated.
> >
> > * Feature name: ccache-native
> >     Priority: P3; M2
> >     Owner: Wenzong Fan
> >     Summary: Integrate ccache-native to yocto
> >
> > * Description:
> > Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
> > included by poky/yocto, just add it as a native tool.
> >
> > * Usage:
> > Build ccache as a native tool by default and enable it for speeding
> > target packages build.
> >
> > * Implementation:
> > 1) Copy bb file from OE upstream to:
> >       meta/recipes-devtools/ccache/
> >
> > 2) Update bb file to get the latest ccache_3.1.5 and split the single
> > bb file to:
> >       'ccache_3.1.5.bb', 'ccache.inc'
> >
> > 3) Enable ccache in the native tools building.
> >
> You will need to have it be a dependency pretty early on in the build.
> Additionally, this is a bit a new part to this task, we want to have the 
> default CCACHE_DIR for the build default to a directory in TMPDIR 
> instead of the user's home directory.  This will mean setting an 
> environment variable somewhere early also.

There is a little more detail on:

https://wiki.yoctoproject.org/wiki/Yocto_1.1_Schedule

Specifically, "c) Set CCACHE on a per recipe basis. need to figure out
whether ccache data can be shared and under what circumstances."

so something like adding:

export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/${PN}"

to bitbake.conf with a bit more thought into working out the right
components to add to the variable.

Cheers,

Richard



