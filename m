Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96DF66086F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:04:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6PM4EoQ013734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 25 Jul 2018 23:04:15 +0100
Message-ID: <ca610f5908340f9a0171ba9873fa7a5a85c70a0f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 23:04:13 +0100
In-Reply-To: <1645be9a5bddedbe73060398dd03608173a7d62d.camel@gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
	<CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
	<CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
	<CADkTA4M_67sat73QPFaXeuo522=Nt_qdLcUjoc-KSMYvXHMDpQ@mail.gmail.com>
	<CADkTA4PQ0hqtn2iYSNEUNYss2jGOotg03i+tK2xU4nYHACGsQA@mail.gmail.com>
	<1645be9a5bddedbe73060398dd03608173a7d62d.camel@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 22:04:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-25 at 15:44 -0500, Joshua Watt wrote:
> On Wed, 2018-07-25 at 16:32 -0400, Bruce Ashfield wrote:
> > On Wed, Jul 25, 2018 at 4:20 PM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > On Wed, Jul 25, 2018 at 4:17 PM, Burton, Ross <ross.burton@intel.
> > > co
> > > m> wrote:
> > > > On 25 July 2018 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.
> > > > co
> > > > m> wrote:
> > > > > My question about the change .. is why ? I really don't like
> > > > > cleanup
> > > > > patches on principle, and want things pinned to a bug, a
> > > > > performance
> > > > > issue or something else.
> > > > 
> > > > See a post by RP to the oe-core list a few days ago: a general
> > > > cleanup
> > > > of Python code that spawns is well overdue.  In this case
> > > > oe.utils.getstatusoutpus is a wrapper that just calls a
> > > > deprecated
> > > > function in subprocess, is best to pass arguments as an array
> > > > instead
> > > > of string, best not to use a shell, etc.
> > > 
> > > ah ok.
> > > 
> > > I still don't like it, but it is what it is.
> > 
> > ... and I found the original email, I see the part about things
> > being
> > depreciated. Makes sense.
> > 
> > I'll queue it up and run some tests on some intentionally bad BSPs.
> 
> Works for me.
> 
> I wasn't sure about if the subprocess exceptions should be fatal or
> not. Suppressing them maintained the old behavior, but it didn't
> quite seem "correct" to me.

We should at least put a comment in about this as its not best practise
not to check return codes. I do understand it can make sense in some
cases. Part of the reason to clean these calls up is also to ensure we
illustrate best practise in OE-Core so that when people copy and paste
it to other layers, we don't end up with bad things spreading.

In general, using the "proper" calls encourages better error handling
so that when something does fail, the user gets decent error messages.
For that reason I'd usually recommend the stderr -> stdout mapping so
that errors are displayed if a command fails. I appreciate that its a
moot point here since you ignore failures but in general it is a good
practise to encourage. We've had a spate of problems recently where
errors have been hidden making problems much harder to understand and
debug.

Cheers,

Richard

