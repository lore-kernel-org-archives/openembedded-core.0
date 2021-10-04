Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <42ad79c92bea355abe2d7d7200003f62d6e3a212.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: adds warnings for the exceptions of os.utime in siginfo
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 04 Oct 2021 21:03:42 +0100
In-Reply-To: <CANPvuR=Gnc=QpXqQkC1=37=93SZC1f_MS8FvfLui8RKmx9r5hQ@mail.gmail.com>
References: <20211003213834.934065-1-quaresma.jose@gmail.com>
	 <c9839c9f3bda2be330b9ee6be281b9bee237411e.camel@linuxfoundation.org>
	 <CANPvuR=Gnc=QpXqQkC1=37=93SZC1f_MS8FvfLui8RKmx9r5hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Mon, 2021-10-04 at 18:59 +0100, Jose Quaresma wrote:
> I understand the exception for the use cases but I think it would be useful
> to show this to the users. Will it be more appropriate perhaps to log this as
> debug messages?

The trouble is in the situations that is guarding against, the user cannot do
anything about it so warnings definitely aren't appropriate and I'm not sure
debug messages would be welcome either. Those would be less invasive though.

> I have a final question that I don't understand clearly.
> Can the omission of these timestamps updates on siginfo invalidate the use of
> the sstate-cache for that task,
> bitbake-dumpsig can complain about that?

I think there is a misunderstanding here. The timestamps I've been talking about
are part of reproducible builds and the SOURCE_DATE_EPOCH variable and code.
These aim to make the output identical. If the output is identical, hash
equivalence is more successful and the more successful hash equivalence is, the
more sstate reuse you get.

The timestamps in this part of the sstate code are simply there to handle sstate
artefact aging (e.g. delete things which haven't been used in X weeks). The
timestamp change is therefore "nice" but if it doesn't happen, it isn't a
problem. Hope that helps clarify.

Cheers,

Richard


