Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40D5360616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 13:30:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2TDUl4V031203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 29 Mar 2018 14:30:48 +0100
Message-ID: <1522330247.11431.92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 29 Mar 2018 14:30:47 +0100
In-Reply-To: <CADkTA4MGW3B_R-Y1oAi7BNa8CqxKbRx6ben3F3hXDz-F9vj0CA@mail.gmail.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
	<CADkTA4MGW3B_R-Y1oAi7BNa8CqxKbRx6ben3F3hXDz-F9vj0CA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9 v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 29 Mar 2018 13:30:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-03-15 at 09:45 -0400, Bruce Ashfield wrote:
> On Wed, Mar 7, 2018 at 3:40 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.
> > com>
> > wrote:
> > > 
> > > 
> > > +RDEPENDS_${PN} = "bc python ${TCLIBC}-utils"
> > > +# 4.15+ needs these next two RDEPENDS
> > > +RDEPENDS_${PN} += "openssl-dev util-linux"
> > > +# and x86 needs a bit more for 4.15+
> > > +RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86',
> > > 'elfutils', '',
> > > d)}"
> > 
> > Annoyingly this is breaking our multilib test case:
> > 
> > https://autobuilder.yocto.io/builders/nightly-multilib/builds/852/s
> > teps/BuildImages_4/logs/stdio
> > 
> > It's entirely possible that the test is broken in some way but it's
> > far too
> > early for me right now to comprehend the multilib matrix...
> I was trying to reproduce this here, and couldn't make any sense out
> of the configuration.
> 
> Is there somewhere that I can read to figure out what to put in my
> local.conf to reproduce
> that configuration ?

Sorry, I was travelling. I think this should do it:

MACHINE = "qemux86"
require conf/multilib.conf 
MULTILIBS = "multilib:lib64" 
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64" 

$ bitbake lib64-core-image-sato-sdk

Cheers,

Richard



