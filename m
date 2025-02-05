Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE52C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:19:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.14491.1738768775900620899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0Jlzlze;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38db570a639so491302f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738768774; x=1739373574; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adHa0ysRvT8Ittmb4gnRk4R/vErrJUXZYTagj+3Fdrc=;
        b=S0JlzlzeXYs6uSeMEZ7oOJEfLFl1kHgqHFiqWtI9gqosq0QZ/bQmdb52Dv6WNIX2It
         olVxWfnCf5VKVsWCzm+UJRoNzoieZJZhOJL1kWx4eLgRxpjXUDRO4SMtGYYV8ZBkBDKe
         FEvYcDe2on/6t3nL9zawWtZJrjZm5Ke5pko53dvLjw9yHwDvaN4rE9e7MD3yC2Uxqp5n
         LyT/CrOs6zOYejkHI06dP8I9I6ZDBt6ovtOOFysRJQFVd+ladYf6bXhJykrHJ0kZQAZk
         bdSkXds7o8VybwYbY84tybaiA5FkCS2R7HMKdB46rqtCiqyWg13hyxnnTm4T4JUaiUe6
         /VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768774; x=1739373574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adHa0ysRvT8Ittmb4gnRk4R/vErrJUXZYTagj+3Fdrc=;
        b=aBo9ItPTnD6/6EFTGMcYBoIuEwvsEGvHIa1X3BlUu0OYkG28BMaLvxvFsa5P/T6oQl
         3fMC7DenOj7KHXPO8mdCl/qY90lazVLuIXKaRaZTOqt9KuCfvru+cqLD3y1bXuA4O8Kd
         Ut6cbkEgOe8XV3BU47KuKbrHhayo5b8p/vNm93lX4Z8YA77RppAOCZU4c3GTLW4tcu1n
         ndBvpX6npDp3pYipDycriAJ1yM+mNXLuQJetnvZeo1Jlj1VHeCuD/bTzagaWvY3HO+Id
         8dMLw+7xzPm902TnTSuXcd3tOf2Ync2Y3HW4nPr74ex+ZQ80iKRb2dyc+n94naocETfG
         Uchw==
X-Gm-Message-State: AOJu0YwSlGSKobPDo9uttrwIFcScXqOdL0ofPY2lBoUTYQMjLkW46j1B
	WZlIQDf6d+HvC0XJibrv64qeN1JgvNedmbcaPxG4/IbfSJQaif/K
X-Gm-Gg: ASbGnctmWqVNQKlhw27MqsfYodzoMyljTlH+MdSQ5QgDvQmm4Q0H/XmxRhbpsGx6oX3
	xw0j3bCws/jnp6p2TvWE3189Um+Rc56lnTliT1niZujcVp9uIlpsmbJoKnDLkKksQVxXFaEcYaf
	OF3CmY+wNcTOSRGsWf0gZzQz6qF1SNtqlbc9QsOl11R4eSOxTkIo8M4Okqhz7NIN0EEYeJWD8/7
	3yXJKjFNxaMYY8gTauqRmdYQkvklbCmikhZtIDCqH2r1W7WyYUiGgPEcs+AYbmuDAm2TTJv4Pz+
	jnANqYDM3IbDbgqAVhLtqzJ9tyeb0/PXFPNjFoq43e88jslc
X-Google-Smtp-Source: AGHT+IHZ7ocqzgVzlgd/bOHaCQAkTN73VboOff7KSpNiYe2Pd4RL7ACCqKwceiEQ/f9bBH7wB18C/A==
X-Received: by 2002:a5d:47c5:0:b0:386:3bde:9849 with SMTP id ffacd0b85a97d-38da53aa532mr6208846f8f.12.1738768774046;
        Wed, 05 Feb 2025 07:19:34 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c121951sm18886444f8f.45.2025.02.05.07.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 07:19:33 -0800 (PST)
Message-ID: <14328f25-c88d-442f-88eb-03f127615c77@gmail.com>
Date: Wed, 5 Feb 2025 16:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v6 3/3] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250205043637.2649428-1-zboszor@gmail.com>
 <20250205043637.2649428-3-zboszor@gmail.com>
 <CANNYZj-u4w9c44hp2hiFLFEQFpFdGG2JBCRRpHGbHQQOSJZd3g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-u4w9c44hp2hiFLFEQFpFdGG2JBCRRpHGbHQQOSJZd3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210859

2025. 02. 05. 12:04 keltezéssel, Alexander Kanavin írta:
> On Wed, 5 Feb 2025 at 05:36, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> Add a crypto policy file (identical to the one shipped by
>> rpm-sequoia) and use its path in SEQUOIA_CRYPTO_POLICY envvar
>> for runCmd('rpmkeys') commands.
> This complicated maintaining the policy file even further. Rather, you
> should set the location of the policy in the rpm recipe where the
> wrappers are defined:
>
> do_install:append:class-native() {
>          for tool in ${WRAPPER_TOOLS}; do
>                  test -x ${D}$tool && create_wrapper ${D}$tool \
>                          RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
>                          RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
>
> MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
>                          RPM_NO_CHROOT_FOR_SCRIPTS=1
>          done
> }
>
> This should allow dropping patch 2/3 (the tweak to sign_rpm class) as well.

Thanks for the pointers, I am running the self test with this.


