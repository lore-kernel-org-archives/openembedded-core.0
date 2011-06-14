Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QWRgb-0008Py-Fm
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 13:21:33 +0200
Received: by fxm19 with SMTP id 19so4293511fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w+ydtvx3DtE1rG5opMJEvyFF6l79MVKLuPgUYNk9vWg=;
	b=mFXbIdkKVB4ioF1+OBsEb6oJhyEfl+vR1pv56tL0HldRefJ8DOBX80Y21/iJStgGuF
	TaiYVHGNZeiDU4awTNcLEq7Ms9dYNwOUKtiZH/58dQdg9kVF97Gg5cGPxIhjyPZr0PQb
	slnNHL5DdEt1QUQ/30MiKhRKYobGnEF4Lb8iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lV2orZXGmrO7tVEQK8/FiVXYRie3ZFdhPBS2Tc42qvssbEU/+pFbpVhbGDceYgr5dn
	vAEgJrJepRYjFwUFjJS6iX4FjjkgOILD3ztFEHUyDnjlylMnG3dqaauC1swL9LlYZCTk
	9WsUqkvXnthPhHQgUcbl0Y4hzfv9cSlmB4j3A=
MIME-Version: 1.0
Received: by 10.223.79.151 with SMTP id p23mr1585391fak.78.1308050278391; Tue,
	14 Jun 2011 04:17:58 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.109.19 with HTTP; Tue, 14 Jun 2011 04:17:58 -0700 (PDT)
In-Reply-To: <1308047749.25285.248.camel@phil-desktop>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
	<BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
	<BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
	<BANLkTi=u8pJ=pkgmWLuPnqKNjRow18X70A@mail.gmail.com>
	<BANLkTimyQdXV9Fxp8EuAfEWfX2=eGt=O+Q@mail.gmail.com>
	<1308047749.25285.248.camel@phil-desktop>
Date: Tue, 14 Jun 2011 13:17:58 +0200
X-Google-Sender-Auth: _Qw851b58ynsZnlXbSegOyIyCE0
Message-ID: <BANLkTinRJv9aW3YQ5rxbkErDJJjsc8-jXQ@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Tue, 14 Jun 2011 11:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 12:35, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-14 at 12:33 +0200, Anders Darander wrote:
>> Sure, if we need multiple variables, we'll save time by only invoking
>> bitbake (and parse all configs, etc) once. On the other hand, have we
>> then gained anything, as compared to 'bitbake -e'? Sure, we'll reduce
>> the output, by only outputing the requested variables... But in the
>> original case: TMPDIR=3D`bitbake -e | grep TMPDIR=3D\" | cut -d '=3D' -f=
2 |
>> cut -d '"' -f2`
>> the only change we can do is to substitute 'bitbake -e' with 'bitbake
>> -V TMDPDIR', which wouldn't be any improvement.
>
> Well, that's not quite true. =A0If "bitbake -V" outputted the full
> assignment then you could just write:
>
> eval `bitbake -V TMPDIR`
>
> which would be a considerable improvement.

That should be correct...
I thought about something like that, but for some (unknown) reasons
throw that idea away. I believe that I for some reason got hung on the
TMPDIr=3D`....` syntax.

Using eval instead, all(?) problems should be gone.

Updating my todo-list. Hopefully I'll get some time soon to implement
this, as it looks pretty trivial to add this support (at least after a
quick glance at the bitbake source).

Regards,
Anders


