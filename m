Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1FF7BDEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:28:24 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id u16so6284827otk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 10:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iMh3466XorDCeuGDoMhaCz7wmt3Uy6esXMKWxopN3vw=;
	b=cTslrzVysrM1OkjycQC4y4bemcTFPkILSpjeAgx7FbnpKe3uh90LFFeipBaH4rUYsZ
	BXsOApYriSMczJeJfqYSdQk7vAkPo/iospGuN7EBsh+N3dWM7EkwKSRMTLXcBzBdrsIR
	5klqatgDry7EHlKNTGCf/BVsEOpf5Kf4nDudGPFmJfflDmzDkN5eMeEjWXaqEuOYPAgv
	r8FzJD3/LVHL0BdHjwCZ4RuHwztBZTmKw8/YHh4XK7Wf39uGcoPWxs9kri75PmLBI4Ws
	RS2tkmf/NzXtlguu1Y5JTYEEUJs+2mcE57X7a/84QMqXdy/aIaiE9w0gZn8z1lCU7kMp
	pbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iMh3466XorDCeuGDoMhaCz7wmt3Uy6esXMKWxopN3vw=;
	b=V/z0cltxjNzVS0cOV3KJTeB08RB4b97CEwfcRnVe+LEv23NT1K8WXTliwGadjzLUTJ
	+BvfUmpsUI5aqSUd29sEG8RPdlNN8JoPdv1k9e6xizZ+/59y70CK7bD+hP3Svv0reUW+
	lcZAy6GRce34xpr47WTyaMDTadXfvj9o5qZXtuPFFuLn/dStUucY7VLWoIOzntSOxxGB
	F+GjENUzy0jpNuu5VllA+Qs+0zZSHstVCemetZXL1qbLYrwxgppZ0tsZuzliFw3TDTRt
	YFZqT3N/OX1koGupWh6ABeNGxjj7J7X6B99MhTqIOJncijhMipOBL5aqi/XCJuIAu70U
	qZew==
X-Gm-Message-State: AA+aEWaUBftwi6joOOLv7GPa2cHMSleEywNazw3pTHnwStBKWEqI2WKE
	mk5qjPscBr2LfDV9A87/xjOgfnu8EyKTGo1+rOM=
X-Google-Smtp-Source: AFSGD/UVJPBdo7CRCPOzFhbYhBrH0YY6LWm3any+jLHkr4vudkTrR/ufrx9bTNFhHkzj9V1wiHfnVwXkRY2VkEPCr34=
X-Received: by 2002:a9d:2289:: with SMTP id y9mr716671ota.326.1544812103976;
	Fri, 14 Dec 2018 10:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20181214181535.9186-1-richard.purdie@linuxfoundation.org>
	<20181214181535.9186-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181214181535.9186-2-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Dec 2018 19:28:11 +0100
Message-ID: <CANNYZj8aDC6L66bSkAgMCT5dxmWMsMAEKMsixGWCvcaoUd8fbg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/selftest/distrodata: Port to use the new recipeutils.get_recipe_upgrade_status() function
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
X-List-Received-Date: Fri, 14 Dec 2018 18:28:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Dec 2018 at 19:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> @@ -17,11 +19,11 @@ class Distrodata(OESelftestTestCase):
>          feature = 'INHERIT += "distrodata"\n'
>          feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'

^^^^ These are no longer needed? Otherwise, looks fantastic!

