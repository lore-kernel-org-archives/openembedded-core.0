Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59043105D9B9
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:16:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107413.1775657804653395216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NUbAZh3M;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso35136875e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775657803; x=1776262603; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMxidFxjTnRr5DHuMXBhTw/1dvkahkQ0ARSM/Lu3sWQ=;
        b=NUbAZh3MR7FyJ9R46r/mgLhg5OMnxQzfZlRpSQEZL2kE8MLlwhpnv24i5gHpZZQQQT
         GXaqV7GrZWku/ajGYzWcTAztxK3gesJng0NRQUDixtx7kz3IcwHXk2s10k69Zt6cAHNI
         vKFWtpZiyVVvQc7Ohn1wKT+3NwMcXNGOQVoPMUTiDlcocY3whCC8StqzFTGaZQuhG/Zi
         kiVpXk4PqoxtP1TPsD2AnD6fugTKdDZXrsaEaiAnLg8A1ZjoJqBKsbghGlnmTcFXi8MI
         0iKZCnx+g7zZZaD4Ko+LQBEOi94sI4/atPuqLZ0CCAFk8lHnn3+ViOjjCb7FJBWFfUhc
         2skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657803; x=1776262603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMxidFxjTnRr5DHuMXBhTw/1dvkahkQ0ARSM/Lu3sWQ=;
        b=a6Sl6QXgrawyRxpfkNN5aT+re+uW3KroUGhsR2u+rRX11NplJZegs9kXgzJxH1XZo6
         B8Md9xvw88wlEOEYJxaNeqniWQcfWF3abmVmEQcWSBvlzJSK92DYcahrDr672KCZmBXE
         Y2QE0sO2+kePrC/5N+YkRwsCXJuTy/4vE/IGQMxLqolJhNchdEgjXO0Kxdf9n3sO1Kn4
         RssG/o5ysqX3RgQP5SrPjtZAWQWAyP5/cHhLA2IcgL4RTUkWBH227CwSpfce50JhIvBa
         r7tqwoHSEri2Vxjgjs5dXMXDbxfO7WtIyKtKnMMzwAT2IMo2V3yHEPRGVDDNE9EUXn+5
         kPow==
X-Gm-Message-State: AOJu0YxzsHCEGwkZR3r0XBMRbuU92/7p5qGNuE6E8/XZiL4XMoQ+NCfM
	nE8ChnXNVhINxHCwF7Sk1FJU+Tk7ihKUzSLIHp8aa9I/8zf7Mq5C3i99
X-Gm-Gg: AeBDievtfjZBhYSiAUBH1S+Gd+09xarHv/7ngMGuXiljurjFo2x1pVSLDSAEwhCAUj9
	lbwKIt8js2mOIRG0jEeQV96wjgVF+5iDSCJ/1wPbcxhFBuV1gVWQsv7KG3fJ2JNDcns/dLRuyuS
	k7WTOPrVnLzFbylfipg/BnpjOPnke7RJHoYSoiKJW0iZevJVNZrgP+T/u41WOgmR10/rUCBOXml
	lwHxsa17IL5KeIY08tY0423YrK7JzeemO/QCDGN827Ud/DaCdFO0rxvBvSBl9+wOfazJlfnutdS
	QHCbvjIA0Njsq2MgTBP6evoEnWNiQm0nRzpJhRER98eZQRW9U9lT86ggoPoTrw6F2H0Kid9jxoQ
	yi+iquhqu6KRjxDCXEHJyFEmNRVXVqGA+Vc0eP7ncSSWIWziyoVHAoOuKQF3HMEzd5SFpz/iF+6
	p9lxEqcq+A7Jc9tIsArGNOKncgwAZXeZ1UxzATzVOr61+jJBNuF5+pSl6/8+D5do1makfVM8anA
	XR6D73zDWe9Q4ePRCLB1N8MzzjfwS3EEvct9ZfaDbLxnK5qN2mA4C4T7dokRYt+6hBB2Tlt6Q==
X-Received: by 2002:a05:600c:37c8:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488ba5f98cemr126136595e9.6.1775657802779;
        Wed, 08 Apr 2026 07:16:42 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c1c5291esm187671585e9.15.2026.04.08.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:16:42 -0700 (PDT)
Date: Wed, 8 Apr 2026 16:16:41 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: openembedded-core@lists.openembedded.org, u-boot@lists.denx.de, 
	simon.glass@canonical.com, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: EXTERNAL - Host GnuTLS now needs pkcs11 support
Message-ID: <bcq6u674sxgtmi6sdbeyrnvr5okjdcf32kqre2se2tn7nkuv4z@yfjgumhdscp2>
References: <f5ov7deig7xaovxmtx3nhewki6mudgebahghknhxodlfa3lrdh@ary63d3fodkz>
 <adX6wVUWvNrzYfuV@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adX6wVUWvNrzYfuV@mt.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234840

Hello
On Wed, Apr 08, 2026 at 08:50:41AM +0200, Wojciech Dubowik wrote:
> I could add disable compile flag in mkeficapsule if there are no objections. Sth
> like this in pkcs11 places:
> 
> +#ifndef DISABLE_PKCS11
>                 ret = gnutls_privkey_import_pkcs11_url(pkey, ctx->key_file);
> [...]
> +#else
> +               fprintf(stdout, "Pkcs11 support is disabled\n");
> +               return -1;
> +#endif
> 
I think it makes sense, given that some U-Boot users might not want to 
have pkcs11 and deal with the dependencies. 
> This way OE or possibly openwrt don't need to patch.
In any case, I've sent this patch to OE to have pkcs11 support on 
the host side if it's wanted.
https://lore.kernel.org/all/20260408130553.819420-1-fra.schnyder@gmail.com/

Kind regards

Franz

