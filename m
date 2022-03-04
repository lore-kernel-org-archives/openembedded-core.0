Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BABC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:00:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.895.1646413231127811799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RfL+a/Yk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u1so13566627wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e1grMIObJfpRuFRTQP5CT2hhNIans61FHYVLLl5yBZA=;
        b=RfL+a/YkSnnlx1nQry+FI369PVdYTk2iaZW9DCe6SbrWrJWysx9u+/ynFWf5J8P1P3
         +RoF105+cXY81xFQFmED4wA5d+1to5q4oSVTURyGuf1/PUHNtnyQHM8VtlPo0dpH/JwW
         HE/6HsILbt0dnu4N/3TS0fYmCO5A1wOkdnjCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e1grMIObJfpRuFRTQP5CT2hhNIans61FHYVLLl5yBZA=;
        b=tsuP3atlYO9BNjACJ3dW2OKWfQkN7WNEjnwdlOHv+UqLMF23KcVjaHKcSu0p1EwSIA
         oeV4TA01MChFUIudFwVSRSB2W4dzRa5ckdSOiMr0NwusEjknj58LgZ4CgSQ2fMTlT6io
         SCd6Qwu0UiVm7BAbtyPTcamCRWPnCqF08FgJtx8g+ViUgHFbVSHSy9oGy76MdezQIL1Y
         8tDJGWImrmCmbvsVjcu0oAGUDGCXiOGESjAMZVGt4kuQWrf4QHG2bGzjVlok3br20oqT
         DIlSdMx9NXWHcuLzI40tqU6cE+jf5yf46yUflBtaK4bdNDqINGNJIYdDQ4zg3y3RikUZ
         WdcQ==
X-Gm-Message-State: AOAM533CsJ831pRB46X6Fr+tv9TZOiBoFy2gIBBQ+IbpabcURf0uWEj0
	/aWWTL/wA4mx83KLsJjcfNVFqEtfeQbVHkGv
X-Google-Smtp-Source: 
 ABdhPJzypYrNPASS5kTan75bld199MhLlNqNRHyIm9MFI8frnXwq5DQXuN21UYhgIBbYuss/XI4KHQ==
X-Received: by 2002:a5d:5746:0:b0:1ea:9643:92ac with SMTP id
 q6-20020a5d5746000000b001ea964392acmr30328479wrw.597.1646413228915;
        Fri, 04 Mar 2022 09:00:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af?
 ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 bh15-20020a05600c3d0f00b003816824aa54sm16934973wmb.27.2022.03.04.09.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 09:00:28 -0800 (PST)
Message-ID: 
 <417ab7af8ac7ad5ed81bf0c9130721d161a4ae17.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] layer.conf: Filter docs dependencies for
 efficiency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 04 Mar 2022 17:00:25 +0000
In-Reply-To: <16D93B0B8102AC9D.9315@lists.openembedded.org>
References: <16D93B0B8102AC9D.9315@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:00:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162743

The net result of this series is that for a recipe like run-postinsts (allarch)
with api-documentation enabled, for the do_package task, the recipe-sysroot-
native no longer needs to contain: 

e2fsprogs-native
gperf-native
gtk-doc-native
libcap-ng-native
libpcre2-native
libxml2-native
libxslt-native
python3-flit-core-native
python3-pip-native
python3-pygments-native
python3-setuptools-native
python3-six-native
python3-wheel-native
unzip-native
util-linux-native

with the dependencies reduced to:

bzip2-native
curl-native
dwarfsrcfiles-native
elfutils-native
file-native
gdbm-native
gmp-native
gnutls-native
libarchive-native
libcap-native
libffi-native
libgcrypt-native
libgpg-error-native
libidn2-native
libmicrohttpd-native
libnsl2-native
libtirpc-native
libunistring-native
lua-native
lzo-native
ncurses-native
nettle-native
openssl-native
perlcross-native
perl-native
popt-native
python3-native
readline-native
rpm-native
sqlite3-native
util-linux-libuuid-native
xz-native
zlib-native
zstd-native

which does make a significant difference to the numbers of files.

Cheers,

Richard



