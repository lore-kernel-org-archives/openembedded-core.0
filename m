Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMZgk-00067s-7G
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 07:52:54 +0200
Received: by ewy5 with SMTP id 5so359032ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=01hyRfuzWgZdjzXwkzXPGN+Dzep42eK1aZQUrV22or8=;
	b=MNsX4/FuSA+toSKzDnJ5x7Q+aTQwpaUW1L9ySgz5OzNfcT1BbRm+VdaNh3ElHR0prD
	iO6xa6s0w5vz8/hQIwj59zu8kZLIJhaM/aTksatCyGXEvtMJ+3rf2etiFW1Jr1gLct/a
	ve1WpMjrK2Xe7t9DZnHE+yACOWDo/vwGME+24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OWrcinvz24muq8gLr7zTjl21AaCa6VRuwhxfZQJ8m3kxyB6D9cqj1x/iaj+v9Ez1oF
	MuteK6NmstUdvCjgmmaVjJade9IOiQGlUf1E7ekmCYiwRChhLxH9dHNuYHQEM/O/RPFP
	fjn5CtYrsHL5sCQxgWajEhBQKxnQQ50fHB6Lk=
Received: by 10.14.47.8 with SMTP id s8mr462141eeb.140.1305697800120; Tue, 17
	May 2011 22:50:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 22:49:30 -0700 (PDT)
In-Reply-To: <1305591231.3424.152.camel@rex>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 22:49:30 -0700
Message-ID: <BANLkTimGz3Fh3ekAH3NJbX_cN=VncG-5Nw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 05:52:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 5:13 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2011-05-15 at 23:04 -0700, Khem Raj wrote:
>> Do not define DEPLOY_DIR_IMAGE
>> Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
>> recipes
>> Append -uclibc to STAGING_DIR_HOST only for target recipes.
>>
>> These changes make sure that we still share the native sysroot
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> The more I looked at that patch, the more holes I could see in what we
> were doing (and what Angstrom currently does). I started playing around
> with the patch below which tried to improve on that idea.
>
> I then concluded that we might be able to do something like:
>
> MACHINEOVERRIDES :=3D "${MACHINE}"
> MACHINE_append =3D "-uclibc"
>
> since what we're really trying to do in the uclibc case is replace
> anything MACHINE specific with something containing uclibc?
>
> Thoughts?
>
> Cheers,
>
> Richard
>
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 553c6a2..354668f 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -23,7 +23,7 @@ python () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('SSTATE_PKGARCH', bb.data.getV=
ar('BUILD_ARCH', d), d)
> =C2=A0 =C2=A0 elif bb.data.inherits_class('cross', d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('SSTATE_PKGARCH', bb.data.expa=
nd("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('SSTATE_MANMACH', bb.data.exp=
and("${BUILD_ARCH}_${MACHINE}", d), d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('SSTATE_MANMACH', bb.data.exp=
and("${BUILD_ARCH}_${STAGING_MACHNAME}", d), d)
> =C2=A0 =C2=A0 elif bb.data.inherits_class('crosssdk', d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('SSTATE_PKGARCH', bb.data.expa=
nd("${BUILD_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
> =C2=A0 =C2=A0 elif bb.data.inherits_class('nativesdk', d):
> @@ -31,7 +31,7 @@ python () {
> =C2=A0 =C2=A0 elif bb.data.inherits_class('cross-canadian', d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('SSTATE_PKGARCH', bb.data.expa=
nd("${SDK_ARCH}_${BASE_PACKAGE_ARCH}", d), d)
> =C2=A0 =C2=A0 else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('SSTATE_MANMACH', bb.data.exp=
and("${MACHINE}", d), d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('SSTATE_MANMACH', bb.data.exp=
and("${STAGING_MACHNAME}", d), d)
>
> =C2=A0 =C2=A0 # These classes encode staging paths into their scripts dat=
a so can only be
> =C2=A0 =C2=A0 # reused if we manipulate the paths
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index fef6457..c2e4e50 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -91,7 +91,7 @@ SSTATETASKS +=3D "do_populate_sysroot"
> =C2=A0do_populate_sysroot[sstate-name] =3D "populate-sysroot"
> =C2=A0do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}"
> =C2=A0do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST}/"
> -do_populate_sysroot[stamp-extra-info] =3D "${MACHINE}"
> +do_populate_sysroot[stamp-extra-info] =3D "${STAGING_MACHNAME}"
>
> =C2=A0python do_populate_sysroot_setscene () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sstate_setscene(d)
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b6236e..141b942 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -300,7 +300,8 @@ STAGING_DATADIR_NATIVE =3D "${STAGING_DIR_NATIVE}${da=
tadir_native}"
>
> =C2=A0# This should really be MULTIMACH_HOST_SYS but that breaks "all" an=
d machine
> =C2=A0# specific packages - hack around it for now.
> -STAGING_DIR_HOST =3D "${STAGING_DIR}/${MACHINE}"
> +STAGING_MACHNAME ??=3D "${MACHINE}"
> +STAGING_DIR_HOST =3D "${STAGING_DIR}/${STAGING_MACHNAME}"
> =C2=A0STAGING_BINDIR =3D "${STAGING_DIR_HOST}${bindir}"
> =C2=A0STAGING_LIBDIR =3D "${STAGING_DIR_HOST}${libdir}"
> =C2=A0STAGING_INCDIR =3D "${STAGING_DIR_HOST}${includedir}"
> @@ -312,7 +313,7 @@ STAGING_PYDIR =3D "${STAGING_DIR}/lib/python2.4"
>
> =C2=A0# This should really be MULTIMACH_TARGET_SYS but that breaks "all" =
and machine
> =C2=A0# specific packages - hack around it for now.
> -STAGING_DIR_TARGET =3D "${STAGING_DIR}/${MACHINE}"
> +STAGING_DIR_TARGET =3D "${STAGING_DIR}/${STAGING_MACHNAME}"
> =C2=A0STAGING_DIR_TCBOOTSTRAP =3D "${STAGING_DIR_TARGET}-tcbootstrap"
>
> =C2=A0# Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are usi=
ng
> @@ -344,8 +345,8 @@ STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/kernel"
>
> =C2=A0IMAGE_ROOTFS =3D "${WORKDIR}/rootfs"
> =C2=A0IMAGE_BASENAME =3D "${PN}"
> -IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
> -IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
> +IMAGE_NAME =3D "${IMAGE_BASENAME}-${STAGING_MACHNAME}-${DATETIME}"
> +IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${STAGING_MACHNAME}"
>
> =C2=A0# This option allows for a precentage overage of the actaul image s=
ize rather than a
> =C2=A0# fixed extra space
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distr=
o/include/tclibc-uclibc.inc
> index 27f6ec6..e84da81 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -20,11 +20,7 @@ CXXFLAGS +=3D "-fvisibility-inlines-hidden"
>
> =C2=A0IMAGE_LINGUAS =3D ""
>
> -DEPLOY_DIR_IMAGE =3D "${TMPDIR}/deploy/images"
> -DEPLOY_DIR_append =3D "-uclibc"
> -STAGING_DIR_TARGET_append =3D "-uclibc"
> -STAGING_DIR_HOST_append =3D "-uclibc"
> -SSTATE_MANIFESTS_append =3D "-uclibc"
> +STAGING_MACHNAME =3D "${MACHINE}-uclibc"

should we use ${MACHINE}/${TCLIBC} in all those places instead of
defining STAGING_MACHNAME

>
> =C2=A0LIBC_DEPENDENCIES =3D "\
> =C2=A0 =C2=A0 uclibc \
>
>


