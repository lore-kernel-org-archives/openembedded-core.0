Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B257FE69164
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:52:14 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87368.1766433129730073183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AEayJx4H;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f4b23c23ccso38324351cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766433129; x=1767037929; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21vwS115UVrBPFViZfJBitmQSweiuXc/deNJXBYdd4k=;
        b=AEayJx4H5PriGT6kvOgsdGi5SEu4RYtlXxNE3022MPZJe2+mYzvI2ZuvmtMdK4Krj4
         dxtVOG0kdYZ1VnwU9IKkBMU2h08uUKQVYzXJWTcXbioF2QAiomo9+Vrv7QpuLoeazsoE
         zZ0IGa9kDumv8Mt9dB5rFE8yhahq7dVjW1z03h8FzGaSc3WPbwgOV/AtC6BHB0c582c2
         FN9WXd6pCYIX0Py7bbRce0KGKqvLDUgt+TAocchHyaX6R/cVmZRngTnrpSEUanzFq1Y/
         G8USB87UQUtgkVZbFeUzqNTJ9Vwf2EhR9Pd56JXp+bK0RBA1bxfJCjOtCpVf7UIflcqN
         v3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433129; x=1767037929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21vwS115UVrBPFViZfJBitmQSweiuXc/deNJXBYdd4k=;
        b=UK7MIXiJNPkOHCI32uLd6isRX/eeTkj7hbnjwSQwbMlxFU3/8v3YTDb3t6ZY5vuj7E
         OwcBz3V8gxBdNCBjmBbnZ+Lbkm0PmSHSWmIjkTZHAJ+8F5bGex7efHmmfJNCX4cjBnZY
         wEL4hAM6O11FiC6/6ZwPjolgJfIkgOvp5jds0fEdx52FmoLqDpxtwm69XJdKzuehXTwG
         oFa+H8haVCzJaTrVTAIBsiR7RPlve7GGdAJ2SkluzU30idXRFgZf9cTixHWHQWoKPNH/
         kDPSbmjq+dkb6la7pKRNsfLBYXWYU6o7ZlV9u3eTkMtAQbZW84xDbIZQVhccsDB4fyI7
         70mA==
X-Forwarded-Encrypted: i=1; AJvYcCXq5V1YywRmU1Wq0ZYGH7Aqa/qP+paiE2JUBPgyi7MqBni1PgwsFVJAO9ereB7SJVnRlEKTma1ctMjg/Dt0x/q0AA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+Oy9vmOmOidg8EFKc3Xa8RC1hPXKj9vEkpNS9e4hqiYSNYdBz
	33k2/v1Me+L2+vudonuQy6SYwrdgpe/XNncKIQ4UIYbsn3MQxhP3V1FiluEsqZi91LQ=
X-Gm-Gg: AY/fxX7tyq/4cufDt67VxAsJFohPiWXcpSlpCZTjyyP4zNzoiOxw20Ur4ogSay53x4t
	0sbK39UBU7ABssIeDlucdNGbdJZ2RkSaxHmf8XHerJSwTVN7cRho1cMps7Eq/RSkyPu8LGgsJGG
	/drXcLQxO8F+T+kplIJzNiOIbeilX1IyYtrniuFK4ZyF7wkwtEglVesiLbFV+Un0XkSb9yDxo1s
	uUbVp9SJ+5rWdzWiQAPEocpDPLXnWf8b2kKIB3P7omImV6RrL24oa7rsj/IJNjZoVdBIUBmOCpF
	LfRvbJyGCNksthXn3g5N0uSfw1AJulVj6C9/9O/KZ5HX8t5fBVleVyyt4UCys3a1gK2NCJsu/PB
	eQydCDMeqi5LgD/h/QSnSNbijxHJtO9D/pQZP/MFepsOF77v6cgTsGOfBTHCCOzuafqVzGMyOv8
	PLUDpnh9oNh1wfMT91WxAGoGNp5JZh7i+xxS8WZ9FKNWZRHHlf3LJyE8XYcuon10b1
X-Google-Smtp-Source: AGHT+IGYHfg0j60dn9ETxBOOZHYN3XNX5SGi1IeUZeJ0DvbBSM70/La8O9kCgq0FzOj/7pIJcv1xvQ==
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr193588461cf.51.1766433128588;
        Mon, 22 Dec 2025 11:52:08 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dc1esm86933156d6.39.2025.12.22.11.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 11:52:07 -0800 (PST)
Message-ID: <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com>
Date: Mon, 22 Dec 2025 14:52:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>,
 Tim Orling <tim.orling@konsulko.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
 <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
 <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 19:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228324


On 2025-12-22 14:33, Alexander Kanavin wrote:
> On Mon, 22 Dec 2025 at 19:36, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>>> Testing 'maturin develop' requires Rust cross-canadian in the SDK
>>> Traceback (most recent call last):
>>>     File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_python
>>>       self.assertIn(expected, output)
>>>       ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
>>> AssertionError: '3.14 at /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3' not found in '🐍 1 python interpreter found:\n - CPython 3.13 at /srv/pokybuild/yocto-worker/qemux86/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.13\n'
>>> ...
>>> RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.57s)
>> I'm not sure how to address this one - it looks like the problem is that
>> the buildtools tarball has a 3.13.4 binary in it (at least when I try
>> locally). Where does that get updated?
> I think the problem is not in the buildtools. This is the test:
>
>      def test_maturin_list_python(self):
>          out = self._run(r"""python3 -c 'import sys;
> print(f"{sys.executable}\n{sys.version_info.major}.{sys.version_info.minor}")'""")
>          executable, version = out.splitlines()
>
>          output = self._run("maturin list-python")
>          # The output looks like this:
>          # - CPython 3.13 at /usr/bin/python3
>          # We don't want to assume CPython so just check for the
> version and path.
>          expected = f"{version} at {executable}"
>          self.assertIn(expected, output)
>
> So first 'python3' executable from the SDK reports its version (which
> says 3.14 as it should be). Then 'maturin list-python' runs, and for
> some reason it falls through to (or is executed with) earlier python3
> from the buildtools on the host, which doesn't seem correct, as
> maturin should be run by python3 from the SDK, and report that.
Maybe. I tried all of this locally (on a F43 system, which includes 
3.14.2 as of writing), and after I sourced the pokysdk script, the 
interpreter on my path changed to version 3.13.4. Seems that the 
install-buildtools script is (at least for me) resulting in a 3.13.4 
version is getting pulled in. I'd think maybe something got contaminated 
somehow from my cache, but there'd be newer 3.13.x versions for it to 
grab if that were the case.
>
> I also wonder why this hasn't been seen previously, as build hosts
> have all kinds of python versions installed. CC Ross, Tim.
>
> Alex

