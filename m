Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UJ0lw-000647-B0
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 13:08:36 +0100
Received: by mail-la0-f50.google.com with SMTP id ec20so6940265lab.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=bRRlapLJ4kdRQJj0C3QPbp35BRzmpTXyYsjvU+3pIEI=;
	b=lqVEpJAt/Y7kigYY1EkzVmGF22Xm2HwSjy3wlhzBfn0920xseqPnKdps9aRMmKRAdn
	97wSOg5HwQlwe0BB3eXge1mGsP7AKXcxhFitsN1V+ZI6mCOJm9pwdp5dTB8R7MhNXB7B
	YgXXvz3SDmU4RgSDUQnqU4Wi443fuEAXO/Nne8nq8HJ92IpbD3OvNnC67hFqLROjMZHY
	QTOHA9CcIoHqvaJcUum6q7q/rKC+DXQ14Rq2fepXJQYynNReA7jwRZ38PxNRoz3uLns3
	SkotLQstGD20Ev+BYvKQRLZgY5UHFmPF38vA1Cqjqc+v8BA3stR7NlKPMY7Cm+lvtF6P
	E1Zg==
MIME-Version: 1.0
X-Received: by 10.112.101.230 with SMTP id fj6mr926075lbb.115.1363953102366;
	Fri, 22 Mar 2013 04:51:42 -0700 (PDT)
Received: by 10.114.18.212 with HTTP; Fri, 22 Mar 2013 04:51:42 -0700 (PDT)
In-Reply-To: <20130322091549.GC3219@jama>
References: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
	<13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<20130322091549.GC3219@jama>
Date: Fri, 22 Mar 2013 12:51:42 +0100
Message-ID: <CAC1BbcRfxRkSDfs5g5eWRoHOQYApR0hhuS=rvW_Ryghv0wO50A@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Use u-a for getopt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 12:08:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 March 2013 10:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 22, 2013 at 09:08:34AM +0100, Bernhard Reutner-Fischer wrote:
>> On 20 March 2013 16:09:10 Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * when enable busybox installs getopt to ${base_bindir} and
>> >   util-linux to ${bindir}, so there is no file conflict, but
>> >   because busybox implementation does not support --long used
>>
>> Do you mean that Busybox' getopt does not support long options?
>> If so, enable FEATURE_GETOPT_LONG in busybox instead of this patch?
>
> Having lsb working correctly even when someone has bad busybox defconfig
> is right thing to do, isn't it?

Probably. That aside, --long being rejected smells like a bug.
>
> busybox's getopt supports --longoptions, but util-linux's also supports
> --long alias for that and that's what lsb is using
>
> $ getopt --longoptions
> getopt: option '--longoptions' requires an argument
> Try `getopt --help' for more information.
> $ getopt --long
> getopt: option '--longoptions' requires an argument
> Try `getopt --help' for more information.
>
> busybox (IIRC even with FEATURE_GETOPT_LONG enabled) reports
> getopt: unrecognized option '--long'
> BusyBox v1.20.2 (2013-03-16 17:45:30 PDT) multi-call binary.

That's odd, it seems to work for me?
$ grep GETOPT .config
CONFIG_GETOPT=y
CONFIG_FEATURE_GETOPT_LONG=y
CONFIG_ASH_GETOPTS=y
$ ./busybox getopt --long 2>&1 | head -n2
getopt: option '--longoptions' requires an argument
BusyBox v1.22.0.git (2013-03-22 11:20:17 CET) multi-call binary.

>
> lsb already RDEPENDS on util-linux, changing lsb to use --longoptions
> would be good, but having /bin/getopt and /usr/bin/getopt without u-a
> to select preferred one is bad, that's why I used this solution instead.

Yes, i see what you mean. Still,
a) it should not be required for lsb to RDEPEND on util-linux since
   busybox supposedly should work fine too, iff configured correctly, of course.
b) busybox's getopt --lo (or other substrings of the
-l,--longoptions=LOPT[,...] opt)
   should work correctly.

I'd like to know why you trip b) above.
Do you have CONFIG_FEATURE_GETOPT_LONG set?
If so, what libc are you using?

Thanks,


