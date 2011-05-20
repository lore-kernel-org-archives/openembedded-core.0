Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QNUCE-0002TJ-5E
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 20:13:10 +0200
Received: by vws2 with SMTP id 2so3307362vws.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=1FxfDloMCpGewy5Z1LX5bee04S/OrvORaRORmE3cuos=;
	b=f4eXMsFLKE1nWKGy7N0jD9w8q7zql8vVZQsyhfSzx/YWdDzHZzmoLCoszsyI2pn75r
	pbbXsOVVJ4KcRM2WeWTk4oZHNNbJuDT6dRyYSNCKXaBLbD3EraRhVsYMMLfkrXt2T0Xf
	M8pi6xBPh9ktBs9p5UV2Nc4FFv9L9Th+FvljA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=D6HbEhTyZYQycmdU1loU/7qMArk0X1JLdBwwI7WFAsyK0vmLPD7z2y9dI1RtzcOoe3
	fZVWGgpRwRtMrZksyx43ouFKLqxqAj2eGiERKlF8NPsvomzPUTyLJArUHoMM+/TKv+vc
	AMgOLSlR9ljqyJ0TsHZWXFgKzzzzW01P8i1Mk=
Received: by 10.52.32.102 with SMTP id h6mr6498136vdi.34.1305915012419; Fri,
	20 May 2011 11:10:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Fri, 20 May 2011 11:09:52 -0700 (PDT)
In-Reply-To: <1305914753.3424.670.camel@rex>
References: <cover.1305752660.git.chris_larson@mentor.com>
	<b7564c32452e9ce33d9790465b986471ef5a3cba.1305752660.git.chris_larson@mentor.com>
	<1305914753.3424.670.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 May 2011 11:09:52 -0700
X-Google-Sender-Auth: LdK5lDQsRuv6jeQkB3FBUKNKO-E
Message-ID: <BANLkTinNWWa326y1rS8eWNkXrYYaSqTh8Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/5] image.bbclass: switch to OE's IMAGE_FEATURES
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
X-List-Received-Date: Fri, 20 May 2011 18:13:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2011 at 11:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-18 at 14:06 -0700, Chris Larson wrote:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> Currently, all image features are assumed to be package groups defined w=
ith
>> oe.packagegroup (PACKAGE_GROUP_<group> =3D "<list of packages>").
>>
>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
>> ---
>> =C2=A0meta/classes/core-image.bbclass | =C2=A0112 ++++++++++++++--------=
-----------------
>> =C2=A0meta/classes/image.bbclass =C2=A0 =C2=A0 =C2=A0| =C2=A0 41 +++++++=
+++++++-
>> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A01 +
>> =C2=A03 files changed, 79 insertions(+), 75 deletions(-)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- SDK
>> @@ -26,75 +24,43 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=
=3D3f40d7994397109285ec7b81fdeb3
>> =C2=A0# - nfs-server =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- NFS server (exp=
orts / over NFS to everybody)
>> =C2=A0# - ssh-server-dropbear - SSH server (dropbear)
>> =C2=A0# - ssh-server-openssh =C2=A0- SSH server (openssh)
>> -# - dev-pkgs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- development pac=
kages
>> -# - dbg-pkgs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- debug packages
>> =C2=A0#
>
> I like the patch, there are just two things which bother me a little.
> Firstly, if I understand correctly and haven't missed anything,
> "dev-pkgs" becomes "dev" with this change?
>
> A quick grep shows users of this such as:
>
> recipes-core/images/core-image-minimal-dev.bb:IMAGE_FEATURES +=3D "dev-pk=
gs"
> recipes-extended/images/core-image-lsb-sdk.bb:IMAGE_FEATURES +=3D "apps-c=
onsole-core tools-debug tools-profile tools-sdk dev-pkgs ssh-server-openssh=
"
> recipes-extended/images/core-image-lsb-dev.bb:IMAGE_FEATURES +=3D "apps-c=
onsole-core dev-pkgs ssh-server-openssh"
> recipes-sato/images/core-image-sato-dev.bb:IMAGE_FEATURES +=3D "apps-cons=
ole-core ${SATO_IMAGE_FEATURES} dev-pkgs"
> recipes-sato/images/core-image-sato-sdk.bb:IMAGE_FEATURES +=3D "apps-cons=
ole-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev-pkg=
s qt4-pkgs"
>
> and I'd expect the changelog to at least mention it and correct this.
>
> I'm also thinking IMAGE_FEATURES =3D "dev" doesn't really indicate what i=
t
> means very clearly which is why dev-pkgs was originally used...

Good points, that's fair enough. I only went with 'dev' for
compatibility with upstream OE. I'm not opposed to switching to
dev-pkgs. Would you like me to do that and resubmit, with the other
issues addressed?

>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -11,8 +11,45 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> =C2=A0# "export IMAGE_BASENAME" not supported at this time
>> =C2=A0IMAGE_BASENAME[export] =3D "1"
>> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL}"
>> -PACKAGE_INSTALL_ATTEMPTONLY ?=3D ""
>> +
>> +PACKAGE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages('${I=
MAGE_FEATURES}'.split(), d))}"
>> +PACKAGE_INSTALL_ATTEMPTONLY =3D "${@' '.join(oe.packagegroup.optional_p=
ackages('${IMAGE_FEATURES}'.split(), d))}"
>> +RDEPENDS +=3D "${@' '.join(oe.packagegroup.active_packages('${IMAGE_FEA=
TURES}'.split(), d))}"
>
> I also noticed this patch changes things so PACKAGE_INSTALL_ATTEMPTONLY
> is used for the dev/doc/dbg packages. I'm not sure its a major issue but
> it is a change in behaviour and I'd have expected it in the commit
> message.

Ah, that's my mistake then, I didn't realize the behavior was
different in the current implementation. I just figured some packages
might not have dev/doc/dbg, so it should be nonfatal to miss them. We
may also need to make sure rpm/deb both handle attemptonly properly,
as upstream's did not. I'll add this to the commit message, unless you
think they shouldn't be optional? I'm inclined to prefer it this way,
as, iirc, the depchain stuff uses recommends rather than depends.
(though i may be remembering wrong?)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


