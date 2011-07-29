Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qmp3t-0004kk-6q
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:33:17 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qmozl-00077f-Cs from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:29:01 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 29 Jul 2011 08:29:01 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 29 Jul 2011 08:29:00 -0700
Message-ID: <4E32D1B3.4010707@mentor.com>
Date: Fri, 29 Jul 2011 08:28:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311836896.git.lei.mei@intel.com>	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>	<4E317B82.1020907@mentor.com>	<749B9D3DBF0F054390025D9EAFF47F2212D0F6D3D5@shsmsx501.ccr.corp.intel.com>	<4E321053.1050305@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCC70E@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <749B9D3DBF0F054390025D9EAFF47F2212D0FCC70E@shsmsx501.ccr.corp.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Jul 2011 15:29:01.0217 (UTC)
	FILETIME=[3DE53910:01CC4E04]
Subject: Re: [PATCH 1/1] python-native: Fix	a	compiler	finding	issue
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
X-List-Received-Date: Fri, 29 Jul 2011 15:33:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/28/2011 11:58 PM, Mei, Lei wrote:
> 
> 
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Tom Rini
>> Sent: Friday, July 29, 2011 9:44 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding issue
>>
>> On 07/28/2011 06:15 PM, Mei, Lei wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>>>> Tom Rini
>>>> Sent: Thursday, July 28, 2011 11:09 PM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding
>> issue
>>>>
>>>> On 07/28/2011 12:20 AM, Mei Lei wrote:
>>>>> The CC variable sometimes add option information after compiler name,
>> but
>>>> python can't get the real compiler name if those information added.
>>>>> Fix this issue by dropping the option information when finding compiler
>> name.
>>>>>
>>>>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>>>>
>>>> I think this is going to cause problems when you must pass flags to gcc
>>>> to have it work, eg 'gcc -m64'.
>>>
>>> This patch fixed your worried issue.
>>> The CC variable, sometimes like:  "x86_64-poky-linux-gcc -m64
>> --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains flags information.
>>> This will lead to wrong compiler name "qemux86-64" rather than
>> "x86_64-poky-linux-gcc" when python finding the compiler name, so add this
>> patch to find the real gcc name.
>>
>> No, what I'm saying is I have a compiler that must be invoked as 'gcc
>> -m64' (which is what BUILD_CC is).  So, I think after saying that, the
>> right answer is to modify python to read the OE-specific BUILD_CC variable.
> 
> 
> I think I didn't describe this patch exactly before.
> 
> This patch is only for function runtime_library_dir_option, this function is to detect which platform we are running and what compiler we used, then decide what option information should be passed to compiler.
> 
> By default, our cross-compiler's name be recognized as "qemux86" rather than " x86_64-poky-linux-gcc" in this function, this is wrong, this will induce a wrong option information passed to x86_64-poky-linux-gcc and block the compile process.
> 
> And function runtime_library_dir_option only return the option information, so didn't influence compiler name in global.
> 
> By the way, I think BUILD_CC is host compiler name, not for target.

You're patching python-native, not python, which means the host python
and not the target python.

-- 
Tom Rini
Mentor Graphics Corporation


