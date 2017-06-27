Return-Path: <net147@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4E41077F38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:53:23 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m19so2157353ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sBzPBIKq7gs+U5KB9t6SB0+iCxAZUzwwpSOOBOTyC9g=;
	b=UB89i5O23fwr8tA2dYlMnZqFVwrXAiBHr9254D5BX49vb8nxfsJflBYT3uW4zEDIVj
	Gt7GQC/hxh91prs+3MWnhO6+BI6RtAWW1UK0cbwIjmq/Oyjec9DIdxQHSF3b66w5VsDa
	A5NF25q5VYCmaRdY3gZdgl9S7XWcTPft/aJuHbnlyCxoTP0iBkzAXq0FO2nVCX+QcVaf
	vM3S74crIO16IdcwYQysF0E0tOnG30f35llUb93wxEip8d79cKfA1VSo74PcT1Z/63vF
	UnmbK8i7RuKD8DhWRGMIdx5l9UGqSRpqF00an9/DbGaqi42x4jnCRwnZudMACXiC0Fqs
	6lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sBzPBIKq7gs+U5KB9t6SB0+iCxAZUzwwpSOOBOTyC9g=;
	b=XNgBL/fwntuMrGP4TpKHONctwGoq9fDyvJfV8bJQ3lfL+4A8T6B/coqgEXKLD6LzKc
	VK3R+Rg+J77Icnocz742si1YxdlZ8gWM0SZxKKQ7wwTLSIH6XsAZqKs411HOJqVqDFcT
	U6j8XH6Q7U+isI22PrWpQ0shfgt/SJoNlMjjI4ufCM1zRCH3M9NmTnSv/60dQtYztmQW
	V1sQDgFtuWBh6m8Mnzvy8HOh/80uR2Ro6I4l0031maQWPZPpTFr29KxylNzGwnVPnTGp
	Hl06q/P+DAjOfrf1wWxjZVFvxRiS6r9YTNJBgUdNSHUS4+IpKU8XO1myfw5ZXt8eGxic
	sLxA==
X-Gm-Message-State: AKS2vOwc4qJAuq4OgnPWnikpDISTIxkmZms0XNE/kEZAYtgWiZz6MyQt
	wHUkO2sRrqywYWxK6hKomzBT0XXdGw==
X-Received: by 10.107.40.18 with SMTP id o18mr5505199ioo.128.1498557205080;
	Tue, 27 Jun 2017 02:53:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.104 with HTTP; Tue, 27 Jun 2017 02:53:24 -0700 (PDT)
In-Reply-To: <1498554326.7464.33.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 19:53:24 +1000
Message-ID: <CANwerB2NyXa=MiKAHRMa+kYCUhFWQ47JEDT6fcVEzhVgc4=X6Q@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 09:53:24 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

Something is really strange. HOSTTOOLS doesn't appear to be working
anymore in pyro branch
If I do "bitbake -c devshell qemu-native", I can run the following
commands successfully which should have been filtered out by
HOSTTOOLS:

$ which sdl-config
/usr/bin/sdl-config
$ which ncdu
/usr/bin/ncdu
$ which whoami
/usr/bin/whoami

For some reason /usr/bin is contained in PATH. Previously it was filtered out.

Regards,
Jonathan

On 27 June 2017 at 19:05, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Thu, 2017-06-01 at 22:15 +1000, Jonathan Liu wrote:
>> If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-config
>> to HOSTTOOLS to allow access to the host sdl-config.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8e4f4bbb56..3ad905c917 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -471,6 +471,9 @@ HOSTTOOLS += " \
>>  # Tools needed to run testimage runtime image testing
>>  HOSTTOOLS += "ip ping ps scp ssh stty"
>>
>> +# Link to sdl-config if using host SDL
>> +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
>> +
>
> Why are you checking ASSUME_PROVIDES? The variable is called
> ASSUME_PROVIDED.
>
> Even if you had checked the right variable, is that really necessary?
> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine on
> Debian Jessie, without sdl-config in HOSTTOOLS.
>
> Sorry for the late reply, going through my backlog... I see that this
> has been merged. Probably needs to be reverted or fixed.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

