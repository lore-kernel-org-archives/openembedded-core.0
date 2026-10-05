Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2B8CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 15:34:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22963.1791214453297569723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 08:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GUfrAusA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 13C2B1A1158
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 15:34:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6871601A5;
	Mon,  5 Oct 2026 15:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4818B10330663;
	Mon,  5 Oct 2026 17:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791214446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VmmB5YzkFdND8T4GfRBMBYkawm9sZQPAkgmtSl1lTck=;
	b=GUfrAusAaygsrpvWOA9wy38Ez53ysEc7OGarRh4/V7oMkzybT7CA7Rdqd5me5wwPnpEvhH
	GNKKlZ7di3TQeLagyM3cVLbD6azwREFFj4L2ojzemXKOqEIhwN0Ube7JG3cX0AkyeIIX3b
	AfoX9BdtI/nDgXk0bpMW+a9/4TGZbwzfgDPsRBmiS59iXMTaw69CARJao6j5zHN+Tei8Qd
	5+984tzGOyvRsaSRXX9AbZCGGZjL2eXW8lDlpilbSih4Bvkd/dsMd6zabg4D89CPZLPcFc
	XfCu9jZ7t7Gfn3F+nSEr4Mj9+6gNlzUNC/qkSVIIq3roErYSwjzSn3w162UX6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 17:34:03 +0200
Message-Id: <DLX0IZJ8VAS9.334U1B5L5ZG53@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 22/24] libpcre2: upgrade 10.48 -> 10.49
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com> <20260930-mathieu-upgrades-2026-02-29-v1-22-102c38be04df@bootlin.com> <DLWSAC7YXK30.1G1YB5HCJTRHP@smile.fr>
In-Reply-To: <DLWSAC7YXK30.1G1YB5HCJTRHP@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 15:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247244

On Mon Oct 5, 2026 at 11:06 AM CEST, Yoann Congal via lists.openembedded.or=
g wrote:
> On Wed Sep 30, 2026 at 10:16 AM CEST, Mathieu Dubois-Briand via lists.ope=
nembedded.org wrote:
>> Version 10.49 28-September-2026
>> -------------------------------
>>
>> This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.
>>
>> Compared to 10.48, this release has only a minimal code change to preven=
t an
>> out-of-bounds write with arbitrary data. An attacker-controlled regex pa=
ttern
>> is required, and applications are only affected if using the
>> pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a =
growable
>> JIT stack, and then matching against a pattern with unusually high JIT s=
tack
>> usage, such as a large number of capturing groups.
>>
>> The implications of an out-of-bounds write could include arbitrary code
>> execution.
>>
>> The issue is not a regression and affects releases 10.48 and earlier.
>>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>>  meta/recipes-support/libpcre/{libpcre2_10.48.bb =3D> libpcre2_10.49.bb}=
 | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recip=
es-support/libpcre/libpcre2_10.49.bb
>> similarity index 96%
>> rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
>> rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
>> index 56791171c238..5fa7c3db3b4c 100644
>> --- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
>> +++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
>> @@ -20,7 +20,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/p=
cre2-${PV}.tar.bz2 \
>>  GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
>>  UPSTREAM_CHECK_REGEX =3D "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
>> =20
>> -SRC_URI[sha256sum] =3D "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b51=
46491d12003f2c8ed"
>> +SRC_URI[sha256sum] =3D "53c156e1ba416a20da8e65395daa132da0d80e76910424c=
aca3fcdae7831d384"
>> =20
>>  CVE_PRODUCT =3D "pcre2"
>> =20
>
> Hello,
>
> Shouldn't this patch have removed=20
> meta/recipes-support/libpcre/libpcre2/testoutput3C ?
>
> See: https://git.openembedded.org/openembedded-core/commit/?id=3D3c447001=
749427b151dc2e6f08c790bac77b1c43
>
> Regards,

Hi,

I assumed it had to stay for this release, but my tests are proving me
wrong. I will send a patch to remove it.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


