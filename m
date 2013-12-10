Return-Path: <saul.wold@intel.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 38FD560660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 04:39:48 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id up15so6789849pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 20:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gjoK/vO8O2BmhboOh+cRdtYaW2BS34obbGbLWJuveog=;
	b=T3xkGAwNVLb2G0ck+l53ttIHs1obVkWFan6geahF8F0K7j+PFxvNPLynvR22YY6L7+
	BpAauoLM6kH1kYxLIH5eDtGIm7c56Jgau7LMhMlg35G/db4fo3juKZ8vyrIoizhArNXr
	a4F7sVJIgtYxEUNVnhKYq1cG5KDoo4Vvft6cWWLm4fndZtHzBnrdbzNuLjNanalcF7Fa
	VavDbKBidz//k0WkM44mozyMlFOIqbbVfea2QaWrRahjtcGEfc1IWM/+tuKr02FOhyad
	DQoZLHXwFXmGWV57MaDQnNLK9ZFvd+gN4Ejc/f7XGeLFkvDLUawzE/A+Aw8iDLebI9w0
	lMHQ==
X-Gm-Message-State: ALoCoQlBVXlwpEJhEB8N32bq2KveuRNg8qAC/Krs+FBYtG4az7xMCFH0Hg0pvrc0eJ1Xy2VQpH/e
X-Received: by 10.68.106.98 with SMTP id gt2mr25297877pbb.61.1386650387704;
	Mon, 09 Dec 2013 20:39:47 -0800 (PST)
Received: from [10.6.18.24] (c-50-186-0-160.hsd1.or.comcast.net.
	[50.186.0.160])
	by mx.google.com with ESMTPSA id xs1sm30735759pac.7.2013.12.09.20.39.45
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Dec 2013 20:39:46 -0800 (PST)
Message-ID: <52A69B11.6090207@intel.com>
Date: Mon, 09 Dec 2013 20:39:45 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386066249.git.hongxu.jia@windriver.com>		<837855b3a50fc0672000e2419763a8c6ad062ae3.1386066250.git.hongxu.jia@windriver.com>	<1386072858.4463.42.camel@ted>
	<529E9E34.10806@windriver.com>
In-Reply-To: <529E9E34.10806@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] eglibc-locale.inc: use nativesdk override with the PACKAGES_DYNAMIC statement
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
X-List-Received-Date: Tue, 10 Dec 2013 04:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2013 07:15 PM, Hongxu Jia wrote:
> Hi Richard,
>
> I have updated this patch as your suggestion, and it works well.
>
>      nativesdk.bbclass: support nativesdk to override with the
> PACKAGES_DYNAMIC statement
>
>      While compiling nativesdk-mtools, there was failure:
>      ...
>      Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
>      ...
>      This patch supports nativesdk to override with the PACKAGES_DYNAMIC
> statement
>
>      [YOCTO #5623]
>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>

In the future, please resend changes like this as a V2, we pulled the 
mtools change only to find that we did not have the correct nativesdk 
patch since it was not posted.

We have since found this patch in your branch and pulled it to master.

Thanks
	Sau!

> diff --git a/meta/classes/nativesdk.bbclass
> b/meta/classes/nativesdk.bbclass
> index 94bc326..21a69c7 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -81,6 +81,7 @@ python () {
>       clsextend.map_depends_variable("DEPENDS")
>       clsextend.map_packagevars()
>       clsextend.map_variable("PROVIDES")
> +    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
>   }
>
> //Hongxu
>
> On 12/03/2013 08:14 PM, Richard Purdie wrote:
>> On Tue, 2013-12-03 at 18:27 +0800, Hongxu Jia wrote:
>>> While compiling nativesdk-mtools, there was failure:
>>> ...
>>> Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
>>> ...
>>>
>>> Using nativesdk override with the PACKAGES_DYNAMIC statement fixed
>>> this issue.
>>>
>>> [YOCTO #5623]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/recipes-core/eglibc/eglibc-locale.inc | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>> No.
>>
>> lib/oe/classextend.py has a map_regexp_variable() function which is
>> called from classes/multilib.bbclass:
>>
>> clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
>>
>> Perhaps such a line should be added to nativesdk.bbclass to fix this
>> properly instead?
>>
>> Cheers,
>>
>> Richard
>>
>>> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc
>>> b/meta/recipes-core/eglibc/eglibc-locale.inc
>>> index 83569da..5e256a5 100644
>>> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
>>> @@ -35,6 +35,12 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
>>>                       ^eglibc-gconv-.* ^eglibc-charmap-.*
>>> ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
>>>                       ^glibc-gconv-.*  ^glibc-charmap-.*
>>> ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
>>> +PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-locale-base-.* \
>>> +                    ^nativesdk-eglibc-gconv-.*
>>> ^nativesdk-eglibc-charmap-.* \
>>> +                    ^nativesdk-eglibc-localedata-.*
>>> ^nativesdk-eglibc-binary-localedata-.* \
>>> +                    ^nativesdk-glibc-gconv-.*
>>> ^nativesdk-glibc-charmap-.*  \
>>> +                    ^nativesdk-glibc-localedata-.*
>>> ^nativesdk-glibc-binary-localedata-.*"
>>> +
>>>   # Create a eglibc-binaries package
>>>   ALLOW_EMPTY_${BPN}-binaries = "1"
>>>   PACKAGES += "${BPN}-binaries"
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


