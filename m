Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Shgsy-0004Dp-7L
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:53:20 +0200
Received: by qcso7 with SMTP id o7so256293qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bhaWtsdzmI5GCn415ZcZ4fZUg7Ul1O4WXuFb2wZnVxc=;
	b=PgCHgczA7xD0o8JwvtT+5/4HqYrUd4ijPf3PQf0KWFdbxj9vwG757gbSB/lWUa7AVT
	FpmPrKBkydCsflkL38/pk7cqnenLhteBnU1bwBrSDhWdGSTSGCI+Pfw2bh4UXpnAIZXx
	5W6K+BiuUjOBE4WrtclG+05eme5e5uqE53JCH50Ql1Li3ct/cjw1bNvMAYU9YZDovZS5
	t7QjhdVk45sAClPc/GEcXSTZzUBUvwRKTh+6P+QFuoDEg387ce4mQuwrOzeLfA6rcdTf
	I1LN9PI+y4VFI15MLngDxjZzaIdCrOHOCKq9HGHJ6h66IrbhZZZx7eu8VZm8VMVHW803
	y2ig==
MIME-Version: 1.0
Received: by 10.224.208.66 with SMTP id gb2mr47798685qab.29.1340282554069;
	Thu, 21 Jun 2012 05:42:34 -0700 (PDT)
Received: by 10.229.51.10 with HTTP; Thu, 21 Jun 2012 05:42:33 -0700 (PDT)
In-Reply-To: <1340282394.1640.108.camel@ted>
References: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1340281789.1640.106.camel@ted>
	<CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
	<CADkTA4M6tN=zGrKe6-1ZVmcW3Facm-cLT+70cqMs7+Q_U6DXOg@mail.gmail.com>
	<1340282394.1640.108.camel@ted>
Date: Thu, 21 Jun 2012 08:42:33 -0400
Message-ID: <CADkTA4Pgp=3oD+b-7bdseEiNE++CSwzd++FfBriQ5kZ=0qS+vQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-tools: multilib compilation fix
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
X-List-Received-Date: Thu, 21 Jun 2012 12:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 8:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-06-21 at 08:33 -0400, Bruce Ashfield wrote:
>> On Thu, Jun 21, 2012 at 8:32 AM, Marinescu, Bogdan A
>> <bogdan.a.marinescu@intel.com> wrote:
>> > On Thu, Jun 21, 2012 at 3:29 PM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> On Wed, 2012-06-20 at 11:25 +0300, Bogdan Marinescu wrote:
>> >>> This patch makes linux-tools compile properly on multilib configurat=
ions
>> >>> (which failed because of some invalid dependencies). Tested by compi=
ling
>> >>> lib32-core-image-sato-sdk.
>> >>>
>> >>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> >>> ---
>> >>> =A0meta/recipes-kernel/linux/linux-tools.inc | =A0 =A02 +-
>> >>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipe=
s-kernel/linux/linux-tools.inc
>> >>> index 3b03c05..048608c 100644
>> >>> --- a/meta/recipes-kernel/linux/linux-tools.inc
>> >>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
>> >>> @@ -34,7 +34,7 @@ do_install_perf[umask] =3D "022"
>> >>>
>> >>> =A0PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${ML=
PREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot=
"
>> >>> =A0PERFDEPENDS_libc-uclibc =3D ""
>> >>> -PERFRDEPENDS =3D "python perl elfutils"
>> >>> +PERFRDEPENDS =3D "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elfu=
tils"
>> >>> =A0PERFRDEPENDS_libc-uclibc =3D ""
>> >>>
>> >>> =A0do_compile_perf[depends] =3D "${PERFDEPENDS}"
>> >>
>> >> Bruce has just totally rearranged this code. Could you check if the n=
ew
>> >> recipe still suffers from this issue please?
>> >
>> > Sure, I'm on it.
>>
>> Yep. We still need this addition to the recipe .. luckily, easy to do :)
>
> I'm not sure, the autorenaming magic should take care of a simple
> RDEPENDS...

Ah yes, I wasn't sure about that myself. I'll just watch and wait in
that case :)

Bruce

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



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


