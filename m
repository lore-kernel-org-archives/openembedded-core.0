Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE17C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 12:23:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10622.1746102181285408313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 05:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRX23IKt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee651e419so352757f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746102179; x=1746706979; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pqgVTxy69K3lWw7TxciSbr2ui9hxRn24RR5n1IR/SU=;
        b=BRX23IKtmJsA9wNiWy3oxukFyXGxkTZZDjn0XMtHhB/1l8esA3ekrkmrNfl+HozSAY
         Zvfdaa2WPjDXjO0UOHEJh+KcjtzWnmi2smgIppZu4kJrGf6enBmTjC3AuhybzIIqjwzC
         u10CpeeiiH+3fYkTYDweCPebzTVtIelgcM5N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102179; x=1746706979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/pqgVTxy69K3lWw7TxciSbr2ui9hxRn24RR5n1IR/SU=;
        b=grSqMlMfi57wde7RMNKL3kAI1QqDL6TrI8a0QAbflzibmfe8V15K9kr7DLNpCJSlIw
         wd+aC8qjHOz8OIFZKQ32m6AIpBOXzdKpjxsSHlCVpKp1Kmbxi6e2OesFloKopesiL+TH
         kthf86SH4L1MCLQu8byGbYrrUSz5V7dIGMAmFcJ21fGSuNs0dqJVtY20xEUKLaQdmy0s
         ol5PkxMSjtfQKD3x7MDrZYxKWcZtOOSVscpTLyRlg/mQr81bIUtIMeszpvQf2NBK8AXO
         GWND5h52BudGDgwWUf0dg424rlpMCFa6cE5a4dGtyZdKq4O9/yRWBUJZgFuuTj9G18TG
         hfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCaq5+5vHuQ/nxjNe8SYxDw8wuHQxk7zDJjSVsKxXuYiCpvM/r95vOQncfU5yZZ6RxvnlUR5fN6I1x+14KG13R/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7pZTVeXSt/YKganiXnGzmaMKmZD5p9XLgum4F0Z4Yx+u0b1Xe
	8K4ZMXVgvFGR1TPV0WV4ubk3GBhn6qmfWS8VmD+jE5drxujzZJHQSftlaH6FsJI=
X-Gm-Gg: ASbGncsBdZUSzQi/SyRhGFkCvr2+Y3DLW+zFbYsbsOBjIefyHYqtSIoX8GqkWSy9eEu
	NUc4MNjKTWZFdbQwae4M55QaKcOUpDqDkAgDQHfMQTXDxl18DHFXKz52/BGVxO2IYZifs07CNpc
	TZwTOU3SSDltDExoFhJaNiOFDRLZ0FCNLxRV7mMDPidzRvPHvs9U/zCic4ZnFsM/nx73B5dr7aj
	LeirQb9S8MSukoqfFEARZPJnYG7DXe+kmlJpO4keupm+Ih5bqee35R0tK6UJGLzV+OMarosHA6V
	GJaBsZhO+Q8XMkkChJO8qZXIU3/NjK3gYtG+vkc5ckX4oMFjMpDv/9iRr2/FqXbasz+ueud0dy6
	c2IKYVgS5xshgWNY3a3VsCEXpnoTXNA==
X-Google-Smtp-Source: AGHT+IHExA+dPQ5C2RX8IZg4KGO+BzeY0qqSHs8hKvLnBNmOxFqDsBijAp4j0Y3EnRzBOP4oZxuRAQ==
X-Received: by 2002:a5d:5f53:0:b0:39f:e50:af8 with SMTP id ffacd0b85a97d-3a09404c8admr1589059f8f.18.1746102179461;
        Thu, 01 May 2025 05:22:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1fd6:dc80:b60f:d613? ([2001:8b0:aba:5f3c:1fd6:dc80:b60f:d613])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88197sm724363f8f.72.2025.05.01.05.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:22:58 -0700 (PDT)
Message-ID: <13f4086b0ed39ac011ed5aeed53aca866dfeaa68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 1/7] meson: Allow user to override setup
 command options
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.hochstein@oss.nxp.com, openembedded-core@lists.openembedded.org
Date: Thu, 01 May 2025 13:22:56 +0100
In-Reply-To: <319176ae-a09e-425e-be0c-2db0306826a0@oss.nxp.com>
References: <18372D83C40C1A33.11203@lists.openembedded.org>
	 <319176ae-a09e-425e-be0c-2db0306826a0@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 12:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215768

On Thu, 2025-05-01 at 06:43 -0500, Tom Hochstein via lists.openembedded.org=
 wrote:
> What is the status for this patch set?

We know there are some issues causing esdk tests not to run which
aren't from this patchset but we've been looking into.=C2=A0

I think Ross also has some feedback on the patches in this series too.
I'm hoping Ross can get that sent out.

Cheers,

Richard

