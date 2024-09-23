Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E2DCF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 17:19:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.271.1727111966622096090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 10:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AIKaHPXk;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5356ab89665so5436262e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727111965; x=1727716765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm8F3KQ/HzAIqlfgDs2UwyGZqyaH2W2oxa+lk/3AH8I=;
        b=AIKaHPXkB83KDUxxIodKqjv3B8gxUW2obJAASlxzV29tDUwOBa1jJHdleaz4WshwgZ
         OU02w5EYa6EYE/rkybGAt8hO8/vBJWwgfQ+eAosJ+kldRyIqRcR9nsprpcmgaubarO+C
         BCzoF3PQcr94l0DDwYcmRy4WOhIuKIf/DYx9cZ2Y/ntz4IBOnaHffMooDOXn9jnvwalh
         vJ/8eEhNXPH+o84vi3qTQDm3NmiBTdKx9Qcmwz85DPnRkqXthQ4IOj3FUOO4hdTjm0if
         kPa7Z8cd2kwPo4LfUlPhB2/KMD47NjPlJ+26apS9J9OnHYlEj7STjxzpVjzg5ukpzeZy
         OXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727111965; x=1727716765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm8F3KQ/HzAIqlfgDs2UwyGZqyaH2W2oxa+lk/3AH8I=;
        b=iJD8pnZLmx5d+Lk2JfNkkmGrAZPNAMuRxryJFdWfZ3RNA18kIKO6nNeMuB7qBZ7sZF
         S8xtcdkxDpz9fNpuPvR5KF+L/vkSAx+aTIJ1EJSIHv2Rf/NItuuGG7mgPjJnczK5JCaR
         zHZBglzYF5fgGAYqL4x9ELVeRL+UOKkPCo8YS2xGj4JHhrTkU82ydmtXtyfKQvjCLdDr
         6tuXbsMUyaZeMalDv0wQwIo4KRwohWUZeUn92CE6VZ+SdB3MkLTB8e1XDvoA9uKGQ1FF
         DZVzhd7+VUlaqsVSQlq9M8EwzdcmFQi/0ZvnVYfQEVxekHlwvjPBsud1AsHDAeBNoNCW
         1MmA==
X-Gm-Message-State: AOJu0YwbapVQqZ0LzOV6PrRRr1dcwE4dvbixy3pAIVi6iaDCXcLp7N3O
	O8x/eXKPGQkZOq7DpCxl73liIpIL99nOXvzfgzagpykKnKtznP2nv7s3ruY2WmlXd1Zfgg6wHa0
	BpGMMlcp9OYvtUumOidwFKvY0AHg=
X-Google-Smtp-Source: AGHT+IGKFdEPQwDkjihQv75m5LNX28fi67MEQx9L6dwyo9e8PepPwik5HWoymExBOaBrSjD70I/8y+VzBg7D+mfXD/0=
X-Received: by 2002:a05:6512:2386:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-536ad161b0dmr5316721e87.20.1727111964302; Mon, 23 Sep 2024
 10:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726821150.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1726821150.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Sep 2024 19:19:12 +0200
Message-ID: <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 17:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204823

I don't understand. If we fix a CVE with a backport, then there's
metadata in the backported patch to indicate that even though the
overall version doesn't change to the one that isn't vulnerable, the
patch addresses the vulnerability. Why is a whole separate mechanism
still needed?

Alex

On Fri, 20 Sept 2024 at 10:53, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
> lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
> a higher version, but it can't know the CVE is fixed in a lower version without
> a helper, we have the following ways to set the helper:
> 1) Use PR server
>    This doesn't work since the server updates PR for any changes.
>
> 2) Update PR manually when add a CVE patch
>    This is doesn't work either since:
>    - This is very trivial and people may forget to update the PR
>    - The PR may be updated for other reasons except CVE patches
>
> So we need a specific part such as VENDOR_REVISION for cve scanners.
> The VENDOR_REVISION is designed as part of PR:
>   PR:append = ".vr51"
> - ".vr51": The VENDOR_REVISION
> - "vr": Vendor Revision, can be set to other values such as oe or poky
> - "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
>         a function defined in GET_CURRENT_VENDOR_REVISION.
> - The VENDOR_REVISION will only append to the recipes which have patches
>
> There are two bbclasses to manage the VENDOR_REVISION automatically:
> - gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
>   automatically, and save all the recipes' VENDOR_REVISION in
>   vendor-revision.conf, it is like:
>   VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
>    CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
>    notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'
>
>   And in the second release such as Yocto 5.1.1, the bbclass will update the
>   vr51 to vr511 when both of the following 2 conditions are met:
>   - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
>   - The recipe's patches are changed (Patches added, removed or updated),
>     otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
>     unnecessary PR bump.
>
> - enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
>   After the VR is appended, the rpm package is like:
>   openssl-3.3.1-r0.vr51.core2_64.rpm
>
>   There is no change if the recipe doesn't have patches, for example:
>   base-files-3.0.14-r0.qemux86_64.rpm
>
> Check the comments in the header of gen-vendor-revision.bbclass for more details.
>
> // Robert
>
> The following changes since commit 161c5b311f1aeb8f254dca96331b31d5b67fc92d:
>
>   build-appliance-image: Update to master head revision (2024-09-17 12:31:45 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/robertlinux/yocto rbt/vr
>   https://github.com/robertlinux/yocto/tree/rbt/vr
>
> Robert Yang (2):
>   enable-vendor-revision.bbclass: Add it to append VENDOR_REVISION to PR
>   gen-vendor-revision.bbclass: Add it to update VENDOR_REVISION
>     automatically
>
>  .../enable-vendor-revision.bbclass            | 125 +++++++++
>  .../gen-vendor-revision.bbclass               | 243 ++++++++++++++++++
>  2 files changed, 368 insertions(+)
>  create mode 100644 meta/classes-global/enable-vendor-revision.bbclass
>  create mode 100644 meta/classes-global/gen-vendor-revision.bbclass
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204726): https://lists.openembedded.org/g/openembedded-core/message/204726
> Mute This Topic: https://lists.openembedded.org/mt/108555445/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

