Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPCR3-0005p7-3d
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:48:40 +0200
Received: by mail-ob0-f177.google.com with SMTP id uz6so5801229obc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=RorSXHovyGPFiSh3OqwL/1uVIrGoZxPC4cYVtYIuFgQ=;
	b=dW4S+Z9PjJnVDwnkJhKkPuRtrgdBbnJEPKRdaM8PdvOXfqz9CwYGWzoc4I/9ASi2QY
	9pkFdmLLmnrBIugyAZvghf++IzwvgbhrXTcrYtJEaItCM4anMnQBTaCJx93z4VjGS/g4
	mdIrwr7oZVSxnE35g3IfglgJ36q4sAOzPE3aEhflZK2/C/zykZhERO5m3aiDFVLjXpdP
	jWkH6RHnGnBxztaka3dXVisMYak2FE5ZR8/Zru4puOvMb3q56B6l86wecARp6n/aHhRq
	9Ft4pE1P+/RXGpj2c9IrPmdn5vN+DY9UG6OQIop2CuIHom1ZcEoX/99NF55xE1q2uCym
	ZizA==
MIME-Version: 1.0
X-Received: by 10.60.93.7 with SMTP id cq7mr15390535oeb.40.1365427878053; Mon,
	08 Apr 2013 06:31:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 06:31:17 -0700 (PDT)
In-Reply-To: <20130407073745.54c2d0e8@e6520eb>
References: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
	<20130406200203.6eca6094@e6520eb>
	<CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
	<20130407073745.54c2d0e8@e6520eb>
Date: Mon, 8 Apr 2013 10:31:17 -0300
X-Google-Sender-Auth: Vycxr9NrqM-tv5eLFdtmNGkQCWM
Message-ID: <CAP9ODKqfL7o1pjTALefq148uiLQcUBOzv5Tdc5d_wMwfZW8PFw@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 Apr 2013 13:48:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2013 at 2:37 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Sat, 6 Apr 2013 17:58:30 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
>> On Sat, Apr 6, 2013 at 3:02 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>> > Hi Otavio,
>> >
>> > Le Sat,  6 Apr 2013 14:17:48 -0300,
>> > Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> >
>> >> When a SOC_FAMILY has more than one value, split by ':' as usual
>> >> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
>> >> matching as we need to iterate over each SoC family and check if it i=
s
>> >> compatible or not.
>> >>
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> ---
>> >>  meta/classes/base.bbclass | 12 +++++++-----
>> >>  1 file changed, 7 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> >> index abd6a52..6f24064 100644
>> >> --- a/meta/classes/base.bbclass
>> >> +++ b/meta/classes/base.bbclass
>> >> @@ -515,11 +515,13 @@ python () {
>> >>          need_machine =3D d.getVar('COMPATIBLE_MACHINE', True)
>> >>          if need_machine:
>> >>              import re
>> >> -            this_machine =3D d.getVar('MACHINE', True)
>> >> -            if this_machine and not re.match(need_machine, this_mach=
ine):
>> >> -                this_soc_family =3D d.getVar('SOC_FAMILY', True)
>> >> -                if (this_soc_family and not re.match(need_machine, t=
his_soc_family)) or not this_soc_family:
>> >> -                    raise bb.parse.SkipPackage("incompatible with ma=
chine %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> >> +            compat_machines =3D [d.getVar('MACHINE', True)]
>> >> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) or =
"").split(":"))
>> >> +            for this_machine in compat_machines:
>> >> +                if re.match(need_machine, this_machine):
>> >> +                    break
>> >> +            else:
>> >> +                raise bb.parse.SkipPackage("incompatible with machin=
e %s (not in COMPATIBLE_MACHINE)" % this_machine)
>> >>
>> > aren't you breaking this log here vs what is was supposed to
>> > print before ?
>>
>> The 'else' is used when no 'break' is done inside of for loop.
>>
> but will this_machine contain the value of the MACHINE variable ?

Yes, check:

...
+            compat_machines =3D [d.getVar('MACHINE', True)]
+            compat_machines.extend((d.getVar('SOC_FAMILY', True) or
"").split(":"))
...

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


