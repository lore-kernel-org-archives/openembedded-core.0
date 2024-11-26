Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53793D65539
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:55:34 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.52644.1732643730555002932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lo87dgTO;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d846307673so21263326d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732643729; x=1733248529; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EN8b4WOl26lIJ583iaVZKwDPIIfhZMzKnrzbf/Ve/I=;
        b=Lo87dgTOPUXr2GbcfuLKcolD89b1WbPjdOjdqivcK+zTA3g2U3jyW9NKMD1H4IIW/X
         2XRzdleRFc2Dc1dqDj/woDfBCkAZoLYka+NRm1/fEtHDyvX8X+Tk3Qm09URdlLBPxorc
         p/c5sFoVMcdyVYhG4kUD3OObqvkd61iybRf+t2QXPQV1VKkT2Ka50EuStFdV+MNx18JZ
         QEGSSWc2L9jeKDwxkLHXDOAIR3Zx1OZ2oFzYrAkr6q0Riu4tKpCPCmwZnp5aZWQaBwPY
         WokSiKNkYujB23T1l+3na17GDpE4G1gb+QY/Cnfr0N+tzpqQ8nUeEuhjr7SLzc8yQna5
         5S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732643729; x=1733248529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EN8b4WOl26lIJ583iaVZKwDPIIfhZMzKnrzbf/Ve/I=;
        b=sftfFHWy7V18ZjHGgtkP4S6oDoXBn1Hna1G+EIY0xHnVux6nOUM3OGYgMR4RDXgGn9
         bDlSCz6m2vc4ANwbf8TFRdyEfhcnU8q/xFBVnulJ6P1BOJ9XGtkySw3f7ApsZB+s352M
         512FVzdo/5kqmyDqhobDgX2MSCgKNJ7PSgERC7MUni4dM/3UqSLkkt6EZPMud7jskBDn
         c3fHWv5Z8luTVmp0Ypix7iwFfBBo0XPBGVsZt4WSXEbMI73ZZ+3z2F68oOGFA0cZ+J+5
         k3i7d0wsvZlFrh2a2D0Q1d+l/OQOTh077IFk0jERzBzEl+uwXjf3lH/H1zh6DYqoxsi3
         pZeg==
X-Gm-Message-State: AOJu0YzxBihkUZUe6v4n9eyivFdnyoJO7NW/SNiDo/B8VFrYTeLB0psw
	n1/UZMfh4u2DnUb6XaUEi7DRucrO0NV7Lc0OUuM4CNoudFj2BVohLThm52H4wda2+015FBDF2D5
	kLVsNGFjXNOGMz1Lm8Xk8ztRsTwE=
X-Gm-Gg: ASbGncueIzGCzWzL2pEgqKxfpSYq6pCr8aAafnQVQnzDx39gvFWpMfZuXWxnGCZsC4B
	nbD+27tu46xcx9H3FFtzPEDme9jLBlzx+c3sE8P6lc8WcZeZphb2aifdcONR2QxNbXQ==
X-Google-Smtp-Source: AGHT+IGTM/kYlV4cuTshwUOI9vDaNhmpNRN7wIXSYSbe3QDD4viK+r49j3kr0dPd2l23oDu5kpNBj1krz9bUSXqKcns=
X-Received: by 2002:a05:6214:490:b0:6cd:ed0b:3392 with SMTP id
 6a1803df08f44-6d45134039emr304036426d6.39.1732643729644; Tue, 26 Nov 2024
 09:55:29 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
 <20241126175112.2019940-1-danismostlikely@gmail.com>
In-Reply-To: <20241126175112.2019940-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 18:55:18 +0100
Message-ID: <CANNYZj98i-RU060Hjxx3PgX6guCvfkzY5-_mE78-yVwz4Ks5ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3: package tkinter's shared objects
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@usask.ca>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207876

The removal of d.setVar should be in a separate commit, with its own
explanation.

Alex

On Tue, 26 Nov 2024 at 18:51, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Seems every time python is updated this gets removed. That's likely
> because the tk option can't be enabled in python3-native without
> creating a dependency loop.
>
> Instead of manually editing the manifest every time, explicitly
> add it in the recipe as suggested by Alexander Kanavin.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/python/python3_3.13.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
> index 8db5b813738..a393b5e4a07 100644
> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.0.bb
> @@ -360,7 +360,6 @@ python(){
>              newpackages.append(pypackage)
>
>          # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> -        d.setVar('FILES:' + pypackage, '')
>          for value in python_manifest[key]['files']:
>              d.appendVar('FILES:' + pypackage, ' ' + value)
>
> @@ -428,6 +427,7 @@ RPROVIDES:${PN}-modules = "${PN}"
>
>  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
>  FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> +FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
>
>  # provide python-pyvenv from python3-venv
>  RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207875): https://lists.openembedded.org/g/openembedded-core/message/207875
> Mute This Topic: https://lists.openembedded.org/mt/109793661/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

