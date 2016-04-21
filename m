Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17D7D73180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3LDDWMx012576; Thu, 21 Apr 2016 14:13:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DOzvYbVt2hm9; Thu, 21 Apr 2016 14:13:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3LDDQih012572
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Apr 2016 14:13:27 +0100
Message-ID: <1461244406.31320.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 14:13:26 +0100
In-Reply-To: <alpine.LFD.2.20.1604210639150.4110@localhost.localdomain>
References: <alpine.LFD.2.20.1604210639150.4110@localhost.localdomain>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: question about order of processing SRC_URI items
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
X-List-Received-Date: Thu, 21 Apr 2016 13:13:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-21 at 07:19 -0400, Robert P. J. Day wrote:
>   i'm currently building up a BSP layer which is going to involve
> quite a bit of FILESEXTRAPATHS and OVERRIDES and conditionals in my
> kernel bbappend files so i want to make sure i understand the
> processing order (or what there is of it).
> 
>   first, if one simply appends items to SRC_URI, as in:
> 
>   SRC_URI += " \
> 	derp.scc \
> 	gorp.scc \
> 	...
>   "
> 
> then regardless of how FILESOVERRIDES adjusts the search order in the
> eventual FILESPATH, those items *must* be found somewhere, correct?
> (this seems pretty obvious to me, but i've been burned by obvious
> things before.)

They need to be found somewhere, yes.

>   next, i realize there are two forms of appending to SRC_URI:
> 
>  * SRC_URI +=
>  * SRC_URI_append =
> 
> first, is there an aesthetic preference for one over the other if the
> end result is the same? (just curious about what people here prefer
> to
> use.)

In general we should try and use += if possible as its simpler and
easier to understand what it does.

>   more significantly, i realize the final order of SRC_URI items
> depending on which one you use might be different, as "_append"
> leaves
> the appending until the final stage of processing. so what this tells
> me is that all of the items you list in SRC_URI should *not* be
> order-dependent, is that a fair statement? or, IOW, if your layer
> depends on the items in SRC_URI being processed in a specific order,
> you probably need to rework your recipe file.

Sometimes order is important, e.g. two patches which change the same
set of files would need to be applied in the correct order.

Some things don't matter though.

>   (side note: i do realize that, in a single .scc file, the patches
> listed will be applied in precisely that order, but that's a
> different
> issue and not relevant here.)
> 
>   next, if there are truly conditional SRC_URI items, the only way to
> identify those is:
> 
>   SRC_URI_append_<override> = " ... blah blah ..."
> 
> you can't do this, can you?
> 
>   SRC_URI_<override> += " more stuff "

You can do that but it won't do what you'd want (it would overwrite the
original SRC_URI).

> i don't think i've ever seen an example of the latter, but maybe i
> just didn't look closely enough.

That would be because it wouldn't do anything useful in most cases.

>   and, finally, given that you can have a combination of SRC_URI
> assignments and appends in the same .bbappend file:
> 
>   SRC_URI += "..."
>   SRC_URI_append = "..."
>   SRC_URI_append_<override> = "..."
> 
> that tells me that you *really* don't want any of that to be
> order-dependent, as i mentioned before.

Right, you'd have to be careful with this.

>   is that about it? am i missing anything about SRC_URI definition
> and
> processing? thanks muchly.
> 
> rday
> 
> p.s.  oh, wait, two more curiosities. first, i still see the
> occasional example of this in numerous layers, including oe-core:
> 
>     meta/recipes-support/attr/attr_2.4.47.bb:
>         SRC_URI_append += "file://attr-Missing-configure.ac.patch \
>         ^^^^^^^^^^^^^^^^^
> 
> pretty sure combining "SRC_URI_append" with "+=" is just as redundant
> as ever, no? :-)

+= means there is a space prepended so its equivalent to:

SRC_URI_append = " file://attr-Missing-configure.ac.patch \

but we should remove such things.

>   also, if the list of items in SRC_URI should be order-independent,
> then it would seem to make little sense to specifically use:
> 
>   SRC_URI_prepend = "..."
> 
> anywhere, right? IOW, there should be no situation in which
> specifically *prepending* to SRC_URI is necessary. but i found one
> example in oe-core:
> 
>   meta/recipes-devtools/qemu/qemu_2.5.0.bb:
> 
> SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>             file://qemu-enlarge-env-entry-size.patch \
>             file://Qemu-Arm-versatilepb-Add-memory-size
> -checking.patch \
>             file://no-valgrind.patch \
>             file://CVE-2016-1568.patch \
>             file://CVE-2016-2197.patch \
>             file://CVE-2016-2198.patch \
>             file://pathlimit.patch \
>            "
> SRC_URI_prepend = "
> http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
> SRC_URI[sha256sum] =
> "3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4"
> 
>   uh ... yeah, i get that the above does the right thing but, come
> on,
> that just looks weird. is there a reason the qemu recipe deliberately
> goes out of its way to do this?

Its convention that the main source is at the top of SRC_URI. I
therefore don't really have an issue with what the qemu recipe does but
agree it could be cleaned up.

Cheers,

Richard

