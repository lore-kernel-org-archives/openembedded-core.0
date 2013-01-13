Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TuKpN-0002CQ-EF
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Jan 2013 11:30:24 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:55981 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TuKaa-0001vQ-L3; Sun, 13 Jan 2013 05:14:52 -0500
Date: Sun, 13 Jan 2013 05:14:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <CABcZAN=T+GS=H_PuyusNYJNmjbVraoz1u_OdCHq3Nr8s=hqBHw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1301130504330.21628@oneiric>
References: <alpine.DEB.2.02.1301120618220.15410@oneiric>
	<1357995930.4072.134.camel@ted>
	<CABcZAN=T+GS=H_PuyusNYJNmjbVraoz1u_OdCHq3Nr8s=hqBHw@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: image_types.bbclass: what's with "elf" and "cpio.gz"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Jan 2013 10:30:25 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1353976235-1358072090=:21628"

--8323329-1353976235-1358072090=:21628
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 12 Jan 2013, Chris Larson wrote:

>
> On Sat, Jan 12, 2013 at 6:05 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>       > i was going to trivially fix that comment (it's now "alltypes", not
>       > "types"), but i was distracted by the code above that -- what the heck
>       > is going on there?  what's the rationale for removing elf, then adding
>       > cpio.gz and elf back on at the end?  if someone can clarify that, i
>       > can add that as more comment, as well as a few other tweaks in that
>       > file for more documentation for anyone reading TFS.  thanks.
>
> Order is important.

  we'll come back to this shortly.

> The elf image depends on the cpio.gz image already having been
> created so a) it must be created and b) it must happen before elf.

  i'd immediately assumed that's what was going on -- what confused me
was that i was unaware that ordering was important in simply
*tracking* the collection of types one wanted to create.  (it isn't,
of course, but the code led me to believe that.)

> I'd think we could implement a data-driven method for this, rather
> than hardcoding this knowledge. Either declare the deps via a flag,
> or have one directly call the other.

  yes, any of the above, since in many places, the code seems
unnecessarily confusing by implementing with (ordered) lists what
should be supported by sets.  for example, as in this case, the
collection of image types should be a set to not have to mess with
additional code checking for prior membership, uniqueness, etc.

  and yet, in files like image_types.bbclass, you read unnecessarily
complicated code like:

        if "ext3" not in types:
            types.append("ext3")
        if "ext3" not in alltypes:
            alltypes.append("ext3")

simply because "types" is a list and not a set.  things like that
should be handled by sets, and any order-dependent processing should
be left until the very end and hidden from normal view in whatever
specific routine *needs* to care about order.  as you suggest,
data-driven, deps via flags, whatever.

  anyway, just my $0.02 at way too early on a sunday morning.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


--8323329-1353976235-1358072090=:21628--
