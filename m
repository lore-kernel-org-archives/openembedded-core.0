Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RT3BI-0006xg-9j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 04:07:29 +0100
Received: by iahk25 with SMTP id k25so1050514iah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 19:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=6IElqAEqtCwyhOlqRocZL7dbIN2ZgTc8WJEf4ZXnRMY=;
	b=s+X5UsB3z1wWmK4CwKuZ51tG3eahOv+gbj5ukpZbGS7vJLZfeGbdTogggF+S/WL1L7
	3Qbob40Zoh0203lVW0+Fhq5hHkpGQaoVbql0YS6WhNhH5kN3GdysH0PqMFNkxPbxlLzz
	1zpDV9eNZBBfpdUfgWTFeEDBjdl8mIjhNSR0I=
Received: by 10.231.64.78 with SMTP id d14mr5796219ibi.56.1322017256090; Tue,
	22 Nov 2011 19:00:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.32.69 with HTTP; Tue, 22 Nov 2011 19:00:25 -0800 (PST)
In-Reply-To: <1321979300.18926.58.camel@ted>
References: <cover.1321811216.git.raj.khem@gmail.com>
	<d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
	<1321979300.18926.58.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2011 19:00:25 -0800
Message-ID: <CAMKF1sqAuNv+r838gHTi8b0omTQBa7VkjahGAiEzBg137hyhHw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] matchbox-stroke: Fix linking error with gold
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
X-List-Received-Date: Wed, 23 Nov 2011 03:07:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 8:28 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2011-11-20 at 09:50 -0800, Khem Raj wrote:
>> Gold defaults to no-add-needed thetefore
>> it does not link with librtaries that are not on cmdline
>> it needs libXrender but is not on the linker cmdline
>> so add it.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../matchbox-stroke/files/ldadd_libXrender.patch =C2=A0 | =C2=A0 2=
5 ++++++++++++++++++++
>> =C2=A0.../matchbox-stroke/matchbox-stroke_git.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A06 +++-
>> =C2=A02 files changed, 29 insertions(+), 2 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-sato/matchbox-stroke/files/ldadd_l=
ibXrender.patch
>>
>> diff --git a/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.pa=
tch b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
>> new file mode 100644
>> index 0000000..90d2057
>> --- /dev/null
>> +++ b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
>> @@ -0,0 +1,25 @@
>> +with GNU binutils-gold the
>> +important difference is that --no-add-needed is the default behavior of=
 GNU
>> +binutils-gold. Please provide all needed libraries to the linker when b=
uilding
>> +your executables.
>> +
>> +Otherwise we get link errors like
>> +
>> +/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_=
64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-=
gnueabi/4.6.2/ld: matchbox-stroke-ui.o: in function mb_stroke_ui_resources_=
create:matchbox-stroke-ui.c:223: error: undefined reference to 'XRenderCrea=
tePicture'collect2: ld returned 1 exit statusmake[2]: *** [matchbox-stroke]=
 Error 1
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Upstream-Status: Pending
>> +Index: git/src/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/src/Makefile.am 2011-10-22 19:25:52.000000000 -0700
>> ++++ git/src/Makefile.am =C2=A0 =C2=A0 =C2=A02011-10-22 19:27:07.7464289=
46 -0700
>> +@@ -6,7 +6,7 @@
>> +
>> + bin_PROGRAMS =3D matchbox-stroke
>> +
>> +-matchbox_stroke_LDADD =3D $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm
>> ++matchbox_stroke_LDADD =3D $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm -lXrender
>> +
>
> I had a look at this and -lXrender is listed in MBSTROKE_LIBS. I'm
> therefore a little puzzled on why this patch is needed? I appreciate the
> commandline is order sensitive but that order should work?

In my case

Makefile:MBSTROKE_LIBS =3D -lXft -lX11 -lXtst -lfakekey


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


