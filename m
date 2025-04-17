Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED2C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:24:59 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.11725.1744903490295281725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O4G+kHcf;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1266859e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744903488; x=1745508288; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQGOf+6XfSUWWDeaxtstCHzwjtzsX2dO2uslPhrGQhY=;
        b=O4G+kHcfcFHJr0H5dn7JNuuJUeKFySTswuzD3DsSxxgoDPmCTnsyxM6DWpw3zvmP00
         7Cvp3+CVBp/aGc5RKHjVtkPeHhFRnmRcbzm5Ac7A9jcRP55tIMYv5kZps05/QPC1j7+Q
         hQkXNrWr6+A3gmRUWWdzhcZn/A7+sqBBu+cx5M9RCvbxYW/S1d7Z4RO8GwIUCJMRK5K9
         EpTlqlhF4iV9fB+fBxx7SiDpye7HEi29SUNbgQ2mQwf+zMpVlwhGGwYFKcK6MYJJlB8N
         mgc13XMedWCiEF+V8PDa5Dgr+r7zhxRbHFWxfdhrrB6YYOcWMGXyYjobFU/95/QtkLtE
         md1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903488; x=1745508288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQGOf+6XfSUWWDeaxtstCHzwjtzsX2dO2uslPhrGQhY=;
        b=j8plX/V2oR5ImWkwasU7nbqf43w2CvA461pHRHbqP6f5hOIqGK4uWkJrHjRZin3tgP
         H5mGGfb/Y+helvtCyicw98j3QUl+JWzXjEsW33/Qi83j5b0FzRzpyiPY6c/0Ho2HhsJe
         cAWMZYPw5lOMgGcYAS1PbL6rc+KWvSgS541GD46CVBceXJH4WnfAsto+fX6/HXZHGNA1
         Rcm+Jez8yjy3KzCg5ZljKxofqCBZRtn+sW+MT28H7biBjCvsuvC0pF0nbz59F7Pv5xJ1
         FFDXjfeRn3kK9MKPY9ww+fWTO49e7yQWULpDFyFOgwrfDBmJPRgOEv0MOUh1r+ugFR3p
         4rHA==
X-Gm-Message-State: AOJu0YxQt7HIqkoIDznSeBzfyg0HQ8hY1m/UB6MLmDY7LGPJr/+OdK39
	OBDCiLdLvElaxFDTEVXbA0utruVm6jrYIA/yW3qhntohsvQdTrsqaSrdl7mosHbn3Ox4DY2sCXI
	2K1DtqRHC1eG2aiJsNaguSjfg5wQ=
X-Gm-Gg: ASbGnctHdEm6ayiHjaY/pEIDtvyISIvWefWhxznO8Vfv0xQ8f2ES0qOsnJ/4hKShKTy
	8O7eaQd31yyj7HjETzHoynkzqhxvUlCSh7seQGRuby5QAiPgp+20wUjJUhk2WWY1olByfwV25ke
	N5oP+En/SfpWgi4ZOr59i90A9VkCWdiXfux/YMqZf2I54Kqu0=
X-Google-Smtp-Source: AGHT+IGEabpdPJoiHkCnDoHK7YEetslu/3MriEtDy2e0mzFspleC3tfwlyypUAe5vUb4ySvTcqL4ptCdu1bJUXS8rDM=
X-Received: by 2002:a05:6512:3da7:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54d64a9d02amr2100174e87.22.1744903487995; Thu, 17 Apr 2025
 08:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250417093457.2091799-1-peter.marko@siemens.com> <20250417093457.2091799-2-peter.marko@siemens.com>
In-Reply-To: <20250417093457.2091799-2-peter.marko@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 17 Apr 2025 09:24:36 -0600
X-Gm-Features: ATxdqUFAvNn_2cF9EjfjT8X9P5rhytsAjQ_W0hwSrz5fEBvYvqG651oCUnlky7M
Message-ID: <CAJdd5GYijC3O61ZFJbDGxqNmPLVHtG6+3sY8QVKxADFcObnTZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spdx: extend CVE_STATUS variables
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215101

LGTM: Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Thu, Apr 17, 2025 at 3:35=E2=80=AFAM Peter Marko <peter.marko@siemens.co=
m> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> If spdx is generated without inheriting cve/vex classes (which is poky
> default), only explicitly set CVE_STATUS fields are handled.
> Calculated ones (e.g. from CVE_STATUS_GROUPS) are ignored.
>
> Fix this by expanding the CVE_STATUS in spdx classes.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes/spdx-common.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index 36feb56807..713a7fc651 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -37,6 +37,11 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
> +python () {
> +    from oe.cve_check import extend_cve_status
> +    extend_cve_status(d)
> +}
> +
>  def create_spdx_source_deps(d):
>      import oe.spdx_common
>

