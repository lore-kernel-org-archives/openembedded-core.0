Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C66BCD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:11:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34939.1779365466534709999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vnrB2clK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so39587075e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779365465; x=1779970265; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnerynGcaqxq/7uUzAjTIzET3XCtzvgeP+LKVDfXYb8=;
        b=vnrB2clKG5qBQ4aNppr7apnpnhBmY2F+vL3AC4nCAjyMX1mEqfSgxWcaeBE4bRu56U
         eZhMN7K/rdvFMIcM7ffwl8PiDbOFDq/y8jvQLg3r7DrKE4FGj1SK4y162dZnq5BZm1pj
         5moRSoWcgsrXSU2jraratsnjAoFP6tp55822M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365465; x=1779970265;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnerynGcaqxq/7uUzAjTIzET3XCtzvgeP+LKVDfXYb8=;
        b=oHOXtN3GhHXWWYbytzBXeFZIxIczPvx9bh+X0+WhTZSVYMsb09CJkh/ipfw7/fG5XW
         p5pYekJeLNH56mbyf81nJ5zwg3+si9E0Wsx83egtfxI9bYPeexykemrpRW2lZyQ+Gn75
         X6QzyRBLGNhfOKpCn4gYK43MHhU/SKvXxO9zgaY+tqTN97I+G1T9nBKXO1ECGyy3+jzy
         zxwtIUxDodPtm+kWiq2/OVlawHIe6lG00Sg1eyqpnpmMvpykfGkGv6fddrsmUsRs3XK3
         i4BGGwDThcccvroO8FxGBUy83+CW33gxidtsOa9NYMjxYrxP2oJhcPu4s6fZLNR0RisP
         zZFA==
X-Forwarded-Encrypted: i=1; AFNElJ9AVxzEDnhvuR7gNxyS38Zy4Z/F9ISdCfYChXEUplQPcwxSW+ozXZ/EUPaXC8uMp903dXdkL/AzZTIDc+kRP8QzMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVR/Y39KtG23AwwIlrD4qmxzS7px1ebID8C5R13RhQ7Hb6uZGm
	LQvekeGOhe+siKNUqG4SFwd5BOUueju0Qm2L1r5xds5go4pdUtmWJJ9XIKd+JgBsRQ==
X-Gm-Gg: Acq92OHaxy3BDeyYNl2I9qbksgeh+sXcpxVkjn3r9tuHStokSuBHnBGcahLztKZwwBC
	wBmd8HhAc3WA7fUCwsZ5Cb3rDi4Ymxk6KpReHRwpZ7j7N63dsGc0iO5tKGFwznfWCZVYydqPJ2V
	bfs1GCjD4Si2z3sGRYdXZAjf5BsHEbRZbm/o/R9KmhBFXijqT/2wP6g4OiU21uVdSNg1Ebi0pqV
	7GsofdWe3TO5037g1eIZ9Mn8Yq9svyYn/yseA6jurfesAG5e4qL5c2HAbCsGrPtpyylWXkqTKbY
	06EqhGSReB1iNxG0Lh2YGmT3MPL2UGBfcUkgBQDjbBfD2CVL4416wve2gR8ecBzBhLZPkcMxR+J
	KQ1OKvbLvLQU0n5pbeihkJZDd7J0hMWs5uEOWpG0aVCdMK1njYqiK0GV2LvMkV0b457rX11ePt9
	XYV5TD41AMeLx3BkFGNUfqOQ==
X-Received: by 2002:a05:600c:3147:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-49036033406mr35346995e9.1.1779365464693;
        Thu, 21 May 2026 05:11:04 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9962a2sm22660615e9.2.2026.05.21.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:11:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 14:11:03 +0200
Message-Id: <DIOCEX8UMENP.1ESHST4X7HVZF@smile.fr>
Subject: Re: [OE-core] [PATCH] initramfs-framework: replace eval-based
 bootparam parser
From: =?utf-8?q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
To: <paul@pbarker.dev>, "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260519090517.1201609-1-alexander.sverdlin@siemens.com>
 <484fb04a4b512d8456d42720ad89a8bbe8d85b20.camel@pbarker.dev>
In-Reply-To: <484fb04a4b512d8456d42720ad89a8bbe8d85b20.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237506

On Thu May 21, 2026 at 12:25 PM CEST, Paul Barker via lists.openembedded.or=
g wrote:
> On Tue, 2026-05-19 at 11:04 +0200, A. Sverdlin wrote:
>> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>>=20
>> The bootparam parsing loop uses "eval" to set shell variables from
>> kernel command line parameters.  Since eval interprets its argument as
>> shell code, a crafted boot parameter such as:
>>=20
>>   rootdelay=3D1";command;"
>>=20
>> would be executed as arbitrary shell code during early init.
>
> Hi Alexander,
>
> If you can modify the kernel command line, you can pass options like
> `init=3D/bin/sh` and then execute arbitrary commands anyway.

