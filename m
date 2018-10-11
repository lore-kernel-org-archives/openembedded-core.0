Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81DE46025F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 12:00:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 143-v6so8663284wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YdAmdlxkKkWaKLasSizR1GJo0Nc7VvuwXZ/eMr+8LMM=;
	b=LHITu9nP/j1NXkDz1586yBeaAJ2K7yRpIhiyBn6Z0BvsHF6G5+EJekrKNpWRen9gli
	5xMExPKhZlhvj252eglEpWrOCcTFVzCSHDsd0BsZEo4/n+FSrY3YJWcEGWu8iTInxQ9T
	JmYG7qwiMgjiuuLsWcW4Epzdw+4VQSl0EQ6VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YdAmdlxkKkWaKLasSizR1GJo0Nc7VvuwXZ/eMr+8LMM=;
	b=F4W5361TkPRndIZSRpyJp45H6edQOVUtshWCS1XvXwTQamPoKQgyX491FEqptuSlCJ
	Crf/ypE/3RipSIHrzU2RJKNyx2fft5As81NU4Yu7ZJJDc7vWU+dab1+LuB9Wmj2h11vd
	ZY/iToGeJXpb/DkpCjiK5IjTAN0xf5WPZtcfbT3Botcoi2xDP1+fjuP1tJHABn8E/GwG
	Fr7KKSrPsNOdXckx1Fewl3SWrgLtald8qgoYNXaaHEovXNybEJy082PaUHhUKDv2sjt/
	5OsLmwp4mDaCVAws5Lq9XbNeCeAeES8OQqIJ0Jhgg4MuYhCDK8H1j6f4w1rNXMmbkKzL
	ruBg==
X-Gm-Message-State: ABuFfoic0q1CfKmUm6U75B36D7Fs+295/pX8LPGTTvL/kofCiJJeR268
	CvSySBFvEywmThVMt8AO+lkZjw==
X-Google-Smtp-Source: ACcGV61eH9Jm92PV55vz6eOw3DWfUDBMVNd9vNc5Rlwwf+Fmu93g19rO9P1E8Ecf1yFniidtn1aKNA==
X-Received: by 2002:a1c:87ca:: with SMTP id
	j193-v6mr1304561wmd.99.1539259251025; 
	Thu, 11 Oct 2018 05:00:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e67-v6sm20929264wmd.41.2018.10.11.05.00.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 05:00:50 -0700 (PDT)
Message-ID: <e8b42506cdaf9437f715100f0ff6541d5ed3c894.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 13:00:48 +0100
In-Reply-To: <20181011095511.5509-1-hongxu.jia@windriver.com>
References: <20181011095511.5509-1-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Thu, 11 Oct 2018 12:00:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 02:55 -0700, Hongxu Jia wrote:
> If host perl is old version (such as perl v5.16.3 on CentOS-7.5),
> the openssl-native failed at do_install, the reason is its Makefile
> is not correct which is generated at do_configure by perl script.
> 
> Use nativeperl to assure latest perl on host for openssl build.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I think this will have a noticeable effect on built times unfortunately
since it means openssl-native would then depend upon perl-native...

Cheers,

Richard


