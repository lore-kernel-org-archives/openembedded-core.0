Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5A5601A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 12:54:43 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so709439eek.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=JQb/R/Y+/5te0IJ3qHazNWzeYU2CwxMEVbx+MswprkQ=;
	b=to8JjQ7mngTAFz7+hjyKaKSaCQtIS2XIRKH76Gu3Mz4GCKvAV1gihNuE+VfdNTXus+
	7iNXknyX7+UWWmFDnF+q7dVsp1uonbvxeD9d8to7mxo+4e+nWtM1vYxgcyFRo2bn+rFH
	eu0/mDs9l0ce9rQ8j/4hRQaP0e2AeamOC7KTxXq0UrQwI6HbMBOreIBg6Jz6nA9UtyCa
	L615Zi5qaXxY6uW/L0ou4t/utHnd1Plo5SdHNOIUeUGoTghGoo9hKzpzSb9ZLNKQuaY0
	/wcx8HboLa5Z7j+6LVjrIsNDpZs+MmMPJx9AcbtPcips2U0DDKe5KUKfX4w9COvlZmYY
	867Q==
X-Received: by 10.14.69.201 with SMTP id n49mr15471150eed.106.1399467284075;
	Wed, 07 May 2014 05:54:44 -0700 (PDT)
Received: from [192.168.1.149] (p5DCFD17A.dip0.t-ipconnect.de.
	[93.207.209.122])
	by mx.google.com with ESMTPSA id l3sm4018950eeo.43.2014.05.07.05.54.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 05:54:43 -0700 (PDT)
Message-ID: <536A2D11.8000009@gmail.com>
Date: Wed, 07 May 2014 14:54:41 +0200
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <536899F5.1030104@gmail.com>	<20140506205518.GE11339@denix.org>	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>	<5369533B.9010209@windriver.com>	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
	<536957A8.90300@windriver.com>
In-Reply-To: <536957A8.90300@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Wed, 07 May 2014 12:54:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 05/06/2014 11:44 PM, Mark Hatle wrote:
> On 5/6/14, 4:40 PM, Khem Raj wrote:
>>
>> On May 6, 2014 2:25 PM, "Mark Hatle" <mark.hatle@windriver.com
>> <mailto:mark.hatle@windriver.com>> wrote:
>> so they
>> need a hard path to the correct ld.so to get started.
>>
>> isnt this fixed by the installer when it is run
> 
> Yes, it sounds like either he moved the files after the the installer 
> ran, or didn't use the installer at all and just tried to execute them 
> out of the build system.
> 
> (If the installer -was- used, then it's definitely a bug.)


The installer _was_ used, I didn't move any files and used the default 
location /usr/local/oecore-[...]

Thanks for the hints. 

Additional note, in case it was missed: I am using v2013.06 (yocto 1.4 base, Angstrom variant)


I guess the problem is, that the relocation_sdk.py excludes /lib/ and 
32/64 bit variants.

I just 
- re-run the installer with -S
- edited the extracted relocation script commented the lines out:

            #if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
            #    break

- re-run the relocation

Now I see the expected result, matching the "old" toolchain from summer 2013:
# ldd /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/m4 
        linux-vdso.so.1 (0x00007fffe6800000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/../../lib/libc.so.6 (0x00007f86e8110000)
        /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f86e84c0000)

Executing the binary works as well.


Comparing the binaries from the current toolchain with those from the old one skipping the relocation step (extracted toolchain with -R) shows:

Old and working:
# ldd m4 
        linux-vdso.so.1 (0x00007fffb1800000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f50bd210000)
        /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f50bd5c0000)

New and broken:
# ldd m4 
        linux-vdso.so.1 (0x00007fff6c000000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007fefc1de8000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fefc2198000)

/lib64/ obviously doesn't get replaced.

I have no clue how to debug this any further. Not even sure if the problem is more likely related to eglibc packages or somewhere hidden in the general OE build scripts. :/

I will build a v2013.12 version now and check if there is any difference. 

-- 
Björn Krombholz
pironex GmbH -- http://www.pironex.de

