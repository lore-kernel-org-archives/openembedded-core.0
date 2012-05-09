Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SSA7P-00042T-Qv
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:52:04 +0200
Received: by pbbrq2 with SMTP id rq2so645772pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TkXg30gB9r7WZFYcWZC2nKNR8QxQoNyH+DYPPL2qQK4=;
	b=Kp6oMRPmrB3UmdN+ETAjXsLwOBJrREoQpSbzqK1lrvjttRfLiMl4mFkaBOF+oIeLAC
	A28gh9/X9eCGLWSwFgj6XU0uIYSSqLfy+i+ZlNzVA0qpIQBQrOfVepUtekX6MV7Vxm96
	xT01izIyjPFyFgXy/sAyC+S4wcC6y1QHUNSEjZvak7c+0LatOw4KXfKwShIWFV8NZkNn
	47tAxjq2nlHf2915zygjkQjN7Qibz1ug+ukdTqs8Kz2/5/hCo8PMXZIMnP0BJwtfqHDS
	IchJZEuFvsVaj8H5NgnTF9KWdTCGqIIvi5NhoVrg32mX+D/93TYDVjtP/IEUkqyc3zQw
	4v7w==
MIME-Version: 1.0
Received: by 10.68.191.137 with SMTP id gy9mr10854055pbc.83.1336581730055;
	Wed, 09 May 2012 09:42:10 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Wed, 9 May 2012 09:42:10 -0700 (PDT)
In-Reply-To: <CADkTA4OFZN+mH8e1ub+jcbhnvpqQf7nkU+D=sBiHj6oUoA3Pfw@mail.gmail.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
	<893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
	<4FAA8FEF.9050702@linux.intel.com>
	<CADkTA4PQbCqC6SrTA-v7vZ70ruqSSzxKObFudvMiYaXpCLMT1g@mail.gmail.com>
	<1336579353.5602.98.camel@phil-desktop>
	<CADkTA4OFZN+mH8e1ub+jcbhnvpqQf7nkU+D=sBiHj6oUoA3Pfw@mail.gmail.com>
Date: Wed, 9 May 2012 12:42:10 -0400
Message-ID: <CADkTA4NG8Ncge_7miPc38tzConX0FxJN-By+RmzO01Y3j4F3Cg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kern-tools: checkpoint restoration for reset branches
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
X-List-Received-Date: Wed, 09 May 2012 16:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 12:11 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, May 9, 2012 at 12:02 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Wed, 2012-05-09 at 11:48 -0400, Bruce Ashfield wrote:
>>> On Wed, May 9, 2012 at 11:40 AM, Darren Hart <dvhart@linux.intel.com> w=
rote:
>>> >
>>> >
>>> > On 05/08/2012 08:48 PM, Bruce Ashfield wrote:
>>> >> Updating the SRCREV to pickup the following fix:
>>> >>
>>> >> =A0 =A0 createme: fix checkpoint restoration for reset branches
>>> >>
>>> >> =A0 =A0 The meta branch can optionally be merged out to BSP branches=
. This removes
>>> >> =A0 =A0 the need to restore the checkpoint when working with the tre=
e. =A0The way
>>> >> =A0 =A0 it detects the merge is by checking to see how many branches=
 contain the
>>> >> =A0 =A0 meta data. If there's more than one, the branch was was merg=
ed out.
>>> >>
>>> >> =A0 =A0 Unless you are a BSP that isn't tracking the latest meta, an=
d you get
>>> >> =A0 =A0 meta and meta-orig created. That's two branches and the code=
 opts to not
>>> >> =A0 =A0 restore the checkpoint, which leads to configuration errors.
>>> >>
>>> >> =A0 =A0 The fix is simple. We allow for 2 or less branches with meta=
, and will
>>> >> =A0 =A0 still restore the checkpoint. Three and up, we won't.
>>> >>
>>> >
>>> > Uhm... am I the only one for whom this language is really confusing?
>>> > "merged out" ?
>>> > "restore the checkpoint" ?
>>>
>>> I could be more verbose, but it's like reading a kernel -mm commit. I
>>> don't grok everything they write, but they aren't writing it for me as =
a
>>> -mm newbie.
>>
>> So, who exactly is the target audience for the above text? =A0I'm not su=
re
>> that "really confusing" does it justice: from my point of view (though
>> admittedly I am very far from being an eleet k3rn3l h4x0r) it just looks
>> like gibberish. =A0If it's going into oe-core then I would have hoped th=
at
>> the checkin comment would be intelligible to oe-core users at large, not
>> just those who are schooled in the mysterious ways of some particular
>> subgroup.
>
> It's a quote from the kern-tools commit log. I could just put: 'fixes stu=
ff',
> but that's not good either. Writing a novel isn't good either.
>
> I'm not sure why everyone is having such an issue with this, there's many
> other examples of commits like this, and everyone sits in a glass house
> in this regard.
>
> I can re-work it of course, I wrote it very late at night to fix a

I rewrote the SRCREV update commit into something more legible. It's on
the same branch as the original pull request.

Cheers,

Bruce

> fairly blocking
> bug, so everyone cutting a little bit of slack would be appreciated.
>
> Cheers,
>
> Bruce
>
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


