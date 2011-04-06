Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q7Zm6-0008Gb-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 22:56:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id C681064F0;
	Wed,  6 Apr 2011 22:54:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DtdyoxWMSVP0; Wed,  6 Apr 2011 22:54:13 +0200 (CEST)
Received: from eha (0x55532124.adsl.cybercity.dk [85.83.33.36])
	(Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id CED80A85;
	Wed,  6 Apr 2011 22:54:11 +0200 (CEST)
Received: by eha (Postfix, from userid 1000)
	id 26B3AA51C7; Wed,  6 Apr 2011 22:54:11 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: "Hatle\, Mark" <mark.hatle@windriver.com>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk>
	<1302091554.22904.18.camel@rex>
	<A69B9A48-C42D-48B5-B09F-46AA5281C048@windriver.com>
Date: Wed, 06 Apr 2011 22:54:11 +0200
In-Reply-To: <A69B9A48-C42D-48B5-B09F-46AA5281C048@windriver.com> (Mark
	Hatle's message of "Wed, 6 Apr 2011 18:01:18 +0000")
Message-ID: <87mxk3drt8.fsf@eha.doredevelopment.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 20:56:27 -0000
Content-Type: text/plain; charset=us-ascii

"Hatle, Mark" <mark.hatle@windriver.com> writes:

> On Apr 6, 2011, at 5:06 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
>>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>> 
>>>> One of the items on our post 1.0 schedule is multilib and we need a plan
>>>> of implementation. I've been thinking about this for a while and at
>>>> least have some ideas how some of the issues can be handled.
>>>> ....
>>>> Does this make sense to everyone, are there any questions/ objections/
>>>> concerns/ things I've missed?
>>> 
>>> Which actual OE use-cases justify this kind of addition to OE?
>> 
>> Several people wanting to use OECore have a requirement of multilib
>> support. The typical embedded use case is where you have one main
>> application which you might want to run in some kind of large memory
>> mode or with some special optimisation (think a database engine) whilst
>> the rest of the system is "standard". This requires the ability to mix
>> different libraries.
>
> This is a very popular use-case in carrier grade systems.  Back haul
> voice, data, etc applications that require large routing databases or
> billing databases.  The other use I've seen for multilibs is some very
> specialized DVR systems where large amount of video need to stay in
> memory for quick retrieval.

None of which really resembles the systems the typical OE developer is
working on.  My point being that what might be important goals for YP
might not be equally important for community OE as such.  Not that it
necesarely is a real conflict, but I believe it is worth keeping in
mind.

>>> I know it is on the Yocto post 1.0 schedule, but is it actually a good
>>> thing for OE?  Maintaining OE recipes is clearly not going to get any
>>> easier with multilibs support.
>> 
>> As detailed in the proposal you will see that the complexity added is
>> minimal. It requires a simple enhancement to BBCLASSEXTEND which is
>> likely desirable for other reasons too and that is the only real bitbake
>> change required. For the metadata, individual recipes remain unaffected
>> and also the core conf files are unchanged too. The toolchain dependency
>> changes will be the only change affecting users at the recipe level and
>> most of the class/machine configuration will be opt in by anyone using
>> multilib. The only other invasive change is the package manager
>> integration. For rpm, it has good support for multilib already and we're
>> just enabling that. For opkg, we still need to determine the best
>> approach but the simplistic approach I mentioned will probably suffice
>> and anyone wanting true support at the package manager level can use
>> rpm.
>> 
>> For day to day recipe maintenance I don't see much direct impact.
>
> What I've seen in the past is the ability to build multilibs has
> improved the quality of the software integration by finding poorly
> constructed headers, hard coded library paths, etc... All things we
> should fix.

Cannot really be against improving software quality :-)

/Esben


