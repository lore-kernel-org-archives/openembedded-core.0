Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 992E3601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 04:53:08 +0000 (UTC)
Received: by lagv1 with SMTP id v1so5302221lag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 21:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=BQ6uobsIgeNjC/xFtMZOJr5ODf/zHUf7YfOPHn37nBg=;
	b=HdKFW3mJjgMbdL7zds6S76y7iJBAJ85/rk8yy9MG7QTZLbl7njte8pmlV1ThHo3h6E
	MlF8JYXU2JGGZTHkwXmrURdyurdWO3XoytREEMVjy+KhjNZWYHnSxkMtx24pW/oEKLrS
	wrlw8QDUb+CI7tpumH1ti4HId232dOB0wu2PqV/sI+yWag9K4VCHUMf023rDpYW1C8wl
	Gz+NWJzznVqHNX8HkpImd1+P1fY6e6yPS+q0pOH/x0TTWXpsLuoMmdgLH3CVx1PNbJmf
	xo2OXtDVzL1PS9k4Oq5dTNNGTKOwnHOLvpekA0Vkim2femmb5uLscxNciCzYK5Vnxuq8
	kNWw==
X-Gm-Message-State: ALoCoQnC1T+f21nxZwjDZy87YoHQpMWF/cssBbjKP5Rs2zwoAwKlytixLFrkhtigIxuT4Ze2S+Ux
X-Received: by 10.112.154.138 with SMTP id vo10mr20028708lbb.68.1432011188656; 
	Mon, 18 May 2015 21:53:08 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by mx.google.com with ESMTPSA id p7sm3211792lae.47.2015.05.18.21.53.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 May 2015 21:53:07 -0700 (PDT)
Date: Tue, 19 May 2015 06:53:06 +0200
From: Anders Darander <anders@chargestorm.se>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150519045306.GA6886@ad.chargestorm.se>
Mail-Followup-To: Otavio Salvador <otavio@ossystems.com.br>,
	Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
	<1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
	<CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
	<CAP9ODKoHQiPV5nYJbDPi9afxfagoxZzwvLbhDvD68O06yP1m2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoHQiPV5nYJbDPi9afxfagoxZzwvLbhDvD68O06yP1m2g@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cleanup-workdir: wait for bitbake instances to finish
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
X-List-Received-Date: Tue, 19 May 2015 04:53:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [150519 00:27]:

> On Mon, May 18, 2015 at 7:23 PM, Christopher Larson <clarson@kergoth.com> wrote:

> > On Mon, May 18, 2015 at 1:08 PM, Lucas Dutra Nunes <ldnunes@ossystems.com.br> wrote:

> >> bitbake uses a lock file on the build dir, "bitbake.lock", to prevent it
> >> from running before an instance has exited. And sometimes the
> >> cleanup-workdir script can call bibake too many times, too fast, before
> >> the lock has been released.

> >> By simply waiting that the lock has been released solves this problem.

> >> Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>

> > The fact that the bitbake UI can exit before the lock has been
> > released is a bug. Not being able to assume bitbake is done by the
> > time the bitbake command exits is not ideal, no one should have to
> > block directly o the lock like this.

> Agreed so you would prefer this to be fixed there?

Sure, that would benefit everyone, not just this use-case.

Cheers,
Anders
-- 
Anders Darander
ChargeStorm AB / eStorm AB

