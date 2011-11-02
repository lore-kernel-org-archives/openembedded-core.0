Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLPE8-0004yU-ML
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 02:02:48 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:56:30 -0700
Received: by faan26 with SMTP id n26so7405261faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:56:28 -0700 (PDT)
Received: by 10.223.14.140 with SMTP id g12mr4329762faa.34.1320195388674;
	Tue, 01 Nov 2011 17:56:28 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id a26sm2116066fac.2.2011.11.01.17.56.26
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:56:27 -0700 (PDT)
Message-ID: <4EB09538.3010701@intel.com>
Date: Tue, 01 Nov 2011 17:56:24 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319786807-9015-1-git-send-email-msm@freescale.com>
	<4EB08F6B.5080009@intel.com>
	<CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
In-Reply-To: <CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
Subject: Re: [PATCH] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 02 Nov 2011 01:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 05:50 PM, McClintock Matthew-B29882 wrote:
> On Tue, Nov 1, 2011 at 7:31 PM, Saul Wold<saul.wold@intel.com>  wrote:
>>> +# Additional image generation features
>>> +#
>>> +# The following is a list of classes to import to use in the generation
>>> of images
>>> +# currently an example class is image_types_uboot
>>> +# IMAGE_CLASSES ?= "image_types_uboot"
>>> +
>>>   #
>>>   # Runtime testing of images
>>>   #
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index 05f4331..e932879 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -111,7 +111,8 @@ def get_devtable_list(d):
>>>           str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
>>>       return str
>>>
>>> -inherit image_types
>>> +IMAGE_CLASSES = "image_types"
>>> +inherit ${IMAGE_CLASSES}
>>>
>> Does this really work with =, should it not be ?= here?
>
> Ugh. No. This was an attempt to fix this:
>
> +IMAGE_CLASSES ??= ""
> +inherit image_types ${IMAGE_CLASSES}
>
> which gives the following bitbake error:
>
> ERROR: classes/.bbclass is not a BitBake file
> ERROR: Command execution failed: Exited with 1
>
> when IMAGE_CLASSES is left as "". It's trying to inherit a ".bbclass"
> file. There is no good alternative because I have to enforce
> IMAGE_CLASSES is only modified by appending to it. So the only
> solution is to modifed the local.conf.sample to say
>
Right I understood that part from before I think.  But why can't you have

IMAGE_CLASSES ?= "image_types"

and then in the local.conf override that with

IMAGE_CLASSES = "image_types_uboot"

since image_types_uboot inherits image_types.

> IMAGE_CLASSES += "image_types_uboot" and leave the other bit as is...

I have to admit I like this a little better with the possible thought of 
breaking up image_types a little more, keep more used ones in 
image_types, but move lesser used ones to their on .bbclass

Them IMAGE_CLASSES truly is a list of image_type classes.

Sau!


> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



