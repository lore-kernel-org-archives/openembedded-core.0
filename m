Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D35FEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:39:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.21053.1688647176885601042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=UOK2VTGs;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31441bc0092so530069f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688647175; x=1691239175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QZTTAjrRrXxnrAs5R+/3xympe7rDR2K6aLS1wEn/NR4=;
        b=UOK2VTGsSX7SAtk3Ax2oSEKoNY0zIlFzWZllNs/84obngZO1/dTwpevn9K2LkWc2IJ
         W/6pGxAqZXJRaLJrr9370iU3aorJD73tskiNp1O6ljbr38mmWejDIF8iDsniABVkLkhm
         q2JSKXufhMsNqHnjdI0SSQ0jTeE5TAYVBUSQJRXxp/mh+5JZBLH4dmorTAKOiR2kNwAU
         eYqQsleMlU7g/2ag2fCdFWH6u40Gl0zcJjcxwP2QzOWd2XZ6pp6UXRhyZBdxMUsNNlHN
         tb5YercO49RFcq7MevtCtIR6g5Kx5K3934IOte3+bOz+1wS/5lS/+bBC1rECzPJghHhF
         RZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647175; x=1691239175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZTTAjrRrXxnrAs5R+/3xympe7rDR2K6aLS1wEn/NR4=;
        b=N8s6U1rMpNHWiz3w4vnDtNgMuxWCJMiRQ8g9pDPVgDGb8lUwA8zq03eSOXOKBXtHUm
         C2FWqDWgNw5NyOM3YVMfnmiF/uMWoK2AgU13PeKNTw2Yfey1WSHRuoTNg0nitkK53OE7
         d31iBg9HtelbAYj2POGGtJxbE8pOo2wOsKZroLRMZKTl6m5ZoES0QNInjW5fp6bnQTsl
         TPdLp88Ne2XKRYInEKq4L7NXQSZ7vdf48v/jBHPFYGb0px4d1cu+fesG4rrZUE57X2Tu
         DVOVisyk4aEyLaywVbw9S17vdi4rrfqiqtPGZzZ1F2hgZ54tvZV8Sg0NJUOfl9enD1dc
         jW1g==
X-Gm-Message-State: ABy/qLZt1Y+RC+ubr+crycT+gY7LP7aaDSgAq2xlGhtOnx9nu3MJpmeh
	AWq1JjbxOjOhHO3Weh+3M0u0lg==
X-Google-Smtp-Source: APBJJlErsUOiz9jlfkqtbP9T9SSt4nCJmH4z4yFpReNBqzb60nXc9DyfJdts+3KlqBjMxxcDoz1yvA==
X-Received: by 2002:adf:e94e:0:b0:313:f6bb:ec2b with SMTP id m14-20020adfe94e000000b00313f6bbec2bmr1486495wrn.47.1688647175179;
        Thu, 06 Jul 2023 05:39:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id f17-20020a7bc8d1000000b003fba137857esm2021156wml.14.2023.07.06.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:39:34 -0700 (PDT)
Date: Thu, 6 Jul 2023 14:39:31 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] Add ptest for less
Message-ID: <2ijklwr5pp3qttdmc7nml6xy37dh7ar34wkt4nwxuosuu2xk5p@wit5npp2thjr>
References: <20230705153137.389584-1-jstephan@baylibre.com>
 <18349E7E-44AF-4A6A-AB7F-6670A43078BF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18349E7E-44AF-4A6A-AB7F-6670A43078BF@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183935

On Wed, Jul 05, 2023 at 03:52:00PM +0000, Ross Burton wrote:
> Hi Julien,
>
> > On 5 Jul 2023, at 16:31, Julien Stephan via lists.openembedded.org <jstephan=baylibre.com@lists.openembedded.org> wrote:
> > So before test code gets bundled into the release tarballs, switch to
> > github URI.
> >
>
> Please split this into a separate commit, so we can review the change to git separately from the addition of ptest.
>

Hi Ross,
done in v2!

> > FAIL: chinese1.lt
> > FAIL: utf8-2.txt.lt
>
> If there’s a way to make the tests more verbose when they fail then that’s really useful, being able to see what the error actually is helps a lot.
>

I found an option to be verbose an error, I'll add it in a v4.

> As you say, these are locale issues, so you _probably_ need to RDEPEND on the right packages.  For example, glib-2.0-ptest RDEPENDS on glibc-gconv-utf-32 and locale-base-fr-fr to pull in UTF-32 encoding and fr_FR locale support.
>

thank you for pointing this out. I fixed the issue using
locale-base-en-us as RDEPENDS. Fixed in v3.

Best
Julien


> Ross

