Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD186AC36
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 08:48:49 +0000 (UTC)
Received: from [99.240.204.5] (port=46263 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YUWtE-00075T-W7; Sun, 08 Mar 2015 04:48:49 -0400
Date: Sun, 8 Mar 2015 04:48:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <54FBD854.8060509@mlbassoc.com>
Message-ID: <alpine.LFD.2.11.1503080446380.13892@Device-040570>
References: <alpine.LFD.2.11.1503070902110.16088@Device-040570>
	<F503D67F-FDF9-49B6-BBC9-149D56AA3EE4@gmail.com>
	<54FBD854.8060509@mlbassoc.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what's with the loop with "in in" in u-boot.inc?
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
X-List-Received-Date: Sun, 08 Mar 2015 08:48:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 7 Mar 2015, Gary Thomas wrote:

> On 2015-03-07 10:48, Bernhard Reutner-Fischer wrote:
> > On March 7, 2015 3:04:52 PM GMT+01:00, "Robert P. J. Day"
> > <rpjday@crashcourse.ca> wrote:
> > >
> > >   based on a recent post to this(?) list, i was curious about the
> > > following loop construct in u-boot.inc:
> > >
> > >         for config in ${UBOOT_MACHINE}; do
> > >             for type in in ${UBOOT_CONFIG}; do
> > >                 if [ "${type}"x = "in"x ]
> > >                 then
> > >                     continue
> > >                 fi
> > >
> > >   the words "in in" above don't appear to be a typo, as the next
> > > condition explicitly checks for the value "in" and skips it. what's
> > > the rationale for that? i used "git blame" to examine the commit that
> >
> > for may barf on empty iteration input.
> > One usually uses for i in ${foo} '';
> > and skips i with zero length. Any other is obviously fine, too though so
> > nothing wrong or odd here.
>
> But this code is only executed if ${UBOOT_CONFIG} is non-empty
> so this test is nonsense.
>
> My guess is that the code originally tested for ${UBOOT_CONFIG}
> being empty this way, then the if/then/else was added (look at
> the indentation) and the original test was never removed (which
> does no harm)

  technically, it *is* possible that UBOOT_CONFIG contains a non-empty
string of spaces so, yes, that test still has some technical value
but ... you know ... yuck. movin' on ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

