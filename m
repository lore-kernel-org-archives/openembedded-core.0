Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSHkT-0004uH-Db
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 03:00:53 +0200
Received: by wgbdr1 with SMTP id dr1so778621wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=hw0/t99PrXcoAaZvf5g3uVSej3fQbL6Hu6xTlZW4Gz4=;
	b=c/5EazuY9/SrJACM5ifJsn9CP+Rs6agu3sbu3otu1vIJrLqjC86qI3sDJS02m9hu7j
	QObtCb0/dLBYcQnbbOvwt2kD9Fr5yYfoxPAI0pqsBu2cLNEmq4sIRIN6mdypoiUCV58M
	aJV40zjwnNS4ifCviNZ8uwWT74OWS4VB6a+j2ccW/SwuyMaQeWftcdZtLiANin1XyWCL
	niwBS2PXERqhKSJiUFoWK1nlhytuMtsSXVqTU6uJ3Awq9WBZwEG6DE2ymFZKd+JOF3v4
	IXMFaSMBAEZAj81W60wIFZZcDcTVUYwKims0RB/m/hCK5Avf+BMapXH3eNMdeu/HvUfa
	ocbw==
Received: by 10.216.213.79 with SMTP id z57mr230159weo.27.1336611060279; Wed,
	09 May 2012 17:51:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Wed, 9 May 2012 17:50:40 -0700 (PDT)
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 May 2012 17:50:40 -0700
X-Google-Sender-Auth: Btz2zTLSTfnAGjI4mhrH_aEWOcA
Message-ID: <CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 01:00:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 5:22 PM, Joshua Lock <josh@linux.intel.com> wrote:
> In Yocto #2041[2] =C2=A0Mark reported an issue with reusing shared state =
as a
> different user on the same machine.
>
> Since the whole purpose of shared state is that it be shared I decided to=
 dig
> into this issue. I wanted to at least be able to use the shared-state cac=
he of
> a different user without error, even if all of the objects aren't actuall=
y used
> (i.e. native, at least on the Edison branch I did most of the testing wit=
h).
>
> This is an RFC mainly because it changes the permissions of created direc=
tories,
> sstate files and siginfo files from what they have traditionally been.
>
> There is more of the rhyme an reason in the patch commit headers and comm=
ents
> but tl;dr bb.mkdirhier directories will be 0777 (rwxrwxrwx) with this pat=
ch, as
> will all of the contents of sstate-cache (siginfo and tgz) files.
>
> This is actually what one would expect from reading the Python API docs f=
or
> os.makedirs "The default mode is 0777 (octal)."[1] but not what actually =
happens
> on most modern Linux systems thanks to umask.
>
> Please review the following changes for suitability for inclusion. If you=
 have
> any objections or suggestions for improvement, please respond to the patc=
hes. If
> you agree with the changes, please provide your Acked-by.

777 seems questionable to me, personally. Generally collaboration
happens amongst folks within a group, and chmod g+s makes that easier.
I'd expect 775 to be a more sane value, myself.
--=20
Christopher Larson


