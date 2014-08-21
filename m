Return-Path: <mario.goulart@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3762F65D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:11:05 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id j15so8063994qaq.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 05:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=nOsKHSM9qcUPQH6GzU575hC9Fdy0a7W8/xJ81idwOPw=;
	b=gJdArHuPniTMMMtSGXVTVB56UYg8vV35aJq5n+XhFwMV3yf/qZxxh0Q8r4pA89aGRO
	a3aHa5u3FiaNh6Y1/rF9Utxs8VtlObTH/2UyleuxKf36Vhct776CbxndA6jplY1indh+
	KdTQo5xPsS6H2cL+fgxFL8I04pZETrmLW8e0D8XRECaZGfAZ75e7nhMuOVFkdPlXQv0C
	XaNoe7gjzyku5y3RXH/41Wyg/zf+/P2fogqoLIcwNyLJSATxVpM3MsdqEB3+YQnViZNV
	mPkOnYIVXje08tGO+eeEEIUZwmKV2OLXAXgKTU6QXFAttrDXKTRcsGFYGeFsFp5BJbyc
	1ArQ==
X-Received: by 10.224.97.66 with SMTP id k2mr87342036qan.21.1408623067019;
	Thu, 21 Aug 2014 05:11:07 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [198.199.72.94])
	by mx.google.com with ESMTPSA id
	a41sm28953926qgf.37.2014.08.21.05.11.05 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Aug 2014 05:11:06 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1408047639-18852-1-git-send-email-mario@ossystems.com.br>
	<1408607451.1669.109.camel@ted>
Date: Thu, 21 Aug 2014 12:11:03 +0000
In-Reply-To: <1408607451.1669.109.camel@ted> (Richard Purdie's message of
	"Thu, 21 Aug 2014 08:50:51 +0100")
Message-ID: <87oave11rc.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 21 Aug 2014 12:11:13 -0000
Content-Type: text/plain

On Thu, 21 Aug 2014 08:50:51 +0100 Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

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

Oh, boy.  I'm really sorry for all the trouble this apparently innocent
patch caused.  Unfortunately we didn't catch this issue here, as we
don't use rpm.

Thanks for all the work you guys have put into handling this issue.

I'll try to come up with a better patch.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

