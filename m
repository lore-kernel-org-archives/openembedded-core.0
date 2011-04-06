Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7Xfy-0001WK-5l
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 20:41:58 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q7Xdu-0005kC-R5 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 11:39:50 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 11:39:50 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 6 Apr 2011 11:39:49 -0700
Message-ID: <4D9CB36D.5060406@mentor.com>
Date: Wed, 6 Apr 2011 11:39:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1302001365.24596.459.camel@rex>
	<51BF8F9A-3607-4DBF-9A6C-03E2FC1BD284@windriver.com>
In-Reply-To: <51BF8F9A-3607-4DBF-9A6C-03E2FC1BD284@windriver.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 Apr 2011 18:39:50.0714 (UTC)
	FILETIME=[033C51A0:01CBF48A]
Subject: Re: Proposed Multilib Implementation Brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 18:41:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/06/2011 11:26 AM, Hatle, Mark wrote:
> A few comments to the original proposal below...
> 
> 
> 
> On Apr 5, 2011, at 2:24 PM, "Richard Purdie"
> <richard.purdie@linuxfoundation.org> wrote:
[snip]
>> and all the multilib class would need to do is to manipulation of 
>> variables including OVERRIDES in a similar way to native.bbclass
>> with the complication of handling the parameter.
>> 
> 
> One of the complications though is deciding what packages to build
> for which multilibs.  We will need a way to say the default system
> libraries and components should be say 32-bit.  But I need this one
> component to be 64-bit....

To be clear (and I think you agree), it also needs to be vice-versa
(64bit except...) and rather arbitrary on what recipes get which treatment.

>> The toolchain bootstrap process would become a little complicated
>> by this. We'll need to be able to iterate over the list of
>> multilibs and configure the compiler with a configuration
>> appropriate to the multilibs requested. The compiler should then
>> take care of generating a suitable libgcc for each multilib. Where
>> the compiler currently depends on virtual/libc-initial, we'll need
>> with a function called to generate the dependecies so for example:
>> "virtual/libc virtual/libc-initial-lib32"
>> 
> 
> I think the toolchain bootstrap is a place where the implementation
> of the toolchain can make this easier or MUCH harder.  In the
> environments I am used to using (code sorcery based toolchain) its a
> single binary that enables the user to use many different multilibs.
> However, this is likely not the best/easiest approach for source
> based toolchain builds.  It's much easier for use to just iteratively
> build toolchains for each multlib.  Using unique filenames can make
> this fairly easy to implement with minimal changes to the recipes.
> 
> Using something more complex like the CS toolchains, you can do
> simply by creating specific wrappers that call the base common
> toolchain with the right parameters to switch the multlib settings..

Putting my community hat on, why not replicate what the CS folks do?
Even with sstate and the yocto 1.1 goal of quicker builds, no one likes
how long the toolchain bottleneck is.

-- 
Tom Rini
Mentor Graphics Corporation


