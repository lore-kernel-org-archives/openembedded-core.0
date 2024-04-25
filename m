Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0F5C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 08:08:28 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.11840.1714032504843611727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 01:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9DOUyFP;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516ef30b16eso742497e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714032503; x=1714637303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNDWVBg0pTmd5Ym5laVASk8cS+G89wW3FaPJz8YJSIY=;
        b=d9DOUyFPWJPLiofmMwYCB4x6TFy6UKd0+tYIBMzuUyLddjpkNR78nEvC0k2YkR0usn
         01sOAbDIGbyDGIK1BmccnnSfdSyUApw1KM34jI5VwRCukXDkC7VFNgjrnfeT/nbG5WDB
         g5ezQzzq+BNnj0t2KVJvbxroh0o/O3Er/w1jzfPwh335Ms+ey7aVcx4tpd/stnBnSYgw
         d0Sca6P2hNRiyMKNMtBPCIpvqgXsYyk6Jif3ZEVJsLbyoo3XFEzRCH37Pgm993jpbTeS
         6fy8ZhiGN32TdSPwmWe7iSUCSvZ4Mr6GCFHl2zzgSM9cz/GO4P4/Gnn3x6DUskyHgEFm
         I2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714032503; x=1714637303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNDWVBg0pTmd5Ym5laVASk8cS+G89wW3FaPJz8YJSIY=;
        b=FztUUOhl2zBtyXG7l7654vwupdEjd+BogEadXO0sT5tTbra6lhge1lBEkGckj9wZa1
         vtoUHGZECo9tT9gyKs5oFTBo2KB0rXrLPaNIBxQf2zqmWwPVrs3i9Vvrl9JJTz6xeFqM
         G1+SO/EXvlU3UDfx/tp5so2PtmEy7vMoe7M00U2+3okRDTDRNJREdhulZGWT4DsDpLV4
         0uF9wBZIYfMZfxRM2p3QzYeO6Izs+dQp6IK5e//cyeV28JSZVgpPfLBoAdMruTfffxhQ
         uNm/MqLFKZdjatpwevJy4RTurhMlqsseB//QWl8Y0A4CF+kcbcRgAKINYJjlPrgMm3ei
         RDhA==
X-Gm-Message-State: AOJu0Yz2JJq7u7imFU46OrjdZL28DnJRzD5YKwd+7EkJE5bp2sIM9Ymy
	nhDb3HxdLt3ODG2TgpDSedh6DK5MB8DzFwFnlcUB+V7gjx5hHBRJ/HImcXXtIeV/lUBTPm4D04u
	WYuL5SHN42jwf6sU0iru9neEu+U4=
X-Google-Smtp-Source: AGHT+IF5kHSX6aLxlGLEQ7rJ5pmzLQWm48NYnCzcvjKBn6fseaMWorbyqOwT4W8qko9y3lkMdIZGIp4B+csjT81lAh4=
X-Received: by 2002:a05:6512:3d2a:b0:518:8d15:8810 with SMTP id
 d42-20020a0565123d2a00b005188d158810mr4667189lfv.14.1714032502546; Thu, 25
 Apr 2024 01:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240425055231.668897-1-leimaohui@fujitsu.com>
In-Reply-To: <20240425055231.668897-1-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Apr 2024 10:08:11 +0200
Message-ID: <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] libbsd: Fix conflict error when enable multilib.
To: leimaohui@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198696

On Thu, 25 Apr 2024 at 07:52, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> - After oe_multilib_header on cdefs.h, the path of cdefs-64.h and cdefs-32.h in cdefs.h need to be corrected. Please reference to https://man.archlinux.org/man/libbsd.7 for details.

I looked at this in a local build, and I actually don't think they
need to be corrected. Without the sed command, there is #include
<bsd/sys/cdefs-32.h>, which is fine, as it's relative to /usr/include,
and unambigious.

After the sed command, there is #include <sys/cdefs-32.h> which
requires special non-default arrangements in the build system,
specifically, using libbsd in overlay mode with special compiler flags
as described in the man page you refer to. But that's not the only way
to use libbsd, and the other way won't work.

So what is the issue that happens if there is no sed, and only
oe_multilib_header?

Alex

