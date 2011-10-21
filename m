Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHa6-000072-7P
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:04:26 +0200
Received: by pzk33 with SMTP id 33so10082380pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GV2Vgm6UX2GqQIT2Jd+oaq+N0wzHRrbE/mlbTehVk4U=;
	b=uT37mcDOkxLEO3O6r04MvYKT+pA1seTPusGeRncwLh9N61ZW623aKnh7NZjeMTGzUY
	QuCztygCtw0zcb9JRi0tGkujGhRhOXNeMgg7gE48VJAJ40fWCiTQLNSMnUKVdfJpGV83
	W8n6YFBNY3v2BiY4diBF/ledF0cN7bpGKErm4=
Received: by 10.68.73.103 with SMTP id k7mr19295439pbv.30.1319212708161; Fri,
	21 Oct 2011 08:58:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 08:57:58 -0700 (PDT)
In-Reply-To: <CAP9ODKqYn0WY2qsCttbdvCvJJnQpuKvmH79u4aAXs-XbQfCMYQ@mail.gmail.com>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<5980062f84b228fa8977cf3f14c064192ba91eee.1319167843.git.otavio@ossystems.com.br>
	<CAMKF1sqpvqZ4cOg4jceaB9P6HMTcZqhYVFG1SqZxN4Um3G1fAA@mail.gmail.com>
	<CAP9ODKqYn0WY2qsCttbdvCvJJnQpuKvmH79u4aAXs-XbQfCMYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 08:57:58 -0700
Message-ID: <CAMKF1sqy0+XtVnjsYoAQ+6Q4Q_+_0YaTrak2C4AGS7TVbpCszg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] bootimg.bbclass: add support to disable HDD image building
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
X-List-Received-Date: Fri, 21 Oct 2011 16:04:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 5:27 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Oct 21, 2011 at 04:07, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Oct 20, 2011 at 8:31 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>> =C2=A0meta/classes/bootimg.bbclass | =C2=A0 44 +++++++++++++++++++++---=
-----------------
>>> =C2=A01 files changed, 23 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclas=
s
>>> index a5ba3cf..eecc2bf 100644
>>> --- a/meta/classes/bootimg.bbclass
>>> +++ b/meta/classes/bootimg.bbclass
>>> @@ -48,34 +48,36 @@ SYSLINUXMENU =3D "${HDDDIR}/menu"
>>> =C2=A0inherit syslinux
>>>
>>> =C2=A0build_boot_bin() {
>>> - =C2=A0 =C2=A0 =C2=A0 install -d ${HDDDIR}
>>> - =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${STAGING_DIR_HOST}/kernel/bzIma=
ge \
>>> - =C2=A0 =C2=A0 =C2=A0 ${HDDDIR}/vmlinuz
>>> + =C2=A0 =C2=A0 =C2=A0 # Create an HDD image
>>> + =C2=A0 =C2=A0 =C2=A0 if [ "${NOHDD}" !=3D "1" ] ; then
>>
>> please document this new variable NOHDD somewhere so people know how
>> and when to use it
>
> What do you suggests.

Either OE manual or local.conf.sample.extended may be

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


