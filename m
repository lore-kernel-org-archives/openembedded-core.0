Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id CFEA960E68
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jun 2014 19:50:34 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id bj1so20166pad.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jun 2014 12:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kONfDIix56bU5XQzkvOHtNuZqGFpa+LIK+YPbThXqn4=;
	b=ckO9/6REFNM0qWbbLkq6m6Onf/Bawi46IpIDbIKv6CaJk1E7ydcx8DOHV5675dj2ye
	PrP1wUZDIuTKMSDME5Kxpnh0m5QTxj/dXlBwdPCsiGHweOam8D+pldI+KMnFsOZTfN9m
	L8xtAlOi5OoFv1c+seu+wdnx0+briWdcVDKJ/wWqsH6zojdzbM//yPGpTZiTjJBXMlfP
	7uE+un5O5UDhr8U2kNpXHyR5pqjd4F2GhNvFPQpFz2XBbZyfZakq5BRsz/35Go64Z6G8
	M81eQiLwF7vyjLPb11cKsYs2719NFuAO+0Xc0LcyawVRz4dfkj8ZkLiKtQfAD6VnsLuH
	9ihg==
X-Gm-Message-State: ALoCoQkwMTaxrg/AhETs5tnt6Ewz7R8GVoLxkM+JKwTfiXRN8eCitLfconuWB+FvwyahTK/0hoo9
X-Received: by 10.68.160.163 with SMTP id xl3mr74664pbb.39.1402257035498;
	Sun, 08 Jun 2014 12:50:35 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	sh5sm60147380pbc.21.2014.06.08.12.50.34 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Jun 2014 12:50:34 -0700 (PDT)
Message-ID: <5394BE87.5000804@mvista.com>
Date: Sun, 08 Jun 2014 12:50:31 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 08 Jun 2014 19:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


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
> Do we really want to enable crypt here or make it optional?

Good question.
> If we set ac_cv_search_crypt=no on the EXTRA_OECONF line, then we can 
> remove this floating dependency or make it a PACKAGECONFIG setting
Ok.  let me work on this a bit more.

- Armin

>
> Sau!
>
>>   PROVIDES = "cups14"
>>
>>   SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
>>


