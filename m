Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UEIrl-0006wA-U3
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 13:27:11 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so2024539obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Vh1iRKPWusjDyKXd7kkUqBnC9FWBJB/M9X1jMx0d69Q=;
	b=pA+PXd+cCqhbgUR33IdWL8+JwpgzUACzPcFS1k8melDPp10LKcSq54HcckS1LK/Tzd
	rEq0Ctz9Od+GYsfrGP+5Uo2RUtvatKy1FZA5RbJ1ASlaEq23guhX9Pgm1ny125vqunFI
	nU0gutggr/1j11gajDzQN3aNXB2Kgq5znvwwWSJfYhSiXFoJOHQw0dYzxRwbS6J8FZVB
	PROREq1lwXXSM4duAfI1QVaF9d1+I3tmpxJIDj2aJ21hMeO3PCqlkc0aE88Chzn6lYLy
	U+DH0Vj4sppme38GGbNQeLoriPjzvRsXDrbwts7q3+xjv4wT6x/5CuS24HBUJbnRkjZY
	2ROg==
MIME-Version: 1.0
X-Received: by 10.182.157.104 with SMTP id wl8mr4413450obb.79.1362831034086;
	Sat, 09 Mar 2013 04:10:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 9 Mar 2013 04:10:34 -0800 (PST)
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
Date: Sat, 9 Mar 2013 09:10:34 -0300
X-Google-Sender-Auth: v4OpMCtjHTOzZVGsXfqJyECAaos
Message-ID: <CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Maupin, Chase" <chase.maupin@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Sat, 09 Mar 2013 12:27:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2013 at 7:16 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> -----Original Message-----
>> From: otavio.salvador@gmail.com
>> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio Salvador
>> Sent: Friday, March 08, 2013 2:27 PM
>> To: Denys Dmytriyenko
>> Cc: Maupin, Chase; Patches and discussions about the oe-core
>> layer
>> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
>> override order
>>
>> On Fri, Mar 8, 2013 at 5:06 PM, Denys Dmytriyenko
>> <denis@denix.org> wrote:
>> > On Fri, Mar 08, 2013 at 03:52:57PM -0300, Otavio Salvador
>> wrote:
>> >> On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin
>> <Chase.Maupin@ti.com> wrote:
>> >> > * the current order has SOC_FAMILY settings, which are
>> generic
>> >> >   settings for a group of devices, overriding the machine
>> specific
>> >> >   settings.  For example:
>> >> >
>> >> >   KERNEL_DEVICETREE_ti33x =3D "xxxx"
>> >> >   KERNEL_DEVICETREE_beaglebone =3D "yyyy"
>> >> >
>> >> >   Should yield "yyyy" when building for the beaglebone
>> because
>> >> >   that is a more specific device than ti33x.  However,
>> without this
>> >> >   change the result is that the value is set to "xxxx"
>> meaning the
>> >> >   more generic setting overrides the more specific setting.
>> >> >
>> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> >>
>> >> Maybe while on that you could look at supporting xx:yy as SoC
>> family?
>> >> like am37xx:am3715 ?
>> >
>> > Did you mean am3517? That's a slightly different variant of
>> am35x/omap35x SoC.
>>
>> Yes; sorry ... what I meant was 'am35xx:am3517'
>>
>> > But if you really meant am3715 (as well as am3705, am3725 and
>> am3730), then
>> > those are variants of am37x SoC, just with some subsystems,
>> like SGX or DSP,
>> > being absent or present. Having those variants handled by
>> SOC_FAMILY would be
>> > an overkill. Instead, we've started using MACHINE_FEATURES to
>> distinguish
>> > between those variants of the same SoC, by checking for "sgx"
>> and/or "dsp"
>> > flags there and pulling in needed software components
>> accordingly.
>>
>> My main concern here is that COMPATIBLE_MACHINE also parses
>> SOC_FAMILY
>> however if you have two (as the 'am35xx:am3517') it is going to
>> fail;
>> it could split it and parse it individually.
>
> Sorry, I'm not sure if I'm following here.  Are you saying you would find=
 it useful to have support for a MACHINE to have more than one SOC_FAMILY? =
 In the example above I would have expected that you would have a machine c=
onfig file for am3517 which has an SOC_FAMILY of am35xx.  Why would you spe=
cify two SOC_FAMILY values per machine?

We can have more generic to more specific combinations.

> Or are you trying to build something like omap3->am35xx->am3517 where you=
 can use omap3 as a more generic setting but still use am35xx for a slightl=
y more restrictive group that is still grouping like parts, and finally you=
 use am3517 for the exact part?

Exactly so we avoid duplication stuff to boards or SoCs. Another
example of use: imx -> mx6q -> mx6.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


