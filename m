Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08465C6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 16:52:19 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.950.1663001537018017297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 09:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AnrNpwxC;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id y17so16571607ejo.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=i5IelekiT0lp4eHMGe7DQqDcuC+ylJL9yKZIByPaK+E=;
        b=AnrNpwxC44HPD2Eos/zimZje5cf5CXyB9Inp0mY+bpsx/wcP/nJWA6/8ry1XaPrRV7
         mA397ZiLAHM95sByU1UhPXIF7ISREaeYQMVsBMUa81oxsZwGtZ1I0SI6CIqEICtmHy+M
         esDJ+NVS7/JAZySkMqzwbFPD0THqpQX7KPNLKHpo7GuQE3BjS1mBiuG7MXWZCVsrsTTc
         q9DJEkVqW/HSxFJse4saryjZ9LMxCLsBUSdUp+655VMO/GmeZGFe9W16bechQ+/CiplO
         /T+DCSjBJS8EcAwjY1mBem8jIruFW1J1dRuaMtrFlTVm2yAq2WQXG8E+4aJlmnGXE9tn
         o0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=i5IelekiT0lp4eHMGe7DQqDcuC+ylJL9yKZIByPaK+E=;
        b=gu8bwmLD4Igen+SWri2AhXHMhB4R6B7HpDHrwN7x5jtFHROnqYAmPRkFvUqxLuhgiA
         +UipYKWuLvKrk5A/3xTqdspDEJK6OKRJWXehVx/McLFOYXeScRPZV3xEpnc8Iz9Y/SCF
         ySoYPAPQa4GusJ+SpZBTKHoxyyXAY4OKuZVf6ZKJA9I0VT7s8LA4KNKSjOj3kxqs+fVB
         1VoRl/8ezLR5TGakAMmmWvD0vr+3wSKwLOGOraIwELF1MtpJu0lvSQjdf+hK8e2Uw+Q/
         IQjfUki02XRfYBUyNo3cDo3b1OOVAF7RZjEMpq3CFTDf2YawoLfPLWXIJ0tLibFzzECI
         7u6A==
X-Gm-Message-State: ACgBeo1Um//Q/SOBFGaQIfGm+nbv1oHjR8WFyoKtcnF8hEUpWvrdrIUL
	mpger+xaSLv7WmMVdf7C6CAooRlhRY6483+np8LcS/SH002ChAUj
X-Google-Smtp-Source: 
 AA6agR5hQL1mw4HB4Qax+GTft4zdnGojCawyDKeebirvSgMv0Z3IJZV17EtQ6A4OBecPj4+COjj4AbmImI+lReA9Jn4=
X-Received: by 2002:a17:907:9805:b0:77b:cbe2:c5dd with SMTP id
 ji5-20020a170907980500b0077bcbe2c5ddmr6999457ejc.41.1663001534598; Mon, 12
 Sep 2022 09:52:14 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Sep 2022 06:52:03 -1000
Message-ID: 
 <CAOSpxdabuEte0jKNTMj=nQXA+Tfo25c_M-u0VVqunVR5q1FL3w@mail.gmail.com>
Subject: Dunfell CVE reduction fun: Raffle #2
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 16:52:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170538

Sadly the CVE count for dunfell has been creeping up over the past
few months. Several people regularly contribute CVE patches for
dunfell and their efforts are much appreciated. But we need more
help!

To encourage more folks to contribute to this effort I'm going to be
holding a raffle from now through the end of October.  You'll get
one entry for each CVE fix patch that I merge into dunfell.  And a
CVE database update that results in a reduction in dunfell reported
issues will also get you an entry.

The prize?  A bag of fresh roasted whole bean coffee from my small
coffee orchard here on the Big Island of Hawaii. This coffee won first
prize for the Hamakua District in the 2021 State of Hawaii cupping
competition. If the winner isn't a coffee drinker I'll try to get some
locally grown tea as a substitute prize.

The fine print:

1. Patches and database update requests must be submitted during the
period September 12 through October 31, 2022 to receive a raffle entry.

2. CVE patch submissions should follow the guidelines in the "Patch
name convention and commit message" section of
https://wiki.yoctoproject.org/wiki/Security

3. If the patch also applies to master please send the patch for
master and note that it should be backported to dunfell/kirkstone as
appropriate.  I'll pull this type of patch into dunfell only after it
hits master.

4. CVE database update requests should be sent to:
cpe_dictionary@nist.gov  You should note the CVE number and provide
supporting links for why you think an update is appropriate. When you
receive a "Thank you for bringing this to our attention. We appreciate
community input" response please forward a copy to me.  I'll add your
raffle entry to the pool when the database is updated and the dunfell
cve count reduced.

5. To help avoid people working on the same CVE's I'll start a "CVE
raffle: collision avoidance" thread on this list.  Just do a quick
reply noting which CVE you plan to work on.  Please don't claim one
unless you really intend to follow through!

Steve

PS: While CVE patches for master and kirkstone are also much appreciated,
this raffle is intended to help reduce the dunfell CVE count. So only CVE
fixes/database updates that influence the dunfell CVE count will be entered
in the raffle.

