Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC2161B29
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 22:14:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f7so15983450wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=69b7szO+sekmlRsSV3lUwPKNLF7P3pxF41ssq+Cc/NQ=;
	b=PQZNUb/FaBwwnx+Zm4a/+0MObkX376gaJta83fNXGeG9YcQ2SwFOJhI505U057VK3T
	LzoriGi3EzVGJj6ISy/uzCtVNBI+mhelVNVvHZIL9CkSPqDMy4csbDm7BL1XTq31hJ3o
	DTqoWsGYKBrde1nJ58FXYiJGZmH5pI/HfwbBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=69b7szO+sekmlRsSV3lUwPKNLF7P3pxF41ssq+Cc/NQ=;
	b=kUU329qJuZZc/2zC7f/QhzzvaVkjdTNtE56d2Ig8nh4Llgyjwn8fo9PfVu8LUG06I3
	2Ux2mzczPoFkXYjkjsAWT5XaQd+nV5jG6UpmbS79VOky5J/BcJla7oPzbbrfpzKiNwfR
	8jZtyIhGPJGc1qErukGPxz8bcY1O7yAuf34w+64z1aa8HGd6W6b7Qy/WBG43XBwv9v/2
	4y1oH8N++Ja5UDSPbNWtqTy0wY/DHVkN1hCUYK+UkOzy2RiO2/bPGLwLkWZP7tNP7wJY
	NoOuCLdLo7T0L9N9T4oxcrQP5ODXLbcN7zoQQXUeE/seTpe8IRXcp5ttGKyuv6GnKrRf
	A5sA==
X-Gm-Message-State: ANhLgQ04CrSihc2zNGf+JwJ1etAoSfKcmqtSA0ZUpb6q+REl3+0Ia90s
	j4tdt3ayZKVK5fyaOv4VPkSazg==
X-Google-Smtp-Source: ADFU+vvlk7SCW/DfUkAk42qq+VrVasUSgW/8ppwouRapVULhrC+Fuia1ilxCMklaCE7h8deZNeBVkQ==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr24033038wmk.18.1584310447681; 
	Sun, 15 Mar 2020 15:14:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm25670687wmj.38.2020.03.15.15.14.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 15:14:07 -0700 (PDT)
Message-ID: <cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 22:14:06 +0000
In-Reply-To: <20200315042947.3257882-1-raj.khem@gmail.com>
References: <20200315042947.3257882-1-raj.khem@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 22:14:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:
> In some cases, we run into parallel build failures where
> BUILT_SOURCES
> is skipped, as a result required header files are not generated and
> the
> build fails with missing header errors like
> 
> ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
> No such file or directory
>  #include "uniwidth.h"
>           ^~~~~~~~~~~~
> compilation terminated.
> 
> BUILT_SOURCES should be built automatically with `make all` [1]
> therefore
> ensure that make is invoked with `all` target
> 
> bison-native parallel build fails when -l<n> is passed globally from
> build environment, errors like below due to race starts to show up
> 
> Therefore removes a previous load limit if set
> 
> [1] 
> https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example

I'm not sure I understand this. We've seen a failure on our ubuntu1604
performance tester which I think is the same bug as this. The
environment on that machine doesn't change, so how/where is this -l
option coming from?

I suspect there is some issue we're not quite getting to still :(

Cheers,

Richard


