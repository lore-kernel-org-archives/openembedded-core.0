Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07CE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:08:04 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.13396.1733411282683906633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BK/DDwK4;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so9112671fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733411281; x=1734016081; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgwtx4L1Hy+8r561CiE5vT3HGJ3TBskFpCCk0/SbCj4=;
        b=BK/DDwK4dpf7bUJcQ5oCeFBpZjNqGZPaQIGuef9MStmt8/5DYECo5U1CwP8bE/FFRL
         ZzQ3K3jzI4MKsrmeToqxb5r6xDWId7BC02Gh4tXZ0qcNy0cOqLLjjRI0/kV0/1e+gHPl
         P0xH3GmLxjJG1uNByPdWuDEyq8fc2hddiwbYqZpMILa/+CBZrxDTye6oIltKxD0oRMYh
         zuxUezjcvSityauCV8bkpO+GHb+X6TcelV8rVZmmRZjPZIglJe/DOCbnOkXDYWnlOTY0
         sXH7MNWmtRbEzGtp+HD7CIMlVKIV62Y/kVyQCaxdX/ltM95G7UJjByKRVhQzCOs9Ksju
         yCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411281; x=1734016081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgwtx4L1Hy+8r561CiE5vT3HGJ3TBskFpCCk0/SbCj4=;
        b=Utp1WlF3y405SkoJVf2wpIVt3rTUpoGIokhm2JsPRcwqaJmBkg3uQvP93nOshhvQEz
         heotisUFHqMn+YrjA7iysyGG5543ju0PgChyi93sKlaYX8gGCB3livptutS2Z8dF7Udu
         cqI1bOPeepjnIdzhk5v5peY55INmOnlZHgWMod2yIumeKm2WwzaPz2aicDVtXrb/BKIE
         skRbhgjngibJIuloup7Xyvj0VRPD+4THc14XnNKku/pSmTXA+Aa3yY8i6jJUmAGYfc18
         taPmvDBFMfrVhc6wspgeXTCOU7VJUt6qoECNr4ixBrLp8Ghpby2mLlTyFtMa1tlxy336
         inYA==
X-Gm-Message-State: AOJu0YzpR9NKf0wLaWbxMiac2fZf5FKaiq4WZtH76bZwgxDvAD43p/VX
	jeKg+cN1NMWzr805c45kSqcrYKU0VpoQ7aPOOklUVk/M/m8lyVV/y9Venk49/o49c0pF9QUTRHY
	9VBw=
X-Gm-Gg: ASbGnctbC3p8m8BSbor/GcC1rTyuOGPWKdoMRy5czTKvG/AmRMj2ARdS+VfolTBqqzs
	JS0wEzHCWsWOZDQqkR973x0thmPJExjIM+Sq2J2HtoyjojJx4qdIV9OAaC1nMoJNDiVf1mNvyAL
	yNlf4Ww+Fm9bzpQkgjlu+fN84kBFClxm2xKIO3CbVLRUZy9nCYo1A2VddAEiFwWuM20maGKkMbj
	RxDzAMIbEhA/tUFXvOlNRqrkJ4bXxR2kOp+uHJiLLjx3vCBKoGwe+jm8OH2eud2m9KH5OEbX5W7
	fkg=
X-Google-Smtp-Source: AGHT+IFpaeSfQfHju1OtfqrlK3qe3VdpldmPTE6KvMicDR/peXKlHF4PA8+/0BMpQSG5gPty2neAWA==
X-Received: by 2002:a2e:a90a:0:b0:2fa:cdac:8732 with SMTP id 38308e7fff4ca-30009ce0b00mr81414651fa.30.1733411280785;
        Thu, 05 Dec 2024 07:08:00 -0800 (PST)
Received: from nuoska (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d85356sm2406341fa.15.2024.12.05.07.07.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:07:58 -0800 (PST)
Date: Thu, 5 Dec 2024 17:07:55 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
Message-ID: <Z1HBy3LORw20GLOv@nuoska>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205093237.333818-1-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208382

Hi,

These changes are already in master-next from Alexander Kanavin <alex@linutronix.de>.
Sorry about the noise. I should check email archives and master-next before working
with updates or bug fixes. Maybe even check bugzilla too :)

Cheers,

-Mikko

