Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A71C6B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 09:34:49 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hr1so6579222wib.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=tOdP2AiBZJYVF2Ifj8FMQZyjHbTT3AorbKLmbB2Osi4=;
	b=ld9Rs1OHwOm9C8p6ELa74rEcj3IRLGvbYQkHKS6h3ajjHqvEHnG3qgj8+33dXu3vlj
	GaGPuEF9QoO7bYIvaL3SOl561/2Dz/keVlIzDsx84TCVwu9ab2GTEvtMWsFXW2pr2BXo
	qtu6r/xxavy54K87A9qcHKZZUv6VYTqMOSX5nNpHN4DN8JBEUnTUfDzPDNlpAXSKP7g1
	i8rng7NrU9teaUKOpwWDLBvYERSjuHmWsfFYGaYkaWU3Fw4/aU9rfqfgqwa2yoLe+UP4
	eyT9InCQBbj44yAGmKrC9W+me/K83Js5jp1HocXe1j6XiLoMSMPFGnnvgTmcrF8S3laH
	x0TQ==
X-Gm-Message-State: ALoCoQlR3UHhuWsbSgtDC0hhh4mpUYonCgEAPY74X3cG4o6vYQGtKe8n5pHzM/g39H3NC25HA/Hl
X-Received: by 10.194.60.73 with SMTP id f9mr862402wjr.65.1390469689864;
	Thu, 23 Jan 2014 01:34:49 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ey3sm26204623wib.4.2014.01.23.01.34.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 01:34:49 -0800 (PST)
Message-ID: <52E0E238.9030601@linaro.org>
Date: Thu, 23 Jan 2014 10:34:48 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>	
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted>
In-Reply-To: <1390316993.874.85.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Thu, 23 Jan 2014 09:34:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 04:09 PM, Richard Purdie wrote:
> On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
>> On 01/21/2014 02:57 PM, Richard Purdie wrote:
>>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>>>> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
>>>>
>>>> Original behaviour:
>>>>
>>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>>> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
>>>>
>>>> Behaviour after this patch:
>>>>
>>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>>> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
>>>>
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>>    meta/classes/package.bbclass | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> FWIW this resulted in a failure on minnow:
>>>
>>> http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio
>>>
>>> So we may have some fixing up to do before this change can be merged...
>>
>> I have that QA issue as warning not as error. I guess that's why my
>> builds kept working :)
>>
>> Aside from that, what are your thoughts on this patch?
>
> I'm ok with it in principle but I'd like to see known build issues fixed
> before it goes in since red autobuilders cause me enough grief
> already ;-).

I've changed all occurrences of INHIBIT_PACKAGE_DEBUG_SPLIT to have 
INHIBIT_PACKAGE_STRIP as well in all the layers angstrom has configured. 
I've sent patches to:

meta-intel
meta-initramfs
meta-oe
meta-fsl-arm
meta-android
meta-aurora
meta-linaro-toolchain

Which brings me to my next point:

If you list a mailinglist in your README where you want to have patches 
sent, don't make it automatically reject them. I'm looking at you, 
shr-devel!

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

