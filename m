Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id BF17D60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 17:45:58 +0000 (UTC)
Received: by iodt126 with SMTP id t126so89862881iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E6DoH2X5+p0rswTYPBYLJJyk+R9QlhHd5Zxjv+roThs=;
	b=PVg5wMlB5zmBfMdikLyqBqpX1QS1N4cNXMuHiYpxDmf3qcXhQJX9/P4zXmP3Z3PFjR
	l5Mvj0NW2/xCtZAnVC7gARJ60EEdwlSisJgVwThqjHHG5OLIJcBEy7ZlnrkFuQVo5zln
	Vt040yZGLkwoR9biMKv1QlzvYSzJSksdpRYvshqnqnNS+9XQRkSayByLzVExDYUlUBOm
	Pv53vTXjTJ17QkJ5JjYXUC95bzq31TOhtKDypAidOHNvhnJ1065fRoUYXvF1hl24b5j+
	v9bRA7QdlaPZun1X8cyjtVoO1HZ3gE4b5tEYNNKeBe1TkTSbtoFaZ5jO5fJMqF07kea0
	FerQ==
X-Received: by 10.107.35.195 with SMTP id j186mr5105629ioj.49.1440179158247;
	Fri, 21 Aug 2015 10:45:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 10:45:28 -0700 (PDT)
In-Reply-To: <1440153906.12105.233.camel@linuxfoundation.org>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 10:45:28 -0700
Message-ID: <CAMKF1srDn=2kMGpkn0Pp1fF89PBk+Ex6AonVgur5vSFnkAOfdQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 21 Aug 2015 17:46:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 3:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
>> Allow restricting recipes brought from a layer to a specified list. This
>> is similar in operation to blacklist.bbclass, but instead specifies a
>> per-layer whitelist of recipes (matched by BPN) that are able to be
>> built from the layer - anything else is skipped. This is potentially
>> useful where you want to bring in a select set of recipes from a larger
>> layer e.g. meta-oe.
>>
>> Implements [YOCTO #8150].
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 meta/classes/whitelist.bbclass
>
> I should go on record as having some pretty strong reservations about
> this from a philosophical standpoint.
>
> Why? I think its going to encourage behaviours which will result in a
> decrease in layer quality, particularly for meta-oe.
>
> Taking a simple example, today if someone breaks parsing in meta-oe, its
> quickly known about and multiple people can see and resolve the issue.
> Once people start using this class, many users will simply never
> see/care about parsing breakage in less maintained parts of the layer.
>
> I appreciate Martin will likely notice, however this shouldn't Martin's
> sole responsibility.
>
> Since people's focus will be on to narrow parts of the layer, we'll
> start to see islands which are well maintained/used and islands which
> are not. Worse, just looking at the layer, we won't be able to tell
> which is which.
>
> I'm nervous about anything which pushes responsibility onto already
> overloaded maintainers and encourages behaviour which is a net loss on
> "quality".
>
> I've talked to several significant users and they all "love" the idea of
> this class and plan to adopt it ASAP over existing tools like
> combo-layer. I therefore can't see much advantage of not merging the
> class as people are going to use it regardless.
>
> Speaking of it, combo-layer was designed to be an alternative way of
> dealing with these issues (more pain to use but causing less of a
> quality impact). Sadly, whilst it has seen some improvements, it still
> doesn't handle every operation it would need to make it work for some
> users and isn't widely adopted. I simply don't have the time to go and
> push it forward.
>
> So my objection is on record but that is likely about all I can do,
> other than hope I'm overly paranoid...

All points here are valid. We already see this with distro's which use
layers verbatim e.g. angstrom
I wish everyone derived their distros that way since that respects the
layer boundaries, a good chunk of work
there is still we send patches to layers to keep them up to date with
changes in other layers and there still are patches
pending since every layer maintainer doesnt respond in sam time frame,
but this sort of facilities if added is just going to worsen that
workload.
I think amalgmation of layers start with use of combo-tool itself.
This patch just takes it a step further. If we want to preserve
the layer model's health we have to work towards respecting layer
boundaries and I would even go a step further and suggest to
discourage use of combo-tool or any sort of layer squashing.

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

