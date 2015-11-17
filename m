Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 591EA6010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 14:05:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 17 Nov 2015 06:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,308,1444719600"; d="scan'208";a="852939520"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2015 06:05:26 -0800
Message-ID: <564B346F.2000407@linux.intel.com>
Date: Tue, 17 Nov 2015 16:06:39 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
	<56461044.2020202@windriver.com> <5649A752.2060308@linux.intel.com>
	<564A0051.2080005@windriver.com>
In-Reply-To: <564A0051.2080005@windriver.com>
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
X-List-Received-Date: Tue, 17 Nov 2015 14:05:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2015 06:12 PM, Mark Hatle wrote:

> I think a small group of folks that are interested in this work and who
> understand facets of it should get together and try to identify the problem and
> come up with an alternative solution.
>
> I have a lot of experience with pulling out internal structure size, packing,
> order, etc from generated binaries via objdump, readelf and other mechanisms --
> but I have no experience using gobject itself.
>
> So if we could get together to identify how a gobject binary is generated -- how
> the introspection happens internally -- and the output of the introspection
> tool.  It's very likely that I or others can come up with an approach to do the
> introspection that doesn't require QEMU.  (It may require the gobject binary
> generation having additional information placed in it -- or an introspection to
> occur at the time of compilation and saved away in a cache...)  but the point
> is, we need to figure out a general solution to this that doesn't require QEMU
> for "most things".

I know GObject fairly well, since I've done a medium-size project with 
it (https://01.org/gsso/) and I think the above is totally unrealistic. 
Below is an explanation why.

The idea of GObject is to make object oriented programming semantics 
(classes, inheritance, methods, properties and signals) available to C 
programmers. This is achieved by implementing a dynamic type system 
called GType. It serves as a register of available types, to which new 
types can be added, and information about existing types can be queried.

This type register is constructed entirely at runtime. When a 
gobject-based library is loaded into memory, it adds the types that are 
defined in the library (for example, classes and interfaces) to the 
register using GType's API.

There are no tools that can extract the type information at source code 
level, or any preprocessor for the special type syntax (like there is 
for example a preprocessor called 'moc' in Qt). In the source code the 
types are defined entirely using C syntax: a really awkward combination 
of macros and function definitions that the macros refer to. The code 
goes straight to the C compiler which of course knows nothing about the 
types. So writing such a tool would basically amount to writing a 
special-purpose C interpreter: not feasible.

When some library's types need to be introspected, a small binary is 
compiled and linked with the library by the introspection build system, 
and then executed. This binary iterates over available types, and asks 
GType to describe them. These descriptions are then written in the XML 
format to the .gir file. We cannot fetch this information directly from 
internal structures of GType, because these structures don't exist on 
disk; they're only created at runtime through executing type definition 
functions. So again, you'd need some kind of bytecode interpreter to 
extract this information from executable objects, which would look a lot 
like QEMU :)

So the bottom line, to generate introspection info, you have to run the 
code of the library that you introspect, either with QEMU, or on target 
hardware, and I don't see a way to avoid this, short of complete rewrite 
of the entire glib ecosystem. If someone wants to have this feature, but 
doesn't have a working QEMU, they should get their act together and fix it.

Alex

