Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 944057E669
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 16:17:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u16so2472269wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nBCWaQk269edrLSlhCQhD9tHjO4uhyHfA8cpTHTNmVw=;
	b=gFMmekIsMm/hXqPvBgAM6Om71Pbj2A6u6yrXWXGRRvkmroG0fw1HOgAvvWFkVUpuT1
	vneqCOBdy1oQ6+5HhKIHP5k/mRdVGb5Mf9sGgX2S0Ph/4AvtnQEWW93L7PyWoy20/cE+
	YYMMwCSoIjE5ls5SJKEB+x9rWFvClcaImxbdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nBCWaQk269edrLSlhCQhD9tHjO4uhyHfA8cpTHTNmVw=;
	b=ud3UGG6JPzaU2Ti5ixO4rqjpHmTGEmevRqv4FqW4qPii6cJxTgpLZ2mwpzF4a7XyZj
	K5+hfa1VxsMRSPwGsuOw97ollNY5e5Y+ZxS71rUsRmzKNMpsatScDLRUKAJXW9snjjEA
	1jO5pDuz3lpjBxiUpdznA+8r/uJU/Btr1qIULbfIIwsMD2KiC/V+fe6B3K9kWh1dJFMe
	itYavnSseJI9Q9cK86bNsTQ+REdjrv3Ahwx58Q9/OWJrtA1kIZQcs1DMgOvyP5h/fcRB
	504fkq/ePILObGn99vh6ey/6pqrkEnWM/7nZUrc/1PvZPStJDI31GeOAuu2Ca+b/WDP9
	t9uA==
X-Gm-Message-State: APjAAAWdLcQIv4haonF/TKwRHqJIBfNCRVgOldFgg97eg2ZIvgmaUfgd
	hBrzQLtq/CaIMhbNBOYA04JxkB3K1ys=
X-Google-Smtp-Source: APXvYqwbgAvTDkVba4mDpFMMX3T5izwT8Q+XU+8fJuQ/JYf/nh7/SaTFFWY8z3OvBUDtZtBU+2AQGQ==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr9412041wmg.112.1559405826115;
	Sat, 01 Jun 2019 09:17:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u9sm22156511wme.48.2019.06.01.09.17.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 09:17:05 -0700 (PDT)
Message-ID: <35a258e3063f6f6ac9f12702ae8d559719531665.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	<sakib.sajal@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sat, 01 Jun 2019 17:17:03 +0100
In-Reply-To: <71b12ad8-a67a-80fb-f3d1-e0ed583c4932@windriver.com>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
	<20190531202552.21421-3-sakib.sajal@windriver.com>
	<71b12ad8-a67a-80fb-f3d1-e0ed583c4932@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] bash: run bash ptest as non-root user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jun 2019 16:17:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-01 at 11:16 -0400, Randy MacLeod wrote:
> On 5/31/19 4:25 PM, Sakib Sajal wrote:
> > new-exp ptest fails as it expects non-root user.
> 
> This patch made me wonder if by default we should be
> running the ptest as a user and assigning owndership of
> all the ptest files to the same user.
> 
> I will open an ER if no one points out a reason not
> to make such a change. I expect that some ptests would
> need passwordless sudo access.

I suspect the tests will fall into two very specific camps, ones which
expect root and ones which don't.

I'm not sure it will be worth the extra code to do it everywhere but I
could be wrong...

Cheers,

Richard


