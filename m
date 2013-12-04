Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 948CD6D014
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 03:15:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB43FA0T019157
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 19:15:10 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 3 Dec 2013 19:15:09 -0800
Message-ID: <529E9E34.10806@windriver.com>
Date: Wed, 4 Dec 2013 11:15:00 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386066249.git.hongxu.jia@windriver.com>	
	<837855b3a50fc0672000e2419763a8c6ad062ae3.1386066250.git.hongxu.jia@windriver.com>
	<1386072858.4463.42.camel@ted>
In-Reply-To: <1386072858.4463.42.camel@ted>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 04 Dec 2013 03:15:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I have updated this patch as your suggestion, and it works well.

     nativesdk.bbclass: support nativesdk to override with the 
PACKAGES_DYNAMIC statement

     While compiling nativesdk-mtools, there was failure:
     ...
     Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
     ...
     This patch supports nativesdk to override with the PACKAGES_DYNAMIC 
statement

     [YOCTO #5623]
     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 94bc326..21a69c7 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -81,6 +81,7 @@ python () {
      clsextend.map_depends_variable("DEPENDS")
      clsextend.map_packagevars()
      clsextend.map_variable("PROVIDES")
+    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
  }

//Hongxu

On 12/03/2013 08:14 PM, Richard Purdie wrote:
> On Tue, 2013-12-03 at 18:27 +0800, Hongxu Jia wrote:
>> While compiling nativesdk-mtools, there was failure:
>> ...
>> Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
>> ...
>>
>> Using nativesdk override with the PACKAGES_DYNAMIC statement fixed this issue.
>>
>> [YOCTO #5623]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-core/eglibc/eglibc-locale.inc | 6 ++++++
>>   1 file changed, 6 insertions(+)
> No.
>
> lib/oe/classextend.py has a map_regexp_variable() function which is
> called from classes/multilib.bbclass:
>
> clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
>
> Perhaps such a line should be added to nativesdk.bbclass to fix this
> properly instead?
>
> Cheers,
>
> Richard
>
>> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
>> index 83569da..5e256a5 100644
>> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
>> @@ -35,6 +35,12 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
>>                       ^eglibc-gconv-.* ^eglibc-charmap-.* ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
>>                       ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
>>   
>> +PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-locale-base-.* \
>> +                    ^nativesdk-eglibc-gconv-.* ^nativesdk-eglibc-charmap-.* \
>> +                    ^nativesdk-eglibc-localedata-.* ^nativesdk-eglibc-binary-localedata-.* \
>> +                    ^nativesdk-glibc-gconv-.*  ^nativesdk-glibc-charmap-.*  \
>> +                    ^nativesdk-glibc-localedata-.*  ^nativesdk-glibc-binary-localedata-.*"
>> +
>>   # Create a eglibc-binaries package
>>   ALLOW_EMPTY_${BPN}-binaries = "1"
>>   PACKAGES += "${BPN}-binaries"
>


