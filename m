Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA886C264
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 18:50:37 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id D588B1C1520;
	Tue, 13 Nov 2018 19:50:37 +0100 (CET)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20181113101729.19289-1-schnitzeltony@gmail.com>
	<CAJTo0LZmNVBXU+tNYczEqM1C_ed6J1WCeR7--Fda5Xaub8hknA@mail.gmail.com>
	<CALbNGRTtA6uc1fE8S7RdyFihWmP-bZDnqXRqBzb97DMHNaXWzg@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <26a58fa1-d94b-10cd-7523-d592d02a5a5e@geanix.com>
Date: Tue, 13 Nov 2018 19:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRTtA6uc1fE8S7RdyFihWmP-bZDnqXRqBzb97DMHNaXWzg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scons.bbclass: Force rebuild if necessary
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
X-List-Received-Date: Tue, 13 Nov 2018 18:50:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

On 13/11/2018 13.22, Andreas Müller wrote:
> On Tue, Nov 13, 2018 at 12:06 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> This make me look at scons a bit closer, somewhat in shock that it
>> doesn't have a native way of doing out of tree builds.  Apparently
>> abusing the repository argument will sometimes work for out of tree
>> (so you could just put B=$WORKDIR/build and add B to [cleandirs]) but
>> abusing sounds like 'doesn't always work' to me.
>>
>> I then discovered that the one recipe in oe-core that uses scons
>> doesn't in fact use the class, and switching to it breaks because
>> there's no standard way of passing install paths (serf tries to
>> install to /usr on the host).
>>
>> So how is your experience with the scons class? Is it actually useful?
>>
>> Ross
>> On Tue, 13 Nov 2018 at 10:18, Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>
>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>> ---
>>>   meta/classes/scons.bbclass | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
>>> index b9ae19d582..286843f74c 100644
>>> --- a/meta/classes/scons.bbclass
>>> +++ b/meta/classes/scons.bbclass
>>> @@ -2,7 +2,16 @@ DEPENDS += "python-scons-native"
>>>
>>>   EXTRA_OESCONS ?= ""
>>>
>>> -do_configure[noexec] = "1"
>>> +do_configure() {
>>> +       if [ -n "${CONFIGURESTAMPFILE}" ]; then
>>> +               if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
>>> +                       ${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
>>> +               fi
>>> +
>>> +               mkdir -p `dirname ${CONFIGURESTAMPFILE}`
>>> +               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
>>> +       fi
>>> +}
>>>
>>>   scons_do_compile() {
>>>           ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
>>> --
>>> 2.14.5
>>>
> Have few recipes in my layers inheriting scons. I build them
> frequently in my running 'world image' [1]:

I use gpsd from meta-oe, which "works" too...

// Martin

> meta-games/recipes-games/pingus/pingus_0.7.6.bb -> Builds 'fine' currently
> meta-qt5-extra/recipes-misc/recipes-multimedia/mixxx/mixxx_git.bb
> There are others I don't use:
> meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
> 
> Mixxx (has QA issues I am trying to fix) is the one on which I found
> out that rebuild is not performed in case recipes are changed on which
> mixxx depends on.
> 
> So yes I consider this class useful :)
> 
> [1] https://github.com/schnitzeltony/meta-mortsgna/blob/master/recipes-image/allgui/allgui-full-image.bb
> 
> Andreas
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

