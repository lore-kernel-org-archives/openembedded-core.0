Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD13360124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:09:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0E79oWp007109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 23:09:50 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 23:09:49 -0800
Message-ID: <56974989.6070305@windriver.com>
Date: Thu, 14 Jan 2016 15:08:57 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1449743618.git.hongxu.jia@windriver.com>
	<54cd9261fec878206933940c7b097835d738e3f7.1449743618.git.hongxu.jia@windriver.com>
	<5697460E.8030705@windriver.com>
In-Reply-To: <5697460E.8030705@windriver.com>
Subject: Re: [PATCH 1/1] image/multilib bbclass: install multilib and non-multilib language pkgs for image recipes
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
X-List-Received-Date: Thu, 14 Jan 2016 07:09:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2016 02:54 PM, Robert Yang wrote:
>
>
> On 12/10/2015 06:41 PM, Hongxu Jia wrote:
>> Previously if multilib enabled and IMAGE_LINGUAS is assigned,
>> according to the type of image (multilib or non-multilib),
>> only the mapped language pkgs (multilib or non-multilib)
>> is installed to the image. It caused the other part could
>> not work.
>>
>> Such as qemux86-64, the multilib prefix is lib32, and assign
>> IMAGE_LINGUAS_append = " en-us". For core-image-minimal image,
>> only locale-base-en-us is installed; and for lib32-core-image-
>> minimal image, only lib32-locale-base-en-us is installed.
>> For the core-image-minimal image, it did not support the
>> multilib version app to invoke setlocale(LC_CTYPE, "en_US.UTF-8")
>
> I'm not sure whether this is right or not, if all of the installed
> pkgs are lib32 (or allarch), then 64bit locales should not be installed,
> and also, if all of the installed packages are 64bit, then lib32 locales
> should not be installed.

Got it, as you said, it is not proper to install both of multilib and
non-multilib in this situation. So please drop it.

//Hongxu

>
> // Robert
>
>> in C.
>>
>> Install multilib and non-multilib language pkgs for image
>> recipes could fix it.
>>
>> The fix in image.bbclass is for non-multilib image recipes
>> (such as core-image-minimal); the fix in multilib.bbclass
>> is for multilib image (such as lib32-core-image-minimal)
>>
>> [YOCTO #8784]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/image.bbclass    | 20 +++++++++++++++++++-
>>   meta/classes/multilib.bbclass |  9 +++++++++
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index d2f8105..06b4003 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -220,7 +220,25 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
>>   # some default locales
>>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>>
>> -LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, 
>> d.getVar('IMAGE_LINGUAS', True).split()))}"
>> +# Need all non-multilib and multilib of LINGUAS_INSTALL
>> +LINGUAS_INSTALL ?= "${@locale_base_packages(d)}"
>> +def locale_base_packages(d):
>> +    pkgs = []
>> +    imagelinguas = (d.getVar('IMAGE_LINGUAS', True) or "").split()
>> +    mlvars = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
>> +    for lang in imagelinguas:
>> +        # Add non-multilib packages
>> +        pkg = "locale-base-%s" % lang
>> +        if pkg not in pkgs:
>> +            pkgs.append(pkg)
>> +
>> +        for prefix in mlvars:
>> +            # Add multilib packages
>> +            mlpkg = "%s-%s" % (prefix, pkg)
>> +            if mlpkg not in pkgs:
>> +                pkgs.append(mlpkg)
>> +
>> +    return ' '.join(pkgs)
>>
>>   # Prefer image, but use the fallback files for lookups if the image 
>> ones
>>   # aren't yet available.
>> diff --git a/meta/classes/multilib.bbclass 
>> b/meta/classes/multilib.bbclass
>> index 052f911..ec8beb5 100644
>> --- a/meta/classes/multilib.bbclass
>> +++ b/meta/classes/multilib.bbclass
>> @@ -86,8 +86,17 @@ python __anonymous () {
>>
>>       if bb.data.inherits_class('image', d):
>>           clsextend.map_depends_variable("PACKAGE_INSTALL")
>> +
>> +        # Need all non-multilib and multilib of LINGUAS_INSTALL
>> +        linguasinstall =  (d.getVar("LINGUAS_INSTALL", True) or 
>> "").split()
>>           clsextend.map_depends_variable("LINGUAS_INSTALL")
>> +        for lang in linguasinstall:
>> +            if lang not in (d.getVar("LINGUAS_INSTALL", True) or 
>> "").split():
>> +                d.appendVar("LINGUAS_INSTALL", " " + lang)
>>           clsextend.map_depends_variable("RDEPENDS")
>> +        for lang in linguasinstall:
>> +            if lang not in (d.getVar("RDEPENDS", True) or "").split():
>> +                d.appendVar("RDEPENDS", " " + lang)
>>           pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + 
>> d.getVar("PACKAGE_INSTALL", True)
>>           d.setVar("PACKAGE_INSTALL", pinstall)
>>           d.setVar("LINGUAS_INSTALL", "")
>>


