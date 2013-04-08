Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPJxv-00037Z-UE
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:51:06 +0200
Received: by mail-oa0-f44.google.com with SMTP id h1so6777999oag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=j6Whs9OSSad0ka+Og5byk9jdmb0kt4SXiNDg3zy7kdc=;
	b=crb1LIWiGczOftbwXOiShl6NCMy4eEk75bl3XkVBB9gXsjjMpADMEmoTfY4VbENYTH
	jduFp1299K+GBeK8q0o+Jf33swh2W1K5ktohTAbiPGheSuUGnSHyCjLXCwT88QeLdl9a
	7GroktpQBu7dt3ZChnvqyC/rV4t6Gc5vwUOIdC2doWHJDLyIEQYZGrLZbV82S99Sxm99
	Zk28uGckKdV2mPfYiYgkguQ2yiUT0NW/1S86h3DezBnLeo1xoF3czs7FV+TceEJDIQUU
	oAVID9KSt8COX2aQWcxlU6Q9S6FWGu95nsu2Z93iy/dYdT6TD2I/0yNoAif/Kbj4jp5J
	9REw==
MIME-Version: 1.0
X-Received: by 10.60.54.100 with SMTP id i4mr1652416oep.42.1365456824333; Mon,
	08 Apr 2013 14:33:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 14:33:44 -0700 (PDT)
In-Reply-To: <1365456662.12407.61.camel@ted>
References: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
	<1365456662.12407.61.camel@ted>
Date: Mon, 8 Apr 2013 18:33:44 -0300
X-Google-Sender-Auth: tH-4DRuHnTWlYbkhRokFqgDwyTU
Message-ID: <CAP9ODKr63AbUksV_21hSGLgi6+7KHAva_TCGnbVbqWYXhpt_ow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 21:51:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 6:31 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-04-08 at 17:58 -0300, Otavio Salvador wrote:
>> When a MACHINEOVERRIDES has more than one value, split by ':' as usual
>> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
>> matching as we need to iterate over each SoC family and check if it is
>> compatible or not.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> Changes for v3:
>> - Stop checking for SOC_FAMILY as it is just for compatibility with
>>   old BSPs; we move to MACHINEOVERRIDES for this case (RP)
>>
>>  meta/classes/base.bbclass | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index abd6a52..313359c 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -515,11 +515,12 @@ python () {
>>          need_machine = d.getVar('COMPATIBLE_MACHINE', True)
>>          if need_machine:
>>              import re
>> -            this_machine = d.getVar('MACHINE', True)
>> -            if this_machine and not re.match(need_machine, this_machine):
>> -                this_soc_family = d.getVar('SOC_FAMILY', True)
>> -                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
>> -                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> +            compat_machines.extend((d.getVar('MACHINEOVERRIDES', True) or "").split(":"))
>
> No variable "compat_machines" exists before this line so this patch
> cannot possibly work. What did you test?

I got it when testing, hence my previous e-mail saying I found a problem.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


