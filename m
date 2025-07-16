Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DEDC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:14:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.24916.1752678889559263911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=akHuGQwX;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b3316160so7186309e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752678887; x=1753283687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hzp1Z721d56RGt2ASjx4vIU5nBYthGg7QURbjyULgjQ=;
        b=akHuGQwXI92uopMqzrik7ZE2/Ydxn8WaoocdVBqV+toz2uRtE1HnM/ROyj9ri9jMb9
         eYOS49jTUY6VPiPRBXeIUX8DVy7IBWnYbQd6P8DtBdi+JhL28Q5Sl/nbGsPNBcek23lq
         V0tIKuv5p4pkCIwWgygNPBlUvxKViX5murckb/6cv/LMnnsx0a6vVgtbx+HOg6CrHAEo
         gJJ23e4ZkyTh4f1Ou6bmP4ABTUBMEF5Wtuzez+Jiw8WQ9xTjUknj2T0VWMlgyymjvT+d
         w3ub9F2xQVbW1Y8K4RDYCpDwNFtl1QHJQwzZPlFA56EE/2hlzjwkMHu2SU4Q8ruyn6jk
         75+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678887; x=1753283687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hzp1Z721d56RGt2ASjx4vIU5nBYthGg7QURbjyULgjQ=;
        b=AhmTfFC/1Ft6RkwwkIbK0T1zcuwBRLdmwyfYDG8SyOaYdRqtMDFN8Fg03w4P4VJvLo
         ZXhn8Oln+kxOMEfVtmFe14dZq4nTBXW5UQIN7J5qLBDB+KU5hseFAy9fsYXKCpzN/AFd
         VS+2cvYmeROJfkbFnUdrizGJClSB1FGFUYxKruJDIhNSfEnEhbgwUa22nI5rgV+a33nU
         D/FgrsrpKDCslwn7NJGrsXxzY9xFiTOQ2qdZ58J4CpBX+3ijL1m1xYbmchYVvR04DoG4
         54u4Ns1lTH3gysZTIaxQWzBXKMEOZfF+O9Ufky4zxe1f7+79l5dyzra2HsxCS0OOfnMW
         0Ksg==
X-Forwarded-Encrypted: i=1; AJvYcCWtkdjTdcvYucJW14uxJEOpMZbZXHXIr5oK3Pm5zbunt/TWc5EvbCbzNcNFBXPGqtgQWPfnKF6J+aKxSM3aUVHpDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuKWBNNpH0cx6/agLlqES2fb4mn2v7L8EMr/pdqfQMeWSdaZeZ
	+Ysfj4MH0/3tD1dlSPvFO66JPGWzo6t0AEMpKLLvbx84C6iPg6kwJdbzpXNnaQb4wBrRKjKb1Fv
	+5Y+38Vlq1WxtYFWxuro2Qu17QWSx7/E=
X-Gm-Gg: ASbGncsbu2+e/OjLxdmw3WRuMv10t6U0P7VanHWQhUSHyLA5cEx2REV4ZB5G+H3Y11x
	Rdim+aSxgS4XnrF6MQPZHzoJykYg8yaVAWSgdFaq5UvI9gdO0UeYEuvk70BqZDpuc/w+rKCWr+L
	Rmnkoeqxd4m32CMbhkIe2+ktJGmzXai1NzZZmDwqWAInuggeCfwrYdaxmHF6e4Jsm8I7rM9cVKc
	zebpJ1lsg==
X-Google-Smtp-Source: AGHT+IEUPFPAGStNIlEVvERU5sj7pijBmNh0bP7/XhukrqM8juZV/90esYlYX0Y/yC3CajR7FBupt8p+VGfFEb3TEaw=
X-Received: by 2002:a05:6512:114b:b0:553:268e:5006 with SMTP id
 2adb3069b0e04-55a23f98b8amr923705e87.55.1752678887225; Wed, 16 Jul 2025
 08:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com> <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
In-Reply-To: <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Jul 2025 17:14:34 +0200
X-Gm-Features: Ac12FXwvk1-9k3Ngpibr5cKZGx5FXIkCVC8vu9thGmNR85U1W40N4FTECCAoyqU
Message-ID: <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the SRC_URI
To: raj.khem@gmail.com
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220470

On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
> On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.openem=
bedded.org <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wro=
te:
>>
>> It seems under some circumstances the tag in SRC_URI can prevent the
>> recipe from being unpacked correctly. Drop it in order to let bitbake
>> handle the recipe correctly.
>
>
> I think we should look more into underlying problem. I have seen projects=
 create release tags that do not belong to any branches and can create fetc=
hing issues using nobranch=3D1 helped in such cases

I think this happens when the git repo tarball already has the
revision from SRCREV but not the tag yet.

Adding tag param to SRC_URI only when upgrading the version helps in
some cases, but not when the tarball was already created with the
right SRCREV.

The only work around which worked for us in webOS builds is enforcing
to use annotated tags and using SRCREV of that annotated tag (not the
SHA of the code it points to), then either both (SHA and tag) exist in
the tarball or neither and the repo is updated before the tag check.

v20.1.4 isn't annotated:
SPIRV-LLVM-Translator $ git show-ref -d v20.1.4
74843f2186bb63b6802758222084da17fcbe603c refs/tags/v20.1.4

