Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9A67701C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 21:59:33 +0000 (UTC)
Received: by iow1 with SMTP id 1so122836235iow.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zuwtmBeNxAnV18qqijcsxISmcMMOvFckfKp9ZPIMQq0=;
	b=BQ0XTNjbpSUMzMy+ffUfEm12KflldRyN68ivsCpA+eF6W401RQChWcR6Zh1PTyJyKf
	dC549JObaRAGnos/Td4noAJXqRFbmNsmgaYfhaJW9Z3RB6MaXeAy+8DFwo6gOHVDLtiR
	IrwMxQ1MR8ir+3ftPl8gLY5hORLZFGKE1DSZvsHE89wZQnACE7bkQyOgl7unj3Oc3pz8
	Ka1kmePs0mwXIMP+uwH2GGGYBtP/Mjcm8j3tM2Fc6r0RuuvsXhQszp5UweM4afUBE+2X
	Ljk6hgvbocB0ZKkZr73yMp4vww2TG2ex7j9FzuhoDaYmC6IGpWX1fyA+aumQAkHweK4p
	c3OQ==
X-Received: by 10.107.137.106 with SMTP id l103mr20425948iod.112.1444514373661;
	Sat, 10 Oct 2015 14:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sat, 10 Oct 2015 14:59:04 -0700 (PDT)
In-Reply-To: <56198707.8@igalia.com>
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
	<CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
	<56198707.8@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Oct 2015 14:59:04 -0700
Message-ID: <CAMKF1sr2iE=Us2d8CRF5oh3RqQv+OhoHOu3VPbf4K0C1wxcp1w@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sat, 10 Oct 2015 21:59:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 10, 2015 at 2:45 PM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 10/10/15 17:32, Martin Jansa wrote:
>> Did you enable thumb in that build? It's not enabled by default.
>>
>> ARM_INSTRUCTION_SET is for recipes to use arm when distro selects thumb by
>> default.
>
> I assumed it was enabled by default if it was listed on the list printed
> on TUNE_FEATURES when starting bitbake. Seems not.
>
> I manually enabled it on the recipe of webkitgtk+ by setting
> 'ARM_INSTRUCTION_SET = "thumb"' and I was able to reproduce the build
> failure.
>
> However, later I tried doing the same for a standard armv7a machine and
> it built fine.
>
> qemuarm is arvm6 with thumb1, and any armv7 or newer machine will prefer
> thumb2 instead. The compiler would automatically use thumb2 when
> enabling -mthumb on a armv7 or newer march.
>
> So, it built fine with -march=armv7-a -mthumb

that will use thumb2 ISA and its not same as thumb1 that Martin is seeing.

>
> Given that most people building webkitgtk+ will use armv7 or newer, I
> don't think disabling the possibility of building webkitgtk+ with thumb
> (thumb2) unconditionally is a good idea.
>
> I also tested to build gcr and libsecret. Both build also fine with
> -mthumb on armv7.
>
>
> So, could we set ARM_INSTRUCTION_SET=arm only for armv6 or older
> machines in this 3 recipes?

I think that should be fine. Although we don't have a single check for this
one needs to check for armv5 and armv4 and its family of sub-arches

>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

