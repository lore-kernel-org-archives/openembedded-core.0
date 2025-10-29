Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79076CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:27:16 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web01.2951.1761730032471761216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaJ+g1Cw;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-81efcad9c90so82723786d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730031; x=1762334831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eY1YWJOwMDyiF3tTH1fAEE+bL0fGu2d6QgThTwzhg+0=;
        b=ZaJ+g1CwxCFTudTP6yfRXsvnDu+CzUEMTpoKK/8z/dSRhBzumpyIS5r5FQOCjgngaq
         8vrYbO/RcFhuP3AUsRFLTt7LAq5JtY00ADP/bblsfOk2g0mtc1w23VU91phzL/4hDVAl
         9jXOsmTlqLizpSEk+03nCwkKNnzAgbQapIzhwk+RpnqSCtH0CwvFYwHsFJ79cX+jEIRC
         o+Flqh3RdO+L/XmgKsTUPGSryAO5eeyvBciGrsdnK0NUWRCxTb2OjbbLUsscsht8IlUF
         T3XDKw/b+PogACjbILo4jOafjF/YALuv2qkHzWMRtmjmRgPHSghDPJDed34V4oN8S7iD
         rpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730031; x=1762334831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY1YWJOwMDyiF3tTH1fAEE+bL0fGu2d6QgThTwzhg+0=;
        b=kFPXhl0p6ytChT95H4lBXs96glYiWRMb5wZdrIFP+nu29+n8p+YAUsX3GvP2UgTf6i
         okWWOrLbx359K349MxYC35Cgfn7++YXB+MyVjnr0gPnIdoTYyagaD6bOpPyxoDShryDB
         jQPukYzdPTcorrc9kWuDbXhruGVDsZfhGtSFTLmka7+AeOJrYJTOhvdkKJCn0XHy00X9
         fThy8mpuPkXqfi0OqF2yrY+TlxOAES4yqyfHDvl2R5tmYjktXNHHUu4rapCCJ1nGvT1R
         iVkWGaOmG3DXyrDXZJyzOGl7AsjAYt+QIc8ADss3Qe7yxXpie3rfdozHw9dddH2uQ5XE
         VniQ==
X-Gm-Message-State: AOJu0Yw4olmKPU5quikhj62EWGBnvbUgzsIHWsEbY1yK7j/doEC5EATQ
	h51xw9IkSja34X/Uq+L5UricQoEAEUSLXIyYwMs5SPoVN3F3Ft8+5w8p1iTZfeYI0tG8xpPOK1k
	rTlbKhNR8P9002iw3VyYlxMR2yyacHiPzhQ==
X-Gm-Gg: ASbGncunnC9bt2pHpdddSGcCvY2fYqqSajWvsFwRl8Ugc076MCO4k0WMPR0FQ1IbTOP
	/0l8OfpvsaMI7Mn2d7AUa4nq/9/QeuqTQQU/9wYxuzcqHUEjCC31jHWuC7+UrS3KG4zF8lhOyVO
	czTtWVhpwmhJgIFoG07A9FUsOEPWC9OUDlzwLp9GC8ZHlzswyfpNxSVhKjFNt4uWqdm/ut3u/gD
	yM6IawTsZ4LOkhY/tg+4rvKH1zQOQOar3YJSUbYoph/dMI7qECW/EZhyBIoMA7j7fFJ5z8+0D32
	MKjCg+sxmauZMhfIz2EXcybXFHF/qX43fDeIEnMFeXK/d1Fx44ANVwqIKSWE1VnZFweO8Tz1qZz
	J6D19usIlnb8rWhdAtfnlGG+SfDAR
X-Google-Smtp-Source: AGHT+IH2DISjE8enCG6yPlJ87vgZLoDExDB0M4d+bTHuzxoYzzwPthd28AMC4yUzB3CtZtdnkHGzwb/CFsKDy12ksTk=
X-Received: by 2002:a05:6214:c6c:b0:87f:fea5:876e with SMTP id
 6a1803df08f44-88009ad5138mr23267046d6.10.1761730031437; Wed, 29 Oct 2025
 02:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 10:27:00 +0100
X-Gm-Features: AWmQ_bl5Gb85isMmEiQkz1B9AS8E6l6-ZV9NT3Fwsnx5zS8d4RLLAfxu0FR4paQ
Message-ID: <CANNYZj9k4Aa1g7zka-JjLsPgQfKD4SGoA8NF2Gne4Qcs_eQTng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: remove GHS-related files
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225437

On Wed, 29 Oct 2025 at 07:20, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
> Remove files starting with "GHS*". These files are related to the
> Glasgow Haskell Compiler (GHS), which is not supported, so keeping them
> is unnecessary.
> +do_install:append() {
> +    # Remove files related to the Glasgow Haskell Compiler (GHS), which is not supported.
> +    find ${D}${datadir}/cmake-${CMAKE_MAJOR_VERSION} -type f -name "GHS*" -exec rm -f {} +
> +}

You never know. Someone might want them. Yocto shouldn't impose such
decisions on users, but it should ensure the packaging makes sense.
Which package do these go to, and should we put them in a different
package maybe?

A;ex

