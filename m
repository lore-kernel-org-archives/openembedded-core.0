Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA2F60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LAivCG008513; Fri, 21 Aug 2015 11:45:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6lG2RMymAyWU; Fri, 21 Aug 2015 11:45:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LAj6d7008521
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 21 Aug 2015 11:45:18 +0100
Message-ID: <1440153906.12105.233.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 21 Aug 2015 11:45:06 +0100
In-Reply-To: <d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 21 Aug 2015 10:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
> Allow restricting recipes brought from a layer to a specified list. This
> is similar in operation to blacklist.bbclass, but instead specifies a
> per-layer whitelist of recipes (matched by BPN) that are able to be
> built from the layer - anything else is skipped. This is potentially
> useful where you want to bring in a select set of recipes from a larger
> layer e.g. meta-oe.
> 
> Implements [YOCTO #8150].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/classes/whitelist.bbclass

I should go on record as having some pretty strong reservations about
this from a philosophical standpoint.

Why? I think its going to encourage behaviours which will result in a
decrease in layer quality, particularly for meta-oe.

Taking a simple example, today if someone breaks parsing in meta-oe, its
quickly known about and multiple people can see and resolve the issue.
Once people start using this class, many users will simply never
see/care about parsing breakage in less maintained parts of the layer.

I appreciate Martin will likely notice, however this shouldn't Martin's
sole responsibility.

Since people's focus will be on to narrow parts of the layer, we'll
start to see islands which are well maintained/used and islands which
are not. Worse, just looking at the layer, we won't be able to tell
which is which.

I'm nervous about anything which pushes responsibility onto already
overloaded maintainers and encourages behaviour which is a net loss on
"quality".

I've talked to several significant users and they all "love" the idea of
this class and plan to adopt it ASAP over existing tools like
combo-layer. I therefore can't see much advantage of not merging the
class as people are going to use it regardless.

Speaking of it, combo-layer was designed to be an alternative way of
dealing with these issues (more pain to use but causing less of a
quality impact). Sadly, whilst it has seen some improvements, it still
doesn't handle every operation it would need to make it work for some
users and isn't widely adopted. I simply don't have the time to go and
push it forward.

So my objection is on record but that is likely about all I can do,
other than hope I'm overly paranoid...

Cheers,

Richard



