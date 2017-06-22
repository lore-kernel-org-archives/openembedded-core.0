Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 65B9478224
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 16:59:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5MGxZi8001378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 22 Jun 2017 17:59:36 +0100
Message-ID: <1498150775.24449.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Leonardo Sandoval
	<leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 22 Jun 2017 17:59:35 +0100
In-Reply-To: <1498147164.22706.30.camel@intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 22 Jun 2017 17:59:36 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Thu, 22 Jun 2017 16:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-22 at 17:59 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-22 at 10:37 -0500, Leonardo Sandoval wrote:
> > 
> > On Thu, 2017-06-22 at 17:14 +0200, Patrick Ohly wrote:
> > > 
> > > On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> > > > 
> > > > On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > > > > 
> > > > > On Mon, 2017-06-19 at 07:39 -0700,
> > > > > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > > > > 
> > > > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.i
> > > > > > ntel.com>
> > > > > > 
> > > > > > Do not mix the stderr into stdout, allowing test cases to
> > > > > > query
> > > > > > the specific output.
> > > > > This changes the behavior of functions that are also used
> > > > > outside of
> > > > > OE-core in a way that won't be easy to notice. I also don't
> > > > > think that
> > > > > it is the right default. For example, for bitbake it is
> > > > > easier to
> > > > > understand where an error occurred when stderr goes to the
> > > > > same stream
> > > > > as stdout.
> > > > how would that make it easier?
> > > Because then output will be properly interleaved, as it would be
> > > on a
> > > console.
> > > 
> > > Actually, the entire error reporting in runCmd() only prints
> > > result.output, so with stderr going to result.error by default,
> > > you
> > > won't get the actual errors reported anymore at all, will you? 
> > > 
> > process stderr will go into result.error and process stdout into
> > result.output. So when the process is executed ignoring the return
> > status, then test must check result.error. I find the latter
> > cleaner
> > that checking errors into stdout.
> It depends on how the result is used. That you prefer split output
> for some tests does not mean that everyone wants the same in their
> tests. I don't want it in my own usage of runCmd() or bitbake()
> because I don't care about where a message was printed. I just want
> it in proper order.
> 
> If you change the default, then you will also have to enhance
> runCmd()'s error handling to include results.error. That's currently
> missing in your patch.
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Can't you keep the current semantic and just override it
> > > > > explicitly in
> > > > > those tests that need separate stdout/stderr?
> > > > > 
> > > > My proposed patch was mainly based on a RP's comment [1],
> > > > suggesting to
> > > > split std[out|err].
> > > He did not suggest to change the default behavior. I agree that
> > > using
> > > split stdout/stderr in those specific tests which specifically
> > > want to
> > > check for error messages makes sense, but only in those tests.
> > No tests require splitting the output (all tests pass with and
> > without
> > this series). The series is actually an enhancement and without it,
> > we
> > saw (specially when the python 2 to 3 was going on) past warnings
> > going
> > into stdout, so Chris and RP suggested the approach.
> Richard, can you please comment on whether changing the default is
> really what you meant?

The problem here is that stdout and stderr are being mixed and that
mixing is not accounting for newlines. bitbake itself does print
different messages to both. The mixing depends on kernel page size and
when the buffers are flushed.

The key thing I'm not sure about from reading the bug is whether this
output is from the same bitbake process or different ones?

I can think of three things we can do here:

a) Add some flush calls somewhere assuming this is different calls.
That somehow seems unlikely

b) Keep stdout and stderr separate as per Leo's change

c) Have a command version which merges stdout and stderr respecting
newlines. I suspect this happens on a console but likely not on inter
process pipes...

It does sound like we need to answer some questions on what exactly is
happening before we can know which solution(s) might work.

Cheers,

Richard



