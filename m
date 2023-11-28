Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4D0C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:46:55 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.29870.1701168407088650241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsWeYc9J;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507be298d2aso7178598e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701168405; x=1701773205; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vjEZkvNQTMW4QyXyxjCzMFQh8Nw9c4ZyIM2lt2XKqQ8=;
        b=nsWeYc9JgFrlmxv62a2Kl6zBZyG7lyJX29UyY/+YiIXg2TjCF+wkQsrh6sUg/WKF9Q
         sxtTKTI9ZJEo6LLCKVDjssOzEncb2tQIEo7rBI+fgwddKHkLhQsVnDSGstqwu7T2Avhy
         1w81X2eLNKtVDYHSMo0zTqjm8LW4Uxu1yEd00884cZWD0fijoNFn6U4hVyEf7yK57juQ
         jDVv0JBDt6M4VjwHTMyBDtsDg8T8XDqkKH9qH8Gwn6GRwzZNPzDE3QnVSIcHCc1fu1QW
         So9SksvKbgHcnDafY/i32G61QV7Uq+xb+sOy+K/ngMuOK7bTsr/G5G9pEhEY+8KkNwrN
         vvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701168405; x=1701773205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjEZkvNQTMW4QyXyxjCzMFQh8Nw9c4ZyIM2lt2XKqQ8=;
        b=meBk5oX09kEXHPCmGPE8zdFOTE1dW5l+sqSQo5g17E2QMb7iGqhfZ2Hg3o0NM8n5ni
         HmxiekH6aZ4Crm4EwSocU2TLfALtVvtpMwu5/T9JRsJxx3i+IUpi6qOOv6gobKLlA9ky
         qgBFMM6Y9YzZadPmQuMas+ukG9yHFY37LTSV35/IQ0S7KGfkRBlqDv0sxwDMty3Jrh/f
         tZaTN8WbdICzuFzPsn1CjPRsCCJZpDuAawM4VELXP0ApjwG0GuudJo2VR77Eoa5AjrfX
         +eswX/fF04Y8rfhk3BakWSv6hmy40mhwwU3DMdrdF02/AiGOuz/iR2aP9WTQeDlW2A0a
         ZBMg==
X-Gm-Message-State: AOJu0YxP215qdQ9//Zs4VAEpuGMrtGZPcDiYgd6/eDDhF1Sjft5wVswA
	w409nBSwYLBqnSWwozZZo6sKHJESVP1yMXBnfd8=
X-Google-Smtp-Source: AGHT+IHQaMDwuOcCO7nCswEiHkIoqY3cY5uupSwS4uEw0Ay/CMH6a7TrPg+oKockRY9TtFnww+GJjC+qmCeFAfthkkQ=
X-Received: by 2002:a05:6512:1390:b0:50a:2710:d207 with SMTP id
 fc16-20020a056512139000b0050a2710d207mr12235638lfb.53.1701168404916; Tue, 28
 Nov 2023 02:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20231127131927.710690-1-quic_vkraleti@quicinc.com> <20231127131927.710690-2-quic_vkraleti@quicinc.com>
In-Reply-To: <20231127131927.710690-2-quic_vkraleti@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 28 Nov 2023 12:46:33 +0200
Message-ID: <CALT56yP_w6e4rNa54CPL9p7QBPrcFUprr5jnPYm9d-YRRjFxMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd-boot: fix build issues on armv7a-linux
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191357

On Mon, 27 Nov 2023 at 15:20, Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> From: Viswanath Kraleti <vkraleti@qti.qualcomm.com>

Please skip this patch for now, this email address needs to be changed
to follow the S-o-B trailer.

>
> Backport a fix to address the build failure on armv7a introduced
> in systemd v254-rc1.
>
> see
> https://github.com/systemd/systemd/issues/29381
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  meta/recipes-core/systemd/systemd.inc         |  4 ++-
>  ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch


-- 
With best wishes
Dmitry

