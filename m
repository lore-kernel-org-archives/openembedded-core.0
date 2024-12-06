Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC38E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:48:29 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.33539.1733478501460809836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCXz9BMQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8c7349401so12512946d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733478500; x=1734083300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wkl/9wBJ9vaCh3p/pHuon6n9OrAN9p+5ZuEXesruu0=;
        b=NCXz9BMQiFHVJIVKdWTKKrSHy5o0wWxvtx/0ufX2CnpVlawV2uxw7+Qo56Ujr9Gw/n
         CvfXtxvyl2O1/HcrI5NwQ6OQvazJIiTA2uWlCnVj2pBFFDtFULmgUSGKVXAXWTuL/RFb
         2ChTaTbAZ3ERamNpoOO+5KsIslShWcyNCtbZDjVbK5q4e1OrsSdFWs7gJBZInZhdPLaE
         PseWpIi3OXfw7OVIE8mA7DsbmdKRLWl1HyQBYIgEsfTK/m0e74k+U0U9S7iRmOr+N5Es
         n0jHQiWXfBdzc8rBy9N918rc/qve0+uhT+qahCFI5I40VmfJAMKrD+uyH08LJ/W/a2bl
         XATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478500; x=1734083300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Wkl/9wBJ9vaCh3p/pHuon6n9OrAN9p+5ZuEXesruu0=;
        b=W9wAs8oRox1MWOVxon+7SgE880hTmLOYu/aikLAcZI35cCZII49ykpvBtcWZaRfGWo
         4VXREhuWRuQXp+V1630AlqmVgVLK4XYZw7pq/RqsbGJsXQ4VLvE0HGcd6MmKEpisJGnr
         MhhTwR8ZMdBVoIRLiGr0bKPkUdk4s2C9ZKrP45Y9Y/fsN0boYVl3CkJyikWM1MOMTX1E
         rKppd0TFA2YDB/Fhvf7fK6kf02rrkVJGy1+cu86mKytLVkhrOm6z5KoAt1+gJP7Atzwe
         yF7krpCHRYGVsatLnNvrVAl0MAaO1TmP+gYOMBDH6c0zDHagtraN8mNwVby1jN2skmbX
         W7fw==
X-Gm-Message-State: AOJu0YxSx/If+KraoHfeqBM9OZ0CdyJwl7l9EikxQgQM2E6jBmkwdO0Y
	GjirWXH9L9JQlXO0EpipVhQV+jEVMkZwYf0prIRhzMyJoHMwDbD7EeUFKGIH8+lkFVsESykJEjk
	0XKaT8b95bN3NVLw0rqry4r5e27s=
X-Gm-Gg: ASbGncs2MEpRPuSGbfFFcKQJRAzVfTvQnheolFu3GiukgN5n2j2uENA1IVlD4Owo8Xv
	gqKKpUQaxJ0hxK6iTSQSNkAxmTYrCJ0C8VXjnAcDpA3QRhrmCwDA36PzeZBPY58mH/Q==
X-Google-Smtp-Source: AGHT+IH1+5FIgm/jUEpehMfBMGR6kzutwiUUgy6gvq/fxZ7KJSpIe8XNgADhn+LOhciuYM6vcrs3V0saOqFrLea2alc=
X-Received: by 2002:a05:6214:4003:b0:6d4:2806:1765 with SMTP id
 6a1803df08f44-6d8e73bf727mr26817336d6.34.1733478500451; Fri, 06 Dec 2024
 01:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
In-Reply-To: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2024 10:48:09 +0100
Message-ID: <CANNYZj_HuXE-hRcXgn_4F8fKDKw2jH8uwbgoq-BMEAYs6OGb9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg-keyrings: mark IPK as allarch
To: pratheeksha.s.n@ni.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208412

On Fri, 6 Dec 2024 at 10:27, pratheekshasn via lists.openembedded.org
<pratheeksha.s.n=ni.com@lists.openembedded.org> wrote:
>
> inherit allarch as package contains entirely cross-platform content.
>
> Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>

This is probably handwritten and lacks a hyphen. Use 'git commit -s'
to have git insert it for you in the correct format.

Alex

