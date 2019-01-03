Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 246AA79F39;
	Thu,  3 Jan 2019 22:02:07 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id k12so38532106qtf.7;
	Thu, 03 Jan 2019 14:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=UKC7/hVLoLid7jbPTHjVBXuZIAPTIr5FMrfog+UcSt8=;
	b=m0aAN0pVeNQpKfkwLaqTGHhw+GvYvnswtlBvCrMvjK/ldcNuwvmSYp8lPkJ4CHAEOQ
	dkrHNulTTMLr15scyH7BlUdoIyYeNEBp350gw2GTrM8Zkvn/K8ZGnGYxaZTL1B32HBoj
	UcWo2DbNEoRKZRV+6bEWvCPVxwBr8IR/W3sN+8iJpc55bKJkqVKw9zp+OEnSE9FlhxlE
	op5nyR973KUSTDnbVVJN9mVMpFzujVJurOcWVNA43XebQ6rrg5OptLF0EDsnfAHPSTNr
	onnBgV5CIkrOJ9djtbosHEQsqQuXMlVGxyAxdDgEQsS5+95K931PUaHrPLA5RC9NZ2ks
	6ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UKC7/hVLoLid7jbPTHjVBXuZIAPTIr5FMrfog+UcSt8=;
	b=Cs7nr8DgpZnU34j4SZdutF5M13jP5g0U0QUyGGkzpguXx3BEGYUesIOuw9HD87wfeG
	hXZvH+omITi1CByPblbFANfkLYV7pPOE4fGjFcWHYU1iDU+TF1bcgHYns8FX5xy41btB
	YB1MIJFNjLTcaUohXerlFh2+l3GVxoKNC6D+7PE4zzKm2UaMoI6ehYkIHxyZxeuzJafx
	pI2yo4X2P3j4+DJoMT38RvceXy69emQrkgmKotasjvAH3koHTwQIW/t4PdK6EspOnaFA
	Cg3VQ30vS8XFBWfvNimPsTY+OffIa+7AviIe83AQeYKl0ymKAb90PrOMjCr9KxkZXiMP
	BGsw==
X-Gm-Message-State: AJcUukdZ6/u33D1eoJKgyAVtvWxIwBwRHwgsKpdOLlEHFIErtusBlqD3
	uXEcxJ8ylYwlgXHzstTNZjWWq8og6NfzEK8SJpg64O/ah9k=
X-Google-Smtp-Source: AFSGD/XSBMxKhwDeUeDNgwCmpwRfiNfdccDGwTQ4a3InB+3dktQE5vFCJvcNZpRMPirGW3gZwsvmJCsxDk6Y6XF5i+w=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr47642289qtf.196.1546552928200;
	Thu, 03 Jan 2019 14:02:08 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 14:01:42 -0800
Message-ID: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Dropping armv5 and armv5e tunes in 2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 22:02:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hello All

You might have noticed a recent commit in gcc trunk

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b232e6b58e3766bc66fe08fdb7bcba1bdadda8a2

Which removed support for deprecated -march=armv5 and armv5e, this
will be released along with gcc-9 release which is upcoming and we
might be able to add gcc9 to 2.7 release or 2.8 release for sure.

We still have non-thumb tunes for armv5 and armv4 in our tune pack, I
would like to propose a patch to remove them.

Secondly, I would also like to drop armv4t, and keep armv5te as lowest
supported tune, I know some of us do have machines using armv4t, if
you still maintain them and have need to keep armv4t going, please
chime into this thread.

I have also already posted a related patch here

https://patchwork.openembedded.org/patch/157529/

which uses 't' variants for -mtune explicitly for armv4 and armv5 tunes.

I will prepare patches if there is agreement here, and a no reply is
deemed to be 'yes' :)

Thanks
-Khem

