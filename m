Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A7ED2F7D8
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 10:34:00 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2734.1764930835573788766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 02:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nb2KwPO8;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88677f91e9dso18024496d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 02:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764930834; x=1765535634; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KsxB5BlnynnbNv/UQoZ1qVbOYh1812vn6Wp/mga341A=;
        b=nb2KwPO81XdhZyzGP3nCFfGiirdmsFwOto1KSrChE/8ge/Mo2WYA+zOd5h6QMso6a/
         4FSpuoMvvZhx38rEnAIUkF4jBDnlcoij772yPHwJrmYbi492dNqkcYc3OFkG5CayyiCw
         Hk5QeYYq9HK5+ewr8MB1jJMjO/JOzSZXVDRlqDb5lxC+8UeDiXg8CqmhK3OUKg8IeWN+
         uPEUH1Ccc47PgppjO6PlcEdBXHpO1RGw7QQDyOUNQqFbzRb74QaYc9PdL6GfmJwCr9ds
         /o1DpgIPImDdR1T1jey0I3icG7FDFq1yzLRLeEi45zejugF8JPbbZC/5Zslm9jOAHdhB
         ClxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930834; x=1765535634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsxB5BlnynnbNv/UQoZ1qVbOYh1812vn6Wp/mga341A=;
        b=HSC+A/MLwpXPrAc6bom74THNYBzq0WTigqXY1sce2uZ/CaTS7rx39iaKzKE7uq3Xfo
         SN4GwPmt+rhDmOSsDZPefcZ01kYxOhbUWdvoQqdl7jeiTFDinEVrPQKj0J0CiOgCvVL4
         fO/8q8ue5370QFSjmLIslLeqpPE0eY147ChKyUUyNfZ8bWnxBipGl07lTnHe1SHgtvl/
         cNJKOyj7eIhLUcrBS18mQ86bDkeHTBmsg2rFmMPvJD0GnGlkl9x9BihY5tlnk+jvIpEq
         H+u109AOGcmQTJTTuNgx1NYjkBqpR5g5sAzDmaw9IH3oXmjUv4UW4rKb4Lfgakb94Qb0
         eVtw==
X-Forwarded-Encrypted: i=1; AJvYcCU2UPeXkLlOCWhpENzAl+kXlX9PRE2E3ACFZSCAT04ASw+jm/GZ8FpIMBXJ+exqK3mrITjuOe3G1r1rYzKiQO2MKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY5+8msqhloHw1LYS036EZSK52g6CTuQNr766JBcnJajm+7OfN
	X3EufAz74rPYvPrMFKhPX2B+9sx8riRmjyGU1eH5h0rbePe+IZ4MvF6XbxB/WB5nvw6IFEyn9aQ
	QEYcTG81QEBOcla8WXeee9yMf2bNQ83Y=
X-Gm-Gg: ASbGncsT1oVCthQTF5CJGnFb3amN0ahDK7iyaKJaXRxzhSQKSxPWccdBnPEFlDV6X5z
	Q0VbyE9iIYwqWUKi490GalGMPMkc4jGBvWEdAtrKIERSCeymkvCtRuM5hDEbSezGKhG0qc/NHMt
	yahC8xMekg7g/kGtmb7Uv/IQFz5b8B/cTkmTnz9QRNIaiAdobHRGyWf2wI42MiX4EeXUHpSlaaO
	6Y0WvAjlXI2JcFBAwzh09/jKHB7S3n1aUdKsuGywOweVuEBNDYIkubgWVIGm22BjQgeQeeAI7p9
	/bvgHdZH6RXZnjtHyQz7bFziNdgBAQ==
X-Google-Smtp-Source: AGHT+IGXFAvh6cLzv/c7/dGlY//l9NPAVXZyGSXRdEdRlZhuVXHzugPoFZALStaLwtgDMl+rN8y94azh6NoIyPW3DeA=
X-Received: by 2002:ad4:5dca:0:b0:880:5249:be4b with SMTP id
 6a1803df08f44-888245536a1mr113692966d6.12.1764930834606; Fri, 05 Dec 2025
 02:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20251205083202.330982-1-Qi.Chen@windriver.com>
 <20251205083202.330982-2-Qi.Chen@windriver.com> <187E4882ECCAA683.722109@lists.openembedded.org>
In-Reply-To: <187E4882ECCAA683.722109@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Dec 2025 11:33:42 +0100
X-Gm-Features: AQt7F2qiUEtPe0wEh-NR145iaSdsTHjfeKd0iTMkd-5zTju4t_M5Xqm33RZfDNQ
Message-ID: <CANNYZj_cgLPNMUo0L1bo_TvMWPQJNXZseUprAszpAR2VL38giQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 2/2] core-image-ptest.bb: use ?= for PTEST_EXPECT_FAILURE
To: alex.kanavin@gmail.com
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 10:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227348

On Fri, 5 Dec 2025 at 10:43, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> You'd also need to tweak the regexp in
> yocto-autobuilder2/steps/observer.py that Mathieu has recently
> introduced.

Actually this is not needed. The warning the regexp matches on is
still printed, the error is a separate print.

Alex

