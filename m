Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB20C5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 09:57:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6039.1786787859913509104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 02:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RzER30pF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956242332dso18977835e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786787858; x=1787392658; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=paMjvd7NHFYt2s7j7xtp6MagC4qixJnrqMjDRvWS/TY=;
        b=RzER30pFI71ZE+ZbYxQWCtwmiCG9rJGHz2qqE/s6zns/6lm5/oJ83jS3shSQNhAmez
         aw+wlg1BHPZiyMCaEZv91wdotr1t/Cka0QwX5HbdvlxpcX5looSJY2UJrDZGso4zzbb7
         eRYd2TwF0EMH6wKHPMBMs7brm5crjOdJ/mOcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786787858; x=1787392658;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paMjvd7NHFYt2s7j7xtp6MagC4qixJnrqMjDRvWS/TY=;
        b=JD6tomKkWdlPMu4NQqlVCii53VsKyJToVCyXEgLk7kOslQLQCdvQR0CLg+mjgzyET0
         M/Gq8d8dnYFxsgJVTYGR5NgQ56NVB+jIYVG4RvYbjixBYrPnpRkFzufavHjpPGW+YgTL
         0ZVgWMZPkKWIQVpmqoHzJ5M2zVo94CKKNFNkvSBJ89MzXQSY/4l72YdBae4F1t2/YvJW
         Dy6YO0CBXPv+/LvJjXo0+21M4cZx7iMbQSUm68T/zUjniZ3v506WyC+2HjSx8kQj2bBC
         aqHvwRCcVfeR+ZDD4ZH1vz0GjiCspzZwDi4uCi0WX+VOc3H0tt2CRk56HlOOR/iVWtHs
         YIKA==
X-Gm-Message-State: AOJu0YyPwT8XrqtTLEOe4O1BaTLzVlIth/qDuaS1UE83MbpisqEdwyK3
	p+e9S3E8qdynXB87YVjy9hQ5/jtSdrPfV1nyvs01NUaLrCobK0nP6oCCHj/O1VIMjOE=
X-Gm-Gg: AR+sD11AHjveYqhKY3ojXh2oQXThY4m4ec0nM+I34NUCKVOuTyo5shQkkrBFcwNFZbr
	GAhlFtHcnizazg54eBYNEPha9yaTpcqbwiWxI0j2qSp749TV+NMKjSaO8N7Rhq2ncIinPRGli2x
	7Q4v1vjaJfnPpHli4a/4aJ+yA7rNxjs7rUmQwW+VPcJ9yhkoxMmzgDLLK+JU24Fzw8MSPq/rCOq
	WK3x/kLj7PJ+Ui+PM96ujiCFbLBj+Vrw0T7+gJ/sBcgctKWn3XpB4EPtD1B3Z7Ojqqmh+zl4DaY
	cyb/xisBIp9pAMjKYlEFcoJ7C81ndrAAUjYugtgFJwnQwLQ9RZyhTfWRzwmCXLyTfhTHYR1KuI1
	0qnxUwgjZ3HHOt90YgrkGPLwui+hYT+KuatPk55eJZCeWomL09KAoYf/P8nUcwk+/h+J2P0eh10
	lYenPcvukEHABSMuyF/yZ3Euy4AauPq9JZZtMoMQzA+PX1Fpf4s2JsOyegfTsdHYzuEr5LlTUNz
	uLrhYtWQnBMhDnB4hXrs1X6ucBRmsB2NVaoIpwn6ektLxDlIzU=
X-Received: by 2002:a05:600c:3596:b0:499:8ed2:8234 with SMTP id 5b1f17b1804b1-4998ed286c1mr54302265e9.0.1786787858084;
        Sat, 15 Aug 2026 02:57:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:76a9:d146:8f01:f2e? ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999130d9a4sm37794225e9.15.2026.08.15.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 02:57:37 -0700 (PDT)
Message-ID: <4f17e3e48cff0a208f4a7280407940d9e35e5a32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] diffoscope: upgrading to 328 FAILED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 15 Aug 2026 10:57:36 +0100
In-Reply-To: <010101a003e69350-aa8df6dd-eb11-48d8-b004-da9840868a1b-000000@us-west-2.amazonses.com>
References: 
	<010101a003e69350-aa8df6dd-eb11-48d8-b004-da9840868a1b-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 09:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243479

On Sat, 2026-08-15 at 05:30 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *diffoscope* to *328*=
 has Failed(do_compile).
>=20
> Detailed error information:
>=20
> do_compile failed
>=20

The autobuilder downloads config changed recently to stop weird loops
with mirrors. Some jobs (like auh) do need the mirrors setup as setup
their down DL_DIR. We should configure a PREMIRROR when we do that, I
added the config to do so to ab-helper.

It does mean some jobs failed which probably shouldn't have done...

Cheers,

Richard

