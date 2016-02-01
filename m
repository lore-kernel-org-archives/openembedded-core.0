Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3BEB377280
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:48:29 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 9so89021153iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ClFRPgnYzqSUrn2WblbuUUyExDuOyUEujDSldtZkZmU=;
	b=G0wyI2HiEFXtSsz9JwMZSBEf6YewCK+bqG7pqa01Lk8uLJW0CNh9CqBCvrsbLc/tKo
	cmt68xIlkjIrhicu8A5Uxrixt+O5Nmkpt9WWBSpUeAGDg1kT9ssUwOPJDIpwJAcGWt63
	rLlyvMKRQwGY/2Bih6ZwUtPyD0mhTutXrZPbcbYMBbMe7V1UmbNq8dkYDZI2fl/BQjfg
	Wz6S++KjjDa0XNDkx/mwU3/Xn0BP2/WtIe68gqGs8tJAH9x79ASjrEPw4aAWbJG3dteZ
	QrbDI+A/NEhOMcMRi9WHOhn9Hr7I37QLlssb/mpwN5/ucw6GeAkI82iZd2gS4ZuaRmvI
	Br+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ClFRPgnYzqSUrn2WblbuUUyExDuOyUEujDSldtZkZmU=;
	b=JU00A8m3wmMGNJ/IyTTQ/MABBifKewYAwTR/rn/B/8SMDUX65sFBHTCKDR41SRqQcG
	JFNkpOci0WQd1YgCSIFag2Q+wZX5yJJeZ4MmoMTNQCNZ1NOgrrNwTtCRMrf2aive4nVG
	/L+ezbuWx/J9xZCGpurQtfdpXdKXVaAqB0igC8uf2cgShW3IhRoO7I9wAqhMxYd2IAgH
	NpRkXaggbCUEkCdJoDRpAtPPq6gPkN6v0Ep9VwoXchgRI68EBo8qr40rFS8p/BE5L3N1
	KAXlaL/RjHJRD4nHSjoanMEAyBkET+PC1lZqLt+tWRm6+TIftPVHNqxhiXqyz/QAn9sR
	3Mtw==
X-Gm-Message-State: AG10YORaXMG0NaBsi6tdUoMcg7WqTsyiuOygG2c7SziwZ7RPhatCxTJ21Vd8ebfRq9beAd/PC5DZEZwMn/osBQ==
X-Received: by 10.107.9.211 with SMTP id 80mr17841028ioj.112.1454352510549;
	Mon, 01 Feb 2016 10:48:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 10:48:01 -0800 (PST)
In-Reply-To: <1454341995-18859-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1454341995-18859-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 10:48:01 -0800
Message-ID: <CAMKF1sok60noEfj_ZywoN+2Z4QkcMfZrzXbRdrQharg-ZYSX7w@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime/systemd: Fix for boot time string parse error
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
X-List-Received-Date: Mon, 01 Feb 2016 18:48:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 7:53 AM, Benjamin Esquivel
<benjamin.esquivel@linux.intel.com> wrote:
> boot time string can change its format of the output of the amount of time
> it took to boot. It is required to handle graceful fail of the parsing
> errors that it provokes
>
> [YOCTO #8889]
>
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
>  meta/lib/oeqa/runtime/systemd.py | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
> index 03c56ef..2b2f10d 100644
> --- a/meta/lib/oeqa/runtime/systemd.py
> +++ b/meta/lib/oeqa/runtime/systemd.py
> @@ -145,8 +145,7 @@ class SystemdJournalTests(SystemdTest):
>          except AssertionError:
>              self.fail("Error occurred while calling journalctl")
>          if not len(output):
> -            self.fail("Error: unable to obtain the startup time from\
> -                    systemd journal")
> +            self.fail("Error, unable to get startup time from systemd journal")
>
>          # check for the regular expression items that match the startup time
>          for line in output.split('\n'):
> @@ -156,20 +155,23 @@ class SystemdJournalTests(SystemdTest):
>          if check_match:
>              print "%s" % check_match
>          else:
> -            self.fail("Error while obtaining the boot time from journalctl")
> +            self.skipTest("Error at obtaining the boot time from journalctl")
>          boot_time_sec = 0
>
>          # get the numeric values from the string and convert them to seconds
>          # same data will be placed in list and string for manipulation
>          l_boot_time = check_match.split(" ")[-2:]
>          s_boot_time = " ".join(l_boot_time)
> -        # Obtain the minutes it took to boot
> -        if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
> -            boot_time_min = s_boot_time.split("min")[0]
> -            # convert to seconds and accumulate it
> -            boot_time_sec += int(boot_time_min) * 60
> -        # Obtain the seconds it took to boot and accumulate
> -        boot_time_sec += float(l_boot_time[1].split("s")[0])
> +        try:
> +            # Obtain the minutes it took to boot
> +            if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
> +                boot_time_min = s_boot_time.split("min")[0]
> +                # convert to seconds and accumulate it
> +                boot_time_sec += int(boot_time_min) * 60
> +            # Obtain the seconds it took to boot and accumulate
> +            boot_time_sec += float(l_boot_time[1].split("s")[0])

is float right to use here I wonder,

> +        except ValueError:
> +            self.skipTest("Error when parsing time from boot string")
>          #Assert the target boot time against systemd's unit start timeout
>          if boot_time_sec > systemd_TimeoutStartSec:
>              print "Target boot time %s exceeds systemd's TimeoutStartSec %s"\
> --
> 2.5.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

