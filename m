Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGG1u-00014t-Og
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:17:26 +0200
Received: by lbky2 with SMTP id y2so4114193lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=XlTgOwpCyH+fpV81VLLb7YApMdoN/6C1lhMAwVpb68A=;
	b=yflU8WzfChFtq73grRfh6qXUgbNs0eP3cJG/6QcmIcLV/RSTkEhD5m6glvaouaTV3G
	T1LxM6nLk1Ha1JfwCyWxXFlWTUIlxWaZvDXm2czuj4jQnrjkuakPPcg3q6aI6D07/ZLI
	JhBR/t+JzxVfIt5r9KWvtE+61kD11j80lsF9j/QhYN+lhWJOnJWUsmgB0DRIZPFQguhg
	WE6RoaP4PAWNpxmj7Zu3rEfOgcikgOq33vAzRxlJYaqPII3umdColhpLJ0IZZ7qk7gEo
	vd36pf6yiZ4DOWskdQHur30xP+nDcehUvRhlBHbS79eCmj2O9510cXrZVQtgfNxTlDxc
	6xhg==
Received: by 10.152.147.130 with SMTP id tk2mr11519161lab.4.1348520678231;
	Mon, 24 Sep 2012 14:04:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.19.2 with HTTP; Mon, 24 Sep 2012 14:04:18 -0700 (PDT)
In-Reply-To: <CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 24 Sep 2012 14:04:18 -0700
Message-ID: <CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add and use 'localedir' variable
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
X-List-Received-Date: Mon, 24 Sep 2012 21:17:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 2:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 24, 2012 at 12:00 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> This avoids the hardcoding of ${libdir}/locale which is all over the pla=
ce,
>> and will facilitate use of ${exec_prefix}/lib/locale instead of
>> ${libdir}/locale.
>
> what is adavantage of letting use ${exec_prefix}/lib/locale ? Do you have=
 a case
> where you share locale between multilibs ?

This is the case by default for all eglibc builds that set libdir to
the default. See https://gist.github.com/3756705 =E2=80=94 there's another
block just like that for all the other 64 bit archs for eglibc. When
we pass =E2=80=94libdir=3D/usr/lib64, it skips this logic.

So changing it would just bring us inline with the default eglibc
behavior. The binary locale files are, as far as I'm aware, a
relatively arch independent binary format. There's no point or benefit
to having lib32 vs lib64 copies, they'd just be duplicated content.

If it wasn't for the forthcoming 1.3 release, I'd have included the
proposed change to the default localedir to ${exec_prefix}/lib/locale
with this patch.
--=20
Christopher Larson


