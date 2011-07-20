Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjbFe-0006lA-SN
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 20:12:07 +0200
Received: by iwn4 with SMTP id 4so422600iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=mhsJFN8yDVHVFsF+szsdfqhxozZ2D2gjimnG+Dx9A74=;
	b=RKgXK+9zdliSGiXyBpSw4I6RJEJJ6h1BM4vRKu21o/erfDFECjTo9ncaYRDYsMAU2A
	89OPp2/WLAYCc58kcmfgu/LZqHQDbmLwG+4zll8W5yLnY7/grHKYFsvIyDm3gXd0ZzwX
	P+uvggOlLjuKpO0xIw+aY/0baqQzYEnkOp+2g=
Received: by 10.231.170.143 with SMTP id d15mr8215945ibz.75.1311185279914;
	Wed, 20 Jul 2011 11:07:59 -0700 (PDT)
Received: from [172.23.10.146] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id x11sm304779ibd.7.2011.07.20.11.07.57
	(version=SSLv3 cipher=OTHER); Wed, 20 Jul 2011 11:07:58 -0700 (PDT)
Message-ID: <4E27197C.8090602@gmail.com>
Date: Wed, 20 Jul 2011 11:07:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311150183.git.sgw@linux.intel.com>	<4fb98dee67ddcdbc35f6e5c203ddb7217cd55a97.1311150183.git.sgw@linux.intel.com>
	<1311156848.30326.58.camel@phil-desktop>
In-Reply-To: <1311156848.30326.58.camel@phil-desktop>
Subject: Re: [PATCH 46/50] mesa-xlib: Dont use locales with uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 18:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 03:14 AM, Phil Blundell wrote:
> On Wed, 2011-07-20 at 01:28 -0700, Saul Wold wrote:
>> +We disable locale on uclibc in OE therefore we do not use it if building for uclibc
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +Upstream-Status: Inappropriate<OE config related>
>> +
>> + {
>> +-#if defined(_GNU_SOURCE)&&  !defined(__CYGWIN__)&&  !defined(__FreeBSD__)
>> ++#if defined(_GNU_SOURCE)&&  !defined(__CYGWIN__)&&  !defined(__FreeBSD__)&&  !defined(__UCLIBC__)
>
> I'm not totally thrilled about having the equivalence between "uclibc"
> and "no locale" patched into random sources in a piecemeal way like
> this.  uClibc doesn't inherently lack locale support, it's just that the
> default oe-core configuration happens to turn it off, and there's no
> reason that another layer mightn't decide to enable it again.  It would
> suck if that layer then had to re-patch all these recipes to take the
> __UCLIBC__ conditional back out.
>
> I think it would be better to replace this sort of thing with an
> autoconf linker test that checks to see whether newlocale() is actually
> available in the installed libc.
>

Well I thought so. Its just lazyness and time :)
I will rework it that way as I did it for other recipe

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



