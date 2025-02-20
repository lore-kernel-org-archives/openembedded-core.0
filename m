Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B17C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 15:33:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.52422.1740065599047127759
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 07:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=csbufKnO;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f6475f747so451616f8f.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740065597; x=1740670397; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Cewy+h3jxEXG5HTkGCZeEEp5v/srLCjnj28mMH8Nsc=;
        b=csbufKnOv3jxqVh8iFxsJOSEIKN2uMEdCtOIpeEZJtFJNLPXOx/QvX0hpahO9YNN/C
         muObFHLta/d9+E7/F/sSK/cdeq7iLN4ySyjvtqgII/XM1SAbpyir1nYd1IkHyMfUvPmr
         1ehQUnCn8NJaUY6vmoFtzk3hOfrbF+k3jWDyjbKAUiap4oE/2j+Q416Yg80KBSGi+4Eb
         1jhv88Y57wUFWpUSGBx9IbhL6FKBdCmddyxP15cjxzUQkkiVRVWvsC78LHn2KMkFKWHS
         YkNedUNU5BWF60WNLDmp+R3oJ87+yhXojZE+aPKGIn3nXMyo9FcrPKDZf7+U+OnmGRWo
         OLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065597; x=1740670397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cewy+h3jxEXG5HTkGCZeEEp5v/srLCjnj28mMH8Nsc=;
        b=vv4nTQFrVv84+Xw/NFCIJL8IMKiqv395cfg2DjEUi5maxb/RcEER5a4cuY2ffqyvi4
         o4WnQpVGVz7/6cC49wll5C4epjQt18asYRayoTRLcHzSJ/sgq5mPlTTl8XKkkMUe0hM2
         m0ikvQ8PVuHAw6n88kKG32s9cuGX8ktx6VEMSyxLkNj7hKNPrDMFelyPSuVuzTX8yyCD
         3K/zvF1+Sb5e2Iixia3RO5lEQOy2rk3LXA3tlxZ3xT3EIoBCiokfV+xyV/NxIonLfFKP
         LexZSS/Dfv0xJGmeOzByklFz+AWfzgFXJ0HIJTwUOh7cwPb9JVh5B7omuXoi3sAqCyln
         QhxQ==
X-Gm-Message-State: AOJu0YzyvDNwcpk+dk4anleqnmSpJW8+EGbHzR9U4jSiLGxcQlK1cBHF
	Nw66mdpJmRIO4CdYc7uOqWO61huTxEOPPUwXEQkQdPWSPXAl19Ct
X-Gm-Gg: ASbGncs3n7l7fLyujAJZbKNZCYQ2fPUTd25CK5yW59prwrRIISgqatsHDWKb0DnOZ3j
	AW3J1OuZzKA51LVall0QMVWlH0rFsoDy8/riGdHgqMu+Jt5YESIxiEvsFX4g1wkWs1ECE19Jh/F
	3e0HU0khzLx9JxlJqrY7Sv0xwnHub5PQdCOs15MbSUieW1iNWZjlbDhMXJlujP4trYTTWii2lEu
	KWfGv+lpJpa8EperhkaVsbw031H8H0MDlsmUf878OW+cn4o82dPOvOwM9UzxCHjlYKikX5tdbEu
	1EZOQWamq6/+eYKFZNFXuxHAIw==
X-Google-Smtp-Source: AGHT+IGDR+5AKUjWMnYVak4A1u0xQ8ZbzkabT46sEK6KSiHlDy3XlKpIaWZs0ysVHAn95IKuHWKIVA==
X-Received: by 2002:a5d:59a3:0:b0:38f:394f:d83 with SMTP id ffacd0b85a97d-38f6515f4ecmr3252126f8f.48.1740065596729;
        Thu, 20 Feb 2025 07:33:16 -0800 (PST)
Received: from [10.54.9.251] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm21342154f8f.64.2025.02.20.07.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:33:15 -0800 (PST)
Message-ID: <020e4b3e-e483-4ed0-94db-5ee1d45bdb4e@gmail.com>
Date: Thu, 20 Feb 2025 16:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: Ross Burton <Ross.Burton@arm.com>
Cc: "Openembedded-core@lists.openembedded.org"
 <Openembedded-core@lists.openembedded.org>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 15:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211765

Isn't is supposed to be created on first boot?

Slava

On 20.02.2025 15:07, Ross Burton wrote:
> On 19 Feb 2025, at 10:39, Vyacheslav Yurkov via lists.openembedded.org <uvv.mail=gmail.com@lists.openembedded.org> wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> Instead of the python re-implementation build the actual systemctl from
>> the systemd source tree. The python script was used when systemd didn't
>> provide an option to build individual executables. It is possible in the
>> meantime, so instead of always adapting the script when there's a new
>> functionality, we simply use upstream implementation.
> If I compare an image built with master and this, there’s one notable change in the file list:
>
> Changes to images/qemuarm64/glibc/core-image-full-cmdline (files-in-image.txt):
>    /etc/machine-id was removed
>
> The good news is that apart from that the final images are identical, but that change wasn’t expected.
>
> Ross


