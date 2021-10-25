Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8138C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:56:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.33286.1635173762618005558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MXane9IS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id e12so13357301wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=R30BXmvW3Ioi/VPqzpSs7JyXe0CcDiR9+aoc1K7Amik=;
        b=MXane9ISitgtdV+O6sQ60WWUPkV52KG7JiJN6op4vu087SfcU7GtEE+4SDbGLZOlQe
         pzqLGeexDXGTAPzBWYV4UcnYsLILb3mbt6Fk8wmCZt0oKHxAy2NRJe1RuXXNh4y8D3Av
         DYLSMG4XCleEVQsthZ7qLLThSDmWrRMBzzhMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=R30BXmvW3Ioi/VPqzpSs7JyXe0CcDiR9+aoc1K7Amik=;
        b=ssLzoSkbYzEsW99jLH6ltlYT1FBqlH/vlxcqOVV2rYbbsbtWLiHGJRn9aXCCqTz4nv
         fEH0qiM5qJFUQGATIkwXRtiSVtpTo81MckxpgGEBQbrNAp2vaBIpZZ8dmpyISdldasbs
         Awafs3PAMWOFVHOzTdfh5KVVi7jOxVUWGKZ+hP03EUY3FuN5UpdYJZ6c1K/idwYI4mxB
         Uucrml3qO00jO8r5Dv2E0s4AAtYH2CH0gpa4fW5h3pAevCOeSaDwKN8EmGXsNFyhBIPK
         iTH7wNRiK56LvAZ7H2BWKyhfuV11RB1ytyyrppTa8jacFps106SyE8k7ByEp0cSUhN/Z
         kweQ==
X-Gm-Message-State: AOAM532z0DiyPjde+ahMszq4WsgJYbPz9PGw/CymZpJ2hIk4c7uzBUHQ
	qZK/6dQJ5/sxsDPRVcIlDWTCy6ueftCHDA==
X-Google-Smtp-Source: 
 ABdhPJyyeAcgnDyUV01sM/98vUJ/XLooQhDAddB+WoNMDdgpMcGqvnIlpHWiF9w5rL1D3luTPXv6wQ==
X-Received: by 2002:a05:6000:168d:: with SMTP id
 y13mr7418555wrd.300.1635173760330;
        Mon, 25 Oct 2021 07:56:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3?
 ([2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3])
        by smtp.gmail.com with ESMTPSA id
 j16sm18012996wms.16.2021.10.25.07.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:56:00 -0700 (PDT)
Message-ID: 
 <e91fd7eb9c529d07029e3a326e4c65cced626cfd.camel@linuxfoundation.org>
Subject: libtool patches and possible release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Oct 2021 15:55:56 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157349

Just for info, it is possible libtool might make a release. Some of our fixes
are quite useful and would be helpful if adopted by binutils and so on so
getting them upstream would be good. As such I created a git recipe for libtool
locally, rebased our patches and then sent a curated set of 12 of them upstream:

https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00012.html

Cheers,

Richard


