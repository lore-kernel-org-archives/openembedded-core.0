Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D8770780F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:40:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5NDeLNd012969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 23 Jun 2017 14:40:22 +0100
Message-ID: <1498225221.24449.128.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mylene Josserand <mylene.josserand@free-electrons.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 14:40:21 +0100
In-Reply-To: <a63a60dd-1000-0bf3-8fc1-5517b88e222d@free-electrons.com>
References: <a63a60dd-1000-0bf3-8fc1-5517b88e222d@free-electrons.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 23 Jun 2017 14:40:23 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: ARC arch support: uClibc status ?
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
X-List-Received-Date: Fri, 23 Jun 2017 13:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 2017-06-23 at 15:23 +0200, Mylene Josserand wrote:
> We are currently adding to Yocto project the Synopsys ARC CPU
> architecture, which is only available with uClibc library.
> 
> We currently have a layer which adds the support of this
> architecture 
> and uClibc support as it is, now, removed from OE-core.
> 
> Many configurations/fixes are needed in OpenEmbedded-core's recipes
> to 
> build successfully with this C library (library's dependencies, 
> autotools configuration, etc).
> 
> We wanted to send patches to fix them but it seems that all uClibc's 
> references are now removed from OE-core, even in recipes:
> 
> https://patchwork.openembedded.org/patch/140943/
> https://patches.openembedded.org/patch/140906/
> 
> What is the status of it? Remove entirely uClibc from OE-core?
> Could you give us advice on how to handle uClibc?  Should we create
> a 
> "meta-uclibc" layer which adds support of it + bbappend for all the 
> OE-core's recipes that currently fail because of uClibc's
> misconfiguration?
> 
> I guess that there is no plan to add uClibc's configuration in OE-
> core's 
> recipes (even without uClibc itself), right?

We dropped uclibc from OE-Core around a year ago in favour of musl
since it seems to work for all the use cases we've been aware of from
our users and nobody was willing to maintain it.

Since then the uclibc overrides and other pieces in core have bitrotted
to the point it was clear nobody was actively using or maintaining
them. I therefore proposed some patches removing them, those were
agreed by several developers and no objections were seen. We therefore
cleaned up the remaining pieces.

I believe that we have enhanced the extension mechanisms within the
core such that a meta-uclibc layer would be possible now, even for the
site files and insane.bbclass mappings and so on. It would need to add
some of the extensions removed from the core and then it should be
buildable again.

If you can't make anything work from the layer let us know and we can
try and figure out a way to solve that. I don't think the uclibc pieces
would be coming back into OE-Core any time soon though as whilst it
does have some niche markets left (e.g. arc), I can't see it being
widely used by the majority of OE users/arches.

(As an aside I haven't looked at it at all but does musl support arc?)

Cheers,

Richard


