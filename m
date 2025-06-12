Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94F7C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 06:37:42 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.6593.1749710255792095193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 23:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X68IQZs4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so981772a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749710254; x=1750315054; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPIAJsbRcI5nsT3JdD6aUEgqamczfvEpLzHvi20vzYY=;
        b=X68IQZs4B1cSgVxcdUpyBV9nnJAw8wo1ezoDNQnE5ds9ihgicXLaPzQFuERfuZYhm6
         9Bu8RLjNw4wmne+gcyhuiM16erBWwzHegeTXmk8Zn+nUBsIQHnNXpnq3oBkx1IDOFF1S
         HNDlveE+YJE/Zk4XNkN0yaPAhyhGVOkdg87hmOUEp4cnUF0EqUJ0SR+oZxitTDIiPf+r
         HkvQkTrzdlStOzLdrK4GvXFGOcEZed6AtqkwMfOqi4Y1T/OIQ0BeG7DmID+9D3QS0M9s
         +JUOQe8uxsFxn+W8LGNa28uFrh6G3EaZUwN2VUCa4H99xECemZvf4smzLgwVl2wUQmDf
         NiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749710254; x=1750315054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPIAJsbRcI5nsT3JdD6aUEgqamczfvEpLzHvi20vzYY=;
        b=wkKYGbDS+2D/p4z6j9NcMjm7XE27A+xrIbJYkRbBK/Ao94+/jRY2UWywwV0pQ5XGoM
         ORF2Lbi1I2qf3m8UbAbhx/6odebo9fepy1FVPj5TiHIB87YMcU7NbuYGpevzJUEISskq
         ic0UoddOqe5Dve9QJP4mWeIrz63VMRUE3viP3k17O5VvTiSvmVyMesh8Zj5IwTMmh8v/
         4T+EREHix9J2IR4NhPRx3N/jRAfdx8FZcKglkX5/NXGRDG+cbhp6+EEUfnzT82kY2ci1
         DEyCwABQqD/5AJILH9sWVWAHo57CW+vq0cH9AKmC6XSTkULLW4OVnlg9SO642S080lTq
         xcCA==
X-Forwarded-Encrypted: i=1; AJvYcCXadSjjUGSohokIYXvgoI6RpC+MnztyOXFWI9RSt1mSYKzDmsCV12qORp01LN4tTT3g5VbOFhMzU5SGLdGCTA2Tgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTxM6Oq0P7VA7M45rPv+xnFg8pB+9dLFQMeJuHKLLeEMADGyeX
	LRmuPvISHZgKWXAT8Z6T3g3+r8P1BF8KqLT+LV9/nABEC850HO8i4qMq
X-Gm-Gg: ASbGncsoSDKmmqkR8aWL8dDtQ8HNK2Shyw0AOy38aZoXAyui92H12UpNngIxyS2M8W6
	qb8lhVaoc3BybtKZyW4bBtNofSkN4Fr/KPBmOfizZiE2Zc/Tt7Yg53o5DWCvUSHMTYbSypiCzkJ
	zu6CRRUIytSG9kT36u0B42FhCH+D6wAns06VthJu4Tg5mKjmaAqTYOd3AV+Vkmg9JeUserwoNGD
	5vAFds48j8i/YyHany787kydjLTyk+pDX5pe9DknpZplQKgoyay4cUVTSrKt6tKu+06Ui/XK6aD
	H/dkzCynkorxu9ypUL5DU0ggNVH9h47XfrSF8k3aTGDa7lBLFjpOLyP7G/ES1CKQcvAORuJxBpa
	zUnQT
X-Google-Smtp-Source: AGHT+IGToq4+ELTcYkXzsQxLg3TRmhJXr/K9lu/RRsA4Z2cMNWYV618txCV9rS2JFxGNkZog4lROnQ==
X-Received: by 2002:a17:907:706:b0:adb:4342:e898 with SMTP id a640c23a62f3a-adea26ed258mr218778466b.28.1749710253672;
        Wed, 11 Jun 2025 23:37:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadecc41csm80841466b.143.2025.06.11.23.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 23:37:32 -0700 (PDT)
Message-ID: <1a24c39e-3b84-45b1-95e3-ca0c269442f2@gmail.com>
Date: Thu, 12 Jun 2025 08:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][kirkstone][PATCH V2 1/1] python3-cryptography: fix
 ptest failure caused by CVE-2024-26130 fix
To: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org
References: <20250612044316.1385701-1-archana.polampalli@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250612044316.1385701-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 06:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218482

On 6/12/25 06:43, Polampalli, Archana via lists.openembedded.org wrote:
> ---
>  ...st_pkcs12.py-correct-the-Indentation.patch | 62 +++++++++++++++++++

Alternatively you could also just fix CVE-2024-26130.patch itself
instead of patching the patch.



