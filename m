Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127C7C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 14:06:50 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.52803.1748354804877112878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 07:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eVOYzRjF;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f5373067b3so37406806d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748354804; x=1748959604; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ1w8ZK6MkvU52OzpeTse+K6ONKNSzanPhzgojfh5/A=;
        b=eVOYzRjFxrVfqvsGdLvRSnfv2ZBnYVvtLiUqYkasrvwFkQdx4W9/6RmyHj1bi2N+jj
         nQehkt/an7nN/z/rZkyZ1+QPUe5ThUJxCdQaracSthLYeQi67YridJQOKVMU210hkNVn
         Co8DDaJRrL0UM54TAGBJCumRC1fnRnLQ24M9XuFPgXoUeeUcmimJ9B+7JaPYxKNzHqHu
         VgPOxwEuzmQf68327LYZloMUeIkofQaxkyXWs4NVuylETdn2PsVSyR5310WWmRH7loiK
         Fh7Snpd/JtQ1AeYj8PPTQjt8z2UXovRCU2fP++Qtgr2PuL8KZv9bVGqRlTAHb6oEKCt8
         OLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354804; x=1748959604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZ1w8ZK6MkvU52OzpeTse+K6ONKNSzanPhzgojfh5/A=;
        b=QpnsoE4sa5VJhBz2CAvrH+rA8oBzv8cwYwaQDk8tuLgkGRFhTGQ5oZ+Ygp97n/qhD9
         kdNQ2L4qmIgcRDjPmW28XhdS4OObmh2taP0PUkgaESDxarGdxD3HF1m5lkj1tYEFzLPX
         z5Bce+HS1d2isE90Cv2UT3VwshQiLuUkAPGNCpUY7ZcDfoxKHY6uuWuorle+z+1nBxkc
         FrVPCC35s55xMNz3QBNnTZlsVLk2WWFFMNcI2QOKLjejVDTt7T9UIVhS2YBfG/MZvRNf
         CLWmx3qQowOuwb7NVpPFOJrrApHPUDll3hm2XLl1W6rM7JsG6/kiIMzKdKMV0igjuKBH
         z1vA==
X-Gm-Message-State: AOJu0YxEeO++TnjUg1Tj/wjcXyVGQ39FRRDh5cPrOFa6w6vJ09kund+T
	3UV4mIdVgL11PMv8XZgUdI/5HJHQIswf4elYYhNfWZHgDLvB1k16KD3Uhk7Xk1ym8BfVwZn3D0V
	fQIRQYUmcBo5voRRc4G8qoXHQNgUItXpS6Q==
X-Gm-Gg: ASbGncvLMT6yb1SD/ocdc7wiOSqsw0zpL6+b3fDFbdJZmkSkT9Klc6+hLLpm0bLfyG5
	Lhw0D8avubEC3yxVYnOFIiqpeshbw1OB28zoHvSGS4yqlSei/02YSKk9peF2lAFLY/N2L7ln3mp
	lyucpFWD6iZnFOzQaPuwT5nOQVQ7nvUkQ=
X-Google-Smtp-Source: AGHT+IFznxT76K8pF7R5qs7vueQP7pwg3hiyTNHPzXTyL7o3DAY84Ck32g2w1XTBG8+nzWBBZVj+j6ia+Osmwv3eOdU=
X-Received: by 2002:a05:6214:1d0d:b0:6f4:b876:5fb8 with SMTP id
 6a1803df08f44-6fa9cff13c0mr180209726d6.1.1748354803583; Tue, 27 May 2025
 07:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
In-Reply-To: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 May 2025 16:06:32 +0200
X-Gm-Features: AX0GCFuqUV5W9WraT_HGqcFA-cyLqtewUhB2yx08OjGmjTizsrPNVDOBeOCEwlM
Message-ID: <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Yash.Shinde@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 14:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217307

On Fri, 23 May 2025 at 18:22, Yash Shinde via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
> do_package_qa: QA Issue: File
> /usr/lib/rustlib/x86_64-poky-linux-gnu/bin/rust-lld
> in package rust doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

I ran two builds (1.85, 1.86) side by side and this happens because in
1.85 rust-lld isn't installed into ${D}, but in 1.86 it is (along with
many, many other things that weren't installed in 1.85).

This is probably related to the drastic increase in build time too.

Hope this helps,
Alex

