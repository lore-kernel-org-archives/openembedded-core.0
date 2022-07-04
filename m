Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A59C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 06:43:39 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com
 [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web12.69269.1656917015776579197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 23:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=GX3MFoAh;
 spf=pass (domain: bmw.de, ip: 207.54.69.30,
 mailfrom: prvs=1773a14ff=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1656917015; x=1688453015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=12CnczxoI+1DWiEN328Zwqc8Dx1nuA5ixgnccHkCY+4=;
  b=GX3MFoAh7zSLp3mxtb/D8PnKs2NjjarEvBxmup/pv9eIhSqK4g+Pl0DE
   PgFEncaGiWi26rLVI0HYL3jx0uuJPim5pSZvZdc4bcE9/Xf+qBxudhyTv
   vv6OSJPWjDxMenr/a9l63D+oKRDE5Z4aWWoLpUPHm+K5FG8GFCHSuFZdK
   o=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Jul 2022 08:43:33 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
 04 Jul 2022 08:43:33 +0200
Received: from smucm29j.bmwgroup.net (HELO SMUCM29J.europe.bmw.corp)
 ([160.46.167.41])
 by esabb6.muc with ESMTP/TLS; 04 Jul 2022 08:43:33 +0200
Received: from SMUCMP08D.europe.bmw.corp (10.30.13.70) by
 SMUCM29J.europe.bmw.corp
 (160.46.167.41) with Microsoft SMTP Server (TLS;
 Mon, 4 Jul 2022 08:43:33 +0200
Received: from SMUCMP08E.europe.bmw.corp (2a03:1e80:a15:58f::1:24) by
 SMUCMP08D.europe.bmw.corp (2a03:1e80:a15:58f::2247) with Microsoft SMTP
 Server (version=TLS; Mon, 4 Jul 2022 08:43:33 +0200
Received: from SMUCMP08E.europe.bmw.corp ([10.30.13.71]) by
 SMUCMP08E.europe.bmw.corp ([10.30.13.71]) with mapi id 15.02.0922.027; Mon, 4
 Jul 2022 08:43:33 +0200
From: <Mikko.Rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <quaresma.jose@gmail.com>, <openembedded-core@lists.openembedded.org>,
	<ricardo@foundries.io>, <daiane.angolini@foundries.io>,
	<jose.quaresma@foundries.io>
Subject: Re: [OE-core][kirkstone][PATCH] curl: backport openssl fix CN check
 error code
Thread-Topic: [OE-core][kirkstone][PATCH] curl: backport openssl fix CN check
 error code
Thread-Index: AQHYjWVcGc+LZgloJk2Ys54tJRDSVq1ptBQAgAPyWAA=
Date: Mon, 4 Jul 2022 06:43:32 +0000
Message-ID: <YsKMEh4HUz7/9dFK@korppu>
References: <20220701161205.112341-1-jose.quaresma@foundries.io>
 <CAOSpxdbq+CJE-k7dn1wBnd9ay-wD7-FdxMyMS5SXQVy=afdQCQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbq+CJE-k7dn1wBnd9ay-wD7-FdxMyMS5SXQVy=afdQCQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1B4E065B2E6FE43AAF385B10664B504@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 06:43:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167594

Hi,

On Fri, Jul 01, 2022 at 08:27:20AM -1000, Steve Sakoman wrote:
> Should be Backport, not Backported!  The latter will get you an error:
>=20
> ERROR: curl-7.82.0-r0 do_patch: Malformed Upstream-Status in patch
>=20
> No need to re-submit, I've fixed it!

How is poky/scripts/contrib/patchreview.py setup to run so that this would
fail automatically?

I'd like to have this on my CI builds too.

Cheers,

-Mikko=

