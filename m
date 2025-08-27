Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35592C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 09:32:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.10785.1756287113414470309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 02:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k4BrTZRN;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70ddadde48fso10699136d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756287112; x=1756891912; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QhpcFA6O8e8HFVcVQXxY10s8ky4XLmVHZExY36uBL7c=;
        b=k4BrTZRNhjOd96NfkCrwk5GEhVpOpbrNyqEIzCFnssgDR0mpmkJPRbSGN3QBoDGva7
         4/Esup3V1MjAlYEHVI9Y43XcjnMebE0m6cgYAtUon539Oz9OoV3ncZ/QBOn3QRozEAY+
         gqJ7Dhgyz+kgwJriqtMWg/i0HtK7BDTlg53zPz/dYEmRYlto2UzfzK1PMwv5WaoZZNvF
         beOs+nrkfPnNY7jqL3MRO57ccGaqUwPjcHT91Y/7JHoKlGtfoT1BeNxCUIBQrxQMEmUc
         8CjiLarc5cj+ptL6hw1/TA9lLAy4ufXsGce+z5Yj2OzXFdVKNbBQJ5lTBtLkBcv7Cl2p
         QQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756287112; x=1756891912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhpcFA6O8e8HFVcVQXxY10s8ky4XLmVHZExY36uBL7c=;
        b=R1KiBDrhtnwuQ+Qp7z3FuEiWD0ianI5ffUiHfqjh/NaZzTy/bcn9rTnG5ljiNgj0eW
         lctj/YpXaGFqUtTo6HZUzdQYuzRMoO6QWb+duRbOf1UuIKBGoDtrvlRIixjlCNp72un8
         ffK9tZfsT3C3J9qdgtMISAs22cy+lylWXiU5fmlTcsdMO5VJ/HMWGD788LRwyZSTQZHi
         tic0Jh1FiH+ONZQ3R4206/JACQ3/WOZdJgIcJx9E57T9lHu+CRplLuVAYvVFig/jzyH6
         11QqE6RRkFauLnqHQvsAYeYTddzvFAd8ExR5/ja9EwedROqE8KUfkrYJwf4VcdQ7yOCn
         lcew==
X-Forwarded-Encrypted: i=1; AJvYcCVvpkvOrob7/8VpEGXlOVcvofJFeT0MNYMcSkdUX/TzTrD8zA7faOC9uEhimIuNxxMfAu1n4sR63f0wSeeG1yVbYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ/ihqXLMuNRjStGhENV3PnstC6ZYW1A6Gzf2q29ndFmmek7yZ
	DZoRkxOoZNubENmTjWtMDNY1ly3aL/vI/EqzeJcX54VruDV0PqQIKc4t62tAzw2JpIO+X60PiG7
	At4hFHMQ5To16sHJXnRA2IpI563QQVII=
X-Gm-Gg: ASbGncvokdwWUVtcGLtCWyhabttuCefMyWO/nCKPs7g+7lkzvSKDCQSqpZOHRKe9zVW
	XYsFGT9TtRNjm6cO74DSTAFBZT7i37299EFq+pLNMCzsR+hxjljWQx6gl6CSYrMdRiNyO5wbdX3
	aCvEmU7Ry8D+wkfJ/wBoyRUD+tHvb6sVsSdNWggWNQoVvfYxCCUc8GNDKp0ad1MA4PwonvpXjlH
	l+EITdeP4fMXS+0w5zeC9GQohVARb0=
X-Google-Smtp-Source: AGHT+IFtAdN+gZXuU/CR1aiWSYQymwa97H45ZscnC/uAyxIjQu2VV8RMHzrWGxs+znxWMcEEZH2wMrJ3M7VRcAMD76g=
X-Received: by 2002:a05:6214:ac2:b0:70d:c8d6:d9bd with SMTP id
 6a1803df08f44-70dc8d6daf7mr79014346d6.35.1756287112378; Wed, 27 Aug 2025
 02:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250827030517.1402-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250827030517.1402-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Aug 2025 11:31:42 +0200
X-Gm-Features: Ac12FXy_lD0BsCsDQvokmBs4g1CK-drXC-7lbs77a5ipUi7en3g0XoK4mNDk1uc
Message-ID: <CANNYZj_Bzg_q7-j+FNv_gGo43-tOYZYFerj35_h3PGfeNyX+tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] readline: backport a patch to fix issue that
 readline can't work with samba
To: liuyd.fnst@fujitsu.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 09:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222500

On Wed, 27 Aug 2025 at 05:05, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +From 15970c431517a046099d8294c91d778b1da9b29d Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Fri, 11 Jul 2025 11:51:15 -0400
> +Subject: Readline-8.3 patch 1: fix for readline event hook
> +
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=15970c431517a046099d8294c91d778b1da9b29d]
> +Signed-off-by: Chet Ramey <chet.ramey@case.edu>

Please do not, ever, add sign-off-by that has someone else's name.
They did not give you permission to do this. You can only add yours.

Alex

