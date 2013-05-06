Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UZUMV-000688-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 00:58:33 +0200
Received: by mail-pd0-f169.google.com with SMTP id 14so2258001pdc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 15:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DPvQA52LjJvM+ozHs+RAXBwyiI1XA5HfeN5WlwrMQ4M=;
	b=r9dlxKZDXZUUJgOXPe3sLRrorsD9tl5TfYuDfAV+ceqhoWpb1CVjLx0v3zhmn4TXlD
	ZsszjHlP0+hlOtYepTN+nEwW2h07K4vzrKlaMBZnYNDSPV7gGEGiXjjyD0yc663IjPpl
	i9lsiNrNHB3roiAAD72j7WU64w+qtF50h3n38rgn+NGzYbZkDM++h38THBYC+nuGMPuy
	BliM8RyjE6NZrFvCUKYeC5dcS/u1xgc8OgP+aqLuTlfy1zeRSBre3Y2af+c0RKPuym8F
	GcVrv6TVkpthiplFzu+AW5nWshOar4pPdLrWFxEu5gZFUh2X1AnLyM8aFSA6O8OjxszA
	DL/A==
X-Received: by 10.66.12.129 with SMTP id y1mr3844844pab.182.1367880026653;
	Mon, 06 May 2013 15:40:26 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	dr6sm27449306pac.11.2013.05.06.15.40.24 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 May 2013 15:40:25 -0700 (PDT)
Message-ID: <5188303F.6020505@gmail.com>
Date: Tue, 07 May 2013 08:35:43 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1367843494-16123-1-git-send-email-net147@gmail.com>
	<51881B1C.1090301@linux.intel.com> <51882C07.8010105@gmail.com>
In-Reply-To: <51882C07.8010105@gmail.com>
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
X-List-Received-Date: Mon, 06 May 2013 22:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/05/2013 8:17 AM, Jonathan Liu wrote:
> On 7/05/2013 7:05 AM, Saul Wold wrote:
>>
>>
>> On 05/06/2013 05:31 AM, Jonathan Liu wrote:
>>> Patches are now part of upstream or no longer needed.
>>> Added new util-linux dependency for isohybrid.
>>> Paths updated to reflect directory structure changes.
>>>
>>> INCDIR isn't used by the build process during compilation which results
>>> in the compiler not finding uuid/uuid.h from util-linux when compiling
>>> isohybrid unless it exists on the host system. This was fixed by adding
>>> -isystem ${STAGING_INCDIR} to CC when calling make.
>>>
>>
>> I am not sure what's changing in all these version since you have not 
>> added a changelog.  This version still has trouble with building 
>> isohybrid.
>>
>> I am not sure what you are doing to test this, but I would like to 
>> see a more information about how you are building and testing this 
>> before I take another version and find it will fail.
>>
>> I appreciate the work it takes to update a recipe, but we need to get 
>> it correct and tested
> v1 - Patch malformed by email client
> v2 - Added util-linux-native dependency.
> Resent patch directly using git send-email
> isohybrid.c:39:23: fatal error: uuid/uuid.h: No such file or directory
> v3 - Changed util-linux-native dependency to util-linux so ot will 
> work when building for target as well.
> Recipe finds uuid/uuid.h but from my syslinux installed on my host so 
> it appeared everything compiled fine but it didn't.
> v4 - Added -I${includedir} to CC when calling make.
> This didn't work because includedir is /usr/include when it should 
> point to the /usr/include in the sysroot.
> v5 - Changed -I${includedir} to -isystem ${includedir}.
> Still didn't work because includedir is /usr/include when it should 
> point to the /usr/include in the sysroot.
> I was changed to -isystem after reading GCC manual. I figured it was 
> better for it to search its local source files first because checking 
> system include directories like /usr/include.
> v6 - Changed -isystem ${includedir} to -isystem ${STAGING_INCDIR}.
>
> Testing:
> I am using a custom image based on atom-pc core-image-minimal, with 
> .hddimage output.
> Tested changes using "bitbake -c cleansstate syslinux syslinux-native; 
> bitbake syslinux syslinux-native".
> For testing v6, did a clean rebuild of everything, renamed 
> /usr/include/uuid.h to /usr/include/uuid.h.bak on my host system and 
> tests it:
> 1. Fails without the patch - ok
> 2. Succeeds with the patch - ok
I have tested syslinux 4.06 booting with .hddimg on:
-Intel Desktop Board D2500HN (Atom D2500 with NM10 Express Chipset), by 
writing .hddimg to real hard drive with Win32 Disk Imager and connecting 
to the board
-qemu-system-i386
-qemu-system-i386 -nographic

The main reason for me upgrading to 4.06 is that earlier versions fail 
to boot on the D2500HN board more than once. First boot works but 
subsequent boots hang - it just prints SYSLINUX line, does nothing for a 
while and reboots the system. I found mounting the hard drive on a 
Windows system and unmounting it makes it boot again once. I finally got 
it to boot reliably after writing syslinux 4.06 to the hard drive. I 
tested syslinux 4.05 but it still had same booting issue.

Regards,
Jonathan




