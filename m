Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95765C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 17:29:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.370.1645550966897853972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xTty9U/R;
 spf=pass (domain: linaro.org, ip: 209.85.219.43,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f43.google.com with SMTP id 8so963125qvf.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tyfluzpb3YU5OmItYpxIjo6BX1Q2672ISlk4A20j5nU=;
        b=xTty9U/R5XgtEf51Ahl1OFQke01/iTXtntmSzIlZUKQpk/XVB9J0Rqc3HHn2CGoj/q
         etHRa9AdT/4ZpsSDRRoM1xHMzY1Tu6rly8EBXbz95xtmugM2OsKqrJqb4FdGCX4yPEeX
         tn4QImh0+bjIDzyM3gTQvrC5bz0m4yFfuZuqY5yLKZrbSilbRIHJtUeDNVoFOS10THSK
         fcGaHUsAVoFrP2Rg5ZrVZDksnVrTyyXVVsMQQsBUloKD8QSuqTpzqI1jiDvTtF9FAjW8
         Cn+sP0y50Ze8c0ALaabC+c1aHcHz4PvkgZvvEEPqdzjKxNzmzwERcgBEYZidmzBVJTZP
         U7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tyfluzpb3YU5OmItYpxIjo6BX1Q2672ISlk4A20j5nU=;
        b=AtUSDVxEFUHv36NlvvGjVpfDU6IEZlXgic1w1AUZfizMSkm8pitqq2prbEt53APA2y
         HxtWU1cwjFipDggWeOX65UqayENKRNq6OIFxok4iVinSTBM89p6oe5Kf+VcKcbKQTNfj
         8egA39dfFkqTZGSw/PZK7r5rTN6MTdnhdldkvpJph8TeDe3z4jqUUzLA57qlQZCKopr+
         k7k9lVL3kk3GTUh4qE6noFzvkoI3iU1GDvhxvANFkXoJRqQjcQnWLtVej/D9o9u2FHez
         IqVuP+OSoNOhAxE9Kh3y0NqzlJgKGLI1faCr8vyWaJeZ7M4lW4Q0lZ5lvEAyQMOAOrm0
         EhOQ==
X-Gm-Message-State: AOAM532K6xCzeDjstlJM6olPja2R/KACVjrYUnKpaxpYZ4CFiUYqYKTj
	SS3/97xkahJjjabK+IHEkKscjA==
X-Google-Smtp-Source: 
 ABdhPJx5Y+RaOi7OC1xLJs4JWK9luI95RkE9eHHdMAB9MvYLriZnTRRy0cPEWElH54G6c+JTAN5A2A==
X-Received: by 2002:a05:6214:20ea:b0:42d:fa32:ab89 with SMTP id
 10-20020a05621420ea00b0042dfa32ab89mr19386366qvk.28.1645550966045;
        Tue, 22 Feb 2022 09:29:26 -0800 (PST)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 w21sm119163qki.58.2022.02.22.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 09:29:25 -0800 (PST)
Date: Tue, 22 Feb 2022 12:29:24 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
Message-ID: <20220222172924.GA807980@maple.netwinder.org>
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: 
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 17:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162181

On Tue, Feb 22, 2022 at 06:01:00PM +0100, Konrad Weihmann wrote:
>
>This is somehow expected from my side tbh - as the lock file disables 
>any kind of parallelism - so just one instance of cve-check-task can 
>run at a time.

That likely explains why the loadavg is only around 1 during cve-check.

>One thing that came to my mind is to move the created CVE_CHECK-sqlite 
>db into the recipe-sysroot before running the task (currently it 
>resides in DL_DIR), so each task would run on its own copy of the db - 
>that would avoid having multiple access call to the same file while 
>enabling us to remove the arbitrary task lock.

I actually do something like this manually - in local.conf for each of 
my builds, I set CVE_CHECK_DB_DIR to a unique subdirectory within 
$DL_DIR. And I still see the occasional build failure due to "database 
in use".

Ralph


