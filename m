Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363EC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:07:31 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.15330.1743502048877498439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gC5jJI4S;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5111187e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743502047; x=1744106847; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kxky5X/l+rZbYkBz+8j1MUgveULEnYJMFYPn8L2o0NA=;
        b=gC5jJI4SqQjAxkFtzWoW+MCQkMJ/gNkihgWesoyWCjlmjtjWsmEZVEJozGvDjZhpk9
         Fg6+/e0Z6zBuXqBOv30pLFs9IYhFQnNPz/Hi531msPaxbDiKeY6EehG94cORqvWJ90wj
         EH8RjIQjRP30kDIySxoPB9nK1XYOuc8EXTXxVwi2In/p7UfGe1D33wq8gx9VGFWVBWoA
         RuEvaOg0Uk7rcgaQJ83y50/j5EwEJ93Y00Gk2bFpPMnCZ4btx9K4bMvs6sfdemfo6DLK
         czaBDnqjHxa1YNHN8+D+gwLnxfQyzsyLBnRjNCfQOYvN8Ve/gB4dKvfPVraBcAvM0coH
         06BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502047; x=1744106847;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxky5X/l+rZbYkBz+8j1MUgveULEnYJMFYPn8L2o0NA=;
        b=OIVaz9k1bAhRoJnuPSbxYZ0/FbIOfaF1XtLIbFZMj8S/0gOKJ/vzIFjS06DLK28hlk
         Qps+KC5FrKx9chOVpdRPlmRbxKi51MpRNvKFdOiSG08VdjWiiFSvNKGURGLYrsY84vcA
         NFluzg/Vp99FygQ6LA6Nf7AFInOJrQa99yJbKP45NuPwiHQmhykj6SjU1GN1JZet1TAs
         +Ze0dnQ5k9m7WYyH1/fk6TDuz4es4eZkhdH7O4VMeZ6aHSmE3aToe0ucbXm1cDoM2lQt
         mmU/TLjAhgnGm8HUJy2QeJgwoir+IQlZOLC+AyKAZjaXMTCOh5rQy72VommSFlUKs6kL
         S09w==
X-Gm-Message-State: AOJu0YyyHeNU7JJRuVK/Jd75Pnk7QRyCf+WdivO/VM3+nXjlHkY5D9ZS
	I69piofzhJsg0qz/b7jeuEGsqBym7eAqvEJGVNcOatTTLnsaoYMJWxe79jsAhkdCC9ZPPNN+NeH
	eEIbEZMFNfi7YZBHaH5LBA4rG4IR6IFAvQZc=
X-Gm-Gg: ASbGncutk4lJmIJ+Ac6JnMv5uZJNezHDCFKqEFLzv+yCPSGdFLXmwfPiJ+a/pyemSCs
	Mt7bjo3Ot1kAiDABPNHs0GXb1WWaiXAtVyhXxZraKzs0ri63NQvuCzsmNLqbmiAKltCEbxdjVTP
	evRblIbrcK9TdqoqROA4AZ32xDRONxiS8Rv7/0iFM=
X-Google-Smtp-Source: AGHT+IHIO7AK0AE60hg/+5MROitJpLS7xTUfSkZIz8QbPNOghzu+qzn6ySZDSCiXxXYtQ1n6/BF1axqclkBifFvSQ3w=
X-Received: by 2002:a05:6512:130c:b0:54b:117c:8ef3 with SMTP id
 2adb3069b0e04-54b117c8f2cmr3103384e87.54.1743502046775; Tue, 01 Apr 2025
 03:07:26 -0700 (PDT)
MIME-Version: 1.0
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 1 Apr 2025 12:07:14 +0200
X-Gm-Features: AQ5f1Jrtf5p39hR5xUc1wFa6LP59XZA17kVVb6aeuwYAdAQ10pt-b7C_4L-4fR0
Message-ID: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
Subject: meta-qt6 on layerindex
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 10:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214012

Hi,

some layers on layerindex cannot be correctly parsed because they
depend on meta-qt6 (qt6-layer) and there is no record of scarthgap or
styhead compatible release of meta-qt6 on layerindex.

There are:
https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/
- actual branch 6.5
https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/
- actual branch dev

but no
https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6/
https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt6/

which causes e.g.:

ERROR: Issues found on branch styhead:
    meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
not satisfied
    meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
not satisfied
ERROR: Issues found on branch scarthgap:
    meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
not satisfied
    meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
not satisfied

and there will be more once meta-webosose parsing is fixed.

Is Tim the only person who can help with some admin changes on
layerindex? RP suggested to ask Ross as well.

I have admin rights to publish new layers (and edit all existing
layers), but cannot delete wrongly created ones (or their mapping) and
I'm not sure how to add a new mapping (e.g. add scarthgap and styhead
release for meta-qt6 by using actual branch 'dev' or '6.8').

meta-qt6 dev, 6.9 and 6.8 branches have:
LAYERSERIES_COMPAT_qt6-layer = "kirkstone langdale mickledore nanbield
scarthgap styhead walnascar"
6.7 doesn't have walnascar
6.6 and 6.5 (currently used for kirkstone) have:
LAYERSERIES_COMPAT_qt6-layer = "dunfell gatesgarth hardknott honister
kirkstone langdale mickledore nanbield scarthgap"

maybe even https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/
which is currently using actual branch 6.5 should be bumped to 6.8 as
well.

Cheers,

