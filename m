Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SFWVo-0002eA-JK
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 22:09:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q34JxmZD006245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2012 12:59:48 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 4 Apr 2012 12:59:48 -0700
Message-ID: <4F7CA833.1000300@windriver.com>
Date: Wed, 4 Apr 2012 14:59:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
	<CAEsOVNcABe4RpUo2gO4s7_7eRGBDorXeCrP=kSt3Bb7gp92X1Q@mail.gmail.com>
In-Reply-To: <CAEsOVNcABe4RpUo2gO4s7_7eRGBDorXeCrP=kSt3Bb7gp92X1Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] conf/machine/include: Cleanup PowerPC tunings to match README
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
X-List-Received-Date: Wed, 04 Apr 2012 20:09:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/12 1:03 PM, Matthew McClintock wrote:
> On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> --- a/meta/conf/machine/include/tune-ppce500.inc
>> +++ b/meta/conf/machine/include/tune-ppce500.inc
>> @@ -4,13 +4,17 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>>
>>   TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
>>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
>> -TUNE_PKGARCH_tune-ppce500 = "ppce500"
>>
>>   TUNEVALID[spe] = "Enable SPE ABI extensions"
>> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
>> +TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500" , "spe" ], "ppc-efs", "", d)}"
>
> Should these TARGET_FPU's be in a common file? Maybe some of these
> other bits could be moved to a common file too? Setting this
> TARGET_FPU above and TUNE_FEATURES in the same file seems redundant?
> Or maybe this is for the multilib scenario and I'm missing
> something...

Normally I'd say yes, but the SPE settings are a bit unique for the ppce500[v2] 
series of CPUs.  Duplicating it shouldn't cause any unique problems to occur. 
(If future CPUs were to include the e500 or e500v2 SPE unit, we could consider 
moving the code.. or more likely renaming the spe element is to "spe-single" and 
"spe-double"...)

But at this point I believe they are dead ends....

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



