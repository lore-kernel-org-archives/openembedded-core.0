Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMNlS-000130-9W
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:08:58 +0200
Received: by ewy5 with SMTP id 5so211036ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=E+QsPOovsb3SjHeJN3xKb1fNogpu29y05fZ3eTgNFGo=;
	b=PKx9Ve+JGHeQSMtQZDfPV5Yj6TpPBO/RE0BoETXSLwJJuwpBY09ZfVfWgDjr/6e97/
	NidOFVimYudB71oRIYHM3SSXHnEJQLPopmjyOYSEolz6NDD42OQswrkfFXGPcO9LgRuV
	SB4nBw1kxd4bDyRz3ZMp8wG51BGP+8SRtCACU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YGDV24mKvWfitJzMJHk3w+EwUCDGlGuM+uIIgJEgo3R2oCJ7nYAsZNVQdy6VACh2iJ
	PEXGBXbjH0wn3c0rljzx5C7C+WqO9FCG4+ziAXTIHrfu7Rr8i26M0+vBWOhFSbmANKxC
	SqhLXwCLBOkedvXvd5Zn9MkiL7GNnU9wHCh2w=
Received: by 10.14.9.18 with SMTP id 18mr299349ees.236.1305651961177; Tue, 17
	May 2011 10:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 10:05:30 -0700 (PDT)
In-Reply-To: <442f31a687cb0362e9e0a3492eed6bb4ad5d8366.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
	<eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
	<442f31a687cb0362e9e0a3492eed6bb4ad5d8366.1305584418.git.dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 10:05:30 -0700
Message-ID: <BANLkTinDQ5rsDKuaXcyYxPnCoGnMNQ+7=Q@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v2 14/15] send-pull-request: streamline git-send-email usage
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
X-List-Received-Date: Tue, 17 May 2011 17:08:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 3:26 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> The script was sending one patch at a time, which defeats the internal
> confirmation mechanism of git-send-email (which would otherwise allow
> the user to send all patches or abort immediately).
>
> Rework the sending logic to use no more than two commands. Use two
> commands when the cover letter is to be sent to all recipients with
> the -a argument. Otherwise, send all patches via the same command.
>
> The script duplicates git's send confirmation, eliminate that.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Reported-by: Khem Raj <raj.khem@gmail.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Joshua Lock <josh@linux.intel.com>
> ---
> =C2=A0scripts/send-pull-request | =C2=A0 68 +++++++++++++++++------------=
---------------
> =C2=A01 files changed, 26 insertions(+), 42 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 21eb302..8d0bd34 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -1,6 +1,7 @@
> =C2=A0#!/bin/bash
> =C2=A0AUTO=3D0
> =C2=A0AUTO_CL=3D0
> +GITSOBCC=3D""
>
> =C2=A0# Prevent environment leakage to these vars.
> =C2=A0unset TO
> @@ -59,10 +60,11 @@ while getopts "achp:t:" OPT; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case $OPT in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0a)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AUTO_CL=3D1
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AUTO=3D1
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fall through to incl=
ude -c
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;&
> =C2=A0 =C2=A0 =C2=A0 =C2=A0c)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AUTO=3D1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GITSOBCC=3D"--signed-o=
ff-by-cc"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0h)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage
> @@ -130,48 +132,30 @@ if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
> =C2=A0fi
>
>
> -# Generate report for the user and require confirmation before sending
> -cat <<EOM
> -The following patches:
> -$(for PATCH in $PDIR/*.patch; do echo " =C2=A0 =C2=A0$PATCH"; done)
> +# Convert the collected addresses into git-send-email argument strings
> +export IFS=3D$','
> +GIT_TO=3D$(for R in $TO; do echo -n "--to=3D'$R' "; done)
> +GIT_CC=3D$(for R in $AUTO_CC; do echo -n "--cc=3D'$R' "; done)
> +unset IFS
>
> -will now be sent via the git send-email command. Git will prompt you bef=
ore
> -sending any email.
>
> -EOM
> -echo "Continue? [y/N] "
> -read cont
> -
> -if [ "$cont" =3D=3D "y" ] || [ "$cont" =3D=3D "Y" ]; then
> - =C2=A0 =C2=A0 =C2=A0 ERROR=3D0
> - =C2=A0 =C2=A0 =C2=A0 export IFS=3D$','
> - =C2=A0 =C2=A0 =C2=A0 GIT_TO=3D$(for R in $TO; do echo -n "--to=3D'$R' "=
; done)
> - =C2=A0 =C2=A0 =C2=A0 GIT_CC=3D$(for R in $AUTO_CC; do echo -n "--cc=3D'=
$R' "; done)
> - =C2=A0 =C2=A0 =C2=A0 unset IFS
> - =C2=A0 =C2=A0 =C2=A0 for PATCH in $PDIR/*patch; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $AUTO -eq 1 ]; th=
en
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ $PATCH =3D=3D "$CL" ] && [ $AUTO_CL -eq 1 ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Send the cover letter to every recipie=
nt, both
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # specified as well as harvested.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval "git send-email $GIT_TO $GIT_CC --c=
onfirm=3Dalways --no-chain-reply-to --suppress-cc=3Dall $PATCH"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Send the patch to the specified recipi=
ents and
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # those git finds in this specific patch=
.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval "git send-email $GIT_TO --confirm=
=3Dalways --no-chain-reply-to --signed-off-by-cc $PATCH"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # Only send to the explicitly specified recipients
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 eval "git send-email $GIT_TO --confirm=3Dalways --no-chain-reply-to =
--suppress-cc=3Dall $PATCH"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -eq 1 ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ERROR=3D1
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 done
> -
> - =C2=A0 =C2=A0 =C2=A0 if [ $ERROR -eq 1 ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "ERROR: Failed to=
 send one or more messages."
> +# Handoff to git-send-email. It will perform the send confirmation.
> +PATCHES=3D$(echo $PDIR/*.patch)
> +if [ $AUTO_CL -eq 1 ]; then
> + =C2=A0 =C2=A0 =C2=A0 # Send the cover letter to every recipient, both s=
pecified as well as
> + =C2=A0 =C2=A0 =C2=A0 # harvested. Then remove it from the patches list.
> + =C2=A0 =C2=A0 =C2=A0 eval "git send-email $GIT_TO $GIT_CC --confirm=3Da=
lways --no-chain-reply-to --suppress-cc=3Dall $CL"
> + =C2=A0 =C2=A0 =C2=A0 if [ $? -eq 1 ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "ERROR: failed to=
 send cover-letter with automatic recipients."
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> -else
> - =C2=A0 =C2=A0 =C2=A0 echo "Send aborted."
> + =C2=A0 =C2=A0 =C2=A0 PATCHES=3D${PATCHES/"$CL"/}
> =C2=A0fi
>
> +# Send the patch to the specified recipients and, if -c was specified, t=
hose git
> +# finds in this specific patch.
> +eval "git send-email $GIT_TO --confirm=3Dalways --no-chain-reply-to $GIT=
SOBCC $PATCHES"
> +if [ $? -eq 1 ]; then
> + =C2=A0 =C2=A0 =C2=A0 echo "ERROR: failed to send patches."
> + =C2=A0 =C2=A0 =C2=A0 exit 1
> +fi


now it will ask the usual git confirmation once for all the patches
are now mentioned on the commandline instead of a loop.
So I can say 'a'  all in the confirmation and then it will take that
to send all patches. Is my understanding right ?

If so then it seems ok to me

> --
> 1.7.1
>
>


