Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1A03170EF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:47:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2014 23:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,395,1406617200"; d="scan'208";a="472223671"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.84])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2014 23:47:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 25 Aug 2014 07:47:31 +0100
Message-ID: <1541895.M9zFquQ82B@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <CAP71WjyYFPJAu-39FB8i3F5G0XjvkLXRh3xQbz4drwvyiU9kLQ@mail.gmail.com>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
	<CAP71WjyYFPJAu-39FB8i3F5G0XjvkLXRh3xQbz4drwvyiU9kLQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: Improving the developer workflow
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
X-List-Received-Date: Mon, 25 Aug 2014 06:47:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nicolas,

Apologies for the delayed reply.

On Friday 08 August 2014 10:04:19 Nicolas Dechesne wrote:
> On Thu, Aug 7, 2014 at 11:10 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > Example workflow
> > ================
> > 
> > I won't give a workflow for every possible usage, but just to give a basic
> > example - let's assume you want to build a "new" piece of software for
> > which you have your own source tree on your machine. The rough set of
> > steps required would be something like this (rough, e.g. the command
> > names given shouldn't be read as final):
> > 
> > 1. Install the SDK
> > 
> > 2. Run a setup script to make the SDK tools available
> > 
> > 3. Add a new recipe with "sdktool add <recipename>" - interactive process.
> > The tool records that <recipename> is being worked on, creates a recipe
> > that can be used to build the software using your external source tree,
> > and places the recipe where it will be used automatically by other steps.
> > 
> > 4. Build the recipe with "sdktool build <recipename>". This probably only
> > goes as far as do_install or possibly do_package_qa; in any case the QA
> > process would be less stringent than with the standard build system
> > however in order to avoid putting too many barriers in the way of testing
> > on the target.
> > 
> > 5. Fix any failures and repeat from the previous step as necessary.
> > 
> > 6. Deploy changes to target with "sdktool deploy-target <ip address>"
> > assuming SSH is available on the target. Alternatively "sdktool
> > build-image <imagename>" can be used to regenerate an image with the
> > changes in it; "sdktool runqemu" could do that (if necessary) and then
> > run the result within QEMU with the appropriate options set.
> 
> coincidentally, i was giving an OE workshop this week, and when I
> explained about the OE SDK, someone immediately brought up that it was
> quite limited because:
> 
>  1- SDK cannot be used to generate deployable packages, e.g.  using
> the SDK to create ipk/deb/rpm that can be delivered to
> targets/clients, not just for debugging, but also for production when
> production system has package management support.
>  2- SDK cannot be used to regenerate updated images. e.g. Company A
> delivers a SDK + board, Company B is making a product using the SDK
> (adding content) and wants to be able to make new images with the new
> content in order to sell/deploy it.

I have included solutions for these two in my proposal. However, I am a bit 
concerned about it being used in the way you describe above. The main aim is 
to provide tools for developers to test their changes on the target easily; if 
people start using it to produce images that they then send to other people 
(particularly customers or other organisations) then the potential end-game is 
an image used in production is one produced from a single developer's machine, 
at which point you may have some reproducibility issues - "where's the source 
for package xyz?" "Erm, not sure, that developer left six months ago..."

Of course there's nothing we'll really be able to do to stop people from using 
the tools in this way, so it's mainly going to be an exercise in documenting 
the right way to use them. It's worth thinking about these problems though 
especially if you want to encourage best practices.

>  3- SDK itself cannot be upgraded when the 'base image' and SDK are updated
>  4- SDK users cannot add content to the SDK. e.g. I am a SDK user I
> create a library and I want that library to be in the SDK now.

We're certainly aiming to take care of these last two - indeed #4 is one of 
the main drivers behind the proposed new SDK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

