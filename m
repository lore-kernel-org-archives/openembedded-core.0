Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11CACCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 08:08:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16717.1792138110551038270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bsMXNl57;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E664C6220B;
	Fri, 16 Oct 2026 08:09:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45B16075D;
	Fri, 16 Oct 2026 08:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7336510328BE6;
	Fri, 16 Oct 2026 10:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792138108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=001PB8SRtJmjE2IdkjKwIPQBmFvaIHBcV7C2HhAxfK8=;
	b=bsMXNl57rkEAjJrc3VvhYWCFyHgKOZTjHoiYozYKKvX7r8/D1HLaJnF0k2GWTMtxU+GRJc
	EYiv0tfTmFxo1FMRdqfOxsiFa3qa0z+U9jcu46dLFGzPLwN6hvLCLshbNMvXdp8vBohgaE
	YXXcXx+Gq7ukxbnaTMpsxtjL/pm2pzXfjtpeFICzlq3PLW6VImDqA/CbkUM3nsd69sxJ9y
	lPJXsL5QKLwLkvUEIz8Du7AyfoSfaNwXnhHrzhznpJjMo2yc7jvO3Ij8ukYIM3sIO7RP+N
	uklTWRf8CjRTu2ZVqwKnIr7sZwsRdelidEZwPOZr6ngXOLIj5OLS2K4Yl7e1eA==
Message-ID: <0c085fe9-05c8-42c3-a2e3-295b5bdc6e99@bootlin.com>
Date: Fri, 16 Oct 2026 10:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 RESEND] classes/archiver: fix tarball content
 in "original" mode
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, yoann.congal@smile.fr,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260918092711.471982-1-joaomarcos.costa@bootlin.com>
 <84b5b50f-c507-4e35-8090-2a13b79fd4e3@bootlin.com>
 <b398788ff33f7042add03b695235d157ab2bb3b3.camel@pbarker.dev>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <b398788ff33f7042add03b695235d157ab2bb3b3.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 08:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248003

Hello, Paul

Thanks for your reply.

On 10/15/26 10:04 PM, Paul Barker wrote:
> On Thu, 2026-10-15 at 20:53 +0200, Joao Marcos Costa wrote:
>> Hello,
>>
>> On 9/18/26 11:27 AM, Jo=C3=A3o Marcos Costa wrote:
>>> When ARCHIVER_MODE[src] is set to "original", a tarball is generated =
with
>>> the unpacked sources of a given recipe. Prior to it, a tmpdir
>>> (i.e. from tempfile.mkdtemp()) is created and the sources are unpacke=
d inside:
>>>
>>> (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
>>> `-- vim-9.2.0340
>>>       |-- READMEdir
>>>       |-- ci
>>>       |-- lang
>>>
>>> This tmpdir, however, ends up being shipped in the deployed tarball:
>>>
>>> $ tar -tf vim-9.2.0340-r0.tar.xz
>>> (...)
>>> tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
>>> tmp8pu2nsck/vim-9.2.0340/LICENSE
>>> tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
>>> (...)
>>>
>>> This can be avoided by pointing to the subdir where the sources are
>>> unpacked, rather than to tmpdir, when calling create_tarball().
>>>
>>> The subdir's name can be inferred from 'BP', so we will use
>>> 'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.
>>>
>>> e.g. and in the result:
>>>
>>> ./
>>> ./vim-9.2.0304/
>>> ./vim-9.2.0304/SECURITY.md
>>> ./vim-9.2.0304/.codecov.yml
>>> (...)
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>>>    meta/classes/archiver.bbclass | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bb=
class
>>> index b274c53e79..c824718a1d 100644
>>> --- a/meta/classes/archiver.bbclass
>>> +++ b/meta/classes/archiver.bbclass
>>> @@ -230,7 +230,7 @@ python do_ar_original() {
>>>                        else:
>>>                            bb.fatal("Cannot determine archive names f=
or original source because 'name=3D' URL parameter '%s' is used twice. Ma=
ke it unique in: %s %s" % (tarball_suffix[name], url))
>>>                tarball_suffix[name] =3D url
>>> -            create_tarball(d, tmpdir + '/.', name, ar_outdir)
>>> +            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '=
.'), name, ar_outdir)
>>>   =20
>>>        # Emit patch series files for 'original'
>>>        bb.note('Writing patch series files...')
>>
>> Gentle ping: would there be any updates on this one? Thanks!
>=20
> Hi Jo=C3=A3o,
>=20
> In my reply to the v1 patch [1], I asked why we're creating a tmpdir
> under ${ARCHIVER_WORKDIR}, why not just unpack the source directly unde=
r
> the archiver workdir?
>=20
> The archiver already works in an `archiver-work` subdirectory, so there
> isn't any risk of the unpacked sources clashing with ${S} used by other
> recipe tasks. We may be able to change the code so it doesn't use an
> additional directory layer.
>=20
> [1]: https://lore.kernel.org/all/6fc3dd417116cb61641a293fd9a4256774e708=
b4.camel@pbarker.dev/
>=20
> Best regards,

There could be something off with my mailer, Idk, but I replied to your=20
comment(s) back then:

"I do believe that tmpdir was created to handle the case where multiple=20
source controlled URLs are used in SRC_URI. If I fake a second git for=20
Vim, the result will be a couple of tmpdirs, then 2 separate tarballs,=20
each ending with the suffix defined in SRCREV_FORMAT."

So I believe the tmpdir is needed, and the cleaner way to handle this is=20
to change the call site in do_ar_original() as you suggested, thus my=20
v2. What do you think?

--=20
Best regards,
Jo=C3=A3o Marcos Costa


