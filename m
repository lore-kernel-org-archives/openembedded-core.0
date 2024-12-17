Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865B8E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 17:00:39 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.86852.1734454833902357766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 09:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YfqlwqEH;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd049b5428so3561876d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734454833; x=1735059633; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nmtQjMSGFg+mjF3Il4H8FaYJE64O79tQD/YOvk6QNEE=;
        b=YfqlwqEHATzODtFGb7oI+dh45HuKok+UrBC4OxBSBMOpt4wV544SNcuJDH1vU5PJQM
         RWWQKlHxbZN4R7D58ppUdqjRFOFQXb9SXjmrA26XYv2aeMUME/QgT0H1ItG0C1pZ9glK
         OHSYql4b3Wn6wF9kIWtkBndjyNfBRiQR21U5Jz03AYZ2B5PCjuAQAaxRxFfYaHsfaoT6
         7Z/Wjw2J+FDPkmZJZp0XVy0HB7RrYU92WmXdoJ8jE8auSjvONNzSNLVYfJ1LQr0Vl2Hp
         W8j3CosML4d7SPwP4xdV6cJpJQD/I7RSZuI7Z4u6TAPk40c1tBDAVOYjSkWxV0BoRf0O
         OrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734454833; x=1735059633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmtQjMSGFg+mjF3Il4H8FaYJE64O79tQD/YOvk6QNEE=;
        b=EuzNCkJDgslmYLVZvkzVMZoVZiSpql1+kcq/4qsqcCA0KE5XM3GoSifMzBjLLpEkrI
         /7fQgeTJc62Gw4lL/LE4JkcapO4BCaXSei6j5TgyDUd2zHLvqy1D64O2IIofwL2IcUok
         NnNUqqFztm5StSjyV3ayoxDjqAo3je7qQdbJ2AZPpY8zp7btmqZAtyjJkhr4+KuXyv76
         36q/LN0ZwuSyoqdS/BHvfWzbmfBvsIF7aNzFUGEiaOZBRMRmKJAxI23+x7Ljf8ywmhkv
         mFomTHU8f+L317M95Peea5CqbCfXvra643mO2M2xA0Cy/jG8H+f77Cnh9N6g1y83dQnH
         2v+A==
X-Gm-Message-State: AOJu0YzB3nP3J54wbrIX6JXo1NorAxY9X4Vxwvxd8wNM+nfjBrvGV9us
	DCjg9XMwl7GIaz2xrFbBMEo+YSq9E9NEVnYuPnMmVf8hYlnKHQljxuFRJPUksoeERQQib7Mn/VQ
	j4Z1ahX0y3qxfAfQA59b2V4W0S6o=
X-Gm-Gg: ASbGncs96e0JkY/HBuDtfkJCBcX7Z5jGoKEBWYElFvffpP4StB0DcaJ/8Lo5xsWVi5H
	l17F+6HGZUFbhRYebjxLg7O/833VXBZ9+rKfC63kE0z50uKeGp9E8Pp/ntdEQJq4nkDoMPTV6
X-Google-Smtp-Source: AGHT+IGtocO17jpG69Xwu4MUum31qzxXiiY5JwoZRpnHV5KnJAnNSEpdAv87ybe9odyh2AcyxkgM8cZc8gLvGM7jXw8=
X-Received: by 2002:ad4:4ea1:0:b0:6d9:2e0c:56c9 with SMTP id
 6a1803df08f44-6dc8ca3c5demr348371806d6.9.1734454832620; Tue, 17 Dec 2024
 09:00:32 -0800 (PST)
MIME-Version: 1.0
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com> <1734425887-18069-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1734425887-18069-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Dec 2024 18:00:21 +0100
Message-ID: <CANNYZj9ObaOogZy2vO4kQqNvSZne2AURhAvSr2+O2a3FTcN+Zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] bind: upgrade 9.20.3 -> 9.20.4
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208843

On Tue, 17 Dec 2024 at 09:58, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-connectivity/bind/bind/conf.patch
> +++ b/meta/recipes-connectivity/bind/bind/conf.patch
> @@ -1,12 +1,43 @@
> +From 3233f7c3b0d208890a9869309e692c4b0fe0483b Mon Sep 17 00:00:00 2001
> +From: Qing He <qing.he@intel.com>
> +Date: Tue, 30 Nov 2010 13:35:42 +0800
> +Subject: [PATCH] bind: add new recipe
> +
>  Upstream-Status: Inappropriate [configuration]
>
>  the patch is imported from openembedded project
>
>  11/30/2010 - Qing He <qing.he@intel.com>
> +---
> + conf/db.0               | 12 +++++++
> + conf/db.127             | 13 ++++++++
> + conf/db.255             | 12 +++++++
> + conf/db.empty           | 14 +++++++++
> + conf/db.local           | 13 ++++++++
> + conf/db.root            | 45 ++++++++++++++++++++++++++
> + conf/named.conf         | 49 +++++++++++++++++++++++++++++
> + conf/named.conf.local   |  8 +++++
> + conf/named.conf.options | 24 ++++++++++++++
> + conf/zones.rfc1918      | 20 ++++++++++++
> + init.d                  | 70 +++++++++++++++++++++++++++++++++++++++++
> + 11 files changed, 280 insertions(+)
> + create mode 100644 conf/db.0
> + create mode 100644 conf/db.127
> + create mode 100644 conf/db.255
> + create mode 100644 conf/db.empty
> + create mode 100644 conf/db.local
> + create mode 100644 conf/db.root
> + create mode 100644 conf/named.conf
> + create mode 100644 conf/named.conf.local
> + create mode 100644 conf/named.conf.options
> + create mode 100644 conf/zones.rfc1918
> + create mode 100644 init.d

The changes to this patch (adding a lot of new files) do not seem
correct, if it's only a refresh.

Alex

