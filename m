Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38468CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:16:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7989.1780568196998064804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 03:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F0IISNc6;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccf181a52bso4545696d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 03:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780568196; cv=none;
        d=google.com; s=arc-20240605;
        b=QA5lbzpVwqwF0Kf9A4lyDuxofAwKxxjPqy61GerKf7iiKrFGTript6bow8XmHqxf3L
         oeyTOH+fC4d+HTbLOJEjeVFG8jrxPCZ1l6nQbt/4cFr8Tm5l5GoQamoBvLBI+6Y6ojQF
         DTEN+dIFIveQZxDeMRPVHLEz5P8exiIotFSjsaouM8djWhpF3XHmF/cflJrsTYF/QjWH
         AJxOo56BbdAc5yVHocdREJ0fPN2vLA0+O+dEgUnzs0iiU5SZkUYaXPzWTEBg92X3/xal
         WCPmTf+Nz0D6HhLwJgJCyJYtqhR2l2EtepX7vPnyaGV8AZB8NKCs5dInJfNTsajdYGwT
         oRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cyzu5zhC2wDoDqMfTAfCxBOSV9An0RkmLTkQhmM6pPA=;
        fh=7Tdpp1GonPoRsRdfb7A5+EER5kPiaIbCVeaF/5Yk+uM=;
        b=VelLPhYsWa+HmtKVXTjrAs2W9paJOuCzupchboN1ddsfyV5HfD4MOuq2E9vis0R2N5
         iQIMN+7PHjzGMriCcQ3J7OD7BfbpZygYV9vlYMFnVREcYO3DBs1x6KSbkvS/762FyDqz
         LEojObylkFLALhaqwp4lEfYJ+Fm44Q3lYBMWYjNp9XFHxXl34S87O0ZqytENm1vpjBNq
         Z7wmnarbsYOiystw/WhXMaAO68Js/DDk62chnFTjzVLQpWhYQouVXeUeY6DgSjHRWFjs
         4+rdGDi9FhSsEUfolDSCVfZ5qZ1XsuOKOGDpY4brHcj8twa76s948ZT308AeaM8Rs/WQ
         1PTw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568196; x=1781172996; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cyzu5zhC2wDoDqMfTAfCxBOSV9An0RkmLTkQhmM6pPA=;
        b=F0IISNc6sTjj7kDDv0hOb9fDuAzEuBpCXVj7fG+haYATxw5dD1HqYQacf2yoo3xVvU
         qsECZ5frH6xW710HyajDEpRuzHIWVS6YLp1TnqqDaGNQX5sv0u/ydI2PfdVcdB+LCwqe
         uFbD0FZghhADrOYpTtLrdfMQzAnYqT96OdFVvxHAZGqH590twuP07piqe/tYdXO/Cx8i
         viFFXzo6lJJaHvumOHVV3w59ieHmd6cCUfrPhZn4N4yyeKyvEY8C9Vx8iUg0mx+m4ix7
         zcJjCKj9FbRPzq3xpJbHvOaorEnk7FCNcnysPyzQUxe2zWoMX1WfaCz/ioM/P8f8YuDh
         DSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568196; x=1781172996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyzu5zhC2wDoDqMfTAfCxBOSV9An0RkmLTkQhmM6pPA=;
        b=FJqzuxAp4yFoJFNY/ppwS9A6Y7xzJNr0TZqQQJ9rkmnen/6IcFqCBTAHJVOiuzBLSG
         HrJlqup1/0yfFkGQEGtj4l6yXO+V+OJWgAek76TnfJHO6HhMrJD2yLhcdJc6uLYzyYSR
         7oCqIsJSLpGDuJ7friooNUCAvEPEnNCVpj5OSoctT6vEMH7vdOBcKr0f7gJFv82iv5J2
         bRzr+DCFvyo6hQLXle1mk6DadHw6x5CCy8akhul4bSuKKiztQVeBnZLEw1fiGNCcNY7F
         wU3M+HH5GJwJVMP9DaG6Ow/4hoJWFNs/DwoJZvzfNmuI4Do6gJfrgK88qrdOQ5tW0eMO
         TheQ==
X-Gm-Message-State: AOJu0YywTKfATpCbKUXYUYoQDcOFEMYh8jO5vkmBXx0OdgMzYyiqm5Qe
	KErawfjfAN2eyF9xvwgo+VE7nfCTKO8ruv/BJoJ0IzoHoA2YuMJtRXk9OTgjaByWKceZ6fxKn31
	ccK3HHF7Y5aQ4i+ksIf1CusWF2gJKNwE=
X-Gm-Gg: Acq92OF4ydn1dTbRsoX7OQlszzbT/YOoZDZ7fUombGX7Dl2yOOVFpYbJgCxDmtfsixp
	ZUqfhlILMNeBGCAVjscCe55esZDQql7nkdhlG2yB4C+qYQ5BNQ41KjrHT4ISVpv/NvPL6GG0PqB
	pFfqzDcJFkFTCN53fzP0g6GMG5wuSTuBWLSHJzkCUrH1r2gM7lZRqZ4XOmGgZ5XN2McTJQI8Y6J
	tezCxXRSl0hmbopif/8fX6uUhLi+IDxAH5Oqr4StlGijrrkvu7M/hFH9TFguwiYfelWoJmNCzEp
	100pU5Cs43TVotLOSHB04rheCQEeybhScl4cUfuRpicNXgn5UZfq
X-Received: by 2002:ac8:598a:0:b0:516:e974:6f72 with SMTP id
 d75a77b69052e-51778770a32mr98762431cf.50.1780568195750; Thu, 04 Jun 2026
 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260604101028.3347485-1-bin.cao.cn@windriver.com> <20260604101028.3347485-2-bin.cao.cn@windriver.com>
In-Reply-To: <20260604101028.3347485-2-bin.cao.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jun 2026 12:16:24 +0200
X-Gm-Features: AVHnY4Kc09uHow0vioyc4z6FsS90PhsFHJIwjNzh62ZflHVMNVaXhKmeXrs91Xc
Message-ID: <CANNYZj-aMhVqpcd3zo5JR+c6BRLn4zviJT7qxVN9OOD6FPaiSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] insane.bbclass: check for build host
 HOME directory in packaged files
To: bin.cao.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 10:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238121

Thanks, much appreciated!

Alex

On Thu, 4 Jun 2026 at 12:10, Bin Cao via lists.openembedded.org
<bin.cao.cn=windriver.com@lists.openembedded.org> wrote:
>
> Extend package_qa_check_buildpaths to also detect the build host's
> HOME directory path in target packages. This catches cases where
> \$HOME-derived paths (such as userbase in Python's sysconfig) leak
> into the rootfs.
>
> Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
> ---
>  meta/classes-global/insane.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 04700be71c..4250331af1 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -439,11 +439,15 @@ def package_qa_check_buildpaths(path, name, d, elf):
>          return
>
>      tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
> +    homedir = bytes(os.environ.get('HOME', ''), encoding="utf-8")
>      with open(path, 'rb') as f:
>          file_content = f.read()
>          if tmpdir in file_content:
>              path = package_qa_clean_path(path, d, name)
>              oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name), d)
> +        if homedir and homedir in file_content:
> +            path = package_qa_clean_path(path, d, name)
> +            oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to the build host HOME directory" % (path, name), d)
>
>
>  QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238120): https://lists.openembedded.org/g/openembedded-core/message/238120
> Mute This Topic: https://lists.openembedded.org/mt/119643013/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