I agree, this is can't really be considered a security issure, since if
you have access to the command line, you can execute arbitrary code
anyway...

However it is still worth hardening the parsing, if only to protect
against human errors

Regards
Jeremy
>
>>=20
>> Replace the eval-based parser with a single sed invocation that
>> tokenizes /proc/cmdline (respecting double-quoted values) and feeds the
>> result to a while-read loop that uses only "export" for variable
>> assignment, which never interprets the value as code.
>>=20
>> The sed script works as follows:
>> - Split the line at unquoted spaces into one token per line.  The regex
>>   treats sequences of non-space/non-quote chars, balanced "..." pairs,
>>   and lone " (for mid-value quotes) as atomic units that are never split=
.
>> - Strip outer quotes from whole-param-quoted tokens ("param=3Dval").
>> - Strip balanced quotes around parameter values (key=3D"val" -> key=3Dva=
l).
>> - Replace . and - with _ in parameter names (the key part before =3D),
>>   iterating until none remain.
>> - Print each processed token and loop (P/D).
>>=20
>> Additional benefits:
>> - Whitespace inside quoted values is now preserved exactly as specified
>>   (the for-loop word-splitting collapsed multiple spaces)
>> - Reduced from 3+ sed/cut invocations per parameter to a single sed
>>   process for the entire command line
>>=20
>> Co-developed-by: GitHub Copilot (Claude)
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>> ---
>>  .../initrdscripts/initramfs-framework/init    | 61 ++++++++-----------
>>  1 file changed, 24 insertions(+), 37 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/=
meta/recipes-core/initrdscripts/initramfs-framework/init
>> index 67590ad765..97ec62e2da 100755
>> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
>> @@ -92,43 +92,30 @@ if [ -d $EFI_DIR ];then
>>  fi
>> =20
>>  # populate bootparam environment
>> -for p in `cat /proc/cmdline`; do
>> -	if [ -n "$quoted" ]; then
>> -		p_rstripped=3D${p%\"}
>> -		value=3D"$value $p_rstripped"
>> -		if [ "$p_rstripped" !=3D "$p" ]; then
>> -			# End of a opt=3D"word1 word2..." parameter=20
>> -			eval "bootparam_${quoted}=3D\"${value}\""
>> -			unset quoted
>> -		fi
>> -		continue
>> -	fi
>> -
>> -	opt=3D`echo $p | cut -d'=3D' -f1`
>> -	opt=3D`echo $opt | sed -e 'y/.-/__/'`
>> -	if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
>> -		# opt parameter
>> -		eval "bootparam_${opt}=3Dtrue"
>> -	else
>> -		value=3D"`echo $p | cut -d'=3D' -f2-`"	# Option value
>> -		value_lstripped=3D${value#\"}
>> -		value_rstripped=3D${value%\"}
>> -
>> -		if [ "$value_lstripped" !=3D "$value" ] && [ "$value_rstripped" !=3D =
"$value" ]; then
>> -			# opt=3D"value" parameter
>> -			eval "bootparam_${opt}=3D${value_lstripped%\"}"
>> -			continue
>> -		fi
>> -
>> -		if [ "$value_lstripped" !=3D "$value" ]; then
>> -			# Start of a opt=3D"word1 word2..." parameter=20
>> -			quoted=3D${opt}
>> -			value=3D${value_lstripped}
>> -			continue
>> -		fi
>> -		eval "bootparam_${opt}=3D\"${value}\""
>> -	fi
>> -done
>> +while IFS=3D read -r token; do
>> +	case "$token" in
>> +	*=3D*)
>> +		opt=3D"${token%%=3D*}"
>> +		value=3D"${token#*=3D}"
>> +		;;
>> +	*)
>> +		opt=3D"$token"
>> +		value=3D"true"
>> +		;;
>> +	esac
>> +	export "bootparam_${opt}=3D${value}"
>> +done <<EOF
>> +$(sed -E '
>> +s/^(([^ "]*|"[^"]*"|")*) +/\1\
>> +/
>> +s/^"(.*)"$/\1/
>> +s/^([^=3D]*)=3D"(.*)"/\1=3D\2/
>> +:k
>> +s/^([^=3D.-]*)[.-]/\1_/
>> +tk
>> +P
>> +D' /proc/cmdline)
>> +EOF
>
> The main issue here is that this replaces comprehensible code with
> incomprehensible line noise, reducing maintainability. If you want to
> remove eval calls from this script, it needs to be done in a different
> way.
>
> Best regards,


