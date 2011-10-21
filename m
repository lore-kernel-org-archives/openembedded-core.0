Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH8Mj-0006TJ-My
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:14:02 +0200
Received: by pzk33 with SMTP id 33so9011636pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=4kJ3uFgJiHAQeRGDvsY7wKTMDbA+QB2NqcM2phWreOQ=;
	b=rhdVc6m6ljzfQnuszHNKGC+oKSkGWGu8Xs/cQ+CBoK+KbKfAp9xyikTQ/Fv8kTU4Hd
	Vo3lwXY/TP90Weh41vyp3UnNBiOjpT7aC6zEe8/yUk/VxS9+JRdBaxfAilaLNSzTYkQH
	fsmxX4pniDxRzRJyJ1M08yXqt1df9/K1l8dgs=
Received: by 10.68.17.193 with SMTP id q1mr25264045pbd.98.1319177280448; Thu,
	20 Oct 2011 23:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 23:07:30 -0700 (PDT)
In-Reply-To: <5980062f84b228fa8977cf3f14c064192ba91eee.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<5980062f84b228fa8977cf3f14c064192ba91eee.1319167843.git.otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 23:07:30 -0700
Message-ID: <CAMKF1sqpvqZ4cOg4jceaB9P6HMTcZqhYVFG1SqZxN4Um3G1fAA@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Oct 2011 06:14:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 8:31 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =C2=A0meta/classes/bootimg.bbclass | =C2=A0 44 +++++++++++++++++++++-----=
---------------
> =C2=A01 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index a5ba3cf..eecc2bf 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -48,34 +48,36 @@ SYSLINUXMENU =3D "${HDDDIR}/menu"
> =C2=A0inherit syslinux
>
> =C2=A0build_boot_bin() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${HDDDIR}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage=
 \
> - =C2=A0 =C2=A0 =C2=A0 ${HDDDIR}/vmlinuz
> + =C2=A0 =C2=A0 =C2=A0 # Create an HDD image
> + =C2=A0 =C2=A0 =C2=A0 if [ "${NOHDD}" !=3D "1" ] ; then

please document this new variable NOHDD somewhere so people know how
and when to use it

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${HDDDIR}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${STAG=
ING_DIR_HOST}/kernel/bzImage \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${HDDDIR}/vmlinuz
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${INIT=
RD} ${HDDDIR}/initrd
> - =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n "${INITRD}" ] =
&& [ -s "${INITRD}" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${INITRD} ${HDDDIR}/init=
rd
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${ROOT=
FS} ${HDDDIR}/rootfs.img
> - =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n "${ROOTFS}" ] =
&& [ -s "${ROOTFS}" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${ROOTFS} ${HDDDIR}/root=
fs.img
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>
> - =C2=A0 =C2=A0 =C2=A0 install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.=
sys ${HDDDIR}/ldlinux.sys
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 444 ${STAGI=
NG_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
>
> - =C2=A0 =C2=A0 =C2=A0 # Do a little math, bash style
> - =C2=A0 =C2=A0 =C2=A0 #BLOCKS=3D`du -s ${HDDDIR} | cut -f 1`
> - =C2=A0 =C2=A0 =C2=A0 BLOCKS=3D`du -bks ${HDDDIR} | cut -f 1`
> - =C2=A0 =C2=A0 =C2=A0 SIZE=3D`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Do a little math, ba=
sh style
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BLOCKS=3D`du -bks ${HD=
DDIR} | cut -f 1`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIZE=3D`expr $BLOCKS +=
 ${BOOTIMG_EXTRA_SPACE}`
>
> - =C2=A0 =C2=A0 =C2=A0 mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
> - =C2=A0 =C2=A0 =C2=A0 -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdosfs -n ${BOOTIMG_V=
OLUME_ID} -d ${HDDDIR} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.hddimg $SIZE
>
> - =C2=A0 =C2=A0 =C2=A0 syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
> - =C2=A0 =C2=A0 =C2=A0 chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syslinux ${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.hddimg
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 644 ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.hddimg
>
> - =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOY_DIR_IMAGE}
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddim=
g
> - =C2=A0 =C2=A0 =C2=A0 ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${I=
MAGE_LINK_NAME}.hddimg
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOY_DIR_IMAGE}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${DEPLOY_DIR_IMA=
GE}/${IMAGE_LINK_NAME}.hddimg
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${IMAGE_NAME}.hd=
dimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
> + =C2=A0 =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#Create an ISO if we have an INITRD
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n "${INITRD}" ] && [ -s "${INITRD}" ] &&=
 [ "${NOISO}" !=3D "1" ] ; then
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


