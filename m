Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3734EC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:40:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.5865.1653669601585724166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pxr3264Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso4857462wmh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=Sh4V7IjWJ/qI5JwSp/AtfU1I58pQX6I/iSmwBSAT4aM=;
        b=Pxr3264Z2888lF9hEQ2CxZPMEqtO5mM5PjQwAFCZ+FsF/fYHtrRmjQXtg552XjA9jt
         hPDwqxdlRQiY/+P31WAa+UufZXk64bxJoIJdZZO9sZyMaauxaqS3kKMKcd9sZMdr/Nee
         ZLAZwb1tr0+/pXVEa+V7sES9ExqaF1V2nc9zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=Sh4V7IjWJ/qI5JwSp/AtfU1I58pQX6I/iSmwBSAT4aM=;
        b=uRv0udFl1LbaoqHKupvl4aYyprjePXmNt2Ttok/Bw0ge4fQdQ2AehpdK5LDzsE+UXE
         d8x/kssrS+zpTHRyQ9i+AoOUxz0okWBFP326U0e7OHj0XDH1lZJK5pp8aZEieyd777B4
         xEKUH2kjP4u0Zuhu2rmz8eAMA76XrIKiF/RyQuK4RK9xntVcfoPam5CxvaN8HwYhmWeU
         8aOvVunov3eOF9KDluAnNwMKblykpYt9JsMg6fTYO6xeKCnS75wXeKrUIndOPn0u0v1F
         yb7ln1ExDSNm2mzP5yYQVUkYQPayTUjGv0s5Su3RGW39egM7BHOC45W8pIoZ695q8nwg
         RIhg==
X-Gm-Message-State: AOAM531uQTyHPKSXZS0c4lZw6LWkoGD8XkVgDGXtHZtpDeg6UkCrVZtx
	Zqa2Kg0x1LkIjYQYbKwSZ8x1heE6/cKnJjYi
X-Google-Smtp-Source: 
 ABdhPJxwIzBdkEhWm+sbf2uJWjuXSwqr9pJs8m/Cuib8kn0FqoASNJA2b5PEj175x7epd6uh1mLuWg==
X-Received: by 2002:a05:600c:1c19:b0:397:682d:aaf2 with SMTP id
 j25-20020a05600c1c1900b00397682daaf2mr7782674wms.198.1653669599744;
        Fri, 27 May 2022 09:39:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a82:36c1:b105:e682?
 ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b003942a244ecesm2469141wmj.19.2022.05.27.09.39.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 09:39:59 -0700 (PDT)
Message-ID: 
 <7aedb44c4314a1031a6a3a131096b91730d834ba.camel@linuxfoundation.org>
Subject: Builds on fedora - systemd-oomd issues
From: richard.purdie@linuxfoundation.org
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2022 17:39:58 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 16:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166215

I just wanted to give people a heads up that systemd-oomd as configured
in Fedora out the box "doesn't work well" on build systems.

Why? If if sees something using 90+% of the system memory, it will
terminate it. "It" in this case is the whole user cgroup/session.

On the autobuilder this means it doesn't just take out some
subcomponent of the build, it takes out the buildbot-worker and
everything it has started, i.e. all the builds.

Worse, when it does this you don't get any logs about what it actually
killed, just that a session using 90% of the system memory was
destroyed.

Since our autobuilder workers just run builds, we really don't mind
then using most of the system resources. We're therefore disabling this
"service". I thought others may want to be aware though.

Cheers,

Richard



