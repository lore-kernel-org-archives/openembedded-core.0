Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1185.1795710849767444280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UgODRT6C;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B3D64E417AC;
	Thu, 26 Nov 2026 16:34:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20C4760558;
	Thu, 26 Nov 2026 16:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4829D11E6914D;
	Thu, 26 Nov 2026 17:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=34G/h6wv4mPEyFTsA9RHjdkdQWsusvBGbBcU6zKNIoA=;
	b=UgODRT6CJYkThoBFs818T65bTo2pw5imTQW6oOZZMBEMmJ6DTgxBSVevGNgLSYtkOS10G5
	v1lgnABCP9Na0S2Dm59TejeRylaksOjmJm/yafte+b4LKt7TZ/KOMwbelWXB0XEv1j38eX
	4T4cNZuuZg/uHpm0uoH+mB6PbOn4ZIDXnSsmcj/dcWM81J65zxpJZsBJJqZ4tIzKwLZfr0
	i5BN15/rxVDfMGo3IID4ZWn6YgV+UyQnqzZHEL2G6fh+yP9oTbtVmkgp+xxtM3GildTKcN
	MbS3z3vliRfblzTqVTfKruB9/Nc/QqgWCcgUQmvByrZdz3qxNpLIVVJ0hoe9yQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 17:34:01 +0100
Message-Id: <DN5AD86M5KPH.15X5BM1GZR7P1@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] zstd: add nobench, nocompress,
 nodecompress, nodict to PACKAGECONFIG
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
References: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
 <20261125-zstd-1-6-0-v1-2-95f50c6b9de6@bootlin.com>
 <DN58E43X0JY2.H11X8K5K2H4T@pbarker.dev>
In-Reply-To: <DN58E43X0JY2.H11X8K5K2H4T@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251323

On Thu Nov 26, 2026 at 4:01 PM CET, Paul Barker wrote:
> On Wed Nov 25, 2026 at 10:03 AM GMT, Antonin Godard wrote:
>> Add PACKAGECONFIG knobs matching zstd's configuration knobs:
>>
>> - nobench disables the integrated benchmark module, which produces a
>>   smaller binary
>> - nocompress makes zstd compiled without compress support
>> - nodecompress makes zstd compiled without decompress support
>> - nodict compiles zstd without support for the integrated dictionary
>>   builder, which produces a smaller binary
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  meta/recipes-extended/zstd/zstd_1.6.0.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-extended/zstd/zstd_1.6.0.bb b/meta/recipes-ext=
ended/zstd/zstd_1.6.0.bb
>> index 6e4e07050a..cba70007b8 100644
>> --- a/meta/recipes-extended/zstd/zstd_1.6.0.bb
>> +++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
>> @@ -25,6 +25,10 @@ CVE_PRODUCT =3D "zstandard"
>>  PACKAGECONFIG ??=3D ""
>>  PACKAGECONFIG[lz4] =3D "HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4"
>>  PACKAGECONFIG[lzma] =3D "HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz"
>> +PACKAGECONFIG[nobench] =3D "ZSTD_NOBENCH=3D1,ZSTD_NOBENCH=3D0"
>> +PACKAGECONFIG[nocompress] =3D "ZSTD_NOCOMPRESS=3D1,ZSTD_NOCOMPRESS=3D0,=
,,,nodecompress"
>> +PACKAGECONFIG[nodecompress] =3D "ZSTD_NODECOMPRESS=3D1,ZSTD_NODECOMPRES=
S=3D0,,,,nocompress"
>> +PACKAGECONFIG[nodict] =3D "ZSTD_NODICT=3D1,ZSTD_NODICT=3D0"
>>  PACKAGECONFIG[zlib] =3D "HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zlib"
>> =20
>>  # See programs/README.md for how to use this
>
> Hi Antonin,
>
> I think we can clean up the options that upstream gives us a little.
>
> We don't like PACKAGECONFIG values starting with 'no' as the logic is
> inverted. We should also be able to disable benchmarking and dictionary
> building by default as they are rarely going to be used. I don't see any
> case where people would want zstd but wouldn't want decompression
> support.
>
> So perhaps we need the following PACKAGECONFIGs:
>   - `benchmark`, disabled by default
>   - `dict-builder`, disabled by default
>   - `compress`, enabled by default
>
> How does that sound?

That makes total sense, I'll come up with a v2 with these changes shortly.

Thanks,
Antonin
