Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EDFC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:31:53 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.6143.1657114309131081655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jrw2oh9h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id b24so11006587qkn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3CWfiswnfgdiwkMIY7XpwL5B2iHvWud1+tWy79zslBE=;
        b=Jrw2oh9hTF9SpqJLfEuNw/ixnHPWqDTi8Psy/AfM6vfLdCSHbKaNOp3tupMX8HBekk
         r8Mq7JaLJn0+k45/HEo2SmoYsgdVF7pNktAQPz7aKjQc8wkjTyzVUVwKB6Nkc6+j+EEz
         F8fnfUBNs1f3AxhkTlA6V3L/olW8YgiRPLuP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3CWfiswnfgdiwkMIY7XpwL5B2iHvWud1+tWy79zslBE=;
        b=FGr40HC6pfGEMEak4XxXkboX7EnH0QbtoGV0k/JeazvlUenmbwcrisDgKPHx+voWvH
         7CLQEbfgiOGz2+YVjEXcJ+VyYHwuVKXXZc3ppRGCQKmZU+OZy6GYydOQ0i5HRf7ZpKOn
         9Q5uhpcVivr/BCTyePxlZfj/VbXlwTV2l8py4rH0BnDiwUduuFP6ScevG40vc0EKZUTU
         XVto+UT6us7e0O6inu3FbdRoTeMn3MDbB+92V+jyYGzoeH5eVCFp1NvPxI6mtXupoK6S
         6PB8hwx1HgJhnMBqm+xP16epqRO1vOxckcENn3pYVEHY9NlDOZI2oekzanVXbzOmkXke
         +Rrw==
X-Gm-Message-State: AJIora9/BF8LAbGA7JnHLnf7JXtUVvyTpHpJvfAbZc7DRFmS6E13KlCc
	7crUOMigd47XTGoWQLwPALVrLA==
X-Google-Smtp-Source: 
 AGRyM1tFiu/NKCMs/B52+/mRcLfncrsWQzGXWneK/CN6kEr/JBiD6vnP49vwBybCi7lKerGk0XWh+A==
X-Received: by 2002:a05:620a:29cf:b0:6a6:ebdc:ed65 with SMTP id
 s15-20020a05620a29cf00b006a6ebdced65mr26407075qkp.161.1657114308080;
        Wed, 06 Jul 2022 06:31:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 v38-20020a05622a18a600b0031a84ecd4d1sm20331880qtc.95.2022.07.06.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 06:31:47 -0700 (PDT)
Message-ID: 
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
Subject: Re: linux-yocto 5.15.48 reproducibility failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 06 Jul 2022 14:31:45 +0100
In-Reply-To: <YsWOLwlNxhAq7sKz@mail.local>
References: <YsWOLwlNxhAq7sKz@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167725

On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> Hello Bruce,
>=20
> I got the following reproducible build failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/s=
teps/12/logs/stdio
>=20
> To me, it looks like the in-kernel config changed, did the compression
> alg change?
>=20
> Are you able to look at that soon or should I file a bug?

FWIW,
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxcz=
y/packages/diff-html/

and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy changed value...

Cheers,

Richard

