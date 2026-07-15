Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8600BC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:32:54 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5969.1784122372852056294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 06:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jeczkE7t;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso29281281fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 06:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784122371; cv=none;
        d=google.com; s=arc-20260327;
        b=czJktYdK86nTKCyDvoX/+un6eiarA5btnkruz9TkzhO+JW9qv+0FSB82oqyLxACfWM
         Uvn/qWWgs+lfrgTPThLpMcCjPkoJr/+spx5DuauJltpq0F2676/qwNAISlokZsJ+jE63
         KkIEE/grLxzIxqTA7quiCkaJcrL+Z+WWkLSmVSrlFeBQZTfV+7btP4LBdupyxrlCv9l/
         +jO+CqgXBcyiWdkCtczk79jmOhO3v6P63diMbc9hGXUrY492BQozg7vs4ZPMhc0SdXbH
         Vlh9zCYQsNUlyxdFoeQwwonoP9vGFYRnmsbVTXruP3Brg/rhq0hVEF+ydRhlhK827j9D
         12eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lMq7AdpFoXwRdTIXq4CH19epwcSUE65qJKXzQ6XKRPc=;
        fh=G4Gz2rgvIU0ogwMM9/FGcGzAj6WLQwucuzkz5iZYylw=;
        b=Zvmd8t33Q9QjbmHSW+TWK3JHYXGuaOs3Wmi/htmRG5k6lo1gH8aDCx2McHTNexIUgA
         SwEoDng2YCmhTq9YcJPhP9o8ik2G8QUnFvcDP5ZdUbQronV1DTJwrpidijUVAb8F8lCR
         H2brEb0FVdwK5XLDGxtLAcz26n8kQKwsbwRJKdl+bwuAXqdPGtze395o2VaJlfhazbIy
         EtKwLeRf1Qi0OA+l1rnRz2yIfeJyVe2szc9H6XFu0nSHfSl912Dpa16M+VumbrWP++Og
         oPH+2/GX40bWJiHmUvfTsOfwo7n5QVLYiiUAk6nay9m9WhFG0pFp2ouMOSlIpztmLFvm
         T5Xw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122371; x=1784727171; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMq7AdpFoXwRdTIXq4CH19epwcSUE65qJKXzQ6XKRPc=;
        b=jeczkE7t203Q9SVY0IakXcRJx/vVeOWusQbcup/Oi/NExGwIrM2LBF+PmQ8Jqmzj2Z
         x6fISeuifcIJsWO9cqsE4q40yMsmH6F6cgU1C/rJNc4AWC3ZymgiAdlhB2Zc8PImFlV/
         a/AT7GE8O2FF9pyQ9j9kt/OdivEM0AK2isZe6BVu8nqfdcSGSqPkqGanwJFZ/afZzd1x
         MKb+3XpVMAnyEX0M8FcfQdzbI/z+s98w2krkiwh8aagcbQYi0PMZ8Y8+huAPxh/6JLLX
         gSUUKuP/+ozKiRwMp+Mxth6npHIR75jEvAnXbxgTjH6PU1lfY+aSKnX30XKDiGWmv5X3
         Myaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122371; x=1784727171;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMq7AdpFoXwRdTIXq4CH19epwcSUE65qJKXzQ6XKRPc=;
        b=CaQr6ib54WkcDNyXv39UUaO+Tx8qsjEh+hI6oSyyCvzrVL4D9MDX3Z+7plJ844B9kL
         CMKfPlIAkdTuxgGolwz4jj+MnWhEAMh4oHMYJUwRqfUpmmpuTCWbmfyAwYFJ0Iv+5T6j
         KAXSL0Pd9uWZU5W1VcCD4H3cpY8nZFvhrTLOSJnLGQ7NR0hZhqTKbXZpvl2N7D535G1x
         vLyI8DYqZJAAit9je/+1FxCkGdEgL6+nBb5vAJ+BbgC7N3wyi6EA8RdKG9s4LNvPkQHl
         hV2l61Y4bwBmZew8C+5kIdsjnEbVxPfLFGRCu9XrMGTcxuzxW+mr7N/Qeqj4IgiKZ61V
         ncFw==
