Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A354A61527
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:45:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so1172814wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 07:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lng40DHOs5Nrbh8pL/qjtaBaQLjOSCnJ4/HyyC6zDF8=;
	b=K/VacidFoKF6WZ5pxqER51pPiAyY536xSXZ4G7bWHzs9RyLcg01M6euvo3K0F65Egh
	B579HwgtzSh91xkOukk2WNCSDmIoYWXIGCxUjmaClNYQnqjDGSx5TiNCXXm0WVyLb0+J
	xUJ5kQcDF64+kCQkrOIDXaSnUPg+6fRV7MotA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lng40DHOs5Nrbh8pL/qjtaBaQLjOSCnJ4/HyyC6zDF8=;
	b=UAa8WmEWPtwGQkO24FMRVh0F3jESJMKnrIUZnc5hwx2J1Ez9RUI42GMq4yP8GyJX85
	O6b1OTj02SPpoIK36SaIemaPLwxdZXc04IYL168qf05kmrxRWIpCF/zgIIXd9ZJuGgiI
	IQ+x9rqxfV1gwfEHC/loXBDyMfo8sD4wz8Lyywm5kQWL46uri9kcypLdPYYuG4vKCFjM
	T9S1RB19JmCaGxb2b+e2NWNU9fbKaNaKSUfEtmDU3pjPLuOl/nsdNn+e2Ebnl3vHDtty
	ZPj+YS7ydrTWrsnomUgcUxJacMoB/HOjbim8GqPY2KtbOy+5vJsuP9wpVEc6+9bOZ3pw
	CMRw==
X-Gm-Message-State: APjAAAVDBVcAk/4FJPwuRvlhEpQCVdsIE14Lv1ey9ESmhDcOpQelW/jt
	Ibocr8dBhFYFnl4Sdrm99exL9g==
X-Google-Smtp-Source: APXvYqyuCcPZiPCY626Zvn6uSaXnBQbC7jqHcurkkOchvHzae5/5kEMkFl3pm7d0jmlEnZK/QrgaKg==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr10739433wmi.101.1582127112166;
	Wed, 19 Feb 2020 07:45:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r6sm165037wrq.92.2020.02.19.07.45.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 07:45:11 -0800 (PST)
Message-ID: <466b4fa9156bab24bdd059f09f5006a7ab40c372.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 15:45:10 +0000
In-Reply-To: <CANNYZj-VfzdUhLnTGy9y0FBFtuXVDkudk8S+YXQnrZbdYhFPnQ@mail.gmail.com>
References: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
	<CANNYZj-VfzdUhLnTGy9y0FBFtuXVDkudk8S+YXQnrZbdYhFPnQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: Fix reproducibility issue around libcap
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
X-List-Received-Date: Wed, 19 Feb 2020 15:45:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 16:41 +0100, Alexander Kanavin wrote:
> On Wed, 19 Feb 2020 at 16:24, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > +PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-
> > Dsetcap=disabled,libcap"
> 
> I think this should also depend on whatever native recipe provides
> the setcap binary, so we don't depend on host setcap at all?

Right, it needs libcap-native too, good point. I'll tweak.

Cheers,

Richard


