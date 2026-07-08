Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3B9C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:44:55 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6575.1783511089062735938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f4PRn/Qy;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ee88fce476so5661736d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783511088; cv=none;
        d=google.com; s=arc-20260327;
        b=JHCuzPiUPRRlkLtCamx+q5j+QnVJXx1fQLb7h13cWCDM9ay3AH3MJyLNcWPC25nQnp
         SXFh9I+zQlBUeYgd3oDtS8L8fYMKBLjgzN6a85FIKOgkhMpKUQLJLHEE2swoiHOsDQ2U
         ZK4SZdYBpkBH0Rrua2d+74+rK2/ybCjXSEtoRqJ5/w/JjqBc5AKwP//54Gns4AHLwsjF
         L2RpTiUOE43onwJueujyD7HaNsaO+O4mRM3L2gBJvYVKt9RGqs+icbcNt0R7RhNfipTd
         lA0cYP6hvHGr6ygWELpzYhTKgWZwt9iyrZTuWnLtIhjC9U8+nwElOPBYDGWxV/EHmPXm
         ojjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AnM7KrB73YaJH9n6Zj0TQnrntb9LY6S+LTXPTTykIz4=;
        fh=R/gOVhL9AklIGeyFPdeYJD/o5ogGCVFv1ocyTGipaQ4=;
        b=TXS5TAa38X0puLqzwWjxxWgT/aBRqJSpoOoZFngAcmIfPfr90kCQJr6y66Ux8rnGNx
         OK2Y2hvnP/YVNlq3bagBhFdx+wnhqb5RZglfjPariZtiQ2u4hdTMzRamPcF7c18W53p9
         nHMhik0RqdRcuOhPTYSkUGqZm/N29OPFlCejmhvbMqMme+iKpiSgxpduMGibV/BwQZLM
         tVs3Pzlp6Gzx9GnJRSm4hIeJ1y5PJy1ZLI344XVrXxMmFUyQKjxwMZqXcgG/lgjQ60xv
         BUt7u5sokE/m/GAtQ/057xYoSnCuO+BG8brpQsAaixpOcREEZ1eN5fsRJYfX++8xopH8
         O7OQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783511088; x=1784115888; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnM7KrB73YaJH9n6Zj0TQnrntb9LY6S+LTXPTTykIz4=;
        b=f4PRn/Qy+hMVeYZJarJmeihUzSYhgi4BAgU/9ldRN6HNAJ7NYY7g14T03UnP2hDltL
         8SI53xd+aVNRFOXe2d2iXBGPjytgsGNtBQvWwppsP/pgx4Cqzj7MoICC+Yz9drF/ezNr
         QLri5l2V8sAerStgHriTIAoN/2UuRHx+t0cx/poYFlZVOFdSszRC1WATtS1rH/zq0oCu
         kuRYbVZ3ZeXG2O7Y2OHt54YfM8N1ECbBNbjRNWrwKwiNCfdeXBosTyOpJnqn1efSZ0lR
         9MxYtAfBUnNavvQ8yY4OBkNLlBICdVkLSILa8IMu01EwaJQn+K685Eyy9UJr0FEkIBPT
         SuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511088; x=1784115888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AnM7KrB73YaJH9n6Zj0TQnrntb9LY6S+LTXPTTykIz4=;
        b=NIcPeqK0oFsJif5YUWpYgleFjYEzPEZRqyIJqFrASCFXyBhJmrhYKQi4kluz/c7Ilh
         jc4JcXg0R4UOF8MZpQ/TuarrAOv0k+k34cubYPOtBBPnV8yL36qBK0lf69VbKOf41lpq
         JO8oaCRgeT2jHJJc6bckKTPQFUbe2lTb0v5a+S07FmfecgIhiuvhPnO+PB+EAwNIOBzq
         rbbIpQTgVjs2cV2kKDyjVNzVW155oysEVKz7sqAmi6ElNs8vevgbiuVR+Mr0YlbfUhv4
         95MQmgbcHfPmyiKLevx6lQz28sQ5AGHipL4/vgfZBt2ArTobg65r5zDv5Y0MiFq4FZNP
         kxlg==
X-Forwarded-Encrypted: i=1; AHgh+RoItru6IrpAZG6LRN6ShSIC4mtNPDx98CAa0drn5HnAOPgwKrS/EBZw3xYa5DhrETiNJs+Qg4RzIc145umbbM24CQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfJkvWewXNtRlOkUWhQa4xs9SBsbbGSNWVaHpz2go1nIXskme9
	t/jEb4ULqeSX+eQkS/UCQBf5GP7nWSb/JWoEopk0KQPN0vcFpmTt3dNaUv84+Aayn5D+dL1mGC6
	iSM13cApBI02zbZlTzxdGIlE6XA7PcCE=
X-Gm-Gg: AfdE7cmYnL4mcGDc0a/hHNRGNyFILs009kIAmVYovz6yYtqRN4I39y8Vxja8iTk55YA
	Lrlq7i70qyqJHZ2XiOJdQSrcghE7hM3VHCRhRNvU2YrJsNVBzQxnOEJLT34vU2EvwDcTvRaYs/e
	rkWKsW2+KB4b1ay5ibH+nTBqdo04LZ87A+hlpEtiMj608b3LV+qWIf/yIVj+57X+6+6OfvKood6
	IMYHXs02Xkzt5jxzJPY8TMaMU7m6/Ffv0L3W6NadXgiye44pUydcKeclACMS2wHqnz9HHd2EFe9
	4rerXjIsMven6k1dcJ65VoPt78UAy/Y=
X-Received: by 2002:a05:6214:5d81:b0:8fd:6e22:c7ea with SMTP id
 6a1803df08f44-8fec3908a88mr18362306d6.59.1783511087983; Wed, 08 Jul 2026
 04:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
 <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
 <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com> <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jul 2026 13:44:36 +0200
X-Gm-Features: AVVi8CcWsyGjDNHJIjNSyB3pvAuFekG_P-9ZbC33sU30GFqpd7nCOy_EFHr8N_A
Message-ID: <CANNYZj-3-Tj5ZRAgenGOyGXm1FPo269_MX0mrjrZqKTReg6MXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2
To: HimaniRamesh.Barde@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"tgamblin@baylibre.com" <tgamblin@baylibre.com>, "MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Komati, Shiva" <Shiva.Komati@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240475

On Wed, 8 Jul 2026 at 13:40, Barde, Himani Ramesh via
lists.openembedded.org
<HimaniRamesh.Barde=3Dwindriver.com@lists.openembedded.org> wrote:
> Thanks for the pointer. I'll drop patch 2/2 since Alex's upgrade to 10.2.=
0 supersedes it.
>
> However, patch 1/2 (exporting SETUPTOOLS_SCM_PRETEND_VERSION) is still re=
quired - setuptools-scm 10.2.0 will fail at do_compile the same way 10.1.2 =
did, since it still probes SCM metadata via vcs-versioning when built from =
PyPI tarballs without a .git directory. Alex's upgrade will need this fix a=
s a prerequisite.

I don't think it will. I tested this update, and it does not fail.
What is the error that you are seeing?

Alex

