Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4C86D298
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:15:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9VDEsTp026229; Thu, 31 Oct 2013 13:14:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zeq-uUQNt4U4; Thu, 31 Oct 2013 13:14:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9VDEoWM026211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 31 Oct 2013 13:14:51 GMT
Message-ID: <1383225285.25877.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 31 Oct 2013 13:14:45 +0000
In-Reply-To: <4379965.nvzZzTEQm7@helios>
References: <33115ABC4887814E8A92A08FBC93416B0A1A9528@IRSMSX103.ger.corp.intel.com>
	<4379965.nvzZzTEQm7@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: oe-selftest proof of concept
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
X-List-Received-Date: Thu, 31 Oct 2013 13:15:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-31 at 10:34 +0000, Paul Eggleton wrote:
> Hi Corneliu,
> 
> This is a well-rounded proposal, thanks. Some comments below.
> 
> On Thursday 31 October 2013 07:53:48 Stoicescu, CorneliuX wrote:
> > This e-mail was originally sent to the Yocto mailing list in the form of 2
> > e-mails. As per Paul's and Richard's request, I am re-sending and moving
> > the conversation here. Feel free to add any input :) .
> > 
> > NOTE: I also made a small syntax correction in the example at the end of the
> > e-mail for oeSelfTest.var_append() .
> > 
> > After a chat with Richard and Stefan, I came up with an outline of how the
> > oe-selftest feature(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4740
> > ) should look like. I made a summary of my proposal below. Please feel free
> > to add your thoughts!
> > 
> > There will be a new script introduced(similar to bitbake-selftest) that will
> > use python unit test to execute tests. Name has not been decided but it can
> > be "oe-selftest". Running this script will not compromise poky in any way.
> > Initially, the script does not need any preparation in order to be run. If
> > this changes in the future, the user will be prompted upon execution with
> > the pre-required tasks. Oe-selftest can be used together with the automated
> > runtime tests if necessary.
> > 
> > The following types of tests are targeted for the initial implementation:
> > - testing the functionality of scripts in poky/scripts (such as:
> > bitbake-layers, yocto-bsp, yocto-kernel, yocto-layers) - testing of the
> > 'bitbake' command and its output (this includes output data validation such
> > as the sstate-cache/ and tmp/ directories)
> 
> It could be considered a separate exercise, but I'd like us to test the 
> installation and usage of the SDK installer as well. Initially this would be 
> fairly straightforward - install the SDK to a non-standard location, fetch 
> some nominated piece of source code and try to build it using the installed 
> SDK. (One issue springs to mind though - unless we take steps to guard against 
> it, this won't be able to pick up problems where the SDK contains references 
> to files within TMPDIR, since those will still be valid on the build host).
> 
> Later we'd want to be able to test the executables produced using the SDK on 
> the target; however that would presumably necessitate some integration with 
> the runtime tests and that could be complicated.

We could test some simple binary using user mode qemu...

> Actually I think we should avoid modifying existing files if at all possible - 
> instead we should add an additional layer on top to make changes, using 
> bbappends / overlayed recipes as necessary. There are several reasons for 
> this:
> 
> * Most of the time this is the approach users should be using when they make 
> customisations, so it's what we ought to concentrate on testing.
> 
> * It preserves the ability to run the tests with uncommitted changes, which 
> would be useful during development.

Agreed, this is probably something we need to support.

> I know the test case mentions it explicitly, but we don't actually need meta-
> intel to check this functionality, any layer will work. We probably ought to 
> be creating a meta-selftest layer (or similar) within OE-Core that we could 
> use for this purpose and the addition of bbappends / additional configuration. 
> This avoids the need for something like POKYDIR as well.

Yes, having some kind of specific test layer in OE-Core would seem
appropriate.

I read through the proposal and it seems good to me, I know I had
already given some feedback as the details were filled out but it seems
the pieces I believe we need are all there.

Cheers,

Richard


