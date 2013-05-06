Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UZU55-0004Iv-MV
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 00:40:29 +0200
Received: by mail-da0-f42.google.com with SMTP id r6so2021266dad.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 15:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/bpikKwfdEqw0nbLaODOOsJ1UKUvNjeOYd9Hc08WNeE=;
	b=tGNTSRV8agGYa8g4KX6SlE8lruaXTFlvxsuvPmwi9ylTyyOcVeQaMyPnBhxvc7QhAO
	nObYjV63yfzSbaHnjDqGpfYmOFK5aj01M7pBGjl1PmIMDzGiY23dl1jyEoWz2/wOIYM/
	R3WR6J1TlnHVpVKhaUpA6upMmPKruSDvIUxNX/S6myAf7pXcbbI27uvOkXvNJYksz752
	o0pltQDxJJd5nBVL2ifqMDqXD7sBGEx1zJBchg+i8VSdGmY0g/T/oe6dS0B+mFUI3At5
	wFKGG5BZnN6V6P9DjXxb1s1qHIPLaLfKeXp62Y8IClXTCAWieihr+BhwDJwDEQKHhkhf
	hjTg==
X-Received: by 10.68.115.167 with SMTP id jp7mr27572277pbb.145.1367878947053; 
	Mon, 06 May 2013 15:22:27 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ea15sm27380069pad.16.2013.05.06.15.22.24 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 May 2013 15:22:26 -0700 (PDT)
Message-ID: <51882C07.8010105@gmail.com>
Date: Tue, 07 May 2013 08:17:43 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1367843494-16123-1-git-send-email-net147@gmail.com>
	<51881B1C.1090301@linux.intel.com>
In-Reply-To: <51881B1C.1090301@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6] syslinux: Update to 4.06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 22:40:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/05/2013 7:05 AM, Saul Wold wrote:
>
>
> On 05/06/2013 05:31 AM, Jonathan Liu wrote:
>> Patches are now part of upstream or no longer needed.
>> Added new util-linux dependency for isohybrid.
>> Paths updated to reflect directory structure changes.
>>
>> INCDIR isn't used by the build process during compilation which results
>> in the compiler not finding uuid/uuid.h from util-linux when compiling
>> isohybrid unless it exists on the host system. This was fixed by adding
>> -isystem ${STAGING_INCDIR} to CC when calling make.
>>
>
> I am not sure what's changing in all these version since you have not 
> added a changelog.  This version still has trouble with building 
> isohybrid.
>
> I am not sure what you are doing to test this, but I would like to see 
> a more information about how you are building and testing this before 
> I take another version and find it will fail.
>
> I appreciate the work it takes to update a recipe, but we need to get 
> it correct and tested
v1 - Patch malformed by email client
v2 - Added util-linux-native dependency.
Resent patch directly using git send-email
isohybrid.c:39:23: fatal error: uuid/uuid.h: No such file or directory
v3 - Changed util-linux-native dependency to util-linux so ot will work 
when building for target as well.
Recipe finds uuid/uuid.h but from my syslinux installed on my host so it 
appeared everything compiled fine but it didn't.
v4 - Added -I${includedir} to CC when calling make.
This didn't work because includedir is /usr/include when it should point 
to the /usr/include in the sysroot.
v5 - Changed -I${includedir} to -isystem ${includedir}.
Still didn't work because includedir is /usr/include when it should 
point to the /usr/include in the sysroot.
I was changed to -isystem after reading GCC manual. I figured it was 
better for it to search its local source files first because checking 
system include directories like /usr/include.
v6 - Changed -isystem ${includedir} to -isystem ${STAGING_INCDIR}.

Testing:
I am using a custom image based on atom-pc core-image-minimal, with 
.hddimage output.
Tested changes using "bitbake -c cleansstate syslinux syslinux-native; 
bitbake syslinux syslinux-native".
For testing v6, did a clean rebuild of everything, renamed 
/usr/include/uuid.h to /usr/include/uuid.h.bak on my host system and 
tests it:
1. Fails without the patch - ok
2. Succeeds with the patch - ok

Regards,
Jonathan


