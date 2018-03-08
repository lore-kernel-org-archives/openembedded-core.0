Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6ED78958
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:52:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w28IptwN025658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Mar 2018 18:51:58 GMT
Message-ID: <1520535114.10851.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 08 Mar 2018 10:51:54 -0800
In-Reply-To: <CADkTA4P58D1LFLCRZc6PvXa1+R2NTb1LF55EL+U7m+XbwLo4mQ@mail.gmail.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
	<CADkTA4P58D1LFLCRZc6PvXa1+R2NTb1LF55EL+U7m+XbwLo4mQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Mar 2018 18:52:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-03-07 at 08:35 -0500, Bruce Ashfield wrote:
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
> And at this point, I'm basically out of cycles for hacking on devsrc
> :(
> 
> I'll see about it again at the start of next week, and failing that,
> bump it to the next release cycle.

Just as a quick brain dump from a glance at this, I think the issue is
the openssl-dev dependency. It sounds like the image tries to install
two sets of -dev packages and those files conflict. Quite why its doing
that and how/why they conflict I don't know but the -dev dependency is
where I'd start looking at this.

I will also mention that -dev packages are not so well looked at with
multilib, we probably don't test that area much :(.

Cheers,

Richard 

