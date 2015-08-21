Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5E17A60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 11:59:28 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so12144183igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 04:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=uOoFFlqGaEMNpBOc/3axByxJh7NBo0tFPelgqUsXM1M=;
	b=PkFJDj0QhRCP8YEcvS6tvrRIdHdBxHiREQwmeIJ+3X/P78Hr0iAnBTrVBkz0xk7BE2
	Cg8Pysr9EnfoMD0vDx70PAZwCURnAsmx/89yAnMzKi/ZTx/u0zPs7quTW4ZUwS4G8mi3
	vyfvXSQolcRM9/IfxTHTacOGXOuEorFCNe+GZzaTK4eazs4O/VjH1hjkxt5s0ZFBos58
	JTpewB59wO/6B1vq2VxEodkY0fcRX3IpuXsQZHfwqJswdy+DkMBp1px34tDCxoC4JIut
	jK3t/TDxjn8tBnZDQScdQwggRoi1VokdIwQ39EBNzn5Po/CVC/Cpm2hm+Ijgu7CdH+WA
	ylKA==
X-Gm-Message-State: ALoCoQkSYt3nlS8oWpqEql4gQB28b0etbGMzEVHbKUu86X4ku/UZijA7x7FTzJRaeZVedDB5z8PX
X-Received: by 10.50.142.98 with SMTP id rv2mr1926086igb.41.1440158368241;
	Fri, 21 Aug 2015 04:59:28 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F046.dip0.t-ipconnect.de. [93.232.240.70])
	by smtp.gmail.com with ESMTPSA id
	e33sm5795319ioi.12.2015.08.21.04.59.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 04:59:27 -0700 (PDT)
Message-ID: <1440158364.10174.17.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Aug 2015 13:59:24 +0200
In-Reply-To: <1440153906.12105.233.camel@linuxfoundation.org>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 21 Aug 2015 11:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-21 at 11:45 +0100, Richard Purdie wrote:
> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
> > Allow restricting recipes brought from a layer to a specified list. This
> > is similar in operation to blacklist.bbclass, but instead specifies a
> > per-layer whitelist of recipes (matched by BPN) that are able to be
> > built from the layer - anything else is skipped. This is potentially
> > useful where you want to bring in a select set of recipes from a larger
> > layer e.g. meta-oe.
> > 
> > Implements [YOCTO #8150].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta/classes/whitelist.bbclass
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

I understand that concern. I don't know whether there are currently
users who take the full meta-oe and would stop doing that once this
class gets added. But I know that the inverse is also going to happen:
not using meta-oe at all, starting to use a subset of it with this
whitelist.bbclass. Whether that's a net gain or loss overall I have no
idea.

> Speaking of it, combo-layer was designed to be an alternative way of
> dealing with these issues (more pain to use but causing less of a
> quality impact).

I disagree here. When using combo-layer with filter to pick "desired" or
"supported" recipes, you have the exact same effect as with whitelisting
(only those recipes get tested).

Without filter we have indeed the situation of someone taking the entire
meta-oe and activating it, but that's independent of using combo-layer
or not.

> Sadly, whilst it has seen some improvements, it still
> doesn't handle every operation it would need to make it work for some
> users and isn't widely adopted. I simply don't have the time to go and
> push it forward.

I'm not sure what improvements you have in mind here. The "filter"
mechanism certainly could be enhanced (filtering out a recipe and
adding it later does not work), but that's conceptually the same as
whitelisting.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




