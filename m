Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1RqlMH-0001W6-6u; Fri, 27 Jan 2012 13:56:50 +0100
Received: by lbol12 with SMTP id l12so80541lbo.6
	for <multiple recipients>; Fri, 27 Jan 2012 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=NUwlnro1NLNW7VUcqtuV3UJCPao9XrE+OLp7yP4HXII=;
	b=PIYzq1aozo121WVYlvuURI9AtEIiwL4VYgTkUJHhJGOqqLzgJq0STLNtkzaxD+HSWu
	9EhtA+DV7CxkROBS+vLP4nCuocLN2s/BL93mywfiBMa6Jq+5QaExdwiY+lWTXEUEry2Y
	r77amaJmzPPjqWrs6AmJwGt6YRrm8rs8fNWFs=
MIME-Version: 1.0
Received: by 10.112.83.197 with SMTP id s5mr1781215lby.9.1327668536972; Fri,
	27 Jan 2012 04:48:56 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 27 Jan 2012 04:48:56 -0800 (PST)
In-Reply-To: <CALbNGRQ0+FDE7QisckBOCXBUspQiumZFLjPJYgRf87a1mqtHaw@mail.gmail.com>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<4F21FDA2.5070803@linux.intel.com>
	<CALbNGRQ0+FDE7QisckBOCXBUspQiumZFLjPJYgRf87a1mqtHaw@mail.gmail.com>
Date: Fri, 27 Jan 2012 13:48:56 +0100
Message-ID: <CALbNGRTqHJYvSzbman=ZPQ4D=Cyu8oX0F4JdTA7hrH4oMW_wbA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 12:56:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2012 at 9:43 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Jan 27, 2012 at 2:28 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 01/26/2012 05:16 PM, Andreas M=FCller wrote:
>>>
>>> I checked: the complete contents of /usr/lib/evince/3/backends go to
>>> evince package and I would like to move *.a to ${PN}-staticdev and
>>> *.la to ${PN}-dev but I don't understand: who is responsible for
>>> adding all this to ${PN}?
>>>
>> bitbake.conf defines where most files should go, but when you get files =
in
>> sub-directories, such as /usr/lib/evince/..., then the recipe needs to d=
o a
>> little more work. If you look at the evince_2.32.0.bb, there already is =
a
>> FILES_${PN}-staticdev that adds some extensions, you need to add this se=
t of
>> backends to that list, probably same with the .la to the -dev package.
>>
> Why I asked this: Maybe there is a chance to fix this more globally
> instead of one by one in each recipe. But therefore I need to know
> where the path is packed.
>
I looked around for this a bit: As Saul pointed out, in bitbake.conf we hav=
e
FILES_${PN} =3D ... ${libdir}/${BPN}/* ...

This
* drags in all below this directory ( e.g *.la / *.a )
* Forces me to rewrite FILES_${PN} in evince ( e.g just adding
${libdir}/${BPN}/*/backends/*.a to FILES_${PN}-staticdev fixes nothing
). This is something I would like to avoid.

Suggestions?

I guess others but evince are also affected.

Andreas


