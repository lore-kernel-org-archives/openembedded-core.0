Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.2246.1631646530859683832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 12:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UXXQTNd4;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id d6so21898123wrc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGVaHdyDaQhb3CONGZ5AfjNaRk/GxamAcNktxRttQb8=;
        b=UXXQTNd4AKuX1nVERv2d5fbAsTS49xn1tJ39/ZTWE/vBKSfArZrZV3I+kcYcObkdv4
         aueGx/aefDN9SBenepFdw/Hp5ADAs1BLB7Az44kVOovDYWpRbyhzrrEd0+vHAT2DbBgj
         h5q1Mj1t9JGTF/Sm7uTvP7V2DFo7deozj0H5VRoD5CAgrV5MNixSl0NBsKjOF5T84XT7
         sDEVMmbBYFzJDChIWr2ZA9QCL8akIj2eDSWcCuy+cRvhjJ4mzDbWCxvGKBMV2xa2smDv
         dIr72v5gqbA9ngRiguTtzS84u7EQmG1r0Kf7IhHINSRI66DNmh5rO/ZgSqRFVAc1weoa
         wYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGVaHdyDaQhb3CONGZ5AfjNaRk/GxamAcNktxRttQb8=;
        b=YDMO9SkhaL2ctq6J/z6JNOkGZJpSrqsHqr1a1ES37yTvHMApx6q68hfEkSORWIxdKX
         zaLSejgbswTDjp/vt0KDfESUxiISjZUN08RLK7D/BuCERYYb3KIcnZstAbMUoqCNoZWF
         3D8u6xeUYibkBq1MSaVFg/pBULiPkdphJH4fwzakzAjsueuL6emRH5IOwkNq3MibNy5C
         0OsuB25x2oj6YAMtNQEZKiSv/BC4mdnJBc2soH0yxQ8cSEdGPnOLSVyFt2d791U1gD+1
         T3wq147gI9BgLHj2xZOmtGyGTgjuUZeDQTeVeWQxiQJYLxhg5/gDIt4fsZ1+euWbYV2b
         o0Yg==
X-Gm-Message-State: AOAM533d/WKudU4UH55rtgs3111H5davFbvC+zIQdB5bXiF5vufr5BL7
	bcTPzmBxsGos0gc2eHRkoWpe+QHRK5U2OQImD/U0Lg==
X-Google-Smtp-Source: ABdhPJwFv+9PXOIAh6cvZHnaW1CNff17fav9QsnxMd4hU8EGOwWh/QOnAiHD95aQewGqtRArS7wBlcWZifSbXOHPHqc=
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr841498wrp.44.1631646529213;
 Tue, 14 Sep 2021 12:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <16A4C2594C8DE450.1120@lists.openembedded.org> <16A4C45E7F105E33.1120@lists.openembedded.org>
In-Reply-To: <16A4C45E7F105E33.1120@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 14 Sep 2021 09:08:37 -1000
Message-ID: <CAOSpxdbn5nh6TH=hepgDYSoivDg37gZ2m7aRQAgCn4N-OpJjXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 8:41 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Tue, Sep 14, 2021 at 8:04 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > The CVE database correctly reports CVEs for oracle_berkley_db and
> > berkley_db.  We use the oracle_berkley_db source tree and therefore
> > should only check for oracle_berkely_db CVEs. Otherwise the scanner
> > falsely reports CVEs that are fixed in oracle_berkley_db
>
> Please hold off on taking this patch -- I need to do some more
> research.  I may have confused myself :-(

I did indeed confuse myself, so ignore this patch.

The CVE database is reporting CVEs for the Oracle db code base under
the name berkley_db, so the original patch in question is indeed
correct and the CVEs are valid.

Our CVE reporting has been whitelisting db CVEs.  I'm going to remove
that from the tool and submit a patch to add the db CVEs to the
exclusion list in meta/conf/distro/include/cve-extra-exclusions.inc
since it seems unlikely that we will be moving to a version of db with
these issues fixed.

Steve

> > This reverts commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661.
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-support/db/db_5.3.28.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> > index d5b788a3d7..5e9305ab06 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
> >  LICENSE = "Sleepycat"
> >  RCONFLICTS:${PN} = "db3"
> >
> > -CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
> > +CVE_PRODUCT = "oracle_berkeley_db"
> >  CVE_VERSION = "11.2.${PV}"
> >
> >  PR = "r1"
> > --
> > 2.25.1
> >
> >
> >
> >
>
> 
>
