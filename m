Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 06A326FE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 12:56:38 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id BD183663A1;
	Fri,  8 Aug 2014 14:56:37 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP;
	Fri,  8 Aug 2014 14:56:37 +0200 (CEST)
Message-ID: <53E4C905.5020200@topic.nl>
Date: Fri, 08 Aug 2014 14:56:37 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
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
X-List-Received-Date: Fri, 08 Aug 2014 12:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2014 11:10 AM, Paul Eggleton wrote:
...

> * Provide tools to allow modifying software for which a recipe already exists.
> If the user has an external source tree we use that, otherwise we can fetch
> the source, apply any patches and place the result in an external source tree,
> possibly managed with git. (It's fair to say this is perhaps less of an
> application developer type task, but still an important one and fairly simple
> to add once we have the rest of the tooling.)

This has been the most awkard of all OE uses so far. It hasn't improved 
over the years either.

In general, people (both external customers and internal colleages) have 
no objection whatsoever to cloning the OE repos and running bitbake 
themselves.

I haven't been able to come up with a good solution. I always try to 
test and develop my software on a regular PC, but for some things (e.g. 
access to the FPGA, or optimizing inner loop code with NEON 
instructions) you can't do without actual on-target deployment.

So I usually end up with a mix of manual commands and special-purpose 
shell scripts that work for just one package. For small packages, I tend 
to commit locally, and then re-run the package up to the "install" 
phase. For big things that take several minutes to compile I'm usually 
manually moving files around and struggling to keep the files in my 
repository and what the build will see in sync.

Any small step forward in this area will be a giant leap for the 
developers...

>
> * Provide tools to get your changes onto the target in order to test them.
> With access to the build system, rebuilding the image with changes to a target
> component is fairly trivial; but we can go further - assuming a network
> connection to the target is available we can provide tools to simply deploy
> the files installed by the changed recipe onto the running device (using an
> "sstate-like" mechanism - remove the old list of files and then install the new
> ones).

If it's possible to run the "install" target, this may be as simple as 
making a tar from the installed "image" directory and unpack it on the 
target.
I tend to do this in a one-liner if I have ssh access:

tar -cf - -C tmp.../${P}/image . | ssh target tar xf - -C /

I think that covers 99% of the use cases I can come up with...

> * Provide tools to get your changes to the code or the metadata into a form
> that you can submit somewhere.

If you have git in the "modify recipe" stage, this should be a breeze. 
Just use git push/bundle/send-email/format-patch/... to send them where 
they need to go.

Mike.

