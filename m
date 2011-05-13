Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QL25R-00037m-Mf
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:48:01 +0200
Received: by eye27 with SMTP id 27so877002eye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 16:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=fgWl4LsDjXk37GwZJRa21vUGmLuzugWU0HeLIqPlDho=;
	b=qA+FNYR141ns621TcML0nd1ddT7DT6hQFDUFH7W075+cBJoKFeOX/6JnttHPUv2rDl
	cnGkzfD9saMP8Pz0CqlGrlM4vSv7CE433+nRWhBhnNVDyjR+8BD3s+lPJiXZ/9FBpdds
	6rI0dxlnjhxSgc47eGXirP3AnOR/2vjs+ZjVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=X3HWw0Ohpjpc5TpFoNJQbqI3wdmvGjL5cC8pffeIP9BAaVKJM7Gu6VNH52QK1QplMv
	+C3YpD7mCZXxLnfxxhiaq9cZ+8DzKwqvTTYlev5N0PgvjNpFvgV4rtva+UlDQF5nEW/p
	C6abpFb+s8TZ583zDPdd/fxhPO0IwApxT0P7Q=
Received: by 10.14.0.133 with SMTP id 5mr869828eeb.144.1305330312213; Fri, 13
	May 2011 16:45:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Fri, 13 May 2011 16:44:42 -0700 (PDT)
In-Reply-To: <502617737ac9c95e9bd4a172cb8e70a24be1b14b.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<502617737ac9c95e9bd4a172cb8e70a24be1b14b.1305329659.git.dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 May 2011 16:44:42 -0700
Message-ID: <BANLkTiku_-qK483An7J9RNEs2xoEcPcHmA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 09/10] send-pull-request: don't send all patches to everyone even with -a
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
X-List-Received-Date: Fri, 13 May 2011 23:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 4:38 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> Rather than sending every patch to every recipient of the entire series w=
hen
> -a is used, only send the cover letter to everyone and use git's
> --signed-off-by-cc feature to generate an auto cc list for the individual
> patches.
>
> Using git to harvest the Cc list means only collecting Signed-off-by and =
Cc
> lines, rather than the more generic *-by lines previously. This is a fair
> trade-off for significantly reduced complexity. If users want to add Acke=
d-by
> and Tested-by lines and want to use the -a feature, they should include t=
hose
> recipients as Cc lines as well.
>
> Now that we rely on git for auto-cc for the individual patches,
> make sure the user is prompted before sending each patch by forcing
> --confirm=3Dalways.

