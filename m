Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775DBCF9C68
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:16:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11448.1726992964104313712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kte/uGMz;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53653ee23adso2921160e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726992962; x=1727597762; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+0mw35a5e19scIovs0W5N7wq9FIPsobpLfyoiUaELw=;
        b=Kte/uGMzoBHq/FHlCtJJoVYwwVQNI4zKOAMfl8VMM0s1z4fngcixjk04M0k9zrsxia
         YaEkV7mJlA9HEiPLlEF5uVb6O8gwLbJTWLqT1koxuvpGc66a3qHSehG90IRvPHUdOOTG
         6979+fDkyqkVPBB/V3F94vgCfV5xbOBts1uPorOJUW6hXkltGaNdW9Ok3g47J6Gs/jJo
         pblutADoWZWawvxWMzQGJifVDGpAqJP9MkS3Ei4X6Dxw+vQblZqvPrcwsadZNLyYGvfS
         br9mZjxMVBGDMjgWVrccPDH0eFhCnRM8EOwUcNKpEOnvXpDTcJztV+2HRKFGPV+NvqUr
         /Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726992962; x=1727597762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+0mw35a5e19scIovs0W5N7wq9FIPsobpLfyoiUaELw=;
        b=TUhD2d5SJpEHDdxRqJQFQHmGuL94GFgX7zt43hAHHcrNPKNqt4WubS8+stsse1hqhg
         tjL6Qn91rqlecMNH422lVKnLAln7a6gi0XYSI0kLntmPpDLrchXooshugI3pQQ+yUaCn
         04vr/Uj1VnMLUKU71FD1ZYDk9TuVD3i1XaL6uIDgEHLDSjNxk336CLqPkAw27l2c/Cw0
         4B3yOTr9yxYXmwdEGDXXW53iCNTip/NIcG1m2/9htE+2t54UhquDzzFTwHiwZqBkDIGu
         UVzXAjIeEmXB6vZt5m/sEIDP5HTPm689JyTMENfJQpqfPgV8d7VxcCuu6OI0K5j9rvB7
         2GuQ==
X-Gm-Message-State: AOJu0YywrShQVw6xx53gUaEypbuUj2Ohjn0EXqk5bVE0qCwAbCpLu9uK
	wPT3CWqArwf1DLIK8fRux77gKs1dTJBmZGIJoB3GQ8YbJHDGs5qIn6ilPnSRoF4=
X-Google-Smtp-Source: AGHT+IEH7fXIsLt0jjRmfosMRC7whou8n3/fpNPoNlqyIhR+FoVlDCyMq2aiVMdgEWiV4tkOx9koaQ==
X-Received: by 2002:a05:6512:118d:b0:533:3fc8:43ee with SMTP id 2adb3069b0e04-536ad161917mr3737619e87.13.1726992961939;
        Sun, 22 Sep 2024 01:16:01 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a89f2sm2837180e87.240.2024.09.22.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:16:01 -0700 (PDT)
Date: Sun, 22 Sep 2024 11:15:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 01/12] python3-pefile: add recipe from
 meta-openembedded
Message-ID: <Zu_SP7szGXuBS_qw@nuoska>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
 <20240919143706.6074-2-mikko.rapeli@linaro.org>
 <334ed194df94eb08545734f935bef3e20a407e91.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <334ed194df94eb08545734f935bef3e20a407e91.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204770

Hi,

On Fri, Sep 20, 2024 at 08:24:58AM +0100, Richard Purdie wrote:
> On Thu, 2024-09-19 at 17:36 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > It is needed by systemd ukify tool and uki.bbclass to generate
> > UEFI boot binaries.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �.../python/python3-pefile/run-ptest���������� |� 3 ++
> > �.../python/python3-pefile_2023.2.7.bb�������� | 28 +++++++++++++++++++
> > �2 files changed, 31 insertions(+)
> > �create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
> > �create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> > 
> > diff --git a/meta/recipes-devtools/python/python3-pefile/run-ptest b/meta/recipes-devtools/python/python3-pefile/run-ptest
> > new file mode 100644
> > index 0000000000..95ae72306f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-pefile/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake --ignore=./tests/pefile_test.py
> > diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> > new file mode 100644
> > index 0000000000..e30b362323
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "Python PE parsing module"
> > +DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
> > +HOMEPAGE = "https://github.com/erocarrera/pefile"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
> > +
> > +inherit setuptools3 ptest
> > +SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
> > +SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
> > +���������� file://run-ptest"
> > +S = "${WORKDIR}/git"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > +do_install_ptest() {
> > +�� install -d ${D}${PTEST_PATH}/tests
> > +�� cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > +
> > +RDEPENDS:${PN} += " \
> > +��� python3-mmap \
> > +��� python3-netclient \
> > +��� python3-stringold \
> > +"
> > +RDEPENDS:${PN}-ptest += "\
> > +��� python3-pytest \
> > +��� python3-unittest-automake-output \
> > +"
> 
> I've not gone into the series in detail but there was testing capacity
> so I did run it through that. This recipe caused:
> 
> https://valkyrie.yoctoproject.org/#/builders/59/builds/140/steps/11/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/17/builds/144/steps/12/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/37/builds/169/steps/12/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/6/builds/153/steps/11/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/3/builds/162/steps/11/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/25/builds/154/steps/11/logs/stdio

Sorry about this. Looking into the details.

Cheers,

-Mikko