X-Gm-Message-State: AOJu0Yzfc/HU74/Zg/WcaaQNP0giotl/ZQvoQI+WEw0jOgvXnrp3HZ6d
	19PHYTUHt0BEqB3C86lsvmvYi8aLOSbADnQMWb49MKgyIGabtnrl/4zbOxB66nz7PwSRUNGrF3e
	YPQjgannhNLlxKRslLZuqK0HTvlOCG7PyHX/2
X-Gm-Gg: AfdE7cmVswz/1ASF70Un2aa6ju+kOUwjvff8ayzDipjU5ITNYNH4IhsP5HPKXw+XOVT
	iOBLqDG3jdw1TyV2GYARsw39UXiaeZkWNttrFAea1e+L4VY1J0IOu/znDaWVY1ZIxn/Nt0QNOcB
	yTwowZM1nvMiyWkUS8xqgK++5jxA/UOahCujXF4AnJo5W02VrnfyeXqM1zDM153s6bchSS5Kri2
	ovBnjjLnnCdn29ycPdcG2UhccQ4lYWrRmqyjudMm68fy614G93WRAtRKoj7mfxUOYsTD+8Uz9Ub
	eADaKyqoEbPZ9nlKenFEWjku32xbcr8geupdvHfAT/FBuECava+tkGEOUhBuGA==
X-Received: by 2002:a05:651c:889:b0:39b:180d:33d with SMTP id
 38308e7fff4ca-39db6d8f11dmr6304031fa.36.1784122370578; Wed, 15 Jul 2026
 06:32:50 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Jul 2026 10:32:39 -0300
X-Gm-Features: AUfX_mxKk8AJIoUtffoZiogJ75aY611HG1gtnLJlrkM9G4h9gNFILDIxVZuee9s
Message-ID: <CAOMZO5BnTAJyYhHgOwzEkRMw1q9dOTcD4wLt8dbuB8VtXsHV+Q@mail.gmail.com>
Subject: u-boot-tools 2026.07: mkeficapsule requires p11-kit in target gnutls
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: Marek Vasut <marex@nabladev.com>, Franz Schnyder <franz.schnyder@toradex.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Tom Rini <trini@konsulko.com>, 
	=?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240955

Hi all,

While testing the update of u-boot-tools to 2026.07, I ran
into the following link failure when building mkeficapsule:

undefined reference to `gnutls_pkcs11_init'
undefined reference to `gnutls_pkcs11_add_provider'
undefined reference to `gnutls_pkcs11_obj_list_import_url4'
undefined reference to `gnutls_x509_crt_import_pkcs11'
undefined reference to `gnutls_pkcs11_deinit'

The build fails with:

ERROR: Task (.../u-boot-tools_2026.07.bb:do_compile) failed with exit code '1'

I noticed that commit e9f12f64279c ("gnutls: Add p11-kit for native
builds") attempted to address this issue by adding:

PACKAGECONFIG:append:class-native = " p11-kit"

I verified that this is working as intended for gnutls-native:

PACKAGECONFIG="libidn libtasn1 p11-kit"
PACKAGECONFIG_CONFARGS="... --with-p11-kit ..."

The resulting native library exports the required symbol:

$ nm -D libgnutls.so.30.42.0 | grep gnutls_pkcs11_init
00000000000a9070 T gnutls_pkcs11_init@@GNUTLS_3_4

However, the mkeficapsule link command uses the target compiler and
target sysroot:

arm-oe-linux-gnueabi-gcc ... --sysroot=.../recipe-sysroot \
    -o tools/mkeficapsule ... -lgnutls

The target libgnutls.so staged in the u-boot-tools recipe sysroot
does not export any of the required PKCS#11 symbols:

$ nm -D recipe-sysroot/usr/lib/libgnutls.so.30.42.0 |
  grep gnutls_pkcs11_init

produces no output.

As a local experiment, I changed the GnuTLS recipe from:

PACKAGECONFIG ??= "libidn libtasn1
${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
PACKAGECONFIG:append:class-native = " p11-kit"

to:

PACKAGECONFIG ??= "libidn libtasn1 p11-kit
${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"

With p11-kit enabled for target GnuTLS, u-boot-tools builds successfully.

It therefore looks like enabling p11-kit only for gnutls-native is
not sufficient for the current u-boot-tools build, because
mkeficapsule is linked against target GnuTLS.

Would enabling p11-kit for the target GnuTLS be the expected fix, or would
a more narrowly scoped solution in the u-boot-tools recipe be preferred?

Thanks,

Fabio Estevam

