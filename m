Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A18C103E2EB
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:32:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21576.1773322338286356155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aa7USxZe;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c4a93841so771016f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773322336; x=1773927136; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iam8MOkhbKOcIPkcu4jYVAiDMgdbCrlukuCs2PEhg+o=;
        b=aa7USxZeEk4QBM6OELQSEpRzhBFpkQNLChHXcIQh5d4XzYrKX4shrc0wtcsOjtCa77
         O9+8qqdc160FW8MKQJL0vCBd7QWYHbfqOleHqJOAWGzZsvEcTUXNqcL8t3JQdL9l6JdA
         PXv+4M2TjVT3Lrnx6DM33IL/N7Q3tuIggRSJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322336; x=1773927136;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iam8MOkhbKOcIPkcu4jYVAiDMgdbCrlukuCs2PEhg+o=;
        b=rGHxvPU9g1+zTJfTGOQEEqgI8z8a1sS/HAcdaMx9Hw+Kwnjp9FUKv5Rbtm5z9y/puX
         RpuAARb8DQWudt4+KKy+DjOB+/4kxxaI3kZRLVId+BgVAsNUrKDgoneeCqF2NWr8vhKj
         RFlhmj5HcNx1mpsx1qX1O0rN6dSmYw1IrONG+8xh6wf69A2LbORJeMYqM2LT1mPZDacc
         Qc8ChkVeo1CbuJmY0IDOPzPvjRozdgjHfuLYHH6SOvtthHaXa57Ezeo3Ulg1DMuNj8Ec
         EJV0zdZhGn6cIlF/DlAUCLs7pGmoOtMTYXB8YLxf3AgFTrFPqWD1dkXhUa3dSnxs9M5W
         2EJg==
X-Forwarded-Encrypted: i=1; AJvYcCXX4NRcutn7Jk7JIh8AeBXcvhpdZ/STo5l4ksDCJVTesrEO5UTi6snWNzTvJMgpzeiSbWVkGzVOg9JI5vRQNg/kQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YymKEOy2y3iyOwxyIleWnbSH3/udQQ2sAqEMHnjglRvjQ9WCqIb
	xd/zfwkj8smGNSAm6y+oRZLeaif4foi1mReHmBKD3NSkDqmPNRVT8OGjQScZLN9JyEM=
X-Gm-Gg: ATEYQzxKUVdkqTrM67dpOpm7WYlMlZKtI/OrHxz/4gE56YAc4t6gEfAI4b6EDl+DimO
	wYs/cR0NJPebNVIZdfEIATlbo31CDu/OUtCVBsu4aXjthb43/SHItdetEBRIGB8BLhRL8kXyE7P
	13ZfzaY7rUBGPS1whcQpB0g3Bq8r7t1uEHGhgIpD26MpFFg5sxNznZeHjWRy/pQZaGPF5w0Ch8r
	CCQOX2luRYxm5KkNlVkA7x9UGC2aHAh4LsdQIdan+vFtSQkXOJ3styIvru0r/uyVV4NWGgrhE8V
	QSryMk88xaMC0wD1hvUI+e24KCSNGVVN2BdwFh1fCUXhMakGxuYZSNOet/343yxDzKT6XqtWeWo
	xtcR6s+0ewcZjRXhKYf3wILgvxqI5WnNt9UXFr2IcOwizz/NXTIWip/VL2gO5fvvln/dha5ikQh
	IPJitF7NQe0BCGMVLmuD7gLDuIQ2zpqbNuRa9whqbHUQYih5rltvCNC/11gVtOuZJ7L0MSEv784
	rNueonxr1r9hpI=
X-Received: by 2002:a05:600d:6401:20b0:485:4f20:1335 with SMTP id 5b1f17b1804b1-4854f201384mr48448265e9.6.1773322336398;
        Thu, 12 Mar 2026 06:32:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5416bsm108950965e9.1.2026.03.12.06.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 06:32:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 14:32:15 +0100
Message-Id: <DH0UAYG0BSHQ.1ZJE32LWQ4ECN@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Viral Chavda (vchavda)" <vchavda@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "deeratho@cisco.com"
 <deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: Inquiry Regarding Package Upgrade Approach vs. Manual CVE Fixes
 in LTS Releases
X-Mailer: aerc 0.20.0
References: <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com> <AS1PR10MB56975F5D6969FA7DA67B247DFD44A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56975F5D6969FA7DA67B247DFD44A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232953

On Thu Mar 12, 2026 at 9:58 AM CET, Peter Marko wrote:
> Hello Deepak,
> this was during last couple weeks and the decision is here:
> https://lists.openembedded.org/g/openembedded-core/message/232562
>
> Yoann,
> It would be great if Yocto project would document this decision under fol=
lowing page:
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
> I'm not sure who can do that.

I will.

FYI, we are in the process of migrating this info to
docs.yoctoproject.org.  I initially planed to add this info there but
since it is needed now, I might as well add it in the wiki.

>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Deepak Rathore via
>> lists.openembedded.org
>> Sent: Thursday, March 12, 2026 9:46
>> To: openembedded-core@lists.openembedded.org; Yoann Congal
>> <yoann.congal@smile.fr>
>> Cc: Viral Chavda (vchavda) <vchavda@cisco.com>
>> Subject: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual=
 CVE
>> Fixes in LTS Releases
>>=20
>> Hi Yoann,
>> I hope you are doing well.
>> I am currently working for Cisco where our team focuses primarily on:
>>=20
>> *	CVE fixing for OSS packages
>> *	Package upgrades
>> *	LTP execution and validation
>> *
>> 	Package testing
>>=20
>> As part of our work, we also submit CVE fix patches to the community fro=
m time
>> to time whenever new vulnerabilities are reported.
>> I am reaching out to understand more about the list of packages that the
>> OpenEmbedded community prefers to upgrade directly instead of applying
>> manual CVE backport fixes within LTS releases. Having this information w=
ould help
>> us align our internal workflows with the community strategy and avoid an=
y
>> duplication of effort.
>> Could you please share the details or point me to the relevant documenta=
tion or
>> list that outlines this package-upgrade policy for LTS?

The policy for patch acceptance on stable is mostly documented here:
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_=
Acceptance_Policies

As stated, "General version upgrades" are unacceptable but there is an
exception for "Changes to follow an upstream stable series or LTS that
aligns with the original release (based on compatibility)". The upstream
upgrade will, then, have to follow the same rules as our stable
branches:
* Security and CVE fixes
* Fixes for bugs
* No feature addition

From my point of view, the list of recipe cited in [0] are an
application of this exception.

[0]: Re: Recipes which should always be upgraded on stable branches
     https://lists.openembedded.org/g/openembedded-core/message/232562

In case that helps to make it more clear, here are example of recent
upgrades on scarthgap that fall into the same exception:
* bind: Upgrade 9.18.41 -> 9.18.44
* mobile-broadband-provider-info: upgrade 20240407 -> 20251101
* glibc: stable 2.39 branch updates
* ffmpeg: upgrade 6.1.3 -> 6.1.4
* ruby: Upgrade 3.3.5 -> 3.3.10

>> Thanks in advance for your support, and please let me know if any additi=
onal
>> information is needed from my side.
>> Best regards,
>> Deepak Rathore

Regards,
--=20
Yoann Congal
Smile ECS


