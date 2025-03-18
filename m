Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E165C28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:55:34 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.7840.1742291725011288318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuF++Gqz;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c0a159ded2so729258985a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742291724; x=1742896524; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1tbqIedUSwClPUxX6g6qMdHm6n7hTyhStEcObwt5w4A=;
        b=QuF++GqzVEEfIiZN6RwiqsMxh/5/nXhBPz6iZvs54hHRzV61JPOH67xTWAahQLHoE9
         Qtwpj8ciBP6dl3jxSPiy0686Q1dsf5y3f45IBYePXEI1WQBkGgTd5y+qiwQzFf8f23i9
         WSEcrxAJU0dJhFOCK+HJvdtVZtCjTmlg292wgoitesZZtaYUimxYVM6kHcBhTK8z+1eq
         yt+UEoxHmpl8ogF8CWyk49rA6+lSExaODhljbJ5DpyuzGQfsFwtirQUwZaDaUy+M0eYT
         WCaT0+F2NYXfgfgcgnLUQcUOKErpez84gZzamhihYGkV3m63kgQmREDa4n6HIyn0PYaq
         1/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291724; x=1742896524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tbqIedUSwClPUxX6g6qMdHm6n7hTyhStEcObwt5w4A=;
        b=gic4NDH+RAPUwqsjD8StQCJjRqIF9ZvhD7u5Pd4jfLMhZQeEa8LHXOO0D3Hjuc7x1T
         czzjl+qq2l4iH+AzzDrE+7nuhWA/5vj8Sk2fAdz7O7m6xjWZA0yN22aO0c5qZWuBnpCK
         iGLXiRKmWmvh4gJvJSjvMeygQeMLYlIEzOrBkA6gvvcd2pHS6JYic2LN2/d60tgqoRPk
         YRS36tn72psoBmNcOdjF7tyesAjX17OeObqfv9EVPGuRS2bkwtJijOFqFdd3Xe30CpED
         v+JdC3aq5JVZ9hJdACK49sDn0lFygawgpVN7KrRbEvv7LRovUaQGyXINYxBAWvVxVk/N
         lFBw==
X-Gm-Message-State: AOJu0YwvtQpJPD+5QRP23dNVXh0D06tFDOaREtztjXxX/AqXZH58Zkaj
	ulFvE+fJMNYymnOquYufcmECd4szkFaQ5In76JB2hne+V1XeIY7iZDySZBERIQvJSfRlDg/5UCZ
	72hLs5NgkSsyTxSJUxAzTy4DlzEQ=
X-Gm-Gg: ASbGnctzJbSf2ZDuM+Vn00uiX7zjZ7aDX5cKlfTC5wNJuP01yJD9HOdj274RuCKHrh0
	jAU+zYWhZFgI3HD1y/Ooyx11sVh8XEW1EXkvoVSOFn20uwkBqUKHyfeAc3HN9WoP/7SpBg5eXwt
	P37IZzZIYYeOU7pDs7bZDafaZnWlncyi7IXCdti4pk7ucZRgJ3KmVfS9CO9Mzm
X-Google-Smtp-Source: AGHT+IE/FFewRXtIKvU+KqDWxWfd/sIEVaH29yedt4gq2N4TT0+rk+H0MEiC0DYktMKJvBkEpELpFWX3kNQuGHQ/qJM=
X-Received: by 2002:a05:6214:2483:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6eaeaae0998mr234730866d6.39.1742291724070; Tue, 18 Mar 2025
 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com> <1742278912-2989-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1742278912-2989-3-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:55:13 +0100
X-Gm-Features: AQ5f1Jp97vW4Vpum3enrFFfulpZuc_P20zywBTxHlN5ouQ_njAImHlfdoHQ4gsk
Message-ID: <CANNYZj9x+Gh1wnbL1L01LL3pmy923pyAXkxReEu+n2dW1itwjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/12] dnf: upgrade 4.22.0 -> 4.23.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213195

On Tue, 18 Mar 2025 at 07:22, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>  SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https \
>             file://0001-Corretly-install-tmpfiles.d-configuration.patch \
> -           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
> -           file://0005-Do-not-prepend-installroot-to-logdir.patch \
> -           file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \

These removals are most likely incorrect?

Alex

