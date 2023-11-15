Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E15CC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 05:59:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.7308.1700027983606570670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 21:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/oeReUv;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso9588376a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700027982; x=1700632782; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHUrqoj8pW+36ydzk6WrRtgbvWptZZBehVtdjnb6qfA=;
        b=S/oeReUvaqRM1dmqIp5yqo6+JTb5gn+d+y1EkJXurE6lQFloyH+DSo17ke3IzyHHut
         txn+5MWpbPC75uEu/7W2VF1Mnu+YRPZf4OMDvxDASAwqODE8Y/C8hXWdMBEKXUNRJt9j
         J0jg50upPsX96FywqBceVjjM3cIzYt7AjAdEIq2iDyKmVd3iyaWPGR7Yg0CeF21bCrNE
         cSzM4Wn87zTO81C0Uj9C9C1FYGRaKI22GClcIUexRIjWiur27paZY5U+Iy6DqixsbP/t
         DkvHm3Y7P/6o6sxWH4nS+xHCB1pYeLKVVeSRYyOh+YcFS0yb6czItoxkcBw2R8iIAJpk
         mUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700027982; x=1700632782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHUrqoj8pW+36ydzk6WrRtgbvWptZZBehVtdjnb6qfA=;
        b=Y80eiDsyoVmSJeL4c1RwwMg1Dt9CyOJFNMSi6aPoJ41jXigOBNRv0FZolU1pDXJj8h
         pWR/MKiaj4HNWDsEBMbat3KQrAzPae8GDM2gpznA9yMQoAFTjrySheOK1L72cnNURJss
         RLaaA++wZnPCUsBluGcfLe0uqF8U7Wt2Pmd6pCylDUAJHh6vP+FGPj9kdi5D+S9L7DgV
         JJlaDjCiDQNQde5EApki2cR0J1Xc9W5rqAjo7LiAutfWQpGaDi/KMCOyA/apqpCuZOP+
         H5Azw7JPJ41RJvaojY4/b6OS0oOh43KG3VpLkEUMusF6WkjsbjfYoDmBgcDsoJ42250f
         C2bQ==
X-Gm-Message-State: AOJu0Yy2+THTUxPupKzK7c1Ee/yJlmEes3tC3oENtTKsbds//HXc9V/W
	pUcUjUBJfcK2zhpPnmoEtE0=
X-Google-Smtp-Source: AGHT+IFA9x5NhV/dToF0np0/Q5HEHu5g2zOvMFsMx6pGF9wHlTpKhMp1E0WHHJdgeEwiZtxmyr1mvQ==
X-Received: by 2002:a17:906:c418:b0:9a1:bd33:4389 with SMTP id u24-20020a170906c41800b009a1bd334389mr8488420ejz.74.1700027981503;
        Tue, 14 Nov 2023 21:59:41 -0800 (PST)
Received: from [10.134.51.57] ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906118d00b009e624212746sm6552384eja.34.2023.11.14.21.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 21:59:41 -0800 (PST)
Message-ID: <cf5fa871-ddcc-4f18-a013-3ef10ec77de9@gmail.com>
Date: Wed, 15 Nov 2023 06:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: lukas.funke-oss@weidmueller.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, u.oelmann@pengutronix.de,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 05:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190555

Hi Lukas,
Thanks for the v3. I know I'm late to the party, because it's already 
merged, but my testing results are below anyway.

The series seems to have handled my ssh URL correctly.

I've got an error in do_go_vendor though.
File: '<poky>'/meta/classes/go-vendor.bbclass', lineno: 166, function: 
do_go_vendor
      0162:
      0163:    # Copy vendor manifest
      0164:    modules_txt_src = os.path.join(d.getVar('WORKDIR'), 
"modules.txt")
      0165:    bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
  *** 0166:    shutil.copy2(modules_txt_src, vendor_dir)
      0167:
      0168:    # Clean up vendor dir
      0169:    # We only require the modules in the modules_txt file
      0170:    fetched_paths = set([os.path.relpath(x[0], vendor_dir) 
for x in os.walk(vendor_dir)])
File: '/usr/lib64/python3.9/shutil.py', lineno: 444, function: copy2
      0440:    resembles GNU's "cp -P src dst".
      0441:    """
      0442:    if os.path.isdir(dst):
      0443:        dst = os.path.join(dst, os.path.basename(src))
  *** 0444:    copyfile(src, dst, follow_symlinks=follow_symlinks)
      0445:    copystat(src, dst, follow_symlinks=follow_symlinks)
      0446:    return dst
      0447:
      0448:def ignore_patterns(*patterns):
File: '/usr/lib64/python3.9/shutil.py', lineno: 264, function: copyfile
      0260:
      0261:    if not follow_symlinks and _islink(src):
      0262:        os.symlink(os.readlink(src), dst)
      0263:    else:
  *** 0264:        with open(src, 'rb') as fsrc:
      0265:            try:
      0266:                with open(dst, 'wb') as fdst:
      0267:                    # macOS
      0268:                    if _HAS_FCOPYFILE:
Exception: FileNotFoundError: [Errno 2] No such file or directory: 
'<WORKDIR>/modules.txt'

I've located "modules.txt" in my $WORKDIR/$GO_IMPORT/vendor directory 
though, which seems to be consistent with 
https://go.dev/ref/mod#go-mod-file-go . Am I missing something or I can 
send a fixup?

Slava

On 02.11.2023 16:53, lukas.funke-oss@weidmueller.com wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> This patch series adds a recipetool handler in order to create 'go' recipes.
> Each recipe contains a list of dependencies in their SRC_URI.
> Dependencies are derived from the projects `go.mod` file. For each
> dependency the corresponding license file uri/hash is added.
>
> The recipe may not work ad-hoc, but is a good starting point to create
> a working recipe and have a working offline-build.
>
> In addition to the main recipe three additional files will be generated:
>    - $pn-modules.inc
>    - $pn-license.inc
>    - modules.txt
>
> Changes from v2:
>    - Generate separate *.inc for go dependencies and licenses
>    - Adapted oe-selftest according to change above
>    - Incorparate community suggestions
>
> Lukas Funke (4):
>    classes: go-vendor: Add go-vendor class
>    selftest: recipetool: Add test for go recipe handler
>    recipetool: Ignore *.go files while scanning for licenses
>    recipetool: Add handler to create go recipes
>
>   meta/classes/go-vendor.bbclass             | 135 ++++
>   meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
>   scripts/lib/recipetool/create.py           |   2 +-
>   scripts/lib/recipetool/create_go.py        | 730 +++++++++++++++++++++
>   4 files changed, 1029 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes/go-vendor.bbclass
>   create mode 100644 scripts/lib/recipetool/create_go.py
>


