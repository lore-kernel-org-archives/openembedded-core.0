Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D615379AC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:40:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z25-v6so1385089wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eU4/RNhK5hCIGmV9qiTrMmYpiK7btpd5cyDlL3fz6sE=;
	b=cwHWUh3SdjKMepO81xECCKxyU6J9KnBpPCZgxy4Nl/cGowxg3RYEfcHtG0a73tB2dB
	goMrl6oSxO3Rjj0KGMFnTvvc8Hf4nSW7HLhz1pKlmqSGeLnjup4LB0LyU9URjXOcImDj
	+WLDoKqnPM9H5FMeAJOWi7rhtJGOadxIEoiZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eU4/RNhK5hCIGmV9qiTrMmYpiK7btpd5cyDlL3fz6sE=;
	b=BbhllNZFftOKJpamqQy1caiNa9+OsHFtAi578Ezl11hHmsK09CiOHCKlrgZzpj+H3z
	IDGe246SoLEXF1+Dsu6HlMiCEM2cd8SI/mq919zmQqTcTnLchv/7YTmxNtkQIVrxJJCk
	rhmpZytGedTAujsSZXtMobIgKujmOrX3HtcmMRcJ+Sik6fb4Zt1g3J2K7EVpI0cayIzc
	qfBPjp1D20bnc8mL5papvMyRenbST/wSKAaFthBpBfMvJ8Jy6qNtxqpY9HCxpo2/IXAK
	V/cgXszeNd1J33D/5/4kcaL0q7jmkqmml/5OojO2AZfobXckN0eDXpre26c3pzqayg2H
	svXA==
X-Gm-Message-State: ABuFfogO+XTFbsyIN2auCAKDaJrqjN6qnxS6HQKSO4LG5NQPVKCEmf2m
	NnBS+sjPsZSO2au+SMxdRnP8XA==
X-Google-Smtp-Source: ACcGV61EhoK+W3kjEAfFSu6uGiXiwyKH8Kckk+agk8n4JOkF9omNXqu+XUvq8P//k4jcvy57COm0hw==
X-Received: by 2002:a1c:603:: with SMTP id 3-v6mr2627798wmg.64.1539780005071; 
	Wed, 17 Oct 2018 05:40:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n11-v6sm12516909wrx.17.2018.10.17.05.40.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 05:40:04 -0700 (PDT)
Message-ID: <df1d6cd1dc275e9717cb297767a255ee70ae98aa.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 13:40:02 +0100
In-Reply-To: <bb016a11-6387-b7cd-4b64-7c8f925874fe@geanix.com>
References: <20181016192546.15672-1-richard.purdie@linuxfoundation.org>
	<bb016a11-6387-b7cd-4b64-7c8f925874fe@geanix.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] systemtap: Fix issues from 4.0 upgrade
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
X-List-Received-Date: Wed, 17 Oct 2018 12:40:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-10-17 at 10:29 +0200, Martin Hundebøll wrote:
> On 16/10/2018 21.25, Richard Purdie wrote:
> > +
> > +   # Fix makefile hardcoded path assumptions for systemd (assumes
> > $prefix)
> > +   install -d `dirname ${D}${systemd_unitdir}`
> > +   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> > +   rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
> > +
> > +   # Ensure correct ownership for files copied in
> > +   chown root.root ${D}${sysconfdir}/stap-exporter/* -R
> 
> root:root ?

Well spotted, thanks!

Cheers,

Richard


