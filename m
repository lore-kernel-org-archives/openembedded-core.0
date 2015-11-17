Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 189406012C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 15:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAHF2j0b003110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Nov 2015 07:02:45 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 17 Nov 2015 07:02:45 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
	<56461044.2020202@windriver.com> <5649A752.2060308@linux.intel.com>
	<564A0051.2080005@windriver.com> <564B346F.2000407@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <564B4193.7060104@windriver.com>
Date: Tue, 17 Nov 2015 09:02:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564B346F.2000407@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 17 Nov 2015 15:02:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/17/15 8:06 AM, Alexander Kanavin wrote:
> On 11/16/2015 06:12 PM, Mark Hatle wrote:
> 
>> I think a small group of folks that are interested in this work and who
>> understand facets of it should get together and try to identify the problem and
>> come up with an alternative solution.
>>
>> I have a lot of experience with pulling out internal structure size, packing,
>> order, etc from generated binaries via objdump, readelf and other mechanisms --
>> but I have no experience using gobject itself.
>>
>> So if we could get together to identify how a gobject binary is generated -- how
>> the introspection happens internally -- and the output of the introspection
>> tool.  It's very likely that I or others can come up with an approach to do the
>> introspection that doesn't require QEMU.  (It may require the gobject binary
>> generation having additional information placed in it -- or an introspection to
>> occur at the time of compilation and saved away in a cache...)  but the point
>> is, we need to figure out a general solution to this that doesn't require QEMU
>> for "most things".
> 
> I know GObject fairly well, since I've done a medium-size project with 
> it (https://01.org/gsso/) and I think the above is totally unrealistic. 
> Below is an explanation why.
> 
> The idea of GObject is to make object oriented programming semantics 
> (classes, inheritance, methods, properties and signals) available to C 
> programmers. This is achieved by implementing a dynamic type system 
> called GType. It serves as a register of available types, to which new 
> types can be added, and information about existing types can be queried.
> 
> This type register is constructed entirely at runtime. When a 
> gobject-based library is loaded into memory, it adds the types that are 
> defined in the library (for example, classes and interfaces) to the 
> register using GType's API.

This is the key, the types and internal data structures are not dynamically
changing.  They are defined within the library.  (The object definitions may be
generated and exposed at runtime, but once a library is built -- they do not
change.)

> There are no tools that can extract the type information at source code 
> level, or any preprocessor for the special type syntax (like there is 
> for example a preprocessor called 'moc' in Qt). In the source code the 
> types are defined entirely using C syntax: a really awkward combination 
> of macros and function definitions that the macros refer to. The code 
> goes straight to the C compiler which of course knows nothing about the 
> types. So writing such a tool would basically amount to writing a 
> special-purpose C interpreter: not feasible.

I would need to see the code to understand this.  -IF- the macros and
definitions are done in a standard way, it is very much possible to interpret
the results of the macros via the intermediate objects.  But I need to see an
example of the code.

> When some library's types need to be introspected, a small binary is 
> compiled and linked with the library by the introspection build system, 
> and then executed. This binary iterates over available types, and asks 
> GType to describe them. These descriptions are then written in the XML 
> format to the .gir file. We cannot fetch this information directly from 
> internal structures of GType, because these structures don't exist on 
> disk; they're only created at runtime through executing type definition 
> functions. So again, you'd need some kind of bytecode interpreter to 
> extract this information from executable objects, which would look a lot 
> like QEMU :)

Another place where looking at the code may prove otherwise.  I need to see how
this is done to be able to comment.

> So the bottom line, to generate introspection info, you have to run the 
> code of the library that you introspect, either with QEMU, or on target 
> hardware, and I don't see a way to avoid this, short of complete rewrite 
> of the entire glib ecosystem. If someone wants to have this feature, but 
> doesn't have a working QEMU, they should get their act together and fix it.

Can you put together a small piece of test code with instructions on how to
compiler it, generate the '.gir' file and anything else?  I can take a look at
this and see if there is a way to inspect the intermediate objects for the type
information we need.

--Mark

