Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F03C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 03:35:13 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.71647.1638243312711513794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 19:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPNH42st;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id p4so25313627qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 19:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=vTCoHKwLc1EdBeIriBlL0CrF2uaCCXr/Niasg9D6f1A=;
        b=bPNH42stM/nMuDxMkuM86Qb4A2d/zmBnpN2U6o9byjbhVvY3p6beJKfilD9Haobqp/
         xjvN9tRu2n4XiJgnTATxFQy0vWnmzwTjVGIMj8/Y3QYaY8yWMqcSajfW8RP0ddCnV00P
         K2xQYdSzZm1eR7QNgdS0HwXhK1oKYEzefsnFDixhTNgq5/u7TSFhMZAyqqNqQNDZpaIp
         V7M7wHWgcIZcMtg0xhBbXrNR3lktRVDGarrpC80yztYkt96gJPSjzqfZAgi2q2/cYuYF
         DqNQ9HWen8qRdHrooEoU3zXKSjDOxViBGPPHUBQRTwmzCt3otldaMs2WzVkfOP7aMHN9
         GpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vTCoHKwLc1EdBeIriBlL0CrF2uaCCXr/Niasg9D6f1A=;
        b=3TLOaASY+I4suqEKeDLkcoRuw6bVqIdSQkqi6wfL0gZ3mFP+pB0PDQEKeGqcfEhvtz
         /n0J64jSXqEoDdbSkB+f8XYDmU4d39qUsosq385Yg8FddNvPlkKpyG93HkcG49dnpWV+
         Mx1Ha83G2GK0sFV6cqd/MGfA+B5NuiHRQvWEo//Jdzz11to8m19ef+SZlS+GrjbFj9LT
         SE0LxdpMCunKU1ah+AtBqokOVCdFjbrjDJ+J85bo9sjh57Q/PxPlaX0PutsDwfceL/Mc
         czLmOIazuWhaTW4m2LctfhEHBpGoHi8grJpESpE0I8EiTgYL/BdJ9xSJneZhEbuPSe22
         wvtg==
X-Gm-Message-State: AOAM531iivqKH9zvASVM/Zh91AbCXX9Q6AOyPVtE16DG6jhf+blyPhq4
	W1nearBi5UjhsCkwVoOdODamOeCoA+C9cs1tcGr9alXWK3O55Q==
X-Google-Smtp-Source: 
 ABdhPJyeHMo0tBNMfWTfdNVOTKE7Ld6GKF643ffotf+WwQAln9nSr2x13pnf4MSMN6iOdSzHCIE6geBmq/8uJgilLow=
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr42930601qkn.463.1638243311564;
 Mon, 29 Nov 2021 19:35:11 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2021 19:34:45 -0800
Message-ID: 
 <CAMKF1spKdnjMFpD=Qf_1vCzOeAN-Xg5GqQJviNLPXRq6md-tbQ@mail.gmail.com>
Subject: opkg_lock: Could not lock /run/opkg.lock:
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 03:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158965

On CI system  when a new job is launched which is running another CI
job in a different sandbox, following error is encountered often.

 * opkg_lock: Could not lock /run/opkg.lock: Resource temporarily unavailable.
 * opkg_cmd_exec: Command failed to capture privilege lock: Resource
temporarily unavailable.

This is seen when two or more CI jobs are running. Any ideas ?
Its using opkg for O_P_M and builds are running on baremetal ( i.e. no
container stuff )
exact same CI job works when run alone.

For reference see
https://github.com/YoeDistro/meta-openembedded/runs/4362290225?check_suite_focus=true

Thanks
-Khem