it can be tedious for large patchsets say 30-40 patches. and moreover
if something is wrong in middle of sending series of patches say a CC
list is wrong then what to do as some of the patches would have
already been sent.  So I would suggest a dry pass
where it will show you the email headers and CC list so sender can be
assured that all is well
and then he can send them all at once.

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =C2=A0scripts/send-pull-request | =C2=A0 60 +++++++++++++++++++++++++++--=
----------------
> =C2=A01 files changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index b294d35..f94596f 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -4,33 +4,34 @@ AUTO=3D0
> =C2=A0# Prevent environment leakage to these vars.
> =C2=A0unset TO
> =C2=A0unset CC
> +unset AUTO_CC
>
> =C2=A0usage()
> =C2=A0{
> =C2=A0cat <<EOM
> =C2=A0Usage: $(basename $0) [-h] [-a] [[-t email]...] -p pull-dir
> =C2=A0 -t email =C2=A0 =C2=A0 Explicitly add email to the recipients
> - =C2=A0-a =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Automatically harvest recip=
ients from "*-by: email" lines
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in the patches in the =
pull-dir
> + =C2=A0-a =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Automatically harvest recip=
ients from Cc and Signed-off-by lines
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in the patches in the =
pull-dir. These will be used on a per
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch basis. The cover=
-letter will be sent to all addresses.
> =C2=A0 -p pull-dir =C2=A0Directory containing summary and patch files
> =C2=A0EOM
> =C2=A0}
>
> -# Collect To and CC addresses from the patch files if they exist
> -# $1: Which header to add the recipients to, "TO" or "CC"
> -# $2: The regex to match and strip from the line with email addresses
> +# Collect addresses from a patch into AUTO_CC
> +# $1: a patch file
> =C2=A0harvest_recipients()
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 TO_CC=3D$1
> - =C2=A0 =C2=A0 =C2=A0 REGX=3D$2
> + =C2=A0 =C2=A0 =C2=A0 PATCH=3D$1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export IFS=3D$',\n'
> - =C2=A0 =C2=A0 =C2=A0 for PATCH in $PDIR/*.patch; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Grab To addresses
> + =C2=A0 =C2=A0 =C2=A0 for REGX in "^[Cc][Cc]: *" "^[Ss]igned-[Oo]ff-[Bb]=
y: *"; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for EMAIL in $(sed=
 '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ "$TO_CC" =3D=3D "TO" ] && [ "${TO/$EMAIL/}" =3D=3D "$TO" ] && [=
 -n "$EMAIL" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z "$TO" ]; then TO=3D$EMAIL; else =
TO=3D"$TO,$EMAIL"; fi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 elif [ "$TO_CC" =3D=3D "CC" ] && [ "${CC/$EMAIL/}" =3D=3D "$CC" ] &&=
 [ -n "$EMAIL" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z "$CC" ]; then CC=3D$EMAIL; else =
CC=3D"$CC,$EMAIL"; fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ "${AUTO_CC/$EMAIL/}" =3D=3D "$AUTO_CC" ] && [ -n "$EMAIL" ]; th=
en
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z "$AUTO_CC" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AUTO_CC=3D$E=
MAIL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AUTO_CC=3D"$=
AUTO_CC,$EMAIL";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> @@ -84,13 +85,11 @@ for TOKEN in SUBJECT BLURB; do
> =C2=A0done
>
>
> -# Harvest emails from the generated patches and populate the TO and CC v=
ariables
> -# In addition to To and CC headers/lines, the common Signed-off-by, Test=
ed-by,
> -# etc. (*-by) will be added to CC.
> +# Harvest emails from the generated patches and populate AUTO_CC.
> =C2=A0if [ $AUTO -eq 1 ]; then
> - =C2=A0 =C2=A0 =C2=A0 harvest_recipients TO "^[Tt][Oo]: *"
> - =C2=A0 =C2=A0 =C2=A0 harvest_recipients CC "^[Cc][Cc]: *"
> - =C2=A0 =C2=A0 =C2=A0 harvest_recipients CC "^[A-Z][A-Za-z-]*-[Bb][Yy]: =
*"
> + =C2=A0 =C2=A0 =C2=A0 for PATCH in $PDIR/*.patch; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 harvest_recipients $PA=
TCH
> + =C2=A0 =C2=A0 =C2=A0 done
> =C2=A0fi
>
> =C2=A0AUTO_TO=3D"$(git config sendemail.to)"
> @@ -102,7 +101,7 @@ if [ -n "$AUTO_TO" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0fi
>
> -if [ -z "$TO" ] && [ -z "$CC" ]; then
> +if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "ERROR: you have not specified any recipi=
ents."
> =C2=A0 =C2=A0 =C2=A0 =C2=A0usage
> =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1
> @@ -114,7 +113,8 @@ cat <<EOM
> =C2=A0The following patches:
> =C2=A0$(for PATCH in $PDIR/*.patch; do echo " =C2=A0 =C2=A0$PATCH"; done)
>
> -will now be sent via the git send-email command.
> +will now be sent via the git send-email command. Git will prompt you bef=
ore
> +sending any email.
>
> =C2=A0EOM
> =C2=A0echo "Continue? [y/N] "
> @@ -124,11 +124,23 @@ if [ "$cont" =3D=3D "y" ] || [ "$cont" =3D=3D "Y" ]=
; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=3D0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export IFS=3D$','
> =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_TO=3D$(for R in $TO; do echo -n "--to=3D'$=
R' "; done)
> - =C2=A0 =C2=A0 =C2=A0 GIT_CC=3D$(for R in $CC; do echo -n "--cc=3D'$R' "=
; done)
> + =C2=A0 =C2=A0 =C2=A0 GIT_CC=3D$(for R in $AUTO_CC; do echo -n "--cc=3D'=
$R' "; done)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unset IFS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for PATCH in $PDIR/*patch; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We harvest the email=
s manually, so force git not to.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval "git send-email $=
GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=3Dall $PATCH"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $AUTO -eq 1 ]; th=
en
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ $PATCH =3D=3D "$CL" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Send the cover letter to every recipie=
nt, both
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # specified as well as harvested.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval "git send-email $GIT_TO $GIT_CC --c=
onfirm=3Dalways --no-chain-reply-to --suppress-cc=3Dall $PATCH"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Send the patch to the specified recipi=
ents and
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # those git finds in this specific patch=
.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval "git send-email $GIT_TO --confirm=
=3Dalways --no-chain-reply-to --signed-off-by-cc $PATCH"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # Only send to the explicitly specified recipients
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 eval "git send-email $GIT_TO --confirm=3Dalways --no-chain-reply-to =
--suppress-cc=3Dall $PATCH"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -eq 1 ]; t=
hen
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR=3D1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> --
> 1.7.1
>
>


