Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF93CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:56:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.20382.1757692586358494543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TT5K2KqR;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-72631c2c2fbso22121396d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757692585; x=1758297385; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRwBNan0z601v3AB84lU9YmsxtHkiULzSvUVEnGDQ4c=;
        b=TT5K2KqRfH1jZzKZSDer2jayAh0wCncfL7onqReOwvAk8rhhi3bgdBr+qabNCS6IRT
         XQ/VE0LfY9zxFfucluZpyx4Q3kdcTVlQzD7Tz839vEUh+x4dcDTZn2vUtZf+8d0AbCHw
         zznULgvKJoo0XNX0xyBZLv4mTOWCH2vZW3VNJ8lhKtgLthl84xF/ZqPcI+XGJeYfNyIV
         EnUOCM9ilG/blP+T1uCwkBoU/pqRmxAf5jNFyPyBg3mrmPPRRvVEz3Iu2sXnYJfPCGIz
         dINKwvT5Wrr3CfnumQ4QGmWKcwQLOtxC8tM7Fqx59ckS5I/Z5bzglWJdaxtg0COzctE1
         GBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757692585; x=1758297385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRwBNan0z601v3AB84lU9YmsxtHkiULzSvUVEnGDQ4c=;
        b=fl9s4eu6pUeFiPY/o64SG3fPk47tTZhfAsg54QLNulY28l4Z8CfoBW96mGrjsW5r5z
         ILgVVXMWYjxdrEXZnRmPyRfvgSBm+7V3v4dW81LdFIvLDgUvJx6rS2DxvAdAo9vw/ITS
         bfQ3TR+JJq8j0LW9dSMYrjxHC6fqUHtWth+8KjbfzDyncZWSez71IlEe9fzVLlADPiSN
         SxmLHRU0en0j9SP3iLWFx1cD+jrZ7ISn8Y8whU232W/54k4UscobrOVJuYvB5q57F6Az
         9Cry7DlEYzY6Vp2Q52XvldiIZqVfc2SToxpcWEAmo+yXkAwrA+CiMWAAy7nA7HVbxY4v
         TOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYtu9dKNqahLIe0/CFrH/F0hOs351RAEFOtZzND5Dv5CY5e5QBI0HKf/FM0KK8IukVX2B77wFhetS/fP+s1yz+Vg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzF8zqkYV/xMsQiFahvmIHKOxkVRp8QIAGndIKmFlx9r9rpOTWt
	5zNO7Aqh7c4eHSEzMc1YV6l5lY0PTiBoNL3fF9J/m6rDeA8ASc8noS8I653COEg2e0cnLr+4MMR
	qR+KXWeEVrcfYEZ2X/F8EfWH5Vzjb7TI=
X-Gm-Gg: ASbGnctuOQuHEfoLspeE4g3pSVyatweEiqywgHwpgXj/L6bbQ2nYOGHWGVbrb7BbIbk
	znMrMaImZ0iFY23sQLODKn+NOUBZNzPjPHzZeG4UUIlT7PldZV0/eUAMG7DKKI2gEsDtuf0aqYw
	lHfRUrDiNe6GU/5ouubRgYLK9OV3mT/67A0ypzSedroGl9i+xHGtBO0o4j8+u4CGbGOaZAnYZCO
	31p5x3jeQARaBv7haivdW21LZTRmBil/tfMCRaZq2nWjVsLHDC9NY1jEf9wp8ezvt9UqS6L5o1+
	YooRcfsgW9Ma5r76NFLe7xtEpoAmuY6W+hVHlnjAXrRDggVBjWc=
X-Google-Smtp-Source: AGHT+IHOThycDD/+sR4Q5Ekc3MVCpdZDS/bb7jDG3f2D4/MvtW85qV3S+1fjs4NtAF61tRDWUsD6RvmsGduK35rriSk=
X-Received: by 2002:ad4:574c:0:b0:70f:9f02:ff38 with SMTP id
 6a1803df08f44-767bc026f92mr52696416d6.18.1757692585238; Fri, 12 Sep 2025
 08:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com> <c8e6332d-7ec2-42c8-901a-7e95b48d95d4@cherry.de>
In-Reply-To: <c8e6332d-7ec2-42c8-901a-7e95b48d95d4@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Sep 2025 17:56:14 +0200
X-Gm-Features: AS18NWCEcVCN-5kcUIal0SQPYyabBg1bJgfKNIYbRuM-jwLWbSWm2BFpQpmzkTU
Message-ID: <CANNYZj-0XfNjqm1Rf7Vw4-R46a4Uj52U1-fp1pa9VJzchym6bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: add vulkan to DISTRO_FEATURES_FILTER_NATIVE{,SDK}
To: quentin.schulz@cherry.de
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223324

On Fri, 12 Sept 2025 at 17:36, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
>
> Hi Dmitry,
>
> On 9/12/25 5:25 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > Follow the example of OpenGL and propagate vulkan from the target
> > DISTRO_FEATURES into the native build. This helps us to resolve mesa ->
> > mesa-native dependency if 'opengl' is not a part of DISTRO_FEATURES
> >
>
> It's unclear to me how this "helps us to resolve mesa -> mesa-native
> dependency if 'opengl' is not a part of DISTRO_FEATURES" and same remark
> for patch 2/3 in this series.
>
> Can you please provide a bit more context on the issue you're trying to
> solve?

I agree; this needs to be more specific and explain what native bits
need native vulkan distro feature set in order for target vulkan to
work.

Alex

