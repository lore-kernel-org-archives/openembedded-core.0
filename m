Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1F05476FD0;
	Fri, 30 Oct 2015 16:21:46 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so81815864pac.3;
	Fri, 30 Oct 2015 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=L1yA8Bekd7244P7rJAiU6jFhaqJvgqniEy9JK/ltW2g=;
	b=qaliF1XPfZWBeQfiiZ+hoaxJ33VRuNC4LgW9ka4al/WEOYX3w82d9rR4+jqpaCbjYs
	QAy0gjZYwLmKdsXMHO3yVhQJUAmuWybRZ3x+Xw8jfSYzD8z64X2+RZhyRTAMtW5gModZ
	2wQ/lvy/7Hm5qieImDhbZgxKhXHOfGDCni8T5buKsDpHTsB5jtJ4Tq4q60fuQrGJdfgs
	J2MbN/ulG3GnvLjV1RFEFwV7W6akz4Lvl4sEElXmA5vOXIq92tLKP21Bl732kpsp+ECR
	eWd0bqaYjrrre/7bn78sSAVwgMS0+FXWnYUu1S3VchJgVLG6vy+FmWS7VViqzsFudc2o
	8crg==
X-Received: by 10.68.243.106 with SMTP id wx10mr9724634pbc.151.1446222105701; 
	Fri, 30 Oct 2015 09:21:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b89f:56e0:63e5:80b9?
	([2601:202:4000:1239:b89f:56e0:63e5:80b9])
	by smtp.googlemail.com with ESMTPSA id
	w8sm8987232pbs.87.2015.10.30.09.21.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 09:21:43 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Martin Jansa <Openembedded-devel@lists.openembedded.org>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5633990D.3090308@gmail.com>
Date: Fri, 30 Oct 2015 09:21:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
Subject: Re: State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Fri, 30 Oct 2015 16:21:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 10/29/2015 08:42 AM, Khem Raj wrote:
> Hi All,
> 
> I would like to get everyone’s opinion on the libcs we maintain in OE-Core, as of now, we have
> 
> glibc + cross localedef + kconfig patches which are left overs from eglibc days
> uclibc - which is more of less unmaintained
> 
> Its a significant effort to keep forward porting the kconfig changes since it touches everywhere in glibc, (I do it in my local glibc tree)
> almost every week there is a commit in upstream glibc which breaks the kconfig patches, I know there are distribution profiles
> like poky-tiny which uses glibc in this capacity, and may be then their are other custom one’s made on top, I would like us to not carry major
> patches which almost makes our component a fork due to obvious maintenance cost. I think there is viable alternatives to tiny libcs in musl now.
> 
> I would like to make a proposal for 2.1 release where
> 
> 1. Drop kconfig support in glibc and we become inline with upstream

Inline with upstream make a lot of sence and will help make maintenance
simpler going forward.

> 2. Move musl support to OE-Core from meta-musl

I see no issue with this.

> 3. Drop uclibc or leave it in current broken state, I would like to pull it out into a layer in meta-openembedded and we can leave the core plumbing as it is in OE-Core
If its not being maintained, then drop by 2.1.

> 4. Poky-tiny switches to use musl

If Poky-tiny is meant to showcase the smallest of the small , then that
make sense.

- armin

> 
> may other disto’s have moved to using musl as system C library e.g. alpine linux, openwrt, and I am also deploying it in  real products
> its pretty mature and well maintained with very healthy community around it. Right now meta-musl is capable of building and running
> core-image-sato/core-image-weston for all supported Qemu arches in OE-Core, the amount of software it can build is no less than uclibc
> support in OE-Core.
> 
> if collectively we think, this is a good move then I can work on all of above items in early phases of 2.1 so we can settle any
> outstanding issues, due to the shuffle especially in poky-tiny
> 
> Thoughts ?
> 
> -Khem
> 
> 
> 

