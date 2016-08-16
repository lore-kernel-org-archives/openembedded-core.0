Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 19CF27318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:49:21 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160816154920309_0685;
	Tue, 16 Aug 2016 08:49:20 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26742 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bZge1-0000Qc-56; Tue, 16 Aug 2016 11:51:13 -0400
Date: Tue, 16 Aug 2016 11:49:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Ulf Magnusson <ulfalizer@gmail.com>
In-Reply-To: <CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Tue, 16 Aug 2016 15:49:24 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Aug 2016, Ulf Magnusson wrote:

> On Tue, Aug 16, 2016 at 4:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   was about to submit a small number of patches to clean up redundancy
> > when people combine "_append" with "+=" (because it offends my
> > delicate sensibilities), and ran across this in oe-core,
> > unfs3_0.9.22.r497.bb:
> >
> >   DEPENDS_append_class-nativesdk += "flex-nativesdk"
> >
> > uh, what?
> >
> >   most of the time, i assume the above doesn't hurt, it's just ...
> > silly. but normally, with "_append", you *need* to add the leading
> > space explicitly, and that's not being done above. so does that mean
> > that combining "_append" with "+=" *does* generate a leading space?
> > that just makes my head hurt -- the possibility that "_append" is
> > being used in a way that normally makes it fail, only to have "+="
> > step in and save the day. at which point "_append" saves processing
> > that until the end of parsing? yeesh.
> >
> >   thoughts?
>
> By the point the += is handled, the override won't have been interpreted
> yet. My guess is that += fetches the value of the variable
> "DEPENDS_append_class-nativesdk", gets back the empty string, and
> adds a space followed by "flex-nativesdk" to that.
>
> The resulting " flex-nativesdk" is then interpreted as usual when the
> overrides are handled.
>
> You might like the note I added to
> https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages
> by the way. :)

  that note is pretty much what i've been whining about for a long
time. :-) in any event, when one sees something like the above:

  DEPENDS_append_class-nativesdk += "flex-nativesdk"

what is the *proper* cleanup?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


