Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TBnHC-0004t6-Fv
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:46:46 +0200
Received: by lban1 with SMTP id n1so1040510lba.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=/BjQMx9tFkSp0DsYJL2qG4Rh7zd26BZny5v6dCss/HI=;
	b=geUkCyx/mX9lfKh6lkOSSOschrxD7Pm/RgvD5rbg0DZfoiKrF3RdhXFRNijMgnW4rQ
	Mf3b1Tk/bLXbesPyYhfYuxagxY1aAJt0mbPiQxdiFDFicBpUiNfOO9x7LVsE/t6h3S4v
	SPljBwo+0LnwaZ0pmqC8khPmfay1aEH7T5mN3BE0JcvMfQ1N+CfOfhXP0qm2ltcEiIjF
	pTuPAPeOU/w/5Jcn6FoFUoad8cSQ8IURv0JlPcsMprHfQtXMThhZnLzARL6KSTM7ga4t
	V7Vxa+/7iT60i4Z+AqxCVQ5OS3nbHrDQx3I3K5U/3UywCFz9HDRU7dFUXb47mGCymHqA
	PyFA==
Received: by 10.112.101.6 with SMTP id fc6mr7372198lbb.110.1347456851078; Wed,
	12 Sep 2012 06:34:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 12 Sep 2012 06:33:50 -0700 (PDT)
In-Reply-To: <20120912095652.GA696@giant>
References: <20120912095652.GA696@giant>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Sep 2012 06:33:50 -0700
X-Google-Sender-Auth: 5i1o-OnBGS0ohdxPzUqzV-6hSOs
Message-ID: <CABcZANmHAsYa1gniWq0e3mBvg0+X9=AZL7Mnd3C0mbHGGLR1Cw@mail.gmail.com>
To: =?UTF-8?Q?Bj=C3=B6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bug: LDFLAGS is not cleared for kernel devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 13:46:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 2:56 AM, Bj=C3=B6rn Stenberg <bjst@enea.com> wrote:
> I couldn't figure out where to properly patch this, so I'll just raise th=
e issue:
>
> LDFLAGS is configured in bitbake.conf as linker flags to be passed to gcc=
, not to ld. Hence it uses the -Wl prefix.
>
> The linux kernel build system inherits LDFLAGS from the environment and p=
asses it directly to 'ld', in conflict with the bitbake view. This problem =
is avoided by clearing LDFLAGS and some other enviroment variables in kerne=
l.bbclass:kernel_do_compile().
>
> However this clearing is not done for do_devshell, resulting in errors wh=
en trying to compile the kernel in devshell:

We could unexport the appropriate variables rather than unsetting them
in the task.
E.g.
LDFLAGS[unexport] =3D "1"
--=20
Christopher Larson


