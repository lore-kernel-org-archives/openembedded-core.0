Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F40106B52F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:59:05 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21935.1774443542702514781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jlcX5ukv;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899a9f445cbso73270786d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443542; cv=none;
        d=google.com; s=arc-20240605;
        b=Akz/nDHEZAE14g5ACiRKQ8kZo63mV0HWkuGn04pil4/6D3e2Voreh9ul59+M+uDC03
         oP1aJtdCGxt60skEKNHMYxHbYJg3dUXV87RvSO1Gor4CPji7CqNQjmwo5k/Wvg/Z+0ST
         SMJGAqtuA75++5CXYDwCMEKdRppe7BHCACp21tlro5uOGs/0ghtXpz5dYgq1WjJacxBF
         oFLoQxR7UUYhqtzEjOJ6Sc4tO91wVSyUeVx3i2ND+tnCBt21Xs43p8Vv79Ki+CHmRdZ5
         mzZIXqnM3JlOK/irR1YyUw+/NBChyxOpL2dgOjCTAhTgAaEzPB8vXJP8hpS469obWOLC
         G2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s1zpvdv97QOZn5v7cRFKLxLjBhNkegldaN6bFHJFT+g=;
        fh=aVvJtDSEShd8KLZnQ8yHz2v0Gb7a673q26W22AFcpgA=;
        b=eU3xzk4DA0Ku8ADeimU2fHaHKwTmh1TodYaM+WbyvYRkBjFDmJHCyP+Ouu8kzuTsO+
         AwDqXhFpK9a6T+FXjz7v9FkGI3X4HGrLJsfixdazy16FyxINXv4up7rnkykFKOWHC10S
         xTDpBVHyR5Vq16PNwtvVQSYOalqKnyXICMfjLh8UtFalZx09Ot/9YLJCDw6q0uu0gsFQ
         6jQZ/UZOtqs4yZ91tBb8hfN4ojGtVBd+SWqSf6IK15byTAP0HPDlGF5GW94X8XKYBHLJ
         jtRkrAnL5S0LNOSRu4W1jwEFaLXnKmeqqD2PWFuaMtyh/EKaE4OqFufPdO3ieNm3ms6V
         Q89Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443542; x=1775048342; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1zpvdv97QOZn5v7cRFKLxLjBhNkegldaN6bFHJFT+g=;
        b=jlcX5ukvwg4BqpFcaCEVJ7TGDS7zOFt17MRp9vUWHIPAlF2fSPPe+Bau95QUe1bgbu
         XUhSdWv2SjsXsI0D0jiXpdSQ8GY3nS8GFzsqtV23BSFxXl6MQDeUm0EiGmEGj1UMpkDf
         RaN6CR3nTNCgQu7GVmPa0kFvHB4uncU4p5K3/oTXEKKK9kj3GahOxje6BzpC79vo+lDO
         Jndq2LSF8GDpAN5Qsz9sSBrkbfeI+i3W+bLtC6lHsnZvGNSwHd+RjqbiDKh7r18bc7am
         6hlNoYWgzPH+KkiSmE9T10S2Dkrd946SMhMY64zLkCx57fhzK7klBudhJXIUGxydDFuv
         LOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443542; x=1775048342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1zpvdv97QOZn5v7cRFKLxLjBhNkegldaN6bFHJFT+g=;
        b=GahvhXWfqc+BI6RpStGeN7/kkkcw336rDixGTK6aqY/3tWPchnNxMnnQ0UKnc/qnYQ
         YC0p8iKyWTFX3i0QFHJzEcMeQRR8NiWiujuUzQ+HbZ/hiE+8pwuk4ZdNTHmVTbmYGWwg
         ZHwdhVgYVzgYnZCBg+vMeqmMUSdlnS1KDwprT8XES8hnEPXfDmsVRkEkKc+0S6ZwIM2f
         ZDtv9qedUXiVhazHe8GNqtQ1h5/LWizKEXD2o6sZJ6oVXOSMUEaWUoaHC0y50NShgg3c
         PK0kjr2ulHKa1Mrt+ZLRTEMAuQOtxZG9DgWgjXZG6Wm4KfmK2Bj9+iAWn4OJBx9mSzwo
         bOog==
X-Gm-Message-State: AOJu0YwwA/L7K0iV511XaQDUocywQ+OF7Yom9iDOafWzpxYY+hH92Z4I
	RXzxaBW+W0UkQjr3xYdw2ulznK6KGRdgcuG1jRvO7O4wBvYNwSA/K5bCyq+kKMBgzmoGq9aDkK/
	1d13sKGOeinXC9IKqOSDlkzcel938+jE=
X-Gm-Gg: ATEYQzxPo7Mo2MRBuVlo0Hr8PTuYo5F+kej+CEhjfSqucgFQ4TpFtGhQxhv/8/EnguN
	9pyzxbCdJFwVYiqGrNetLx6Jgw8vDBc6a8QXJfebBbVb2QoABpt30a+u7id0KaW6GplxHZJnO48
	UFCVWroFA/AqLRJHGjxPx9NIgZns5Y8tBUN+XTW6fNLvlFnvhM47Bur5F1OFEH76PmYH12XK4pi
	Rd7Dep+RpqZ45hnOx9mIE7g4x3/8g0RlSzVlfb9MknO+Sng1gZqdpzOXtqM45sEwEzmIsIB/hXV
	okwdj4AAe3TqWggO9uNjP1p1MU23sjNp+slaruKRzQ==
X-Received: by 2002:a05:6214:c4e:b0:899:ea9e:31c2 with SMTP id
 6a1803df08f44-89cc5500186mr44821786d6.58.1774443541689; Wed, 25 Mar 2026
 05:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260325113112.1163632-1-zboszor@gmail.com>
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:58:50 +0100
X-Gm-Features: AQROBzBPZsBeGfu7_n3_F9eCLMhZGUr5wmmF7zKIKaWnKFeffbgeUuYE4mwuN2M
Message-ID: <CANNYZj9WxUMMX3WOpM_QfgC+RqvpZOYOFA=1F7sGj0PPOM_nAA@mail.gmail.com>
Subject: Re: [RFC][PATCH 00/14] Support Python freethreading
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233905

On Wed, 25 Mar 2026 at 12:31, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
>
> This patchset allows turning on Python freethreading by using
> a new DISTRO_FEATURES setting:
>
> DISTRO_FEATURES +=3D "python_freethreading"
>
> and optionally:
>
> DISTRO_FEATURES_NATIVE +=3D "python_freethreading"
>
> The change to python3-dir.bbclass is crucial, as all python module
> build helper classes rely on it.

This is fine as an RFC, but otherwise, given the large amount of
tweaks required, and having to choose between one or the other (which
complicates testing), I would wait and see how other distros provide a
free-threading python. Ideally it should be co-installable with
regular python.

Alex

