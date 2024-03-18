Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEC0C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 06:31:12 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.37160.1710743466621180127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 23:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F7jT958G;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso56567801fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 23:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710743465; x=1711348265; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XG2+MCFry/hfeuR7Z9wxEs4lpVgAOkkRla1wetdH4Zo=;
        b=F7jT958G5K8yCo5ksgCYH/gU+Oyh8BDCrBacG3uJGHgohognSuijirZ2lb8qG8RNdM
         q4N7aZWMNdEaSxuOkQzgXEQYbxJ6Ll2kpcBYQlF96+jiwAL0SQddy9W2UlbXylz57sgI
         uRVtGHSR+A7QU+VvQH6ICw6OFUgQPgmRARtxe8JXQtKnaQWg7QzjAo5iU+IqkiSIz1s6
         wOs5BSHRlIrh+ZsaUAQ8+MXbRdmXwP1UQkHbAblJcbqDS1kM9QD6yHqywBHU18MI//cA
         S+U4u7e0GMhHOhFuNrpVxFCRhr9FpKJFnnQ78v/PgiE+MqCOU3oUzkZxsONpu+HRXxxc
         cS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710743465; x=1711348265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XG2+MCFry/hfeuR7Z9wxEs4lpVgAOkkRla1wetdH4Zo=;
        b=lEc+DPBTAeHb35AuIuUT/jMN7Tc5JqBPQzGURRi5sEzg82nqfDtGVIhsMT1mBG8/jk
         o+OYkk9IDtAw8stVXn7CdgIQKuffwLZpvBGMjuZgpTrmr4uE3kCHWpky+RnAYdkImQc0
         GaKzd1KDLCYv2ybr+G6xODLZ2Lw1sfRQaiKJW8Yydb0ctYn88+wpa7CgSeyALp40hiC5
         VhfwPlHpbSuCfeQF6i1TwFMJmJXlXQvmnx51XGXz7NAagiP6GD7V4+8l2r5nWXd+q4jv
         /WraZHPoGNHlhBuvjYmWseyyEAWprqpw2HX8OI5D+tAF0A8PY4pn9/sHuy8QyjCpODcx
         hrOw==
X-Forwarded-Encrypted: i=1; AJvYcCUFkkMenWyKLanttl7xkhMyVtxgmBScRHQ7LgsPKRN6pfF4d8HIo9Q3nLZSktkSskZuCWYEfRRlSwPHFKmNEqFcGWWtFAHKbCw35kI3TyF/8Pv0kyJpuoWY
X-Gm-Message-State: AOJu0YxARgP7gyHZ+SUKp/jhnysK3+JJNSdlrhLekq1KtVVUyYTXUxHw
	jrPDFeV6TwX0CW4GtuRZJXndpdQ/GwUb3GAHuXvpSPXDZPgw9Gps4avLsfxAMkM=
X-Google-Smtp-Source: AGHT+IHv/90mqpChLvFpsDTLz8h7CFSnHZuYUBb7dDmOkVn6Hbf5aus4RTufnMDo/q6PEQH92aK6ow==
X-Received: by 2002:a2e:9188:0:b0:2d4:98bf:a646 with SMTP id f8-20020a2e9188000000b002d498bfa646mr2577063ljg.13.1710743464526;
        Sun, 17 Mar 2024 23:31:04 -0700 (PDT)
Received: from nuoska (85-76-0-102-nat.elisa-mobile.fi. [85.76.0.102])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651c050800b002d4975390b2sm749724ljp.79.2024.03.17.23.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:31:04 -0700 (PDT)
Date: Mon, 18 Mar 2024 08:31:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dnagodra@cisco.com
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Message-ID: <Zfffphmj70A5muCG@nuoska>
References: <20240303175323.2526814-1-dnagodra@cisco.com>
 <3DFB9E4D-D025-4318-8BD0-6D7D8DCEE1C3@arm.com>
 <SN7PR11MB6971F0A6CDA076349AF6C9EFD4282@SN7PR11MB6971.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN7PR11MB6971F0A6CDA076349AF6C9EFD4282@SN7PR11MB6971.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 06:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197293

Hi,

On Fri, Mar 15, 2024 at 07:52:00PM +0000, Dhairya Nagodra via lists.openembedded.org wrote:
> 
> 
> >-----Original Message-----
> >From: Ross Burton <Ross.Burton@arm.com>
> >Sent: Friday, March 15, 2024 9:39 PM
> >To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> ><dnagodra@cisco.com>
> >Cc: openembedded-core@lists.openembedded.org; xe-linux-external(mailer
> >list) <xe-linux-external@cisco.com>
> >Subject: Re: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
> >classes
> >
> >On 3 Mar 2024, at 17:53, Dhairya Nagodra via lists.openembedded.org
> ><dnagodra=cisco.com@lists.openembedded.org> wrote:
> >>
> >> From: Dhairya Nagodra <dnagodra@cisco.com>
> >>
> >> - There are times when exluding a package that inherits a particular
> >> class/classes may be desired.
> >> - This provides the framework for that via the variable:
> >>  CVE_CHECK_CLASS_EXCLUDELIST
> >
> >What’s the use-case for this?  Note that you can control whether cve-check
> >runs per-layer already, if that’s useful.
> 
> Currently, the CVE report is generated for all packages associated with the build. 
> However, not all of them might be getting used in the target device.
> The package associated with native, nativesdk, cross classes are examples of such.
> This patch would provide a way to exclude these packages in the CVE report.
> So, if the variable is set like CVE_CHECK_CLASS_EXCLUDELIST = "native", 
> The report would not have the entries for these packages:
>  gnupg-native, nasm-native, binutils-native (and so on)
> 
> This is helpful when one wants to concentrate their CVE fixing efforts to the 
> specific packages going into the target device.

CVE check generates report summaries for all images already. Doesn't that cover this
usecase?

And many build tools end up talking to servers in the Internet so detecting
and fixing CVEs in them is also quite important.

Cheers,

-Mikko

