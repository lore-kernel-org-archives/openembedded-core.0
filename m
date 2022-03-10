Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82111C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:38:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.1130.1646941113644898149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=2qd0Kyai;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id p9so9551869wra.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oufWD/cTsaMg4nFHhEf5MXY65slaaeniWK94pfAcT4w=;
        b=2qd0KyaiXG43O2PzZ46sakhc+2Ue1KEcuLhDEGrcKiTJ3qiELT3nmpm1/pMfTx9mFg
         n+v1r8n8pKFLAnp6rtS7LhnuEMfE3/14cs+J+97plkRWAINwwYbYpS6RvKfgvIPT/Hiz
         ZpfptFj6OqAfm9sr7E6HtaKNpWemV2XGBS8mtTsKkQzeB9qdW/0+uOPL94kHzmIKA7K4
         Fika0tsKzz573snqNaVog/MwdoXHPJLFKLeW5iHxP93I/MgIJ5WKZmnTipajJweJy/dL
         J2UoERMrEiPhfp7tcI6/NyTsnwNrv0d9TvufKFwAq/fV1vJd1z0eYlSYh8t2B3vtA226
         Wrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oufWD/cTsaMg4nFHhEf5MXY65slaaeniWK94pfAcT4w=;
        b=iwmep4XMCNUpl8jcRsEc0u/syQhrbAbc3QJYQNgUMV8pDW1t1PGL+SxFfrsZ/hHPDX
         HcVFkvfPsUGfZfg4UPF3emkAYIhCVHK8351UHw4ZGVMOzsHEo83XBY9Zw2L5Go7BCQ0l
         Oui1IbETuSLMfhjvb//zlvN/8CQVirm8Fq3gQ7CzufOdFVxov9+J+zVYuNxby8Sw2Met
         4d0e+/8lQXD1ZKShXLxh/8BZf8LcLUCk5ygD3oc/muAA0ujzSTi03WMMTc+UuuAuzFKl
         mSO1b/LUXcyWKlAwNDLEQn4tW4xHyRXNSGe0Lto+hsIjJziu7n79zlyHlRN4ZIwRwt9I
         Ym8w==
X-Gm-Message-State: AOAM533BenuGM3X4NDCvBj4P1tpxn0HsAiNmuXw0sfoXNsuzk2BuhIi5
	IG2hSOZ0huc7F08+m8R51pWtc8gvOhK90k27RGcvtvLno52y4JkW
X-Google-Smtp-Source: 
 ABdhPJx0WFlkpuM2lTFjAJs9aI3MgS6bqqX8T00IZkRHLiR2DUKMv1Vm9d5O9H80rtItmVSYHyuqB4QZkDQimDITwM0=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr4636730wrd.451.1646941111506; Thu, 10
 Mar 2022 11:38:31 -0800 (PST)
MIME-Version: 1.0
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 19:38:19 +0000
Message-ID: 
 <CAAnfSTsib1p5Vgkvqt52WB=4a5wBAF2R0Ei-Wygx0AsNchCiOg@mail.gmail.com>
Subject: [RFC] rename pip_install_wheel.bbclass to python_pep517.bbclass
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 19:38:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163040

This is the last major change to the Python packaging before
kirkstone, I promise!  I think we should release with future-proof
names instead of renaming everything the moment the LTS Kirkstone is
released.

Basically, I want to send this:

--- b/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/python_pep517.bbclass
-PIP_INSTALL_DIST_PATH ?= "${WORKDIR}/dist"
+PEP517_WHEEL_PATH ?= "${WORKDIR}/dist"

-PIP_INSTALL_PYTHON = "python3"
-PIP_INSTALL_PYTHON:class-native = "nativepython3"
+PEP517_INSTALL_PYTHON = "python3"
+PEP517_INSTALL_PYTHON:class-native = "nativepython3"

-INSTALL_WHEEL_COMPILE_BYTECODE ?= "--compile-bytecode=0"
+PEP517_COMPILE_BYTECODE ?= "--compile-bytecode=0"

The rationale being that pip_install_wheel doesn't have to use pip to
install wheels (there is a patch to use installer, and the ability to
change to something better would be nice), and in the future we plan
to also cover the build stage (using python -mbuild).  As this class
hasn't actually been in a release yet, now is the time to change any
names before they're locked into a LTS release.

I'm just building all of oe-core + meta-python with this to verify it
works.  Konrad, any thoughts?

Ross

