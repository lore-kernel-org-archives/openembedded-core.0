Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D883A71CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:47:47 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f193so20891723oib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=HHZBTaoT5jyu/Ml6R6YjyfI6cmqeggOaNIWfg3fZ//g=;
	b=mUsmK65Axt0fKq886FWJqkoetspMQrxPpBnrX/Ip36gsTqDQkUTxnIRGX83eNgciXO
	waI+5kiYufmG0l3zHdLuLOpebpXOZvb8LZaWLUuf5Lu2h5ZFgN2/YWys6LGalyaPu1tY
	zR/rcztz+Ce4LdmdYNkzPiM6FBuWivk9LO8oJwd3ZDnICDfB4GMkEYZ9GwT4Fyk4e1pD
	pVOUN6XsBM5mLilqUnAHeyYkBmhOiUT8EfMXcfh5qqaz86b/w4byLwS0mCMyQz5n3g1P
	WCYnZayqFiibuYDrzxzLAcWEdcEpDXAtYeA3WVMvnLrNVlIgIZdj8r3VE4917Cb5hqA/
	l/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=HHZBTaoT5jyu/Ml6R6YjyfI6cmqeggOaNIWfg3fZ//g=;
	b=ndLFCHgM74U+MdhVR/fKIq4gcj5IpvfmygVUCmdy5X6shYLZG2YXRT+k6Sn2iWPgRl
	s1BHkUlbuLPTkzlkkb4vUGigN26l8ttfzZtBQqcl7XsCAFoFxU3IB3VDpV/mw5NizdCD
	9YjbfeZd3HGpgM8ttScPfccfDLbW7eg3ssbJzZhlzx6DiAW3vT698FDS89TSaSymC63T
	NRgOuQoPNeZ5nWM5rZiFfkIU/9XE5+XCsrUILHiU1e6J9laycxsWwWig7y+D8LuNLhdo
	+zX0u/3CscuSOVSh8Q8NKKZRqVtb1CRn94T+wq1BRi7AirpiTesfvCavUZ2S21OsBA5j
	yKuw==
X-Gm-Message-State: AFeK/H21DH7RAKD7NIeMWLj5OQ12BASuDBf288PJUHO2rr2Up7bOEa02G/ggObIgYa1DR4QrCYXdONRX7KSkZQ==
X-Received: by 10.157.80.20 with SMTP id a20mr10612616oth.89.1491241668703;
	Mon, 03 Apr 2017 10:47:48 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.2.34 with HTTP; Mon, 3 Apr 2017 10:47:18 -0700 (PDT)
In-Reply-To: <1491031171.13980.377.camel@linuxfoundation.org>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
	<20170324203858.27464-2-alistair.francis@xilinx.com>
	<1491031171.13980.377.camel@linuxfoundation.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 3 Apr 2017 10:47:18 -0700
X-Google-Sender-Auth: 8yoXQ79VeD4_C74IXXWqUifYRjA
Message-ID: <CAKmqyKNyhpwgi_NcCxpCYO8K9Q3BNQTUpbpf=oFLBf5x00abcA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] runqemu: Add a background command option
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
X-List-Received-Date: Mon, 03 Apr 2017 17:47:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 1, 2017 at 12:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-03-24 at 13:38 -0700, Alistair Francis wrote:
>> This allows callers to specify commands that should be run in the
>> background
>> while running QEMU. This can be specified by assigning the commands
>> to the
>> 'QB_BACKGROUND_COMMAND' varialbe in the machine conf.
>>
>> This is useful for starting automated debugging instances, automated
>> testing instances (using QMP) or other servers/clients that QEMU can
>> connect to.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  scripts/runqemu | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index f76d976..b5cc56a 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -1118,6 +1118,13 @@ class BaseConfig(object):
>>                  kernel_opts += " -dtb %s" % self.dtb
>>          else:
>>              kernel_opts = ""
>> +        background_cmd = self.get('QB_BACKGROUND_COMMAND')
>> +
>> +        if background_cmd:
>> +            logger.info('Running in the background %s' %
>> background_cmd)
>> +            if subprocess.call(background_cmd + ' &', shell=True) !=
>> 0:
>> +                raise Exception('Failed to run %s' % cmd)
>> +
>
> I have to admit I'm rather unsure about this. What cleans up this
> process when runqemu finishes?

True, there is nothing cleaning up after the process. The assumption
is that whatever is being run is tied to QEMU somehow and exits when
QEMU exits.

>
> We tend to run into a lot of issues around cleanup and a subprocess
> using "&" doesn't sound too attractive given the general issues we run
> into.

Do you have another option that you would prefer? I'm happy to change
it to something else.

Would it be better if we kept track of the PID and killed the process
before exit?

Thanks,

Alistair

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

