Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D7A7F65C8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:52:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2016 08:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,273,1473145200"; d="scan'208";a="1064513171"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.16.121])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2016 08:52:37 -0700
Message-ID: <1475250755.3096.11.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 16:52:35 +0100
In-Reply-To: <353ba145-4e04-d586-8bf9-d9058339efbd@gmail.com>
References: <1475226567-7151-1-git-send-email-joshua.g.lock@intel.com>
	<353ba145-4e04-d586-8bf9-d9058339efbd@gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] multilib_header: avoid sstate checksum issues for -nativesdk recipes
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
X-List-Received-Date: Fri, 30 Sep 2016 15:52:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-30 at 08:29 -0700, akuster808 wrote:
> 
> On 09/30/2016 02:09 AM, Joshua Lock wrote:
> > 
> > Much as with -native recipes, as addressed in commit
> > b15730caf0d4c40271796887505507f2501958bb, arch specific variables
> > like MIPSPKGSFX_ABI were affecting -nativesdk sstate checksums for
> > recipes like nativesdk-glibc-initial.
> Since commit
> 
> b15730caf0d4c40271796887505507f2501958bb is in Jethro and Krogoth, do
> both of those branch need this fix?

This patch improves sstate object reuse for nativesdk recipes when
switching between a mips and non-mips MACHINE. 
It's no doubt useful to have in krogoth and jethro too.

Joshua

> - armin
> 
> > 
> > 
> > Disable multilib_header for nativesdk as we don't use multilibs in
> > this scenario.
> > 
> > [YOCTO #10320]
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> >   meta/classes/multilib_header.bbclass | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta/classes/multilib_header.bbclass
> > b/meta/classes/multilib_header.bbclass
> > index 5ee0a2d..304c28e 100644
> > --- a/meta/classes/multilib_header.bbclass
> > +++ b/meta/classes/multilib_header.bbclass
> > @@ -52,3 +52,8 @@ oe_multilib_header() {
> >   oe_multilib_header_class-native () {
> >   	return
> >   }
> > +
> > +# Nor do we need multilib headers for nativesdk builds.
> > +oe_multilib_header_class-nativesdk () {
> > +	return
> > +}
> 

