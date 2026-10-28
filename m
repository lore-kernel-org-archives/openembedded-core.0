Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62.1793203093629076092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=VzQDvzp8;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=X0CwMT/r;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793203090; x=1793807890;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=kesxBd/LvLnn5Mfg8f3PieUVGELOHUR2ckNeKnY9S2A=;
	b=VzQDvzp8v1QGmWB2npp9qRBhqM7UdCURg57gdjAtOmMZbUZfQ0mxWprnNB+iLiM4i2BFsJORnWV+O
	 evO9oAn2l285NBduylvvy7MfwDF+z1nBsa7aGGE9SjRJAdkEf3EQ1K8nFNepkypYHcITEKO+CEiu90
	 4zK7ZZZ3xUp2/9e3PoBHOfzpEGictna677+ABTCFM2PlLysY531/p0GJVP30HuiGEQEcXUJyJhEQHO
	 CuqF/1QmUrGvC+OEjqtuSrBrpwIcz+5KYGGYBVmaACSumWnC8Kf7VY9EnursbukGpeTiqWJXPSepnB
	 FpPpEHWRSchJWjmp7psmT89bOgz0Kaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793203090; x=1793807890;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=kesxBd/LvLnn5Mfg8f3PieUVGELOHUR2ckNeKnY9S2A=;
	b=X0CwMT/rX+xmcMxUORfOL7633SFfUwtDBvxkUgoeGJYqra+xn6KfjDq1vqAb8+CUKMRo1NvSeAZPa
	 TGz24dqBA==
X-HalOne-ID: 5edc8b63-d2e8-11f1-9241-4f0685a3b9ef
Received: from [IPV6:2a02:3102:8c10:1ae0:c98b:5300:3c35:71e4] (dynamic-2a02-3102-8c10-1ae0-c98b-5300-3c35-71e4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:c98b:5300:3c35:71e4])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 5edc8b63-d2e8-11f1-9241-4f0685a3b9ef;
	Wed, 28 Oct 2026 15:58:10 +0000 (UTC)
Message-ID: <021d92db-a77d-4cd4-aa41-73cb43ed3bfe@embetrix.com>
Date: Wed, 28 Oct 2026 16:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH v2] pkcs11-provider: import version 1.3.0 from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, jlu@pengutronix.de
References: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
 <CANNYZj__g7pMtjyu-yBj1aOtTkRPqfy7kTPWsL4yPo_jwyb4Dg@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
In-Reply-To: <CANNYZj__g7pMtjyu-yBj1aOtTkRPqfy7kTPWsL4yPo_jwyb4Dg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248826
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi,


On 10/28/26 16:46, Alexander Kanavin wrote:
> On Wed, 28 Oct 2026 at 10:49, Ayoub Zaki via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <ayoub.zaki=embetrix.com@lists.openembedded.org 
> <mailto:embetrix.com@lists.openembedded.org>> wrote:
> 
>     OpenSSL 4.x removed the ENGINE API. Add pkcs11-provider to OE-Core
>     to support token-backed keys for target applications and native signing
>     tools without requiring meta-oe. Token drivers and provider activation
>     remain product-specific.
> 
> 
> I would note that meta-oe contains a signing.bbclass, which presumably 
> offers a better more and standard way to handle signing in Yocto than 
> just setting custom, recipe- (or layer-) specific variables in 
> local.conf, and generating disk keys with custom shell scripts.
> 
> If you want to add a recipe to oe-core, you need have consumers for the 
> recipe, or explain how is it supposed to be used.  Let's say I built 
> this recipe, what then?

The primary motivation is OpenSSL 4 removing the ENGINE API rather than 
avoiding a meta-oe dependency!

PKCS#11-backed signing now needs the provider-based integration.
There is already a concrete consumer in OE-Core:

U-Boot’s OpenSSL fit signing Provider API patch:

https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch



> 
> Should we import the signing class as well?  Maybe we need softhsm in 
> oe-core too? Should we have tests and documentation for all of this? I 
> lean towards yes, because secure boot is becoming increasingly 
> important, and yocto's support for it is fragmented and vendor-specific, 
> but doing this right does require quite a bit more work than just 
> copying the recipe from one layer into another.
> 

that would be a nice addition later on.

> In other words, the justification should be more than just "I don't want 
> meta-oe in dependencies".

and this recipe supplies a missing component


Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant
