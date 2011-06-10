Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1QV1ok-0003uz-1R
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 15:32:07 +0200
Received: (qmail 20994 invoked from network); 10 Jun 2011 13:22:03 -0000
Received: from unknown (209.242.7.165)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	10 Jun 2011 13:22:02 -0000
Message-ID: <4DF21A71.40706@mwester.net>
Date: Fri, 10 Jun 2011 08:21:53 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: mike@mwester.net, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DF18EF7.8000207@windriver.com> <4DF1B022.2010506@windriver.com>
	<4DF21798.3080006@mwester.net>
In-Reply-To: <4DF21798.3080006@mwester.net>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	wenzong fan <wenzong.fan@windriver.com>, "Wold, Saul" <saul.wold@intel.com>
Subject: Re: The design document for ccache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: mike@mwester.net, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 10 Jun 2011 13:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 6/10/2011 8:09 AM, Mike Westerhof wrote:
> On 6/10/2011 12:48 AM, Robert Yang wrote:
>>
>> On 06/10/2011 11:26 AM, wenzong fan wrote:
>>>
>>>
>>> -------- Original Message --------
>>>
>>> On Thu, 2011-06-09 at 15:40 -0700, Saul Wold wrote:
>>>> On 06/02/2011 08:11 PM, wenzong fan wrote:
>>>>> Hi Folks,
>>>>>
>>>>> Please help me to review the design document for ccache-native, and
>>>>> I also have two questions about it, any answers or suggestions are
>>>>> appreciated.
>>>>>
>>>>> * Feature name: ccache-native
>>>>> Priority: P3; M2
>>>>> Owner: Wenzong Fan
>>>>> Summary: Integrate ccache-native to yocto
>>>>>
>>>>> * Description:
>>>>> Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
>>>>> included by poky/yocto, just add it as a native tool.
>>>>>
>>>>> * Usage:
>>>>> Build ccache as a native tool by default and enable it for speeding
>>>>> target packages build.
>>>>>
>>>>> * Implementation:
>>>>> 1) Copy bb file from OE upstream to:
>>>>> meta/recipes-devtools/ccache/
>>>>>
>>>>> 2) Update bb file to get the latest ccache_3.1.5 and split the single
>>>>> bb file to:
>>>>> 'ccache_3.1.5.bb', 'ccache.inc'
>>>>>
>>>>> 3) Enable ccache in the native tools building.
>>>>>
>>>> You will need to have it be a dependency pretty early on in the build.
>>>> Additionally, this is a bit a new part to this task, we want to have the
>>>> default CCACHE_DIR for the build default to a directory in TMPDIR
>>>> instead of the user's home directory. This will mean setting an
>>>> environment variable somewhere early also.
>>>
>>> There is a little more detail on:
>>>
>>> https://wiki.yoctoproject.org/wiki/Yocto_1.1_Schedule
>>>
>>> Specifically, "c) Set CCACHE on a per recipe basis. need to figure out
>>> whether ccache data can be shared and under what circumstances."
>>>
>>> so something like adding:
>>>
>>> export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/${PN}"
>>>
>>
>> I think that set CCACHE_DIR on per recipe basis would degrade hit
>> efficiency,
>> the following ccache data can be shared if they they use the same
>> CCACHE_DIR,
>> but if we set CACHE_DIR on a per recipe basis, then they can't be shared:
>>
>> 1) Most pkg's configure will run "gcc foo.c" for checking the C  compiler,
>>    these compiling are the same between different pkgs at most time.
>>
>> 2) Some recipes' compiling are similar, for example: gcc-cross,
>>    gcc-corss-initial and gcc-cross-intermediate.
>>
>> I think that:
>>
>> export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/"
>>
>> would be better.
> 
> I fear that the use of ccache is inherently risky with OE.  Given the
> (relatively common) case where the user blows away their TMPDIR in order

(Replying to my own message, because I didn't have enough coffee to be
clear in the original!)  I'm agreeing with the suggestion that it be in
TMPDIR, and offering the suggestion that if we don't put it there, we
need to qualify it with the toolchain version.  (Now I'm going to get
another cup of coffee -- sorry for any confusion!)
-Mike (mwester)

> to get a full, clean rebuild after an update to the toolchain is make,
> it is possible that ccache will erroneously re-use an object created by
> the earlier version of the toolchain.
> 
> While imperfect, I would suggest that we would do better if we would
> somehow embed the PV (or something like that) for the toolchain into the
> CCACHE_DIR, thus ensuring that we don't risk the re-use of old objects
> when the toolchain is updated.
> 
> (Frankly, given my experiences with it, I'd prefer we just disable
> ccache entirely with OE.)
> 
> -Mike (mwester)
> 
>> // Robert
>>
>>> to bitbake.conf with a bit more thought into working out the right
>>> components to add to the variable.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



