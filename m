Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 417C57D53D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:06:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so8942270wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=a1Q6yMzLEACrZWPx4zH70LFbFSkOLhkLrs2uji0SJ0E=;
	b=X4wuhPH2AWOwInA4ntfIaf2SdDgY747vubX2IyhgSVmlX8/hV/FCKJjFoDtqZ4vFUf
	9Ptye7ob1OM3m3m1MFZHHmJyhAGLaRqf/MlOr44ZwbkzZZ8RIXrc895zQvU2EXQC1sjk
	06sZS11h2niIevsctLDrpLp7wAO2BCg1mHkdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=a1Q6yMzLEACrZWPx4zH70LFbFSkOLhkLrs2uji0SJ0E=;
	b=EoLbquu5ru5HnHwsPwWi+PqQhI7ameBAf/M98aBrXL3AUY1oXSC71gNFhRnu5La2Bh
	5xWarSmOFqO8f70KtvsOdPznz6x2haoqQT6gMHXSMgbCABL3iiNy92qnrL/ux624NO+c
	0ghck/I4Flkki2SHFrQJuzlVx8erOm/F993/Oo3wtQzJ7LtCpJXYqD58DpkaR+ugzu6G
	0nrhKEKZ/Yq9UbMg4BFvVw7zdmnE1kbA3oxev2Bo8+fUYd/QOpL3sTxlIYGBmF3dpP6P
	kM+vwcuOoFimqz19RTSzKiAeSyupjQSFmtsAanhBXy6nZTNNQREJXus2cQaywydZpEX8
	VW2A==
X-Gm-Message-State: APjAAAViB0rf33hQvyPCeT2izOhgZqyhZLBU8vb9MJqMRGgHqG2lQ+nI
	IvNvXZk8jdnSoN2VTwhjHQ8hgA==
X-Google-Smtp-Source: APXvYqyRi1ravdjTok6E4+umHlJOOBJeK861NuwH8izCOeGQkFg9vs8VAS64D2J41UOUzTtByWI9UA==
X-Received: by 2002:adf:f904:: with SMTP id b4mr10456141wrr.291.1562918769921; 
	Fri, 12 Jul 2019 01:06:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k17sm5032548wrq.83.2019.07.12.01.06.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 01:06:09 -0700 (PDT)
Message-ID: <653aa5ae1d1bb459d02b43aec637a94e43f76a4f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, changqing.li@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 09:06:07 +0100
In-Reply-To: <b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
References: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
	<1554165783-46226-1-git-send-email-changqing.li@windriver.com>
	<b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V2] llvm: fix link error for powerpc
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
X-List-Received-Date: Fri, 12 Jul 2019 08:06:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-12 at 16:11 +0800, ChenQi wrote:
> I'm recently getting llvm build failure on qemuppc. After reverting
> this 
> patch, the build succeeds.
> My host is ubuntu16.04.
> 
> I'm also wondering why autobuilder does not detect the build failure.
> No 
> world build for qemuppc?

There is no world build for ppc or mips.

Cheers,

Richard


