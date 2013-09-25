Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 98D9C60EBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 12:24:28 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id c11so5124119lbj.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=R993Qq84Y6nWp8fI9OFc7ImZvRWgcIZEMD+jlNkLszM=;
	b=gC2hN2hsHCevbeB2a0k5nSaTXKzIdLILTKuRldzEduOwt+kDEhS7zzgIE4tDdYrvou
	eUCw+8ej/HNOyfX6nBlhrKihvVYgo4tMlZGzTGk7+LfiFTw/vc/daE2WLVNzNURtVzZR
	TXhN7KzisC3J1onruP965lEF21IrQx9wJX6CIiPHhZhib3OzLcYozhcAJdT6DNBLGwYD
	uCtK/eNLGF7XChQxqGVwDcMoPZ798JyRnlwkhS7HEiWg7zU0JW03b3qOXE9FJwUjYOQl
	5fRZsfJsrR55k++h/iFY0u0udHORqYG+BktvVSumftgC/aXxjMz/kOuqqzSWsn2amGiO
	jKcA==
X-Received: by 10.112.143.3 with SMTP id sa3mr28636773lbb.12.1380111869219;
	Wed, 25 Sep 2013 05:24:29 -0700 (PDT)
Received: from [172.16.141.168] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id b1sm20803371lah.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 25 Sep 2013 05:24:28 -0700 (PDT)
Message-ID: <5242D5F7.1000509@gmail.com>
Date: Wed, 25 Sep 2013 14:24:23 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>		
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>		
	<5240820E.5020407@windriver.com>		
	<CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>		
	<1379970871.18603.265.camel@ted>
	<1380011114.18603.270.camel@ted>	 <5241A215.4020501@gmail.com>
	<1380103400.18603.318.camel@ted>
In-Reply-To: <1380103400.18603.318.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
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
X-List-Received-Date: Wed, 25 Sep 2013 12:24:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/25/2013 12:03 PM, Richard Purdie wrote:
> On Tue, 2013-09-24 at 16:30 +0200, David Nyström wrote:
>> I'm have a question about this though.
>>
>> diff --git a/meta/recipes-extended/shadow/shadow.inc
>> b/meta/recipes-extended/shadow/shadow.inc
>> index 4df5e5e..75b0afc 100644
>> --- a/meta/recipes-extended/shadow/shadow.inc
>> +++ b/meta/recipes-extended/shadow/shadow.inc
>> <snip>
>> +pkg_postinst_${PN} () {
>> +	if [ "x$D" != "x" ]; then
>> +	  rootarg="--root=$D"
>> +	else
>> +	  rootarg=""
>> +	fi
>> +
>> +	pwconv $rootarg
>> +	grpconv $rootarg
>> +}
>> <snip>
>>
>> This will introduce the postinstall hook for both ${BPN}-native and
>> ${BPN} ?. Before the change, the postinstall hook was activated only by
>> ${BPN} afaict. Tried removing it from native* through
>> pkg_postinst_${BPN}, but that does not seem to work.
>
> Basically the postinst is ignored for the -native version. It never gets
> packaged so isn't relevant. Adding in special cases for native for each
> and every recipe would get ugly very quickly.
>

Sorry, bad wording on my end. I was worried about nativesdk 
post/prefuncs beeing added.

<snip>

>> Also, seems like ${sysconfdir} in the nativesdk-opkg postinstall expands to:
>>
>> chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
>> chmod 0755
>> $D/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts
>>
>> Is this really expected behaviour ?
>
> nativesdk postinstalls are probably badly handled at the moment.

I Agree, it would be good with a consistent handling between nativesdk 
and target pre/postinstall hooks.
I'll try to dive into this subject when I have more time.

> I suspect if things can run at rootfs creation time they work out, if they
> can't run then, they never happen at all. We don't have a "first boot"
> of the sdk...
> Cheers,
>
> Richard
>


