Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5A473114
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 20:11:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 12:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,255,1484035200"; d="scan'208";a="1105445581"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2017 12:11:56 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 555956A4080;
	Mon,  6 Mar 2017 12:11:53 -0800 (PST)
Date: Mon, 6 Mar 2017 21:58:18 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170306195818.GB19275@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
	<20170306175010.GA18369@linux.intel.com>
	<1488828715.7785.310.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1488828715.7785.310.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 06 Mar 2017 20:11:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2017 at 08:31:55PM +0100, Patrick Ohly wrote:
> On Mon, 2017-03-06 at 19:50 +0200, Ed Bartosh wrote:
> > On Mon, Mar 06, 2017 at 04:49:25PM +0000, Burton, Ross wrote:
> > > On 6 March 2017 at 15:31, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > > 
> > > > +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> > > >
> > > 
> > > $ ( [ -h / ] && echo something ); echo $?
> > > 1
> > > 
> > > If the -h fails then this is still going to cause sstate_unpack_package to
> > > trap.
> > 
> > I don't think it will as '&&' and '||' lists are among other special cases where
> > shell doesn't exits on error.
> 
> True, but if the clause happens to be the last one in a function or
> script (for example, after restructuring code), then the return code of
> that becomes non-zero, which isn't intended.

Exactly because of this I moved my changes up in the function in v2.

> 
> $ cat test.sh 
> foo() {
>     [ -h /foobar ] && echo 'fstab is a symlink'
> }
> 
> foo
> echo $?
> $ bash -xe test.sh 
> + set -e
> + foo
> + '[' -h /foobar ']'
> $ echo $?
> 1
> 
> Making the intend explicit with || true avoids that.
> 
> -- 
> Best Regards, Patrick Ohly
> 
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
> 
> 
> 

-- 
--
Regards,
Ed

