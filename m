Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7B1CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:40:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78.1778686797952892675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 08:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aL/N/oQq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4109512f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778686796; x=1779291596; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DWF1G9ELMKsGQZOLppx2w3ZclhzlMEN/h2rKtiOZmHU=;
        b=aL/N/oQqm9DQ4uN2UVWeztKikXSPLB1aC6vtfY7Kxk1yQSWQ1cYdSAJ34OfWNcz6Zt
         Xao14/qQmfIehOIhFw0TRMfblopFyJWWVQPr/0pgS+8TvyLITuiqJX/ytdYPzHfpzuKO
         NPy53IbaO49O8+EemnH2OMaEN2ip8M9KB042g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686796; x=1779291596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWF1G9ELMKsGQZOLppx2w3ZclhzlMEN/h2rKtiOZmHU=;
        b=egsUEKhi+Gr5kiQCuTStpWs9j2EJ0Vw6UzNnmdJatJz9Fye39uLtgcW4OtbcE9hU9D
         sBT/YhQ87N2eciH1keZy9B/DeaSU5bmH1QLqJKGD5mEAMOsOIDYJqn4hkYMFVQoFUrkA
         S5oNRyCm8tfvIKn955xdDIzgc1/Edg8qff3H+o9agA9BTkuyXxcP/xXF/oipHM5Cwunr
         1xYkKNZEVQlz4DOuin+tNsdFi45YtuN7asONfFku9M8Nas3nPJdCTc8nxZUZcahety7P
         INQt2kFTuwD+ikPFA+pIO6ePJuvv3bxAryCzfjPehb8rvVbu6j7chpkz0JmaY+GLBzDK
         hHog==
X-Gm-Message-State: AOJu0YygtFgaZX4AmF5SmR+4sL+OXuF7L+hUvSCHdUpyvGcT//rM9qIc
	XCs5rl04vJwA2m0otnGviQJ8pwrqkoUbNAnaoFTbGDfO7G0joO721sGM+cF1u/D0gL4=
X-Gm-Gg: Acq92OE0WKWZJ7wDZ8E1OA1BBh6dvsQOkmd/Kp7n5TEvlHgx0A3c8nZgF2CmYo5xCaG
	vVqovSpmfUfMyFesb/XXn0YZZ61SWGkFFBULk0Fh1mnIhWQVuV+lX9fPlFXIABe8HuriMURVU9K
	IU7GSJTQz3wZ6VO7HGc8N7ZavwqP5ROB5JEO7NS3une4121deodR3hp9WLZxaGiwM5E9J7S/N25
	ZWBo8odD4/v4A6HiIVD9eH80meipoQ76Q+D5cJgvYq5TKebUctNkgrzNcGne6b/2ejrnJsSleFC
	8uNO0Ki+me6U4PM3XyZ9vhOfCHiUDEa6nOiBrUoaS7kdHWgUEJneRTS80zz2QjLLqe7NNxynFJU
	jQugO974tT/rOZ5t2+Xjs9cJDEy/AgGQSrIJDh8cfEfCql5U2x0mYgwMmhgej8poh2g/N75s8S7
	3IALoV+0E/b8nASUSKyfojUQ2gd6qicBwEiF2Tlhi/im5/PZdjyASCjjj72LSHdh9T3yLLTX6s9
	1XS/XN/yPibY/XE
X-Received: by 2002:a05:6000:4313:b0:43d:67f4:91aa with SMTP id ffacd0b85a97d-45c5ad4af38mr6093794f8f.40.1778686796352;
        Wed, 13 May 2026 08:39:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b7ef:b234:c010:91da? ([2001:8b0:aba:5f3c:b7ef:b234:c010:91da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm42796599f8f.13.2026.05.13.08.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:39:55 -0700 (PDT)
Message-ID: <f59f44f5584cc54bea8813854aeb88ed10ba4014.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.blank.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2026 16:39:55 +0100
In-Reply-To: <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
	 <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
	 <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 15:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236990

On Thu, 2026-04-30 at 17:15 +0200, Adam Blank via
lists.openembedded.org wrote:
> >=20
> > which is a lot of non-trivial change and a lot of extra data in the
> > sigdata file.
> >=20
> > Do we really want all of this data to be added into every signature
> > computation?
> >=20
> > Are we 100% sure that add the newly added variable dependencies are
> > "safe" and won't trigger sstate cache reuse issues?
>=20
> Well, obviously such increase in the visibility of dependencies is
> not a comforting or welcome thing, but let's not forget, that those
> dependencies truly are there :-)
> I'd ask the opposite question: given the extent and nature of the
> relations exposed by this change, do we want to keep wholesale hiding
> them with the current implementation?
> Or in other words, are those particular dependencies (stemming from
> 'extend_recipe_sysroot') so irrelevant for the overall signature and
> sstate management, that it is justifiable to keep ignoring them in
> such a unique way and on such a fundamental level?
>=20
> Unless it is truly a desirable situation and the whole subject can be
> dismissed, what would be the recommended way to tackle it?

FWIW I was finally able to isolate one example of a change here which
isn't desired.

For qemu-helper-native, we saw do_fetch change signatures when it
shouldn't really have done. The change was:

basehash changed from ba2bcd325c42f37db9aa87567dbf0ccd217f4f12910558975a9e5=
2e642dd426c to bd5120be022a43e6fd1273a14f0ceda3b72847308d4c4e65bfe91f9fea21=
683e
Variable SSTATETASKS value changed:
"do_create_package_spdx do_create_recipe_sbom do_create_recipe_spdx do_crea=
te_spdx do_deploy_source_date_epoch do_package do_package_qa [-do_package_w=
rite_deb-] do_package_write_ipk [-do_package_write_rpm-] do_packagedata do_=
populate_lic do_populate_sysroot do_recipe_qa"

which was probably a PACKAGE_CLASSES change in configuration triggering
it.

Whether this is the only undesired change in dependencies, I'm not sure
but we do need to track these kinds of issues down.

Cheers,

Richard

