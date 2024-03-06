Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45224C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 06:40:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.6498.1709707202906185775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 22:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScUZZCom;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5131a9b3d5bso7405356e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709707201; x=1710312001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFCe/dwzXTYAKVmEZskwHx0H8Z88xAvHa3m1KEdLcjc=;
        b=ScUZZComN97vk1t0nRUCVgs0BcOF4dXmxvMDfFwgwwcTFpFJs2dWtSmlubJPv7izXs
         LVMF7DdSj0S/7Ek9He9uKdOQITpfAG34CoGwoXIruUQKhILC9ml6hxlW+8jnEcIo1/wT
         9ua7cmxlwxjGd3AaUrP+D4mIw4N+RtLjuQMRYDv2vDvDT3runlsu5yD26Jex3DHv3+Gc
         5YQcHdhJtrpzJfyehVVGPhayiNNita1qs6YV6/55xByrIOCF41cxxtH1a+TsO0a7DG5c
         EIJLTQylFLo0B7Rdyw8K/9HRtK90gcvAxzmQJ6N0Zmzzo0M9xha3YOWrx7e/byv1Ze72
         PIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709707201; x=1710312001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFCe/dwzXTYAKVmEZskwHx0H8Z88xAvHa3m1KEdLcjc=;
        b=VxRA7ab1IK88qpyviIOid5SQhiXl7MDUpDyjmsmiKch6yjkncftybafiLhjvvAdGOR
         hx1jHd4/t1hTTf2KpdzbNO+S+sf3O21MfbwHC1jUDSfdsnUNptcJKf1HFMHcVYseGhvi
         eFoLAYb3ktHntwVUr855oA4llQCE8cCQkRY3o1JKUqOw5HFxda6Fuy5NgKOmWmDxL3HI
         WMIKcTNgnfVMCd6KxL+t4IWW0lQfRhtnnJQ0RN9rLE8K/n0U+W0pZGcZDHwxIcflynk3
         +L+7igpzSzVCSq2vydwp1ZpWsOFfQ/l5+P9SxeHWk16gIoCligAsOJv8tgCpZhy5TQEI
         LC5w==
X-Gm-Message-State: AOJu0YyJE1zI2JNDLnI0cqUxfBPzJx7JNt50JEmGvy+YmhbwPFiV8bfN
	VvCfa0Zf/zZsv1kXDFfvThoR3Bt3CWvmOEZSCRDcQ49gvPOn8SjHDtuaJRSem4ockusZmWMsY1f
	fGkWvADheYNJ54srci/3js1TfxtFOxNkn
X-Google-Smtp-Source: AGHT+IEDNjESpHXMnfhSXVaJ4X0d+sS9uIxzVApCbQxcl89GfcJ5y1a+60K6ClW6eILRfFodJDH+HlWMGQ8Lb0+dlC8=
X-Received: by 2002:ac2:5a09:0:b0:513:2c86:3498 with SMTP id
 q9-20020ac25a09000000b005132c863498mr2768882lfn.48.1709707200820; Tue, 05 Mar
 2024 22:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20240306043249.2673982-1-Qi.Chen@windriver.com>
In-Reply-To: <20240306043249.2673982-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Mar 2024 07:39:49 +0100
Message-ID: <CANNYZj_EN6-FKFCpZ4yoZMCU8=8naga6b_CGO8f8HaB4fDTZyw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ovmf: set CVE_PRODUCT and CVE_VERSION
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 06:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196658

On Wed, 6 Mar 2024 at 05:33, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> +CVE_VERSION = "202308"

This will almost certainly become mismatched with PV on version
updates, so please set from PV with a helper function.

Alex

