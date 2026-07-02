Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE634C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 11:03:50 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66895.1782990230485048401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 04:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y42qZkKT;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so3914366d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 04:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782990229; cv=none;
        d=google.com; s=arc-20260327;
        b=mluTqi/qCUagrL+5qlXJWhdi2CK6uLX66fSdJEEoUO3IlGTomLfaUF7YVvAK8rL5hM
         icZArZ7cEXfO4Zh9VcGNQ06lmESbOrPzE1IeKfeegWmQRV3fQ+y69ze+fhtNaJsagN6c
         MMWdlLgciFS7AZ0fr7DNlcereDeoN3CU6/cgeN7UE3YtzhWaryUxbxYJGQI7affNDBoN
         M93AN+WkP6We2EhZvx2gBuvoKUnxDu7zxjrDB2NQNr9up8eVcrK2SCV5zCdVtsUHAZ44
         YzINtG016oA/izKxwpUGRK/SVI/uDhxhScLzXXU/FhF+ZkGkMsm6jPZIkt9XXK6xsNKN
         zhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kONByOtZoaX0jJXOhY1+R9t1uOofnVSKCN8Pf7JFauA=;
        fh=0dah950TBzSON3mKbQHiaR4cr7sFt6PUUFcJcTTc+9w=;
        b=rjYPM571fjNG+cqWL25PotxJyMtQnGxJg5WKAhlQwM0YtBf0+rKSmOLvarJVAi/kLn
         97In/cKVRTsON0NTuEhLSD2TODRmOY4z50Nl/xuy2pWlWHwXKp18o9ykHw7X7ixHH9Pg
         qPQETZAYM1oxRdBk8d+HChTA03yNkABCJ+RiQBlc9SP4z+C2wFNOHJvhH9d0Kfl1WDn1
         6xKKA/UHA0tIeDXuRTh9Gvay35eLIr+oZXvUdYian1A5fKED5H6pw4hTO8FzECXAX/8l
         nxKlNs5B26aG3CMnJB98potEgG0csiozhffdZclkKbdq1D7H0idaoO+LFHAMGxYOpZNj
         FkXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782990229; x=1783595029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kONByOtZoaX0jJXOhY1+R9t1uOofnVSKCN8Pf7JFauA=;
        b=Y42qZkKT7iSmqHC5JE2L9hv5RoCWyVcVWJxgFxQUpr6bGgSzk6QFwiBav99xI1H2qr
         89Igvzxk2+Q2mkB1cyp/BNIo+J8+ENAznIIsBnKiN/XPJmN0ExRgK/o3OPRcZKLa0Gj4
         OJVV3Vikw3DDFffQmYLoaQVyvsfFPXbTfcu92wierTrrRgDYzbmwRqkwdzHXES0zZUN2
         CvBOub7BBthosPPP6+gXy5ugdWZWp9gLK3ZBHp/N18q3iIK2Y+/nItyg3gqUvasadnMl
         qh0gZCWHZbhFu3FkCuz/47+N4H9Hln9VVoAd94O+RIbfSs3Zl8/oo1mvGW0nfdswEjRD
         buLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990229; x=1783595029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kONByOtZoaX0jJXOhY1+R9t1uOofnVSKCN8Pf7JFauA=;
        b=BRYPj6FyoihSHCXGGY+GPY4pXHLZTFa/GOTEK59Y0g/bK0hkG4mCtrFg+Gwy60tvKt
         2p8LqJgqxhkaTotIbVdLNSYx3Az7kAckVzS53W95Yem3Mf9g27XgMayMOcEFWq5r1EAP
         V7QBcHHdhvOSYLlY9UTTgdRj5GvQdwYUbv0MtukUtZzmlayDJtMpnB1Cmy1lwA4gMNMO
         BdyN1nXf93B1+jMgkOWYHAAXdDDKGCyUr0XRH/SQqEPfkzqOPrXMb3lC0ZywQ14RBkV1
         ClkxZVHdrQ4gba1+RAUt2hlLyezvvuv85/itmfFffBgp7wcm2dRgTz5PbMlbUSOEdSMM
         TBPg==
X-Forwarded-Encrypted: i=1; AHgh+RpqkWUlCR2uxsM7eNsV4b46f50ubHWvpWWygUhmRoGJnmeC7dCnRj6cdwgY55NVA4a8HxX/3dWOEPubPzRMXe3FLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhhBm5rdEGwVvJdO0K0nvzSGMbDvs2uEbLxwdj+rnButr9h0pg
	jEvWjfoS3dFZgXUYt59SxnHiOO4/WBzmDfbC4l1nH3om7I76bgMncSdYURnB4AxjSnxzRwIMdQN
	lBbAT68wVrYk5gLuNM8TrEqF1iaipx1s=
X-Gm-Gg: AfdE7cnZBKmYsGg+vtJ72R9s4IX+VTDa+EpsLfgvnzn0FUN9S0TcA9hEz1Ms7KGzC7J
	/lrSeajNT4WWau4Qw31Zz3z8fI9efqVzb25LviS9riyQ18nhtJY7GFaTGm1Si/qYhvykKV1PbRR
	jPTMmYU3fkYNOFlSquZSnyBqrV1ZvDZ42rlb3pVIjfRUdT/qDZFJXxNWEdZZVN6JheQT3PeBGpG
	grgKLEU22/Zt9h5xZjgg9H687Ofqz4KLVNMa5Hlvg2mwB3KcO7fw207WbTKtA0X1Xp9E8Fa19Qx
	qmHaUSo6V6T+Wwp79hr4+uPeiTdS
X-Received: by 2002:a05:6214:600c:b0:8ef:a6b:18a with SMTP id
 6a1803df08f44-8f251c505b6mr112459946d6.6.1782990229254; Thu, 02 Jul 2026
 04:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com> <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
 <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
In-Reply-To: <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Jul 2026 13:03:37 +0200
X-Gm-Features: AVVi8CeGSuEG0rpQTcZprpd2745uBhTPDcC2MaVkKmt17VZzq5U8fZc-pNyh99Q
Message-ID: <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with rhel8
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Daniel Turull <daniel.turull@ericsson.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"qi.chen@windriver.com" <qi.chen@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Ross.Burton@arm.com" <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 11:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240031

On Thu, 2 Jul 2026 at 11:55, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> I suspect we had the same issue with v2, we just have been a bit
> (un)lucky as it never ran on a Debian 11 worker.

Debian 11 has host glibc that is too old for systemd. There are other
distros that use an even older glibc, and they do not fail because
they use buildtools. So we need to adjust the autobuilder to start
using buildtools on debian 11 as well.

Alex

