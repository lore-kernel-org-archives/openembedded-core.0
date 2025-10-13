Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731BCCCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:00:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.53070.1760382032220008386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=tMz8W3XM;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.171, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so3762919a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1760382031; x=1760986831; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B406qVbW/Di84q48SP0jRnMNywVBf6H98g8cIAf0inY=;
        b=tMz8W3XMxcsJFRiql8fs7yvLSUQOzLZRUyRr3GD9c0e8iEhJK2EL1PwwEADgXM6Yzt
         mTJebClenY+NCnvr4+JgI9YTMAYS+eADMuQRfvKIvErEt/9Lu7rOYSgyibNbaW3sYWaV
         XpWRbcdDHOVYLb/VcL8sfsXeQd8rowPkIiORPgnVUadYA5I5jJsbxcMnXW+WiP7S/kGs
         4drQbcfv0PiNK6ONoX3qGtdqdUdlw5qsP9B+iS6TIxcKjJ7fjqj4BH4kIqJlbjI7teJs
         fa+/IEm3xSnOrQ7NPmi4xtWkZarH6noDl3Rle6KGg+d9D7dssoXYi9ZXd5OaP+RnZH+6
         DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760382031; x=1760986831;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B406qVbW/Di84q48SP0jRnMNywVBf6H98g8cIAf0inY=;
        b=l4JsUka7qiE2pdaRlX+TBITOrauIVXBghn3xLa5epChqQYdb3QkFEnEIAxq5dMIi35
         F6VM5Qb95Qup2LLgo97+ACqI6fGTHNHspJvmvv71vgo0gGzTH7CT1ED2/paB3ucnyChE
         bVJ2ng7+/xpdm5GNbWid4avcGdOl0gyVBQxUwFAix7hoM7d+5arp+xg8hp8pF0i1cR7V
         K3PQyTn70CywwLiz6q3NPaLu+W5dw523SEixOpc33qGBnYGxyeyqH9GxhadnM6qty5UG
         1b4ae57fLk36ImNeP1WjmkRUI+jqMMK3ZDEybV77/66pl4mELIM6T74pu5gzwnL/mm3m
         4HXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7OMphKjSp09ZJNvIO/Vzw7Q2qf6gtt5Oat471WZFpMd8fsFN7pJvlFD8pqucv2TZ93MHVGZsGa5MYIOCyTC+pBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8eICAHudbSI80d4GsjBCrQPVJME2jV9/jkPnzRcJmwrF4dMJZ
	5qZaUt+Og0Ui1cu6WI0ggylN6Ro6w+3Xkg9ERiqSIN2/+eI09BITp7mA6EQeGdUM32DCmlNtX3x
	yxHuvQnSKkKmiBE7vO1D/JgrNYMYvkSN1bLeeIvnRSg7SnsgKkZdMtRtT2Q==
X-Gm-Gg: ASbGncuygRE/iK4xhvO2gZ8YcJxPhopYV8XNCEHdKpmufRPoWN5Ehq2acSVyz2HirP7
	CMUE7iU+oWE1bNEHfW56ZelpTEEIoYoaqzW7umQ2/hh8rC1nLBJXv1Fj2E7BvEktc+/UV8sV/Ip
	Zb5wpspHoRXUlKL3I0SM1bUZSko80F9z8T3UlLr5ekwZUg2ZIArIjCaW+7oaG+o8QYL33YpN03r
	a7Id2RUPMbv4ITW/+9U0Eh6dQynN6oJAMg2+EJj2djTRJ19QBukp/LSFpKXum8ocIfP2g==
X-Google-Smtp-Source: AGHT+IGwpr5HxxsMDrw1kRLbewyUoegpFAtLdTBgykRSSjhQg9uayI9WJtj2geYJH0B6YxelyQQ3+45qlZw23tKEvMk=
X-Received: by 2002:a17:903:3d10:b0:283:f19a:bffe with SMTP id
 d9443c01a7336-29027e734acmr282414455ad.7.1760382030293; Mon, 13 Oct 2025
 12:00:30 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Mon, 13 Oct 2025 21:00:04 +0200
X-Gm-Features: AS18NWCMdN3SjIn28o2bWZF1tkG4xMEYQ8uLxmGTdFKLREWp3JU3fZUWiR4kg4w
Message-ID: <CAEt6Nwq7EGH06tGA8q=+4RLBLfOuuidDh-LRrE3g4MXoPxwuqQ@mail.gmail.com>
Subject: OE Workshop Brussels 2026
To: members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224795

Some people don't like them Mondays. But we say, the Monday after
FOSDEM is the best time to gather for a day full of networking and
discussions around OpenEmbedded.

So here it is, the CFP and registration for the OE Workshop 2026, on
February 2nd in Brussels.
https://pretalx.com/openembedded-workshop-2026-2025/

We will spare you the rambling about all the nice people, cool
presentations, ways to convince your boss... in the end its easy: sign
up, show up, and if you have something to share then please submit.

See you there!

Josef
on behalf of the usual suspects who run all the events.

