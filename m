Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E60F57F344
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 22:08:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 10so369183wmp.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=RupAKNesQALPiCN84eV8ckIxcKr7kAgg/GoRGZ4g87E=;
	b=QbIOlbCp+OoA/UuJ7yekeixme/KP9QG9gBv4dGeEoNEc0+Ulk9T6+N85aUbm8snbwN
	H8wyZkIpkwN8rELYhnBscAe6AXd/cXRPEPLkknWsSubaFW9aOXeLB9ZeA00fIl0rtmuQ
	RiPcb1Z7rDNDVVf7VXaZdyUxzJ/yn3luhfnOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RupAKNesQALPiCN84eV8ckIxcKr7kAgg/GoRGZ4g87E=;
	b=ZsrXoMb78e2v15fCs4FloE/BO8aTD206cZV6YB6gdgIydi5L2iQBQ7t/jbgm/Xtf8E
	AcwudLEneCmvn7zyrfUzU1R4DyvBgWYfYZq7EQyPmX4U4MzulieY0BeDk1Hc4J/DdkP/
	IjGHYvNN9o3W3zl1x/r0UIti153Iqx5pspeMcctF190CAEHELJ5PanV6pD4dlpykTpCP
	mqzt3F1AhGl1URCltkWR4O9g8AqaRRCyVXa4CkRUz4zE3IwzQI37Q8Pi9pP6Ma15Cw/6
	As7OGghc8okWxdNqYoKsODgP8nQbOsxGVRMZzhG5J9iXErmlnIECdbJ0jDR4yKmdl3Ub
	NWug==
X-Gm-Message-State: APjAAAXQOEFhXB3RpzEs6KuJ+IAH9wcGwkp3RNhgGq00PSp1+1zTCpdR
	w3vVYTaDi34TLF+hOjf3ifPsrA==
X-Google-Smtp-Source: APXvYqyTyCfF12X5cO9TBafDxMRRaLEEGPMfup08PTRt13PYw2sPfRHm1+4t/3tR8tP3BtAB5oSjFA==
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr389649wmg.27.1565215709546;
	Wed, 07 Aug 2019 15:08:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	32sm86364286wrh.76.2019.08.07.15.08.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 15:08:28 -0700 (PDT)
Message-ID: <94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 07 Aug 2019 23:08:27 +0100
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Wed, 07 Aug 2019 22:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-07 at 12:29 +0200, Alexander Kanavin wrote:
> Recursive RDEPENDS resolution requires that all of the dependent
> recipes' packaging has completed. There is no mechanism to ensure
> that
> and therefore races were observed.
> 
> This change effectively requires recipes to list their runtime file
> dependencies explicitly rather than have them pulled indirectly.
> This may require a bit of fixing in layers, but should result
> in a better definition of runtime file dependencies.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/insane.bbclass | 18 ------------------
>  1 file changed, 18 deletions(-)

You might want to have a look at 
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/621
and maybe other pieces of that build yet to finish, not sure...

Cheers,

Richard


