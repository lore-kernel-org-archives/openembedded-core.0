Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01387E6B250
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:11:24 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.36285.1730463077059526919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYJjwCZS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1775243e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730463075; x=1731067875; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNHJmBLONtdgvYcj4glYu4qBr6EXCeKCGebhXv4+q7c=;
        b=dYJjwCZSVFQBFdS2upo9ep33b7J81GCrzd2rrqilCZrdBhzogBKHSB1Xu2FmcKuNXu
         WOzKLA9U766DMhj8UTSCXtV2GNhvET5hLjudY+o/B8iLxVLImvDsf0UqGA4ekohl0xBD
         OLEfhlq/hCTufeKNOXNz2rWIhVfOMJH+ewLguBL19+Vx8HsYKxTbG82wjCsbyMp4zstN
         JD4ocNSjJg39yPZD7B+sDlTTFmC9zDL8f7OyE5drjbp7xu4Nj2vPJotcxVFzvSTuy6hl
         J7gAZfkgs26RBsDF/meXsNq/3jDhRSlghLeq9DQBr33MYQtRHao4GouDAR+bqb4nzHHq
         HS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730463075; x=1731067875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNHJmBLONtdgvYcj4glYu4qBr6EXCeKCGebhXv4+q7c=;
        b=CCgOJz1adJV27WK8aINPpY79gaxfCFKC2EKlTq347XVeLnygGGvnIBDLfjQBECelx5
         TlpRwxtK/ePYmRVMgiLazxmIm8q3eZHN/jXgCXJ5ZsVcG+r1tvq55LMhZPNT4vJsLVUE
         NgHxQ6Dtg5MwMv5d+3aBmAet3iVoOKfP4vc28tuktMikSgBaW5zOqHtXb+ONT/3eDk1/
         LPmFgMNaHWro2nYh5odN+X4veIOkP/ZLWPM8ru9flp908KUCUL8Th/suSxChjiohYZ9I
         PRKWVN6klYHWwjI3Vc1irDwI1cOI1GZvq6Y1MOml+HMzkIMBhpp6wNVDjNQMNWy9DCE+
         rMSw==
X-Forwarded-Encrypted: i=1; AJvYcCU4aMuPq2D/kw+Y/EE6z7N6QXe/KMEFoYVHZ4RaDbbXhk08MBtz0V9uA3PuaP98vWGrXF8BReT+uu7UyShUmr22fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvqrT3nPscs4WXT5wh7Ex+XTlSXFarRC9ud+mu8NXKjkw4fcmz
	LZUxttErlpCx3zclK3AJky7wADTODf6LMjb537UCKQ4LsXtdfdgBIL78+Z1brd4dgPeUGWl6jRK
	WnIG6dF1ikQM1GLLQKUELrZ5NWCQ=
X-Google-Smtp-Source: AGHT+IHe8NSGwesTUTCCJFFqUmLoWgIxzPIP2QSOc8diPSFKHb0G0/rV+5/W1ukmzuj4iichKOOmRM4gQ6aWyGWz59I=
X-Received: by 2002:a05:6512:b8a:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-53c79ea562amr3338844e87.49.1730463074799; Fri, 01 Nov 2024
 05:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241030052443.855752-1-f_l_k@t-online.de> <6EDDD5DE-CB20-4E1C-BE71-8363D60CA8AA@arm.com>
In-Reply-To: <6EDDD5DE-CB20-4E1C-BE71-8363D60CA8AA@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 1 Nov 2024 09:11:03 -0300
Message-ID: <CAOMZO5CP4AK7jgnphmhFw_bRHL=WMubsyQU1p--m-A6bhGjT7Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] u-boot: Add patch to use SWIG_AppendOutput
To: ross.burton@arm.com
Cc: "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206619

On Fri, Nov 1, 2024 at 9:03=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 30 Oct 2024, at 05:24, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
> > +Upstream-Status: Submitted
>
> Please include a link to the submision.

The patch has been applied and I changed the status:

https://github.com/yoctoproject/poky/commit/1acf3092ff5849de12bfe047b317263=
ca3e21dd6

