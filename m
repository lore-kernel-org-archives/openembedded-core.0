Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A41FCC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 12:49:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6225.1791895769584868261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 05:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z4aLZflL;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-486e70f2457so1282036f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791895768; x=1792500568; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SScBAJEpKEw23O9/XmPa9oDoP7wBlDCILZnloXf0zGQ=;
        b=Z4aLZflLCuQlSJZJ5PsHZOqWboRyZCOC7ju23qzvT+9FDC+go6pPpFJZLjSYz99B18
         q5ledeHJzsVaSWuMiQh0+kkB0PH6/Ujih9P+PZJv5vOJRkJBmuhdrd9+jPYZerWTIRdp
         BOc66EpbqJFd2IDevg4nOBI7FA9x4sYNW7MAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895768; x=1792500568;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SScBAJEpKEw23O9/XmPa9oDoP7wBlDCILZnloXf0zGQ=;
        b=jmiexFbCY49iyAc2gXXzKYc0zPj27kcYBORAx6DGNO9AAHCv7rtL5aEEgPXHps5Y/J
         m4INu6MI78oeCQkyO6pDDKHq3zUdPocqezQNASbY6M7mMzAPcx1X8W/M+ogAjmlJrTGl
         WX63ZXe2ERlvlEPDyz+XZGiuMTN8Cf2gIbnX5r3FXEzBOuPg+pdlIcrjkIdNiznW0ZZw
         K6cXhoiaXL1xbaztlxizwSvLTY3TBDnT/c0ONbQ8KhvdVqvhpUXUcnWCGr8NeEHwvAsy
         4ILFq/fBbdFLi12X0G6FRUCeXD5hwXoyJKiuKx9S241R6buOHOutx8tyNuj5VzmkXsW9
         vJ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwnnczBXkSqNn2SUbo1xEBeskWOE8IYYkbZRlcYC8Yaphd91LqAP5dnePPFYerlY0ZDP3lLo87H9z8EkXhMg7HuVg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLWqxK6g7I6QavvTIY1S73BGrCdGSyOD+1eWepMTmXnUV+A6zlg
	uSpYT5GuhRmB1vD0wT/MMzWE9MvT8FsSBPp8AB1Vxqy5BBL4Fk14y6Hj16L7Tf3+cHo=
X-Gm-Gg: AYBFou3q1GoWFRIwasnz093JnJmDG12h6ZZab6tGqCPX1n0Ycf/xYTuaCT0scClTPcT
	R5g0bSrdOSGcJpbemcnfwasmOmfkXjcY5POrg5t+TAkJdCjUIttphO/DFgejxxXXgRxsicvi0on
	5qdrPtyqW2A1Yy1M4HsPoWqr1bDcegtN7JJz5SALPppkffYyhtnM9wHKbnaFbyoYqhN3gJwnLKw
	ZLFeQ+bulxnGwPqVFGhC3/HISmxQ/S6GcOFhdvZsMw1mq+AB+T3coaz1XyXdXq9QOh9bex5Fhws
	LdxJdBHqBkAjvBy61k1FUUr1P8JXS6/XjyygHO3+cwwFmgOhUzUPGveAFyey58XKqBwKxUTyZ6D
	DI6nXPRFw8Mk801WZCRQmrDiwKvKFaqlu4PN63k3yA5nVfTjYq8Um7kgpyIojNLx7frjcaKVL3S
	85mrJsgyAaS32z1/NRTKphWDPcn+EFEAasix8myJMdbHeZsIzkn9UunyOez32pMYMG+Tx2FqWu1
	Canu6ciT3Xgyc5T6aIGv4DdNKA77dCgPd7VflVyj7Ykqn7Shbl3i5stsp4=
X-Received: by 2002:a05:6000:3106:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48dca34316amr16102099f8f.39.1791895766155;
        Tue, 13 Oct 2026 05:49:26 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm4705034f8f.23.2026.10.13.05.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:49:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 14:49:24 +0200
