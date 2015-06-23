Return-Path: <armccurdy@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1A29265C63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 05:01:08 +0000 (UTC)
Received: by lbbvz5 with SMTP id vz5so73142568lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n38nEKlY3WOZ5wKW95288Iu8YC1oGHQuInuyKpd7aPg=;
	b=yFqhBw9F5wd8/4bFRFWkIUHir9XRnolg3Jocm3mUB3vJlEhmHKvnd63w6YD54ODPDM
	G3Z14wYzwkGqEj1pxRQ5jQFYYLgh4rRmHGJPOsfejU6nppUG8uEzLhL3fdhVzXFdA6AL
	OjKcpiSDL06yoeOVgpvtkjetoy7f1WlbpU2eccWh0sPM1FLznRMN/heC44LxBzihF3PU
	IYKAW4NK/gIBZ3ONPCD83UN9g2bOL50XrdmvshL0AMJj8lt8NUZtffo1+is1NPFdrQoE
	SxR7Ze8KxlzsIEJshXvyKvUKFrMSyMtspSJ0nDqUd/UbQrd6hQHHrNU4zns/sBPH6SgR
	Pd+Q==
MIME-Version: 1.0
X-Received: by 10.112.168.102 with SMTP id zv6mr33181379lbb.45.1435035668014; 
	Mon, 22 Jun 2015 22:01:08 -0700 (PDT)
Received: by 10.112.126.166 with HTTP; Mon, 22 Jun 2015 22:01:07 -0700 (PDT)
In-Reply-To: <5585828D.90002@opendreambox.org>
References: <CAJ86T=W1YVmDnA6PfkUDRaGsftRt8+1MhWcN2U-DFUAjzoct5g@mail.gmail.com>
	<5585828D.90002@opendreambox.org>
Date: Mon, 22 Jun 2015 22:01:07 -0700
Message-ID: <CAJ86T=XiGhw9Svv-hDh17ntzdiObyVVvR1nGtnSSQ1SawKkPJA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Incomplete runtime dependencies for gdb python PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Jun 2015 05:01:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi Andreas,

On Sat, Jun 20, 2015 at 8:11 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Hello Andre,
>
> On 20.06.2015 05:00, Andre McCurdy wrote:
>> The runtime dependencies for gdb seem to be incomplete when python
>> support is enabled via gdb's PACKAGECONFIG.
>>
>> gdb ends up with a runtime dependency on libpython, but not on python
>> or any python modules, and gdb then fails to run:
>>
>>   root@7401:~# gdb
>
> just curious, is this a BCM7401?

No, just a coincidence. 7401 is the code name for the box. CPU is
Intel's CE4200.

>>   Could not find platform independent libraries <prefix>
>>   Could not find platform dependent libraries <exec_prefix>
>>   Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>>   ImportError: No module named site
>>
>> Manually installing python and all python modules seems to be a fix,
>> but I haven't narrowed down which specific python modules are
>> required.
>>
>> The issue is a little more serious for anyone using meta-qt5, since
>> meta-qt5 (fido and later) contains a .bbappend for gdb which enables
>> the python PACKAGECONFIG by default:
>>
>>   https://github.com/meta-qt5/meta-qt5/commit/9d17546d56b5e710a6420b482514202236f410e3
>>
>
> Here's a patch for fido that I was going to submit after testing
> with master, whenever that may be.
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/fido&id=5461b4a6db9b9429132952ce31d293550c945179
>
> Feel free to adapt, test and submit.

Yes, that fixes the issue - tested with both fido and master. Thanks!

I'll submit your patch for both branches. Hopefully it can be included
in the next fido update.

> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

