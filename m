Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q4Ijx-0007UL-D3
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 22:08:41 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q4Ii5-0002Cp-Dw from Tom_Rini@mentor.com ;
	Mon, 28 Mar 2011 13:06:45 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Mar 2011 13:05:22 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Mar 2011 13:06:43 -0700
Message-ID: <4D90EA4E.8070105@mentor.com>
Date: Mon, 28 Mar 2011 13:06:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <20110327200802.GA23980@sakrah.homelinux.org>
	<AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
	<4D90DB8A.3010609@mentor.com>
	<AANLkTi=Fc8N4ikQvH_6gA-1NkgjXiSmjwc9sn5m4G0Dm@mail.gmail.com>
In-Reply-To: <AANLkTi=Fc8N4ikQvH_6gA-1NkgjXiSmjwc9sn5m4G0Dm@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Mar 2011 20:05:22.0068 (UTC)
	FILETIME=[780B0D40:01CBED83]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DEPENDS tranlation with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 28 Mar 2011 20:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 03/28/2011 12:48 PM, Khem Raj wrote:
> On Mon, Mar 28, 2011 at 12:03 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> On 03/27/2011 04:03 PM, Chris Larson wrote:
>>> On Sun, Mar 27, 2011 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I observed that if I have
>>>> DEPENDS = "a b" in recipe.bb which has BBCLASSEXTEND = "native"
>>>> then dependecies for recipe-native shows a-native b-native so far so
>>>> good
>>>>
>>>> Now if I want to add a dependency which only is needed for native recipe
>>>> I do
>>>>
>>>> DEPENDS_virtclass-native += "c-native"
>>>>
>>>> what this does is it will ignore a-native and b-native dependencies and
>>>> only adds "c-native" to depends of native recipe
>>>>
>>>> DEPENDS_virtclass-native_append = " c-native"
>>>>
>>>> This does what I wanted i.e. have deps on a-native b-native c-native
>>>>
>>>> I think behavior of += or _append should be similar. Is my understanding
>>>> correct ?
>>>
>>> They've never been the same.  += is immediate, _append is delayed.  If
>>> a class, say, native.bbclass, defines the variable with ?=, and you
>>> used += before the inherit, then it will have a value, and the ?=
>>> won't assign.  I assume native.bbclass does it this way today so you
>>> can override the automatic behavior by defining the variable yourself,
>>> but I'll let Richard speak to that decision.
>>
>> As Richard said, this is a good summary.  And a shorter still summary
>> (as Chris reminds me everytime I forget) is that since BBCLASSEXTENDS
>> makes use of an override already (virtclass-native/cross/etc) you must
>> keep that in mind when further modifying it as you get not what you
>> expected but what you asked for.
>>
> 
> Yes no doubt on how it works and can be coded to likings of what we
> have but I think
> that having += and friends as well as _append and _prepend could be
> combined into one logic
> immediate appending/prepending operation may be confusing IMO while
> immediate assignments
> I think still are ok. We have more than one directives doing very
> similar yet semantically different operations
> It becomes hard for recipe writers. May be I am over simplifying

The problem is that we have different operators for different things.
Usually +=/=+ are what you want in a recipe for variables and append /
prepend are for classes that do tricky things.  The problem, as Richard
explains is that BBCLASSEXTEND makes things special and we need to deal
with that better.

-- 
Tom Rini
Mentor Graphics Corporation


