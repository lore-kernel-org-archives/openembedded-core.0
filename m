Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOaSh-0007av-AE
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 23:16:12 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so2084905obc.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 13:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=syIGViQtwq+bIw548hFKJ8C0qGrM1rUy0EDDRMi7mOw=;
	b=ALcgZ26eciyj+3Dv6lB26/JKn+eZqsllZQEbNVV6VvcGIE7zmUPO+e3ilT5T+vKIwk
	j7tDQy+48BmyxJvpbzR6suUWYpxcT5bM2IBFGTiudccSEavmLwx8H/W4BEHWpnBc6JFA
	9QyW3n/f1DNBoUH9pVUMnxi8+AU5zeA3tOKhpgBp/prW9A+r+3ZbrKqoVSweEoU2itNa
	paatI0Fd08DqCqwvJktHxKgi9VXIcJX0caYGy02epzle/xD5CSlOxx0lsOJ/Bo86Vw7u
	YmCqT3U/w5r3l4jTQ8+BgvG1MUgGRuaITILfCbiGQxa0wv6WDE/BhbYUM1yJwEAOjwR5
	6S4w==
MIME-Version: 1.0
X-Received: by 10.182.157.104 with SMTP id wl8mr11627026obb.79.1365281910746; 
	Sat, 06 Apr 2013 13:58:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 13:58:30 -0700 (PDT)
In-Reply-To: <20130406200203.6eca6094@e6520eb>
References: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
	<20130406200203.6eca6094@e6520eb>
Date: Sat, 6 Apr 2013 17:58:30 -0300
X-Google-Sender-Auth: -o5ViMpV051qpZMio_YzXtRZyyc
Message-ID: <CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 06 Apr 2013 21:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2013 at 3:02 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Sat,  6 Apr 2013 14:17:48 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
>> When a SOC_FAMILY has more than one value, split by ':' as usual
>> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
>> matching as we need to iterate over each SoC family and check if it is
>> compatible or not.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/base.bbclass | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index abd6a52..6f24064 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -515,11 +515,13 @@ python () {
>>          need_machine =3D d.getVar('COMPATIBLE_MACHINE', True)
>>          if need_machine:
>>              import re
>> -            this_machine =3D d.getVar('MACHINE', True)
>> -            if this_machine and not re.match(need_machine, this_machine=
):
>> -                this_soc_family =3D d.getVar('SOC_FAMILY', True)
>> -                if (this_soc_family and not re.match(need_machine, this=
_soc_family)) or not this_soc_family:
>> -                    raise bb.parse.SkipPackage("incompatible with machi=
ne %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> +            compat_machines =3D [d.getVar('MACHINE', True)]
>> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) or "")=
.split(":"))
>> +            for this_machine in compat_machines:
>> +                if re.match(need_machine, this_machine):
>> +                    break
>> +            else:
>> +                raise bb.parse.SkipPackage("incompatible with machine %=
s (not in COMPATIBLE_MACHINE)" % this_machine)
>>
> aren't you breaking this log here vs what is was supposed to
> print before ?

The 'else' is used when no 'break' is done inside of for loop.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


