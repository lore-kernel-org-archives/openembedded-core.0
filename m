Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55998C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:35:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.7917.1667316934088534962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 08:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MNkgqJ1y;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id a13so22338190edj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlZg0YHB/iwl7uHgN8pyHqRf7rSRMDpDKblaPMCRU+o=;
        b=MNkgqJ1yDDpVihpUWOBCI3ben4z60dtXBb+uFRfwc5jMfY1mM1hWWTwG59Txfpxp8h
         itrV/mjmESqANP7MnPAklqrYPBbUZy+xCikAsIRuHLIXhQGHtbY/Nj9eclxxtl8ukuRf
         BD6aiN5763omnDJ5uvdWqFyZpFr8izBKV+kB8T3eLMn8sCW5oFmfGBVLpRaZk0SUtxVu
         RJwqwx+4m/E03u2GBaN5jS8t3umG1c/VmPUE7eBXPiMJRd6hXAwOuUwAtTO988afF9E4
         BauH3PFlmdQsarSyNsJDTmK41Mlutbdm4K0UhsCyzD6taOXnnt+QrNSK2+rj59rOnZmu
         vlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZg0YHB/iwl7uHgN8pyHqRf7rSRMDpDKblaPMCRU+o=;
        b=UBuTI+VOLc2sKHUUup/+Pvr2C2Ff5E6zJCL0G8BBA0FhPLNvAIinnBQRaUHWat8+XI
         F7FmEy9UReESy9Pa1klj7B/6Vs/DtrvvvA1CNk/tF21hjGIVccMv1ZtnE9MYpf2ruJTe
         zTe5iTAuBy8Vz9Q16k291jSnsyzSelLWNzke494fwVirbVbBXnuOo+u4FwTMc15k+wtn
         M4xe+xTgigrSd2/3u1j+8iKemGKHS28Vl4gJUm3fyIdHle0EqamkTJX/f+ZIbI43gdRX
         Yk5/weIukq9Rq7sPRi6Dm8H03Vgqt9F0fgL7xPIbdVeyDlXN0OOCpknrpvtNdPs0/363
         XwfA==
X-Gm-Message-State: ACrzQf1QGg1hv0lTqFHlrnmxTR9/ye7mdlXtEhFP3iXQ8V3UrEN51Fxy
	BPj4LjiQW3d4lN16ElT1DF+5kVkKgUBY/Dp6uakrmJfDHGkRm2+H
X-Google-Smtp-Source: AMsMyM40piue53qotExOOZMeoRFq9AiLfcSsoY+O3uFTjuRQ8eegDN2UTet2DmRuMZj3XAjcL4ueDVdA0rvHNP4UtJU=
X-Received: by 2002:a05:6402:3512:b0:461:e146:d2e7 with SMTP id
 b18-20020a056402351200b00461e146d2e7mr19719565edd.39.1667316931947; Tue, 01
 Nov 2022 08:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <17142B1671501C64.2599@lists.openembedded.org>
In-Reply-To: <17142B1671501C64.2599@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 1 Nov 2022 05:35:21 -1000
Message-ID: <CAOSpxdZBXZuaGcC=aZQTmC_XLPhfzjvmMr9R9g_qoDXWj4_FNg@mail.gmail.com>
Subject: Re: [OE-core] Dunfell CVE reduction fun: Raffle #2
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172364

There were 66 entries in the raffle:

steve@hexa ~/Desktop $ wc -l cve-raffle.txt
66 cve-raffle.txt

Many thanks to all who participated, this is great progress!

And the winner is:

steve@hexa ~/Desktop $ shuf -n 1 cve-raffle.txt
CVE-2018-25032 Tim Orling <tim.orling@konsulko.com>

Congratulations Tim!

Steve



On Mon, Sep 12, 2022 at 6:52 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Sadly the CVE count for dunfell has been creeping up over the past
> few months. Several people regularly contribute CVE patches for
> dunfell and their efforts are much appreciated. But we need more
> help!
>
> To encourage more folks to contribute to this effort I'm going to be
> holding a raffle from now through the end of October.  You'll get
> one entry for each CVE fix patch that I merge into dunfell.  And a
> CVE database update that results in a reduction in dunfell reported
> issues will also get you an entry.
>
> The prize?  A bag of fresh roasted whole bean coffee from my small
> coffee orchard here on the Big Island of Hawaii. This coffee won first
> prize for the Hamakua District in the 2021 State of Hawaii cupping
> competition. If the winner isn't a coffee drinker I'll try to get some
> locally grown tea as a substitute prize.
>
> The fine print:
>
> 1. Patches and database update requests must be submitted during the
> period September 12 through October 31, 2022 to receive a raffle entry.
>
> 2. CVE patch submissions should follow the guidelines in the "Patch
> name convention and commit message" section of
> https://wiki.yoctoproject.org/wiki/Security
>
> 3. If the patch also applies to master please send the patch for
> master and note that it should be backported to dunfell/kirkstone as
> appropriate.  I'll pull this type of patch into dunfell only after it
> hits master.
>
> 4. CVE database update requests should be sent to:
> cpe_dictionary@nist.gov  You should note the CVE number and provide
> supporting links for why you think an update is appropriate. When you
> receive a "Thank you for bringing this to our attention. We appreciate
> community input" response please forward a copy to me.  I'll add your
> raffle entry to the pool when the database is updated and the dunfell
> cve count reduced.
>
> 5. To help avoid people working on the same CVE's I'll start a "CVE
> raffle: collision avoidance" thread on this list.  Just do a quick
> reply noting which CVE you plan to work on.  Please don't claim one
> unless you really intend to follow through!
>
> Steve
>
> PS: While CVE patches for master and kirkstone are also much appreciated,
> this raffle is intended to help reduce the dunfell CVE count. So only CVE
> fixes/database updates that influence the dunfell CVE count will be entered
> in the raffle.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170538): https://lists.openembedded.org/g/openembedded-core/message/170538
> Mute This Topic: https://lists.openembedded.org/mt/93637037/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

