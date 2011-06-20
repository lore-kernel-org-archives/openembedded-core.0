Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QYnCZ-0001Rm-5L
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 00:44:15 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QYn99-00045W-ME from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:40:43 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 20 Jun 2011 15:35:33 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 20 Jun 2011 15:40:42 -0700
Message-ID: <4DFFCC57.30404@mentor.com>
Date: Mon, 20 Jun 2011 15:40:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1307965969.15712.279.camel@rex>
In-Reply-To: <1307965969.15712.279.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 20 Jun 2011 22:35:33.0625 (UTC)
	FILETIME=[5E0C8690:01CC2F9A]
Subject: Re: RFD: Recipe variants, multilib and package handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2011 22:44:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/13/2011 04:52 AM, Richard Purdie wrote:

[snip]
> Discussion
> ==========
> 
> I don't think option a) above is viable and the current plan implies
> we'd do b) but its extremely ugly. I'm therefore tempted to look more
> seriously at c). The bigger issues would appear to be:
> 
> * It breaks with convention/tradition for OE (xxx-native vs native:xxx)

True, but how long do we stick with things that are limiting us when we
need a change to fix a real problem?  And this is a little easier to
deal with, now that we do really have a notion of doing releases so we
can more easily explain to folks when the change is.

> * It would add the constraint of packaging starting with ${PN}

I know we have some, but do they also really have a good reason for not
being ${PN}-foo now, possibly other than we borrowed the notion there
from someone else?  For example, I know Ubuntu is still 'ssh' for
'openssh', but we don't do that one.

> * It would require changes to the likes of debian.bbclass to account 
>   for package prefixes when performing auto renaming

Maybe we need to rename debian.bbclass while we're at it and yes, taking
into account multilib is, to me, just a 'yeah, gonna have to' as part of
the problem.

> * It would break a small set of the metadata where packages don't start 
>   with ${PN} (although the class could simply refuse to extend these 
>   automatically).

I think refusing is a good starting point to encourage someone that
needs it to update the recipe, or it can be a janitor project in the end
if the set is small enough...

> Things to consider:
> 
> * Would we just do this for multilibs or would we transition native 
>   recipes to the new style of naming? We don't have PACKAGES problems 
>   for native recipes.

I see a positive here being one less thing to change, but the downside
being one more set of logic sitting around.  Perhaps as a second pass
migrating native over...

> * Likewise, would nativesdk transition? Is has more PACKAGES problems 
>   so likely yes, it would make sense to transition.

I think it'll have to, at least before it's all said and done, otherwise
you will run into someone extending for both and puzzling over the
different names they get.

> * Would we stick with "-" as a delimiter or switch to something like 
>   ":"?

Internally, that might make things easier but in terms of writing out
the packages, that could be a problem...

> Thoughts/suggestions/better ideas welcome...

I wish it was easier to abstract things away so we could get namespace B
and keep that information around to solve problem 'i'.  Then problem
'ii' would just be about changing how we define PN.

-- 
Tom Rini
Mentor Graphics Corporation


