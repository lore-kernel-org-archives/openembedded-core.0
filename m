Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB243C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 18:15:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.1683.1656440104165593990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 11:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eIfWq6Wi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id k22so18877813wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=KHtlonsths7V4s1nrIatBvHIlAWt5DMbfwjpswP2mtQ=;
        b=eIfWq6WiUC+ZaLhE058PDrpXB4hHvQsImwvh6uaa0dc6+uX0gGXnEfC7U0Z3NaKjBX
         Z2m8cM7cjneP5y5Dhul853MIJwE5sB/Vceb5LvLvqKCYnFykM84dLEIM8kA0S1ctybL3
         mWt7vVq3rY2bSsZlie/Up00/93RGy9qu5USa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=KHtlonsths7V4s1nrIatBvHIlAWt5DMbfwjpswP2mtQ=;
        b=VcOuIog+sflwRy9Ak+INQ0FoQp9XRKHyQQ0stGbtacqUzDMCIPbN+kq5OYvrSzVO4c
         Dx1F9Sd/2icDwAlNqsNKA5YbgZZcMcwgYLGVlYI+gOfW3uxwgMvhXf+iDOQ4ZN7W4ilP
         fS5hVMj/ITgCtXNKaWvLdaSji0BlxUgBvnraaAktw0ycB1Wj4mf7kt/6vneHNpmaR6OI
         7EpqE1Om5zaRR5yNsJxjYv9uYjRihNJ1t0mcB2KlKu1QAGjZ6OANhJTS1X4zEPdbAFmj
         VGyfb7mAnxpnppHqD9u918J8nK2AFN+kNucC+hWpBkC1f2/6iuSDF+cn2qQsXpraSu4j
         ECPQ==
X-Gm-Message-State: AJIora9jdXwtAl1ZrftKTGTsUJ0TLQt7os5GxnyyL5Jf/6NUOzr98guy
	fhFnbwe0P9M1zB+tL5LKsuNJnw==
X-Google-Smtp-Source: 
 AGRyM1uxrToXkyxzONlIYP+ikaFPWBp3jYM+p1m62x+mki3jj3O2SOXs2kG0/9UDFN1C4fQnItOChA==
X-Received: by 2002:a5d:664d:0:b0:21a:3b82:6bb2 with SMTP id
 f13-20020a5d664d000000b0021a3b826bb2mr19135935wrw.534.1656440102457;
        Tue, 28 Jun 2022 11:15:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1624:49b4:7dc4:c660?
 ([2001:8b0:aba:5f3c:1624:49b4:7dc4:c660])
        by smtp.gmail.com with ESMTPSA id
 p67-20020a1c2946000000b003a0502c620dsm242925wmp.44.2022.06.28.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 11:15:01 -0700 (PDT)
Message-ID: 
 <15ed412d2d65e4ca35208ac741f71ca9673113a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][kirkstone][PATCH 4/5] cve-check: major class
 refactor
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Davide Gardenal <davidegarde2000@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Date: Tue, 28 Jun 2022 19:15:00 +0100
In-Reply-To: <20220628133713.3390786-4-davide.gardenal@huawei.com>
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
	 <20220628133713.3390786-4-davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 18:15:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167353

On Tue, 2022-06-28 at 15:37 +0200, Davide Gardenal wrote:
> The rationale behind refactoring the class is to make testing=20
> and maintainability easier.
>=20
> This commit includes:
>     - bb var refactor for better readability
>     - function and program flow refactor for better scalability
>       and extensibility
>     - better documentation for all the functions
>     - minor bug fixes when using specific configurations
>=20
> Deleted bb vars:
>     - CVE_CHECK_LOG
>     - CVE_CHECK_TMP_FILE
>     - CVE_CHECK_SUMMARY_DIR
>     - CVE_CHECK_SUMMARY_FILE_NAME
>     - CVE_CHECK_SUMMARY_FILE
>     - CVE_CHECK_SUMMARY_FILE_NAME_JSON
>     - CVE_CHECK_SUMMARY_INDEX_PATH
>     - CVE_CHECK_LOG_JSON
>     - CVE_CHECK_RECIPE_FILE
>     - CVE_CHECK_RECIPE_FILE_JSON
>     - CVE_CHECK_MANIFEST
>     - CVE_CHECK_MANIFEST_JSON
>     - CVE_CHECK_CREATE_MANIFEST
>=20
> Renamed bb vars:
>     - CVE_CHECK_DIR -> CVE_CHECK_OUTPUT_DIR
>     - CVE_CHECK_COPY_FILES -> CVE_CHECK_CREATE_RECIPE_REPORTS
>=20
> Added bb vars:
>     - CVE_CHECK_CREATE_BUILD_REPORT: flag to control if cve-check
>       creates a build report or not
>     - CVE_CHECK_CREATE_IMAGE_REPORT: flag to control if cve-check
>       creates an image report or not
>     - CVE_CHECK_TXT_INDEX_FILE: path of the temporary index file
>       for the txt output format. Deleted after the build is
>       completed
>     - CVE_CHECK_TXT_INDEX_DIR: folder path where all the temp
>       recipes reports with txt format are store. Deleted after
>       the build is completed
>     - CVE_CHECK_JSON_INDEX_FILE: same as CVE_CHECK_TXT_INDEX_FILE
>       but for the json format
>     - CVE_CHECK_JSON_INDEX_DIR: same as CVE_CHECK_TXT_INDEX_DIR
>       but for the json format
>     - CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE: name without extension
>       of the report for the image
>     - CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE: name without extension
>       of the report for the entire build
>     - CVE_CHECK_RECIPE_FILE_NAME_BASE: name without extension of
>       the report for every recipe
>=20
> Default output structure (with txt and json format enabled):
> tmp
> > -log
>    |-cve
>       |-build_reports
>       |  |-txt
>       |  |  |- build report files with txt format
>       |  |-json
>       |     |- build report files with json format
>       |-image_reports
>       |  |-txt
>       |  |  |- image report files with txt format
>       |  |-json
>       |     |- image report file with json format
>       |-recipe_reports
>       |  |-txt
>       |     |- recipe report files with txt format
>       |  |-json
>       |     |- recipe report files with json format
>       |-cve-report.json -> link pointing to the latest json build report
>       |-cve-report.txt  -> link pointing to the latest txt build report
>=20
> Note that a link to the latest image report is present in the
> image deploy folder.
>=20
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/classes/cve-check.bbclass | 642 +++++++++++++++++++++++++----------=
------
>  1 file changed, 390 insertions(+), 252 deletions(-)

I'm a bit worried about this patchset since it changes lots of
different things and it does it as a flag day, there is no incremental
approach to the patches or backwards compatibility.

The patch commit long says a lot about the mechanics of the change but
not a lot about the reasons for the change and how they benefit the
user or the project?

If we're going to do something that radical, should we just drop the
text based output and use the json output?

Normally where new common functions are created like 2/5 and 3/5, we'd
adjust existing code to use them in the same patch.

I'm also worried about the implications for the CVE code in dunfell and
kirkstone with this level of changes. At some point those codebases may
need to diverge :/

Cheers,

Richard