Message-Id: <DM3Q19TD2H1H.1BWEBU31D3XG6@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] bison: Fix CVE-2026-56390
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, "yurade@cisco.com" <yurade@cisco.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260928162713.2651011-1-yurade@cisco.com>
 <AS8PR10MB5073BAA4BDD36FAE76783771FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073BAA4BDD36FAE76783771FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 12:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247724

On Mon Sep 28, 2026 at 8:24 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> This should be submitted also to master.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yogita Urade -X (yurade - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
>> Sent: Monday, September 28, 2026 6:27 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][wrynose][PATCH] bison: Fix CVE-2026-56390
>>=20
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>=20
>> [1]
>> https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=3D8d101c19d4=
d9aaedf83a448
>> c925513742d4efcf0
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390
>>=20
>> Signed-off-by: Yogita Urade <yurade@cisco.com>
>> ---
>>  .../bison/bison/CVE-2026-56390.patch          | 236 ++++++++++++++++++
>>  meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
>>  2 files changed, 237 insertions(+)
>>  create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.pat=
ch

Hello,

Same as your wrynose patch, it needs a master and blacksail fix first.

>> diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch b/me=
ta/recipes-
>> devtools/bison/bison/CVE-2026-56390.patch
>> new file mode 100644
>> index 0000000000..82a80a3a28
>> --- /dev/null
>> +++ b/meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
>> @@ -0,0 +1,236 @@
>> +From 81b11844fcbc7abb3df91c629cd2f2c076f107cc Mon Sep 17 00:00:00 2001
>> +From: Paul Eggert <eggert@cs.ucla.edu>
>> +Date: Thu, 23 Apr 2026 12:41:25 -0700
>> +Subject: [PATCH] bison: tighten up output file names
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Problem reported by Micha=C5=82 Majchrowicz.
>> +* src/parse-gram.y: Do not allow '/' in %header and %output directives.
>> +
>> +CVE: CVE-2026-56390
>> +Upstream-Status: Backport
>> [https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=3D8d101c19d=
4d9aaedf83a44
>> 8c925513742d4efcf0]
>> +
>> +Backport Changes:
>> +- Adapted generated src/parse-gram.c to the Bison 3.8.2 source tree.
>> +- omitted upstream generator-version/copyright metadata and
>> +  src/parse-gram.h-only metadata changes while retaining the
>> +  security-relevant parser changes.
>> +
>> +(cherry picked from commit 8d101c19d4d9aaedf83a448c925513742d4efcf0)
>> +Signed-off-by: Yogita Urade <yurade@cisco.com>
>> +---
>> + THANKS           |  1 +
>> + doc/bison.texi   |  2 ++
>> + src/parse-gram.c | 56 ++++++++++++++++++++++++++++++++----------------
>> + src/parse-gram.y | 31 ++++++++++++++++++++++-----
>> + 4 files changed, 67 insertions(+), 23 deletions(-)
>> +
>> +diff --git a/src/parse-gram.c b/src/parse-gram.c
>> +index 3c1d8229..7f6deb33 100644
>> +--- a/src/parse-gram.c
>> ++++ b/src/parse-gram.c
>> +@@ -2289,7 +2292,14 @@ yyreduce:
>> +
>> +   case 20: /* prologue_declaration: "%output" "string"  */
>> + #line 359 "src/parse-gram.y"
>> +-                                { spec_outfile =3D unquote ((yyvsp[0].=
STRING));
>> gram_scanner_last_string_free (); }
>> ++    {
>> ++      char *file =3D unquote ((yyvsp[0].STRING));
>> ++      if (valid_output_file_name (file))
>> ++        spec_outfile =3D file;
>> ++      else
>> ++        complain (&(yylsp[0]), complaint, _("invalid %%output file nam=
e ignored"));
>> ++      gram_scanner_last_string_free ();
>> ++    }                           =20
Also,     ^ here you have a bunch of newly added spaces at end-of-line.

Can you check if you have those in your other patches for other branches?

Thanks!
--=20
Yoann Congal
Smile ECS


