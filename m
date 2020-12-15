Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.1472.1608062048300904379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=e3LqPm/O;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v3] sudo: split into smaller tools package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608062047;
	bh=4KluGkuW8UPfyAVV7MFu5WwZewNH91IttiiYtb9dXHM=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=e3LqPm/OQlJHHpGgq16oAdLwPANDOLEnJh4p8iSfZr08UQRfsRRSLKqA6HEUKxPI0
	 sPCBv+A/yMrR3vPDYqDwcJSLg12jZ7HYuAWbe1qLFsAuGp3SVfvBhJk1Tv/g2i2DrK
	 AvbmLlDraoma5HbEuAj8W+vhZ2TT23Ow2R7xC2EHhJLHZf1CTpA9CKFNAVJJBIpMIh
	 wP/VrLId6ZBtZXruFW/tbJ63vi3y+Z8X0oLxLP3XRCGNim7KYkhL93fxSIWpdNG9If
	 DEj0ZkdS5s8YuCd93BsWGMi+jW//OKf4B/rlHASKe77MsKxZ/cpWpG8x3/mfhvsS23
	 bmmDbnSmYS5+A==
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201215193506.13053-1-okaya@kernel.org>
 <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <8861f46e-fc85-2af4-fb2a-0aed9cb89791@kernel.org>
Date: Tue, 15 Dec 2020 14:54:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/15/2020 2:44 PM, Bruce Ashfield wrote:
>> -FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
> I don't see this maintained in the split of changes below, why was it dropped ?
> 

I'll fix that. I thought ${libdir} would cover it but apparently it does
not.

>>  FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
>>                      ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
>> +
>> +PACKAGES += "${PN}-cvtsudoers"
>> +PACKAGES += "${PN}-sudoreplay"
>> +PACKAGES += "${PN}-visudo"
>> +PACKAGES += "${PN}-sudo"
>> +PACKAGES += "${PN}-lib"
>> +
>> +RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
>> +RDEPENDS_${PN}-sudo = "${PN}-lib"
>> +RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
>> +RDEPENDS_${PN}-visudo = "${PN}-lib"
>> +
>> +PROVIDES += "${PACKAGES}"
>> +RRECOMMENDS_${PN} += "${PACKAGES}"

> This isn't a direct replacement of the existing packaging. If we are
> going to get a series of patches that keep splitting on binaries, they
> shouldn't be like this.
>> For an image or configuration that turns off rrecommends (which is the
> policy for a distro that I have), this is not backwards compatible and
> we are going to get all sorts of runtime issues .. and then be forced
> to update packages lists with this explosion of new splits.

Interesting, I didn't know that RRECOMMENDS can be turned off.
I was hoping to do a non-invasive change for existing users.

> 
> If we do splits like this, something stronger than rrcommends is
> needed, or they simply belong in a layer besides core.

Would RDEPENDS work?

Sinan
