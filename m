Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7B3E63F25
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 02:17:38 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11508.1771208250193863315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 18:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGyb6AT8;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cb4136d865so349226285a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771208249; x=1771813049; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6iSX7JTGCVk+Q175mOSJXHtZty8BvvPvx0d2Dg6Qxik=;
        b=WGyb6AT8Z4XQNJlxbAa2kX8G3vFZ6kvHSnH3ReM4PsBrg7ZB6HdhzbIjR7SFXuQ80n
         rbX/WsmCFFWRW0d7W3+opqbBp26QMURPuLBlgy7YMGWkk2ZVaQ79NBEjWwWirOjg8Wrv
         XzKTRmXmcv2PpaLsr7s7OMi4maXQW16lJ3oAxxxf9dIjiUudi75gOFkmt6DY4AAFvwuS
         7ATAbczJme+E0XtkzoekMfCFNbt243KMrpT1FRx4teb9I+pVQeyZ8m/DijCbLAPhDW/A
         YJ/XIRuzXX7f9OeINpJdn96DEsXznzjx22iAzWg5rRb2bCOoRHaKe1Uea7+cP+6muumj
         u46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771208249; x=1771813049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iSX7JTGCVk+Q175mOSJXHtZty8BvvPvx0d2Dg6Qxik=;
        b=PF/eu6WLEOrmfQsWCC7R6UdriSUNu9L6aYf4+nSGnBf3ayhwQVQN21feREEMZ1MNZr
         b/m9wPF/pZN7iBBwDXgFQA8oKu/ZqNkKGk1D9nP2E0ISro7M4ywq7hHqvYiSqGYHpiFd
         m1n1RiZY6NoG0V82gssrbLu744IqAj3aoQN3mr721/IrfsKKWbX1X12RJ8Bo+sUs5Tmn
         fu2V9dOUrZR/IKsh71UfGxjGuk58Wb5ZLeFPL8TATqWp6rJTc931EaZmecO6UiRVwT7P
         X4Q7EOa0t2ABUNqGHnVtV+kCCCsLM3pBzVmqX6CT/JRcVc6su/CdU0O1yyO8Z/bbN8QD
         DZYA==
X-Gm-Message-State: AOJu0YxPTJCV1vd5iRMt0AkXOa8ctH0Dn7MXJX4z5QjxNuigbIESmMX0
	cTwSqSKz3FCD2qtf4+6Sv+3eAU37V/E1qZpzW0bVQom5akjWNUeL4eKKZJdYzBcQVFs=
X-Gm-Gg: AZuq6aJelEvXe8JBj96/ePhAJAZ3QFICqgAQjysF7AEHOxdXoHP8UV9AEEKtTG5+XIT
	PElZeyYUbYGzph2IF65BM98FWDvlsBR99mBQ+GFDS+gFvFsynmEnMJrV4P9T+Z3fOgf3TaUU41s
	pK34NKmmWds+rRpQwdtA/MftOJJh1qQbXl6kOIa4EIqx9RMYh6ATWp9gfQUlkGm/OdAvVNEq89y
	MK55j5A16jrTHKREzaw8ozA1ZZ1pdk3+Kq8GDV3nnDh7mif7DVbLuIwj1KUHivRGhBESKbXpYhx
	LUPO+Ra6CsdvpNDMvFlcEWs4B8KRPqB6ETMvSJRoAizyUatVrH/wdOdfbN92mxxS8/BNcVxR0Kc
	dNhD5WB47Um+s7mJXg8u13a0iRz6kxmOIhJCMvxTWRP7VUjfmSmP7wqaBeyJhI1w+zBYXwlVuff
	q9Kk56HQf0I5S2yA/eLuhtV71Z+BP/zGjZo2kgKqVhB4KH5+P4mJOEWC09Dfl0IwsnIA==
X-Received: by 2002:a05:620a:370d:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8cb4bf972d1mr847064485a.8.1771208248572;
        Sun, 15 Feb 2026 18:17:28 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc162sm1164999185a.2.2026.02.15.18.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 18:17:27 -0800 (PST)
Date: Sun, 15 Feb 2026 21:17:26 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: mathieu.dubois-briand@bootlin.com
Subject: Re: [OE-core] [PATCH v2 2/2] ufs image class: add
Message-ID: <aZJ-Nr3X9h_h69uv@localhost.localdomain>
References: <20260216013324.735425-1-twoerner@gmail.com>
 <1894961F92B64212.964619@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1894961F92B64212.964619@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 02:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231175

Mathieu, please ignore this v2; it does not fix the warning.

