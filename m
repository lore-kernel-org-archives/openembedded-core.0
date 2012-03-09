Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S6355-0003Xu-Mn
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:54:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q29GjYl6005250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Mar 2012 08:45:34 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 9 Mar 2012 08:45:34 -0800
Message-ID: <4F5A33AD.4060800@windriver.com>
Date: Fri, 9 Mar 2012 10:45:33 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331076055-15262-1-git-send-email-msm@freescale.com>
	<1331237734.3006.33.camel@ted>
In-Reply-To: <1331237734.3006.33.camel@ted>
Subject: Re: [PATCH] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Fri, 09 Mar 2012 16:54:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/12 2:15 PM, Richard Purdie wrote:
> On Tue, 2012-03-06 at 17:20 -0600, Matthew McClintock wrote:
>> We can use the default value for TUNE_PKGARCH, and now we just
>> append "-nf" if TARGET_FPU is fpu-soft
>>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> ---
>>   meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
>>   1 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> index c9b2829..abd72ed 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -18,10 +18,8 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>>
>>   ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>>
>> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
>> -
>> -PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>> -TUNE_PKGARCH ?= "${PPCPKGARCH}"
>> +PPCPKGSFX_FPU = "${@['', '-nf'][bb.data.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
>> +TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
>
> Can we please do d.getVar(xxx, True) and not bb.data and ,1 :)

This was originally done with a check for fpu-hard and not fpu-soft to ensure 
that fpu-soft became the default value when one or the other wasn't set.

I don't know if it really matters which is used, but that is why it was done 
that way.

--Mark

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



