Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3902B65E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:00:54 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 142so7641989ykq.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=D7zj/pRDGSAZV2LGfPc/WjISshxuQzqszuhxLI1rB2I=;
	b=T97RAZ0CAxdtP4wD2bXcI7t2F6mu1cMaPKgbygiHRBVnPJkY3uaSv0DQOdiHq6sQWB
	7D2mL6dHdi4RSHQLnfZr2VpCgoq2+YB3rnzwLWP+sXT6PDjIXE2WmOyVTZdqWz/moiIW
	G5erJQQXGbjFi1b5Tg9NSfrSeMXZ/2pzfDMorOXXl5RZpnlh9sn77N5her9KxNII1x8h
	WlBoGzun7eYLXm0ONULsHVUNZakYfpltm7Cqmnx5e2rOLNpilJ3Fm84GJNvy0OfdykIS
	aPhdP4Vfgv9e81xzsrF+HM+Q9Z8ibPwdtZWUaDCyCD+BnfbD2VjXAgfnaXL+1XEGSFLn
	viOQ==
MIME-Version: 1.0
X-Received: by 10.236.25.105 with SMTP id y69mr78307223yhy.33.1408622455134;
	Thu, 21 Aug 2014 05:00:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 21 Aug 2014 05:00:54 -0700 (PDT)
In-Reply-To: <1408607451.1669.109.camel@ted>
References: <1408047639-18852-1-git-send-email-mario@ossystems.com.br>
	<1408607451.1669.109.camel@ted>
Date: Thu, 21 Aug 2014 09:00:54 -0300
X-Google-Sender-Auth: AlufyoeP2UquKIIXXA50PEP3Sqk
Message-ID: <CAP9ODKozf08WSjOzEoo+bBiBkoTGd=Pg2WLutsySHv3BLNGZeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] libxml2: explicitly disable zlib for native builds
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
X-List-Received-Date: Thu, 21 Aug 2014 12:01:00 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

On Thu, Aug 21, 2014 at 4:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-08-14 at 17:20 -0300, Mario Domenech Goulart wrote:
>> Without this change, meta-openembedded's php recipe (as of 45e62fb8 --
>> "php 5.4.14: use pkg-config for libxml2 detection") breaks with this
>> error on my system:
>>
>>    tmp/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference
>>    to `gzopen64@ZLIB_1.2.3.3'
>>
>> It seems that the host's zlib is leaking into libxml2's build.
>
> It turns out we need a zlib dependency here, else createrepo fails to
> deal with the compressed index files in the rpm repos. With rpm enabled,
> you can reproduce with:
>
> "bitbake package-index"
>
> Unfortunately this error causes a cascade of other problems and caused
> several people hours of work trying to figure out why the autobuilder
> was "exploding".
>
> Basically, the error above triggers a binary character to be emitted
> into the logs. The error reporting tool chokes on this since JSON can't
> handle the character causing an exception deep in the event handling
> code.
>
> That exception is badly handled and causes bitbake to enter an infinite
> loop, spewing traceback data to the console. That in turn creates
> gigabytes of log files and the autobuilder falls over.
>
> So if anyone wonders why we haven't had patches merging, this is why.
> We're now quite behind with the queue.
>
> Obviously there are fixes to make in multiple parts of the system to
> stop this kind of error escalating so badly again.

This was unfortunate indeed :-(

Mario and I tested this is two customers but both use IPK. We didn't
consider testing with RPM.

To fix the issue, can we send a depends for native/nativesdk?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

