Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFF2C65E28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7qn4J004789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jul 2014 00:52:49 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 17 Jul 2014 00:52:48 -0700
Message-ID: <53C780CD.3030903@windriver.com>
Date: Thu, 17 Jul 2014 15:52:45 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Henning Heinold <henning@itconsulting-heinold.de>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <cover.1405497586.git.Chong.Lu@windriver.com>	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>	<CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>	<53C72A3A.50101@windriver.com>	<CADkTA4MSh39enfLcF5VNtkTBpdBtkhZ8ZhkYXPfypKGTxDFe-w@mail.gmail.com>	<53C77426.3080209@windriver.com>
	<20140717070406.GA2666@mail.itconsulting-heinold.de>
In-Reply-To: <20140717070406.GA2666@mail.itconsulting-heinold.de>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Thu, 17 Jul 2014 07:52:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/17/2014 03:04 PM, Henning Heinold wrote:
> On Thu, Jul 17, 2014 at 02:58:46PM +0800, Chong Lu wrote:
>> On 07/17/2014 10:13 AM, Bruce Ashfield wrote:
>>> On Wed, Jul 16, 2014 at 9:43 PM, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>> On 07/16/2014 09:04 PM, Bruce Ashfield wrote:
>>>>> On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>>>> Fix incorrect paths to split perf package.
>>>>> Can you elaborate here ? This commit message doesn't really tell us much.
>>>>> Why is the current split incorrect ? What is the symptom and result of the
>>>>> incorrect split ? Are the package contents the same after this change ?
>>>>>
>>>>> Bruce
>>>> Hi Bruce,
>>>>
>>>> Currently, perf can't split to perf-archive, perf-tests, perf-python and
>>>> perf-perl.
>>>> All files are included in perf package. For example, like perf-tests
>>>> package:
>>>> It generates files in '${exec_prefix}/libexec/perf-core/tests', not in
>>>> '${libdir}/perf/perf-core/tests'.
>>>> So I change the files paths to make split successfully.
>>> But that means, whether or not we like it, anything using perf has been using
>>> those "non splits" and getting everything when perf is installed.
>>>
>>> It's also might be in order to make the main perf package RDEPEND on
>>> the other three, to keep it consistent. Make it a ?= so it can be overridden,
>>> and then we can age it out over time.
>>>
>>> Bruce
>> Do you mean we should set RDEPENDS like:
>>      RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
>>
>> In perf.bb file, we have RDEPENDS_${PN} += "elfutils", so I think we
>> should use
>>      RDEPENDS_${PN} += "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
>> to keep it consistent. Do you agree?
>>
>> Or, we can also revert following commit to make all files in perf package.
>>      commit 36c3e923df85e685b707fe6bd84b053a5e366fe4
>>      Author: Henning Heinold <henning@itconsulting-heinold.de>
>>      Date:   Mon Jun 9 23:21:29 2014 +0200
>>
>>          perf: split packging
>>
>> Best Regards
>> Chong
> Please do not destroy the following use case, which is using perf top
> WIHTOUT installing perl or python.
>
> Bye Henning
Hi Henning,

perf can't split to perf-archive, perf-tests, perf-python and perf-perl 
from your patch.
Currently, all files are in perf package.

BR
Chong


