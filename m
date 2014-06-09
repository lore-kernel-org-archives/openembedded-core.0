Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id E1AD065D70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 20:22:50 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so5346077pbb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WWTtyvqxBl7IbcND76Rqpq641RqR5Cai4277fWonFL4=;
	b=YgZxWsOKwGMNC1KOufCCLME2qp2kWdCA3Hmc93fbF9OJBXX3mKs0OSFL2afl3JN8uT
	hwY6+/yoxmYuwH2EL05Cz6xwRlj1Wl0xfXkULAgFQEevLYz1tc9N+WAf1Mz8qxqOKiY7
	uNYRHWw6mU3t1rwwhcVzjMyB3YDjOF26qsL3SJtzdpioPFGRT8d+IoRkWHmJjdde0PiE
	5X1YcHZs4uZfbQVKv7e/woVCUlHzZ0ziQFHHy01lKOZafI9U4UpGpa7GagZMYVbHZTXH
	LlY7iuUT2xJnTZm6zkT74VNqrbNG+UfbKaXdhXrQITFvyU0tBM7MqASO6f7tXnyIvuE6
	bg4g==
X-Received: by 10.66.120.201 with SMTP id le9mr686318pab.98.1402345371529;
	Mon, 09 Jun 2014 13:22:51 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ix7sm65537717pbd.36.2014.06.09.13.22.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Jun 2014 13:22:50 -0700 (PDT)
Message-ID: <53961795.9080703@gmail.com>
Date: Mon, 09 Jun 2014 13:22:45 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1402151406-14527-1-git-send-email-akuster@mvista.com>
	<5393E053.6080006@linux.intel.com>
In-Reply-To: <5393E053.6080006@linux.intel.com>
Subject: Re: [PATCH] cups: Fix build failure
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
X-List-Received-Date: Mon, 09 Jun 2014 20:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Saul,

I found a fix from cups.org to address this. I have back ported the 
patch and will submit a v2  cups patch

thanks,
- Armin

On 06/07/2014 09:02 PM, Saul Wold wrote:
> On 06/07/2014 07:30 AM, Armin Kuster wrote:
>> The follwing error was seen when no crypt dependency was included.
>>
>> In file included from cups-private.h:29:0,
>> |                  from attr.c:26:
>> | http-private.h:83:24: fatal error: gcrypt.h: No such file or directory
>> |  #    include <gcrypt.h>
>> |                         ^
>>
>> Add bcrypt to DEPENDS
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/recipes-extended/cups/cups.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc 
>> b/meta/recipes-extended/cups/cups.inc
>> index fd88552..249eac4 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -1,7 +1,7 @@
>>   SUMMARY = "An Internet printing system for Unix"
>>   SECTION = "console/utils"
>>   LICENSE = "GPLv2 & LGPLv2"
>> -DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
>> +DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb bcrypt"
>
> Do we really want to enable crypt here or make it optional?  If we set 
> ac_cv_search_crypt=no on the EXTRA_OECONF line, then we can remove 
> this floating dependency or make it a PACKAGECONFIG setting
>
> Sau!
>
>>   PROVIDES = "cups14"
>>
>>   SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
>>


