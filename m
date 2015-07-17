Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id D260C65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 13:23:20 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id 4AFFC560006D;
	Fri, 17 Jul 2015 15:23:19 +0200 (CEST)
To: "Bach, Pascal" <pascal.bach@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1437119073-4788-1-git-send-email-pascal.bach@siemens.com>
	<55A8DF58.4010906@herbrechtsmeier.net>
	<355BE46A91031048906B695426A8D8E616C12A50@DEFTHW99EH4MSX.ww902.siemens.net>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <55A901C3.1030604@herbrechtsmeier.net>
Date: Fri, 17 Jul 2015 15:23:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <355BE46A91031048906B695426A8D8E616C12A50@DEFTHW99EH4MSX.ww902.siemens.net>
Subject: Re: [PATCH] cmake.bbclass: set archiver, linker and ranlib in toolchain.cmake
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
X-List-Received-Date: Fri, 17 Jul 2015 13:23:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.07.2015 um 14:23 schrieb Bach, Pascal:
> Hi
>
>> -----Original Message-----
>> From: Stefan Herbrechtsmeier [mailto:stefan@herbrechtsmeier.net]
>> Sent: Freitag, 17. Juli 2015 12:56
>> To: Bach, Pascal; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] cmake.bbclass: set archiver, linker and ranlib
>> in toolchain.cmake
>>
>> Am 17.07.2015 um 09:44 schrieb Pascal Bach:
>>> Setting CMAKE_AR, CMAKE_LINKER and CMAKE_RANLIB correctly in
>>> toolchain.cmake is necessary to correctly build -native packages using
>>> CMake.
>>>
>>> The reason is that CMake is not able to find the above utilities by
>>> itself because CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to
>> ONLY so we
>>> need to tell it explicitly where to look.
>> Which version do you use? The master sets
>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to BOTH for native packages.
>>
> I tested it with 1.7.2. I didn't notice that change in master.
> So I retested with master and it is working there without modifications.
Good

>> If this don't work you could set the
>> CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN
>> path (without /bin).
>>
>>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>>> ---
>>>    meta/classes/cmake.bbclass | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>>> index 995ddf1..cae0ad2 100644
>>> --- a/meta/classes/cmake.bbclass
>>> +++ b/meta/classes/cmake.bbclass
>>> @@ -13,6 +13,9 @@ inherit autotools
>>>    # C/C++ Compiler (without cpu arch/tune arguments)
>>>    OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>>>    OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
>>> +OECMAKE_AR ?= "`echo ${AR} | sed 's/^\([^ ]*\).*/\1/'`"
>> This is already set in master.
>>
> Just saw this.
>
>>> +OECMAKE_LINKER ?= "`echo ${LD} | sed 's/^\([^ ]*\).*/\1/'`"
>>> +OECMAKE_RANLIB ?= "`echo ${RANLIB} | sed 's/^\([^ ]*\).*/\1/'`"
>> You don't need the sed for ranlib.
>>
> I wasn't sure it is needed I just keept it to be on the safe side.
>
> The question is if the two above lines are needed at all. As I wrote above it is now working without them.
> For consistency reasons one could add them but currently I wouldn't do it.
They aren't needed because they aren't used anywhere.


