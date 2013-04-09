Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPWs4-00070C-NU
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 13:38:10 +0200
Received: by mail-oa0-f51.google.com with SMTP id g12so7268002oah.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BMEw22cXnPXNgbYfqv7t+9LV1Dmi5PpxgJ3yyJLVpl8=;
	b=aCUnBA9cLysnzvfdNUAH5IovrGH7P36vBrtAK/Xn99CpfkB4a9MtliPRw84sq6NZWw
	CZ5Pfi0iUCkpWRSnbSdiRdLon4vB8PJTCJt6Ef8CEauNZL3IZaYZ9dHE9YScrWMWjSmE
	imOm20edMRB0ewjQxv3OnObhSSsigQoYZNt33i37TD6w3cv4ysTZ/xUS75s6ymwTtMYx
	o/GwJ525NjwdrbhfyF1DBC5WqIaBHtEd9jLuCcXtYxQSQxw7dbZ0hcGIRmV3cbUWwdd0
	QoFbwQKQRrAxYssVMefZ4SSIkvanNFPa8dCFXu3G6Qvu0RQGWPMUslkFZ4DuC3pUFkpE
	yuzg==
MIME-Version: 1.0
X-Received: by 10.182.131.168 with SMTP id on8mr8233253obb.7.1365506432256;
	Tue, 09 Apr 2013 04:20:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 04:20:32 -0700 (PDT)
In-Reply-To: <1365501911.7011.38.camel@phil-desktop.brightsign>
References: <1365457364-3089-1-git-send-email-otavio@ossystems.com.br>
	<1365501911.7011.38.camel@phil-desktop.brightsign>
Date: Tue, 9 Apr 2013 08:20:32 -0300
X-Google-Sender-Auth: qN40EOca_dCVymQPtoIICi1SxaA
Message-ID: <CAP9ODKqdBYeZ6eE_xw8gqXi9i4u-XZBZ=REu7Wf-S8vhgchdww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 09 Apr 2013 11:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 7:05 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2013-04-08 at 18:42 -0300, Otavio Salvador wrote:
>> When a MACHINEOVERRIDES has more than one value, split by ':' as usual
>> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
>> matching as we need to iterate over each SoC family and check if it is
>> compatible or not.
>
> [...]
>
>>              import re
>> -            this_machine = d.getVar('MACHINE', True)
>> -            if this_machine and not re.match(need_machine, this_machine):
>> -                this_soc_family = d.getVar('SOC_FAMILY', True)
>> -                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
>> -                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> +            compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
>> +            for m in compat_machines:
>> +                if re.match(need_machine, m):
>
> The checkin comment above doesn't really capture the semantic changes
> going on in this patch.  The comment implies that there was previously
> an issue with MACHINEOVERRIDES not being split when it contains multiple
> entries, but this is misleading: prior to this patch, COMPATIBLE_MACHINE
> wasn't being matched against MACHINEOVERRIDES at all.  So, the effect of
> this is that anything in MACHINEOVERRIDES (which could potentially be
> quite a large set of strings) will be considered as a candidate for
> matching COMPATIBLE_MACHINE.
>
> It's not abundantly clear to me whether this is a good thing or not, but
> it certainly ought to be accurately described in the commit log.

In fact it was being matched as SOC_FAMILY, in fact, extended
MACHINEOVERRIDES. I will send a new version with improved commit log
in either case.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


