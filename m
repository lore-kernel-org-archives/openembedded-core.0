Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web09.9705.1625737420504830302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 02:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=kUmDXfhr;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=IrkEBjI7CLoe6opFg1DijYfQ68fS++H562o4JYcvUts=;
	b=kUmDXfhrC4uvqum0FYcVnj30MQJQGdwxrNEobeadD2CpuVs1+naVjPPYkZB+8ME6M56U2nH8ZGzA4
	 Dohq+3yg2CPW8Po6n9H48Nz1He7jZMDTuS7G3hdHcLqMZo1Ti62nBz6T8h+bMLRYrl02PaDr0aiQqi
	 asvxxUFeBUqqYeJPhHA88dRPmdmvsy61suaMO07fZi9f9rcMsoCxEn5Hgl1Hxt0i4Fx1kYLsYE2OD/
	 kDydIGnTtuXb2V7qccwENmatYJgPepjTaahIzRASqs+fYIY+gB4y6lTzvrU1nauxtIWXYMLqT+VLmk
	 YGJs/qz2aQkGUMK8xoaVBSU77ZUcpQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=IrkEBjI7CLoe6opFg1DijYfQ68fS++H562o4JYcvUts=;
	b=E3JNxnuNjg8W+LzRp3i1auvhvObtrX52CXLyTqpPK8lLPDleQuV7stKB7i2Y6x38fLZQvJKaXONIc
	 JsfK9xaoxHbPM52XPMTvN6CiJOYBSGRdVIUMfDzdgDq91xBjju4wXI1643fBLjiEDqlSnf/9gSroJm
	 RYwoFIYIHb6z8GWlAuBB6mKz8XSrv6sVs/MXJfr75+XpbOMNBJsZ6d0zz0z9blKTMV1xxPuyp9agmA
	 hedxpWsYdBxQtjGO1G7dqac7T2PGioD3h4mm4i9QmZ19j4ZRYFkHvtnxIXktqb5L55hrN62dJu038M
	 KdtsGKsM+Xfq4eEjBeCCqdguIkVIFrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=IrkEBjI7CLoe6opFg1DijYfQ68fS++H562o4JYcvUts=;
	b=pyJGOPLuyBPCdT25cQHgJV6+YkbxziudkQtGLYNFe4vBoA4X7xTyL1w+Bvt9rwlq6MD7cl2OnJwVL
	 PxksC4+DA==
X-HalOne-Cookie: 49b97bcb9dfae20567f59d7419b2d533f1b8650e
X-HalOne-ID: f818f22f-dfd0-11eb-925e-d0431ea8a283
Received: from [192.168.12.21] (h-79-136-99-68.na.cust.bahnhof.se [79.136.99.68])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id f818f22f-dfd0-11eb-925e-d0431ea8a283;
	Thu, 08 Jul 2021 09:43:37 +0000 (UTC)
Subject: Re: [OE-core] [RFC][PATCH] libubootenv: exclude from world build if no u-boot config
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com, otavio@ossystems.com.br
References: <20210706155551.8958-1-peter@berginkonsult.se>
 <54f75f5235de458ba76f53ed6ef77a98092b9da7.camel@linuxfoundation.org>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <a9a36c96-c9e3-c665-28f7-ace236d06603@berginkonsult.se>
Date: Thu, 8 Jul 2021 11:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <54f75f5235de458ba76f53ed6ef77a98092b9da7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2021-07-08 09:07, Richard Purdie wrote:
> On Tue, 2021-07-06 at 17:55 +0200, Peter Bergin wrote:
>> As a fix for failing the world build for targets not using u-boot
>> as boot loader libubootenv is excluded from world builds if
>> both UBOOT_MACHINE and UBOOT_CONFIG variables are empty.
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>   meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
>> index 306296922c..6774290ea5 100644
>> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
>> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
>> @@ -28,3 +28,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
>>   
>>
>>
>>
>>   BBCLASSEXTEND = "native"
>> +
>> +# Exclude this package from world build if there is no config for u-boot
>> +EXCLUDE_FROM_WORLD = "${@'1' if not d.getVar('UBOOT_MACHINE') and not (d.getVar('UBOOT_CONFIG') or '').split() else '0'}"
> To be honest I'm still struggling to understand the problem here.
> (I'm also not sure we need the split() above)
I am also trying to understand the root of this and relate to other 
packages and dependencies in oe-core. Haven't found anything similar 
yet. The closest but not really related constructions is for 
'RDEPENDS_${PN} = "kernel-module-*"'  that (as far as I understand) 
ignored in build process and assumed provided. Otherwise I guess 
constructions similar to this are handled with COMPATIBLE_MACHINE but 
this is not related to MACHINE but to bootloader and we don't have a 
config for that.
> You previously said "If you just want to build libubootenv you should be
> able to do it for any machine, with or without u-boot support as there is
> no build dependency between libubootenv and u-boot." which does make sense
> to me but the above doesn't seem to be much better than the original
> inherit?

llibubootenv can be built for all targets independent of bootloader. If 
libubootenv should be useful on target it should have configuration 
files in filesystem which are produced by u-boot as the source of 
information is there. So for me the general question is how we handle 
the case where package A needs (a config file from) package B to work 
properly on target but package B is not possible to build for this 
configuration?

Agree that it is possibly small improvement with this and still a 
workaround (as inherit uboot-config was). The improvement for 
meta-freescale is to avoid another workaround for this. In 
meta-freescale the variables UBOOT_MACHINE and UBOOT_CONFIG is in some 
cases set per recipe as configuration names for one machine differs 
between forks of u-boot.

>
> Perhaps we should be doing something like:
>
> python () {
>      if d.getVar('UBOOT_MACHINE') or d.getVar('UBOOT_CONFIG'):
>          d.setVar('RRECOMMENDS_${PN}-bin_append_class-target', " u-boot-default-env")
> }
>
> since the recipe is marked as machine specific (which I worry about in
> itself).

The reason for machine specific setting of this package from commit 
(02d55cd35aa) message:

     "...Also add u-boot-default-env to RRECOMMENDS since
     /etc/u-boot-initial-env is being referred in libubootenv source, and
     turns libubootenv's PACKAGE_ARCH to be MACHINE_ARCH since
     u-boot-default-env is a machine-arch package."

So it turns out we make the recipe of libubootenv machine specific 
because we need a config file from another machine specific recipe.

The files /etc/fw_env.config and/etc/u-boot-initial-env is referenced in 
libubbotenv as the default paths to configuration. The programs tries to 
read and parse those files and if not found the programs exit out with 
error code and a clear message to the user. I agree with Otavios comment 
in the other mail thread that RDEPENDS is a too strong dependency 
between libubootenv-bin and u-boot-default-env.

This is probably a small issue and I'm a bit unsure how much more effort 
to spend on this? We should solve the issue with failing world build for 
'non-u-boot' configs caused by my initial revert. Is the way forward to 
make a conditional RDEPENDS as suggested? To keep it simple I would 
suggest to either:

1) removing RDEPENDS
2) change RDEPENDS->RSUGGESTS which seems to fix the build issue

In both cases above I think we can make libubootenv non-machine specific 
again. What do you think?

Best regards,

/Peter

