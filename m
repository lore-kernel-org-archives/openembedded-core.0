Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65C78610DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 16:20:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r97GKqvX004480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2013 09:20:52 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 7 Oct 2013 09:20:52 -0700
Message-ID: <5252DF5E.6010902@windriver.com>
Date: Mon, 7 Oct 2013 12:20:46 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>		
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>		
	<1380872773.18603.570.camel@ted> <52524055.2090303@windriver.com>	
	<1381139937.29912.11.camel@ted> <5252D124.9090603@windriver.com>
	<1381162713.29912.16.camel@ted>
In-Reply-To: <1381162713.29912.16.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Mon, 07 Oct 2013 16:20:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-07 12:18 PM, Richard Purdie wrote:
> On Mon, 2013-10-07 at 11:20 -0400, Bruce Ashfield wrote:
>>   I had it slightly wrong. Try:
>>>
>>> kernelheaders_sstate_postinst () {
>>>    	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
>>>    	then
>>>    		( cd ${KERNEL_SRC_PATH};
>>>    		  oe_runmake scripts
>>>    		)
>>>    	fi
>>>    }
>>>
>>> since the files are actually installed at this point, therefore we
>>> operate on the final location.
>>
>> That's the kicker, I can't get the right variable to find the final
>> location, KERNEL_SRC_PATH is set to /usr/src/kernel, so we can't operate
>> on it directly. When things were runing in the sysroot_append, the
>> kernel src was staged, and then operated on, then it makes it into the
>> sysroot. Here, we could operate on the STAGING_KERNEL, which is in the
>> sysroot, but stripped of the scripts. Perhaps that is the answer, but
>> I need to confirm that scripts installed in that location would be
>> available to the out of tree module builds that are looking for modpost
>> and friends.
>
> Guessing again (third time lucky?),
>
> cd ${STAGING_DIR_KERNEL};

Yah, that's where it lives. I'm building now and trying to validate Khem's
use case.

Bruce

>
> ?
>
> Cheers,
>
> Richard
>
>


