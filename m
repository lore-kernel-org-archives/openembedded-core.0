Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Smq60-0003T9-Bb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:44:04 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 05 Jul 2012 10:32:58 -0700
Received: by pbbro8 with SMTP id ro8so12851957pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 10:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=U7dBQZystvFl2kbzEuj6iFAzg2y/ca0cfOSatP7kc/8=;
	b=XBsRjGhc0LfVQwl9Wx8qEwnQGWtW+/kHZa2qHBblWVaTN7BLEnfkmrLsiTvKT3H9YS
	Du4bYdKukd95/jL8B0pTXWcel/UYiu78U6rbpb8MOXbDJlzkvouYeaDhA9ErTqylXL/M
	+bUHihkBxKOPHN+ys6gekXSbbiAVD27NUvPEWVKhJ4DTQ1+mmGhQ13H69W2LDhhn1eDF
	XIuRGpDfZ52EMuVFg6Z/azD91FR6+pRvKCiLx/L8Xne6OnCoZyGdpqXmTxF/tZxwNUUL
	dbdDvySD4FmoJEkcN9Hen1//Um7Zopx8g+u/sdCRqcT1E9VOwxO0w/pn8Qq/1x2lZWZE
	Zqjw==
Received: by 10.68.200.104 with SMTP id jr8mr29886284pbc.9.1341509578137;
	Thu, 05 Jul 2012 10:32:58 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id to1sm20140919pbc.27.2012.07.05.10.32.55
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 10:32:57 -0700 (PDT)
Message-ID: <4FF5CFC2.9090700@intel.com>
Date: Thu, 05 Jul 2012 10:32:50 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
	<alpine.DEB.2.02.1207040615500.23821@oneiric>
	<1341401390.3906.12.camel@ted> <4FF5289C.80107@gmail.com>
	<alpine.DEB.2.02.1207050607040.3303@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207050607040.3303@oneiric>
X-Gm-Message-State: ALoCoQnFBqLvN0Z4irB8zG44B6vClGflEJu9VsaW9DAnBA6sdUtzbNmz0BtX+ofWL+xKBsUhDxlw
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Thu, 05 Jul 2012 17:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 03:14 AM, Robert P. J. Day wrote:
> On Wed, 4 Jul 2012, Khem Raj wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 7/4/2012 4:29 AM, Richard Purdie wrote:
>>>>>>> AFAICT, you can't override an append. Both appends, the
>>>>>>> original and the bbappended, would get executed.
>>>>>
>>>>> ok, now i *definitely* want to know whether this would work or
>>>>> not since there are a few recipes that define both do_install()
>>>>> and do_install_append().
>>> Andreas is correct, you can't override a do_install_append (),
>>> both would just get appended.
>>
>> yes thats true. I was thinking about having appends which are
>> recipe-class specific but that case wont apply to a normal _append
>> like above
>
>    so, in the end. there's really no compelling rationale for a recipe
> defining both a do_install() and do_install_append() back to back, is
> that correct?  because there are a small number of OE recipes that do
> just that:
>
> $ grep -wl do_install $(grep -rlw do_install_append *)
> meta/recipes-support/libcap/libcap.inc
> meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
> meta/recipes-core/tinylogin/tinylogin_1.4.bb
> meta/recipes-core/eglibc/eglibc-package.inc
> meta/recipes-kernel/linux/linux-yocto.inc
> meta/recipes-extended/lsb/lsb_1.4.bb
> meta/recipes-extended/man/man_1.6f.bb
> meta/recipes-extended/logrotate/logrotate_3.8.1.bb
> $
>
>    obviously, it doesn't hurt, it just seems unnecessary.

I wrote the do_install_append() in e2fsprogs, and it was no doubt due to 
the fact that I was moving libraries around in a number of recipes, and 
wanted to logically separate this operation into the _append step in a 
consistent manner. It was just a mindset I was in, and as you point out, 
it wasn't necessary, nor did it do much harm.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




