Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6KK-0007EJ-0T
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:41:48 +0100
Received: by lahd3 with SMTP id d3so1247219lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5it61vm+r5GGNbEH3GbM9++oAliFvzBTjfKuAWfU9uE=;
	b=YP6JGCu5oT97HlO2z+4dGfhW2Ka6mM+dM9QaOoLfUQKZ5sLwBpaZvwx0qqdkasvkg1
	IuVYPd3kAHIciY/gIk2jsg0x3jHv6fRV8j/JNqArh9FL5ueRa4Q2hKQPcuU2uIrn7w4Z
	O0/OPOreNxB1rZVBtS1F8rgCHNvyBz5w7Ui/0=
Received: by 10.152.145.233 with SMTP id sx9mr5780747lab.6.1323459293344; Fri,
	09 Dec 2011 11:34:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:34:22 -0800 (PST)
In-Reply-To: <abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:34:22 -0800
Message-ID: <CAMKF1spMGdCj6-hU96gfvvQOgUwOerRtNGgFZk=5jDhAD96tTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Fri, 09 Dec 2011 19:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 7:40 AM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =C2=A0scripts/send-pull-request | =C2=A0 21 ++++++++++++---------
> =C2=A01 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index be13009..8d51ce2 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -108,15 +108,18 @@ fi
>
>
> =C2=A0# Verify the cover letter is complete and free of tokens
> -CL=3D"$PDIR/0000-cover-letter.patch"
> -for TOKEN in SUBJECT BLURB; do
> - =C2=A0 =C2=A0 =C2=A0 grep -q "*** $TOKEN HERE ***" "$CL"
> - =C2=A0 =C2=A0 =C2=A0 if [ $? -eq 0 ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "ERROR: Please ed=
it $CL and try again (Look for '*** $TOKEN HERE ***')."
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> - =C2=A0 =C2=A0 =C2=A0 fi
> -done
> -
> +if [ -e $PDIR/0000-cover-letter.patch ]; then
> + =C2=A0 =C2=A0 =C2=A0 CL=3D"$PDIR/0000-cover-letter.patch"
> + =C2=A0 =C2=A0 =C2=A0 for TOKEN in SUBJECT BLURB; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep -q "*** $TOKEN HE=
RE ***" "$CL"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -eq 0 ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "ERROR: Please edit $CL and try again (Look for '*** $TOKEN HER=
E ***')."
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 exit 1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 done
> +else
> + =C2=A0 =C2=A0 =C2=A0 echo "WARNING: No cover letter will be send."
> +fi
>
> =C2=A0# Harvest emails from the generated patches and populate AUTO_CC.
> =C2=A0if [ $AUTO_CL -eq 1 ]; then
> --
> 1.7.2.5
>
>


why do you want to avoid cover letter ? or is it for other layers
other than oe-core


