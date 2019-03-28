Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0F27D186
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:07:00 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id u15so18016885otq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3HsrfMCOZ5UZgb662JimX8x4KMangY6nYEyo8UZuEjc=;
	b=enKUW2AcRxBpmLW/jXVZ6Xojoa4eUdkfN7u6WeMNcUSSzww4lw8wvTUhHoRsp7b7tb
	BIKPWY46j6oKATYy0B3kz2OQXmth+VI82+jtZubcSFmkgLPGwKt2YNkSXfTCEfjyFFbj
	Y8hXIpxIdShkh92PJS52hdw1RVhELnIfViBUucIal7fpLsuv32ojC44gQuCIvXMDnobJ
	t4cSMfsyHe59KWRDjqhdHo3mu1MZv7fe5/BersSxSHNkE/DOy4oxhnKLt6jJwGcFwgjC
	bfTBvwTfqb511ztRqeUtpCcSBmg93pSPr1M+KXXOIICA6CDHMCF8Ost0YMrJ4Llk35gC
	w2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3HsrfMCOZ5UZgb662JimX8x4KMangY6nYEyo8UZuEjc=;
	b=BUaI/zUPH+fTmFcQtj4OgsPoA55x0XDghd1wEEgb1QELsDAj/k6FDBmH1kacNFJnsW
	Do4/uV6KX+MMxJ0w7bO2VDi/7I/wkKs47x9WrW+LK6+Hy1sBjRyu8WnGeCJnKdgtJk+2
	OjjO/Ys1f2dBScxkNbtIGJacliUPLCRpwwtatUBmEbWbjBm1MD9bB7OsyBf4V+gIeIab
	aDBsWfxJ5P5DJ+KrVvJexgLEeXZkVQbWWl5gJzN2rxDSqt8ErifRrg+AoDPd1I0KGSth
	l/qRQKABKAKiMi1NO/UWwCg/HJOu311o/X7DMFMaw3tuJ6qrVRjRuGtDW6pKrFEGmI8x
	ITqQ==
X-Gm-Message-State: APjAAAV2aIcrgUjCwKodkzroYvty/WM37NXSsPD2s2NFVqbqWO1P3znW
	dzosIFIi11v+6fp3YmprPQKITqtmGlFS73J/9m/g2PU9
X-Google-Smtp-Source: APXvYqyh5bzN92hN7gRdCRuNahYa/tpjwIFpPp4Qd0B05h1pXx8miTQ12CxlV4b5Ra0pF5kgc3O49FRvrOVxDtEBKqk=
X-Received: by 2002:a05:6830:1c5:: with SMTP id
	r5mr19298841ota.360.1553774821522; 
	Thu, 28 Mar 2019 05:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
In-Reply-To: <a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Mar 2019 13:06:49 +0100
Message-ID: <CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 12:07:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 13:03, Chen Qi <Qi.Chen@windriver.com> wrote:
> Setting PV to "2.32.0" results in cve checking tools failing to
> report the actual unfixed CVEs. We need to change it to "2.32".
> After the change, when `bitbake -c cve_check binutils-native', we have:

I sent a related patch yesterday:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280511.html

The problem with setting PV properly, is that 2.32 is less than 2.32.0
and will cause the 'version going backwards' problem. But if RP/Khem
are fine with it, I would prefer your patch.

Alex

