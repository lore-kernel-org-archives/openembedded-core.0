Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Su0XJ-0007A3-SQ
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 14:17:54 +0200
Received: by ggnp4 with SMTP id p4so521846ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RoVzmD7KPct43W9QZ34W/6hm/CIsuK6JfPfN2Ak+/pM=;
	b=kDkY4FjxywUdcMqBh6l/BDtWv+vTxQiuKwZe4SZZ1gLjt3rUcbzHlYeM9rMz1mVe1J
	an3za5ZeOJ5drU8OH5C4jDAkRRkM0CItYlgyEP3ovpEW36tijHhzQpmXvsNCLC/mrM6h
	hKFnUB8Y9JtCd7CRX4sPjarBZVlZsrT3CJa8RzqcPuBZKR4xbeaiTLUKBZRTY5FFNnvT
	sd0SNAaBTQf3k3vid5nGMsVdaE6tmQ8bR91yoDSZcO6wxGvdUZ05ICRD1qKFuhUgwz5S
	Ri1gwMd6lGWRJZYdPoAbupAsukJbpMp5YhvchwBKh2/S4oDcGXj9oHOlBBW1H7dW/5Ey
	3VgA==
MIME-Version: 1.0
Received: by 10.43.52.198 with SMTP id vn6mr23905574icb.42.1343217983865; Wed,
	25 Jul 2012 05:06:23 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 25 Jul 2012 05:06:23 -0700 (PDT)
In-Reply-To: <20120720231539.GB3576@jama.jama.net>
References: <20120718133146.0C2B910217@opal>
	<20120720231539.GB3576@jama.jama.net>
Date: Wed, 25 Jul 2012 14:06:23 +0200
Message-ID: <CALbNGRSkEhgOeEE1EZ05riyxB+mLQLvwfGNuNNdCTWZhKZ0KCg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : webkit-gtk: remove no-parallel bodge
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
X-List-Received-Date: Wed, 25 Jul 2012 12:17:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 21, 2012 at 1:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> This workaround was originally for GNU Make 3.82 which upstream was blaming
>> for a parallel build failure.  Since then I've changed numerous variables
>> and now parallel builds are working with 3.82 (and succeed in 20 minutes
>> instead of 2 hours).
>>
>> Revert the change until we've more data about what causes the breakage, then
>> we can bring it back with more finesse.
> Now it failed on one of my builders:
>
> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-ranlib
> .libs/libWebCoreGtk.a
> | mv -f
> Tools/DumpRenderTree/gtk/.deps/Programs_DumpRenderTree-TextInputController.Tpo
> Tools/DumpRenderTree/gtk/.deps/Programs_DumpRenderTree-TextInputController.Po
> | arm-oe-linux-gnueabi-libtool: link: ( cd "TestNetscapePlugin/.libs" &&
> rm -f "libtestnetscapeplugin.la" && ln -s "../libtestnetscapeplugin.la"
> "libtestnetscapeplugin.la"
> )
> | arm-oe-linux-gnueabi-libtool: link: cannot find the library
> `libjavascriptcoregtk-1.0.la' or unhandled argument
> `libjavascriptcoregtk-1.0.la'
> | make[1]: *** [Programs/minidom] Error 1
> | arm-oe-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
> "libWebCoreGtk.la" && ln -s "../libWebCoreGtk.la" "libWebCoreGtk.la" )
>
> GNU Make 3.82
>
> I've built it without PARALLEL_MAKE about 8 times already and this is
> first time it failed.. so the race condition is probably still there.
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
I have tried 3 times (with cleansstate) and got 100% failure - similar
to Martin's:

| arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
`libjavascriptcoregtk-1.0.la' or unhandled argument
`libjavascriptcoregtk-1.0.la'
| make[1]: *** [Programs/unittests/testdomdomwindow] Error 1
| make[1]: *** Waiting for unfinished jobs....
| arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
`libjavascriptcoregtk-1.0.la' or unhandled argument
`libjavascriptcoregtk-1.0.la'
| make[1]: *** [Programs/unittests/testdomdocument] Error 1

I reverted this patch and build is fine.

Andreas


