Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB67CCD182
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 16:30:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13249.1759422630411862923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 09:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=kKUcP1xB;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.214.177, mailfrom: jester@theyoctojester.info)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eec33b737so15901745ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1759422629; x=1760027429; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FXd+3bmgzFKOxSsARkU947DO5x1ocL+VU1rjRq3EgQM=;
        b=kKUcP1xBKFapttrPeaYUBgy0L/4FB5Sri5ZObrkRftNWV6ObRJdIaAZa/XPzooVkn/
         B4ITV7yLcyO++c3L3p+tzy2BHUHveYT1UWIDaiQPgdxLD4B8sfzIoBKqwzDuro+z7GkN
         W0BZU/x1Qol/2abp0HC+dcGp+CDeswpvkFinEOS6Ir44IdZY01GGtqWkT6Rldu5qUGvX
         6mgAkVwHvygbcl0WU8+QsOCLttzgSV/0JCAsfPYeFWar1TyjOx+wFW76DjLrRerLIuPm
         NkRxkIGZljZ+iq3RGUktbYVgI/hVTpf1/RuMpEhFOOAqYyrPu9piC0hTpSQVuynx4Zet
         eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422629; x=1760027429;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXd+3bmgzFKOxSsARkU947DO5x1ocL+VU1rjRq3EgQM=;
        b=nI899vRfnKfU6wpYx4PSQowcvrkcJqUdkxtkQB3/mwtJSzILC7bgROcZSFIDAUBQ6A
         ET5r15UbdgMID6jRLIO9C7+/y6+N+tvDNO2qB7fPqlyav/hnczv/4ksD0iBHDZmXizCP
         t4NTlSt6GcZ5sZmH/4D1cMnBiApgfhPB+o/spvs2TbAOotL07o1hdhMgjDyGrD1ytN80
         ynQoipzLuHuDqlaqvBv5ZlQg55wP1U8s7QWTberls0tUgR23FssMWwFbfPZ7GUX/l4R2
         wfzJqVJ0bDfjIpboEgYWiD8zGH5af4HkYEBPPQ7ERGn5rSwdwMPqZuPxzup/n1mw1IZC
         8qyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI5tRtaJFRWjxc1BcW/UCSH6+CQ3sFocTik9hAwK9Owg4oLsSsR34cx354VSv9/FdlhxquBAr13Quqtpfi3fgP4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxabPeldgHgSBFGi1al7OHEhP2vs1bvgfVWAoHt5rmx2z1c1qGz
	8HXxCyoHVn/ixBAHGmyP/WZCsqSuw3KL0mBabywnjf33kOuvOpdUaYY9wiRdZ2PRxWDQPFSk514
	++uZNnnj83mhfTAg+R6KRMf9KrGEUyvrwqrjhM+/k9Q==
X-Gm-Gg: ASbGncsSMT9YysKkhnIoqBmG11bc7qsUX7wD/vTT4FkzRX7w28CzfrZe5+MlZ+jJwHy
	k7AVe0L3UpERO6u57h5OwTg6nUtyHpLgGtk6hveRtTNLLrRsiAPewbjEvFV7bpIoLpAPQtNEma+
	ohjM0rPRyp4zjh9n/yYWQ5UoeOWKAD04ntuh0PFmn/FVtmUx9Q0BuAJ+oYdx+V7FQ5ZuXxhKD1t
	infDe/BSQkl2srMH7MZhRnklOn3JqxJC4fyfKKuz3/nAlG8vVALktyOC4kHuAHb/eY1NrzWy5ZX
X-Google-Smtp-Source: AGHT+IF0oLXMb5y4l+iqwomp3/f6AbSlTUJJgwgOKRg/ure+4t9JwIHBllhnlntkUlX1vLY1ODQTW5x5tB+U3dXVC20=
X-Received: by 2002:a17:903:fa7:b0:264:ee2:c40f with SMTP id
 d9443c01a7336-28e7f45448dmr91775455ad.52.1759422629498; Thu, 02 Oct 2025
 09:30:29 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 2 Oct 2025 18:30:03 +0200
X-Gm-Features: AS18NWCirtmmLQolD9eh5lHCW3i4_X_96mndztU259OD8IgaRfw068bI4rNroXM
Message-ID: <CAEt6Nwrci00muZsVX0aCyeQcW3GD1aYDntwei4Goxpm3qudnow@mail.gmail.com>
Subject: Shh... RFQ
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	members <members@lists.yoctoproject.org>, members@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 16:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224373

Shhhh... have you heard of our opening as Ecosystem and Engineering
Operations Lead? If not, hurry up! Applications will close on October
6th.

https://jobs.smartrecruiters.com/LinuxFoundation/744000080228346-ecosystem-engineering-and-operations-lead-remote-contractor

