Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A1AC976104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 20:55:54 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so46784173wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 13:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=canZEAZlWu+jVVwWbs3On5x9J2nFV0zTbZsCxdvppMk=;
	b=Y2b70r6AFyab/wZq3vobZ1ACVO90DiRXvEDs2gVlSCNq9y9ZUAfsTtELqjB/5ePrph
	gGufq0f7GZSGYIM0Z+nzt0jutXI3OHS8SImYN2NfNJ8V/4Dy85fedJfQCFxivl3meWXD
	/yxvcROgl3bXOWtbBOUMx0/aR9ba8ByCm6U8U0Z2FCzwUvaJ6XTTJ/farqUHcssbxKzb
	14fRc9786seP9euh7w03oHhhhpy93a5fpUt4tlUAlxHyibfX3zdoBBWqYrveP+KnxiSw
	vnC7OWoq+uhtwxyoGq2FMiWTmzORCvIwZVaSGCvfyLVH8qIKAUciI2L9GGwBcdVQmZC9
	Dogg==
MIME-Version: 1.0
X-Received: by 10.194.23.2 with SMTP id i2mr6489731wjf.106.1445374554112; Tue,
	20 Oct 2015 13:55:54 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Tue, 20 Oct 2015 13:55:54 -0700 (PDT)
In-Reply-To: <1445332598.17974.142.camel@linuxfoundation.org>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
	<1445281177-3309-5-git-send-email-armccurdy@gmail.com>
	<1445332598.17974.142.camel@linuxfoundation.org>
Date: Tue, 20 Oct 2015 13:55:54 -0700
Message-ID: <CAJ86T=VpnYinWT8oU_j9EayUzhor13y74DuRA+5zV=824yxmBg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
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
X-List-Received-Date: Tue, 20 Oct 2015 20:55:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 20, 2015 at 2:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-10-19 at 11:59 -0700, Andre McCurdy wrote:
>> Use 'atom' as an alias for the first generation Intel Atom CPUs.
>> ---
>>  meta/conf/machine/include/tune-atom.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
>> index 5e1bb74..24cd676 100644
>> --- a/meta/conf/machine/include/tune-atom.inc
>> +++ b/meta/conf/machine/include/tune-atom.inc
>> @@ -1,2 +1,2 @@
>> -# Atom tunings are the same as core2 for now...
>> -require conf/machine/include/tune-core2.inc
>> +# Alias for the first generation of Intel Atom CPUs.
>> +require conf/machine/include/tune-bonnell.inc
>
> This is actually pretty nasty to anyone who uses package feeds or
> packages since all of a sudden, the system rebuilds with a completely
> different package architecture. Not sure we can take this change for
> that reason.

OK. I was thinking the comment in tune-atom.inc "Atom tunings are the
same as core2 FOR NOW..." gave people fair warning that tune-atom.inc
might not remain an alias for tune-core2.inc forever, but no problem
to drop this patch.

Another approach might be to drop tune-atom.inc altogether. Atom is
now ambiguous in terms of defining a CPU architecture and it hasn't
been a documented gcc x86 tuning option since gcc 4.8

  https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options
  https://gcc.gnu.org/onlinedocs/gcc-4.9.3/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options
  https://gcc.gnu.org/onlinedocs/gcc-5.2.0/gcc/x86-Options.html#x86-Options

> I'd also like to understand how much of a difference these specific
> tunes actually give. I know the Intel people have been trying to focus
> on a smaller number of tunes that work well on the majority of platforms
> rather than micro optimising the tunes.
>
> Are there some benchmark numbers or other analysis which shows these
> tunes as being more effective?

Not that I'm aware of. My own tests suggest that the benefits of
bonnell -vs- core2 tuning on a first generation Atom are pretty
unspectacular (maybe ~0 to 5 % performance increase and ~5% increase
in code size). I don't have a Silvermont board. This patch set was
more about enabling further experiments though, so if solid benchmark
improvements are a prerequisite then this patch set isn't ready to
merge.

>
> Cheers,
>
> Richard
>
>
>

