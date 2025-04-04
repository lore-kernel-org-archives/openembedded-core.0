Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C19EC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:53:53 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8069.1743764031267026147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DUYn9cyA;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so2095842e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743764029; x=1744368829; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOJNxVFiFa7Q0FP+8+MNTYlipvEgfoyxS3QA3OOA8HQ=;
        b=DUYn9cyAY1b3XxV0axEHwYYuQuDaQcBFznB7UDC0xhRGj8sUkHSASKj3judtVRl2vB
         a5zlrak00Io2sQc9XXkoE9WtF3YbzjLgLA5ciXwj5+fCTQaJ9tHmc98tEE218+uwjGhd
         TiCRtJU/hpXD9kK3TJzz6E6jbvFVXKNYE+mwFeSp+9OTnugEh95xCh8EuCDHiYyyd3fj
         BpL+zHu54WqjzO97brKwjlxElDT2ifBXcsxj7kyjaZHpAb54L5kdvu5Ru20hWy8yf1pO
         NEcYQgG8+1L+Kk9uFlK1DeTvMVYVyf9SIN9MHEnR6sE1whPSiVOv193+xgbJsG3+rtDP
         JZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764029; x=1744368829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOJNxVFiFa7Q0FP+8+MNTYlipvEgfoyxS3QA3OOA8HQ=;
        b=RyeJ9zVICUiAj2b7usGxitORAhz/QVsVeXocaK0jWxYXrLruL3BlzlcssZgGELIt+M
         CXcD8UaL2W9Tw66UbQkL9QE8icQbUKy3U49hpJWLAcZlw6KL9TrFEdcLDBEbj5W0bdPr
         udrwPBAgbvo1AEWGHeRpEmcwiNa25Jae5cN/Uofx7NuPNTwnYUrNMtu8HQQ2XwjyXILK
         93SU1cbyyd6NEI6IdPgkiek132SriTsRBKUZJqWxaF5CRDzWKmytJoRx4s6KJ+RHFUnk
         wAyQl2goBDk9XJw79g4czTySKByavsE74rLFmeloCj9TkIJ3ash+CHTiBSVz9aBcmzRB
         d6yw==
X-Gm-Message-State: AOJu0YxzJkIKcBhkn1dOHmmdYiDwvvg9P4uSELOW9r0n3jt3X7Si65c0
	68jDTa0RJlOvXeY8H2Z+w2A14Uh8zUdJhSqPkfrG5hepTq+5+ysX6EKIrYcij+/SUYzLhZXdbSm
	TC2A=
X-Gm-Gg: ASbGncuybiFi5vDIVvS8MqoVw3sJunY1ylDjlp5EQUJYY7YvLHRZTBWpbSp+BwwR24h
	uq1h1o2I2WW69IrQ7N8yOrCJgMxtBN0JRLmIYtP1ahH/yS2OXXuBlyssZplNa8JjwdnFT1QazsM
	GIFB8GNVjQ1cjY4oCVmzgQKi1Vj2sLppFTAKWRgZq7UuPfAdOrbMhp5ahP8aDDhBN9WcmqicsOQ
	NlSAMknHF8PPyIg1pgbqAGCAIj1HUn1FmHdVv2/s/bK2xhDWLmftFBSAPTnqKqLwqy6/nU/5VbN
	dc1KnNh4ReUe3J7yDLcOwutOYIZON7oAhWdIrwKtADRQTGEohwaib6CxrfZpDyLTX2Y9fZldVcB
	w/zLlP+m12ed5
X-Google-Smtp-Source: AGHT+IHIxqDwTwG/MDLCcyuNNhB1kc1wyxpGhG0F/4w3CPXo+9gJQ0/nxh7eiPiOKnTCdO1NUiREuA==
X-Received: by 2002:a05:6512:e92:b0:549:8d07:ff13 with SMTP id 2adb3069b0e04-54c227ff7f6mr907825e87.51.1743764029210;
        Fri, 04 Apr 2025 03:53:49 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635b29sm409356e87.135.2025.04.04.03.53.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:53:48 -0700 (PDT)
Date: Fri, 4 Apr 2025 13:53:47 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: AUTOREV with SRCREV_module? (Re: [OE-core] [PATCH] u-boot: set git
 repo branch with SRCBRANCH)
Message-ID: <Z--6O076mTdeC9JX@nuoska>
References: <18330E36E620F155.22125@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18330E36E620F155.22125@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 10:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214340

Hi,

poky-bleeding.bbclass only changes main SRCREV to AUTOREV
but not SRCREV_module etc variables.

How could support for setting all SRCREV_module variables
be implemented?

I tried to grep for some clues how to get all SRCREV_*
variables and change them, but didn't find any.
I think this should be rather simple.

Code only needs to find all SRCREV_* variables
and change them to AUTOREV. I'm missing something to
find examples of this...

Cheers,

-Mikko

