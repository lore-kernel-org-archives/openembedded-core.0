Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA0C97C168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:40:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t27so4827255wra.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=T6+tZXeqiurMJJCdQPMRtvyJ8AXcZlPI8k8dg5+F4U8=;
	b=WS9PBJpbmQCbqO6qjKorhGxeuwnDKkRAyhEh/HouXPOH1f4wj+04LwVYDRK90asE4f
	kZ3zN7z+pDaem484tLBfym3PSBYeCn2SzAiV6vvQpTEPeFYbMDpXZtF0K+k2ujn2Qs3X
	GcbHEZnoAhMHTkfQwBmAo5lzvu0nL5csdSsUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=T6+tZXeqiurMJJCdQPMRtvyJ8AXcZlPI8k8dg5+F4U8=;
	b=gRoTZUKsvscNtOfzxpkQ877ffV10qYNd0WujECpSy1B8+gv+KzfInMBd9ToFZwRbUb
	l77XcnhPVAlH0jpW48QrNLgcouPp/ROTtSoGp4tBkHejFAg6F2sXiJ5oO0P9ooVn+Bb7
	JXjM1sBnFb+aW48y57hi/Je4Il285dYGe7E254/++gLxkNr8C0x2Uw/wgy7Epa7GcovA
	fiQzIVnDSDRmsWBS6a9pwTfcAOoVeKVOPz5dykBuM0EN/BMTJHEBur6OjECST9ta8Qha
	vT/o6Cl2b9TmwHRZk/Xx4oTh8F7jDUR7+h5wzMX8ndkZUiZ7g8gZXYtzNbyfD1fcVEOE
	Q+QA==
X-Gm-Message-State: AJcUukcvQmgktSnZVD+pfyoCa3TN3VWoDb8PmksxRERj9+TRWQiF4n/q
	dSxfpS/J0fH09gjfNbV+832kmw==
X-Google-Smtp-Source: ALg8bN5JJI47Dd+NgA0afWGRBheuBWNLKWqT2HBfzYr1fYGJVYwUeIEFxCcNONd7VhljU/ZeSfav0Q==
X-Received: by 2002:adf:b502:: with SMTP id a2mr5242240wrd.54.1547592033312;
	Tue, 15 Jan 2019 14:40:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b12sm61407211wrt.17.2019.01.15.14.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 14:40:32 -0800 (PST)
Message-ID: <e43ae780cc21144a3f4afc358f54798eab6c3aa2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Randy MacLeod
	<randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 22:40:31 +0000
In-Reply-To: <9e1430b7-e754-a6b3-70e5-848d4c4c250e@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
	<6777b5a2a2442988d4497678639c018f638ad86b.1545102457.git.liezhi.yang@windriver.com>
	<ecb86c3f-7884-fa3f-a21e-4574f3c9df87@windriver.com>
	<9e1430b7-e754-a6b3-70e5-848d4c4c250e@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH V3 03/11] ccache.bbclass: Refactor it to make it more reliable
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
X-List-Received-Date: Tue, 15 Jan 2019 22:40:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-15 at 10:11 +0800, Robert Yang wrote:
> Hi Randy,
> 
> I'm sorry for the types, and thanks for the correction. I found that
> it has
> been merged, I will be more careful.

I did tweak the commit message!

Cheers,

Richard


