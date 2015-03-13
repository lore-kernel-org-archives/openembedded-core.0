Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F11473689
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 17:18:03 +0000 (UTC)
Received: by wghn12 with SMTP id n12so24714743wgh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=4P57DLLljbiiETeRNspA/DIGvAOTjy4nG6KW4UvLzIs=;
	b=tHtWPJhKQJ+bmMk6eIC3cigv0aqW3sMvz88d+C58hiy4/wqqVS8Wa5KQt94zSMeGF7
	yAV5yCx6WW5P2woGOLqArUjfBvzRXpmXzLJWOLNouKFeqsONtwyQdv19pA4WsdF2RpaX
	0suiaUKFbfZuEWI/RIgeVnqgSsG7s3YeNe1TOyTfzgX/YfYivNdfWE6ffC0y6PA3yT6t
	PQB6ftUgwpte0N9JaR4rx1SZ/pizQebJ06u7MNR/LYjgi1p+aG9OhUCAM2Q2UPnuLGZ+
	ZvjoDIzlpBLp6Aql0UG0TxYIy/wl8FhSuUIo2bdw03mDqq7AHMisNaeQcAR9wtW1gfxZ
	jwvQ==
X-Received: by 10.180.8.10 with SMTP id n10mr97423015wia.79.1426267084930;
	Fri, 13 Mar 2015 10:18:04 -0700 (PDT)
Received: from [10.58.128.143] (089144212143.atnat0021.highway.a1.net.
	[89.144.212.143])
	by mx.google.com with ESMTPSA id bd1sm3633378wib.13.2015.03.13.10.17.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 10:17:59 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1426262415.9114.212.camel@linuxfoundation.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-4-git-send-email-naresh.bhat@linaro.org>
	<1426262415.9114.212.camel@linuxfoundation.org>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 13 Mar 2015 18:17:51 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Naresh Bhat <naresh.bhat@linaro.org>
Message-ID: <6C32DAB4-4AC9-41E9-8C3A-C787C0DDD05D@gmail.com>
Cc: matt.fleming@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core v1 PATCH 3/5] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Fri, 13 Mar 2015 17:18:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 13, 2015 5:00:15 PM GMT+01:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
>> Build iso image required syslinux package.  We have already skip the
>syslinux
>> package.  Hence just skip the iso image build too.
>> 
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> ---
>>  meta/classes/bootimg.bbclass |    6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/meta/classes/bootimg.bbclass
>b/meta/classes/bootimg.bbclass
>> index ed7b32f..d8c2a59 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -265,7 +265,11 @@ python do_bootimg() {
>>      if d.getVar("EFI", True) == "1":
>>          bb.build.exec_func('build_efi_cfg', d)
>>      bb.build.exec_func('build_hddimg', d)
>> -    bb.build.exec_func('build_iso', d)
>> +
>> +    if d.getVar('TARGET_ARCH', True) == "aarch64":
>> +            return
>> +    else:
>> +            bb.build.exec_func('build_iso', d)
>
>Its minor but the else: here is redundant after a return.

As previously asked, why does this only affect aarch64 and not all not COMPATIBLE_HOST ?
Shouldn't you instead set NOISO to 1 for !COMPATIBLE_HOST ?

Thanks,



