Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QL7gI-0004CL-OC
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 07:46:28 +0200
Received: by yia13 with SMTP id 13so1090203yia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=G9OuatwVeBGskfO/HPS9O3Q/eycHlAorBKRjkCtzWHQ=;
	b=G58884nqndfHQYIw9N2SWMZzn5KVRbxplMe/Kyq8Cz6y80gG7kid/pJbYVlTNYmwb7
	yRmTX3qrY5AG6qy7KWcSgI5ffDEpwWlnED86uvLJ8vHX/5SOjYAsqtrwLZGjbcFrWInZ
	xiaCTURKbfATU2Pw/a2VvK/vuREJEIg26tfjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=crjpvclm88RV4V/XZHzmZQr/6fbdcfwomiYyDuPGPHHqB3zbgghy7/cQwBL168JKbZ
	YlNDeXW3cNtRzmbtRQTlLRIZkRdnWvTVWNqlnmw3wWsx6ln6hljHFtRrr1iFLc50YUvk
	YNsZopzJcBT2NN+YydKk3F3M9WORAGXJApk9k=
MIME-Version: 1.0
Received: by 10.91.93.11 with SMTP id v11mr1953514agl.157.1305351810359; Fri,
	13 May 2011 22:43:30 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Fri, 13 May 2011 22:43:30 -0700 (PDT)
In-Reply-To: <33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>
Date: Sat, 14 May 2011 01:43:30 -0400
Message-ID: <BANLkTinVmZDFvLVz9+pf3m9O=CeHRx4ddA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 10/10] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Sat, 14 May 2011 05:46:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 7:38 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> Perform a quick sanity check to be able to direct users to configure
> git.sendemail if they haven't yet.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> =A0scripts/send-pull-request | =A0 15 +++++++++++++++
> =A01 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index f94596f..2ccb8e8 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -38,6 +38,18 @@ harvest_recipients()
> =A0 =A0 =A0 =A0unset IFS
> =A0}
>
> +check_git_sendemail_config()
> +{
> + =A0 =A0 =A0 GIT_SMTP=3D$(git config sendemail.smtpserver)
> + =A0 =A0 =A0 GIT_FROM=3D$(git config sendemail.from)
> + =A0 =A0 =A0 if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "ERROR: git sendemail is not configure=
d."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Please read GIT-SEND-EMAIL(1) and con=
figure:"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.smtpserver"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.from"

I was going to ask for this to be optional, since I always pass the smtp
settings on the command line .. but then I realized that I invoke git send-=
email
directly anyway, so I don't need it to be optional. :)

Regardless, reading this from git config is good idea, so the above is
only a comment.

Bruce

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1
> + =A0 =A0 =A0 fi
> +}
>
> =A0# Parse and verify arguments
> =A0while getopts "ahp:t:" OPT; do
> @@ -67,6 +79,9 @@ while getopts "ahp:t:" OPT; do
> =A0 =A0 =A0 =A0esac
> =A0done
>
> +# Abort early if git-send-email is not properly configured
> +check_git_sendemail_config
> +
> =A0if [ -z "$PDIR" ]; then
> =A0 =A0 =A0 =A0echo "ERROR: you must specify a pull-dir."
> =A0 =A0 =A0 =A0usage
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


