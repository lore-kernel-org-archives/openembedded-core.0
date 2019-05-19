Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4D7C7CF8D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 10:10:26 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n14so10510860otk.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xnOX7mmo1dRY9GkAcqA3eko6xY22cWLW9Mo9L6jV21s=;
	b=bSISs5pXLkA6D8CTsTO+nGVLr0iSrCOlGSwh0Ee6n6G+OA+dkNqjBnlkvLzJWt3w92
	UdTlQRebLmvNpW3++/ylCNsihzHk022rF5cN5MMJpEDSGE4QSeShUZg/PUcICR+QonET
	WhfhKe0CkZKB6RleCllu477/q1qKWzD4lezuWe+doRplavIUuMhonroTCF/mHvxWXKjU
	MjyKnoHJ0WEeIF2+Fh7LF1DcxMOS1PDT7OWaL1cVRkdrlQ7jCXUdhLOq/4nbTdSvPfOR
	mZoiv1+i++Mjlvgs3LBoQERz1u14bfYCkUBORB3vFaf3N79WOCHaPuI2z2zw1n4dVvLE
	4O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xnOX7mmo1dRY9GkAcqA3eko6xY22cWLW9Mo9L6jV21s=;
	b=GWBgN11Rytclxp4QJwYH0anJ/qlCWw1Jr6dErgMNVxfA+4OKVB7Uq1gkxLxa3d5+8A
	1odXraMXzRgkGgRd2Xea0pVtuczFFUyG7l0DECtSaOOqX0Vnwf5wsJX/R7mZD0UVJoKZ
	XklCk6kUFcUqupYCEH9gAGXAoPwn3idY6giFYUsR5VLSemk8gRMglf+c13BlJOHz5PrC
	hO2PJr5bfzQfN6D9WKv/EdQpPvoi7bA0IT7rHcEgo7r9Git/l8JVyo05ugHHvGltpVBa
	fPkUf4RSR728az6WK10akHYVR69otyqlg00ls0zCe9gMED0u9nxow5aJDHq6BZfmzYiR
	9nWg==
X-Gm-Message-State: APjAAAXJJfVosoJh7N3VsY2t797dUP3P7ROvcREdDM6Mn2aKa6x1XA1F
	0bxlJyHk+ORWoMXdt1FiBUTsfTPfwTDUN/4uDNQ=
X-Google-Smtp-Source: APXvYqyMMF1b3FGYyjb6KD4Xmx+MSwPHEikY/WNGs+p/uttvE6dtjufoxFM3TQ+wTqEbi6qVxAo5V4jh2xcF59kKq70=
X-Received: by 2002:a9d:694a:: with SMTP id p10mr18011434oto.61.1558260627871; 
	Sun, 19 May 2019 03:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <1558242037-162349-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1558242037-162349-1-git-send-email-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 19 May 2019 12:10:16 +0200
Message-ID: <CANNYZj-oX0Diqsz9cuezEE6CdJwPrtuQz4uD_O2p31LgCPaYZQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: fix compiling failure with `-fvisibility=default'
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
X-List-Received-Date: Sun, 19 May 2019 10:10:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 May 2019 at 07:01, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +Extern global variable `util_cpu_caps' to multiple C source files is
> +not a good habit, it caused linking failure when making a shard object
> +in some cross compiling circumstance
> +...
> +|ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
> +R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
> +when making a shared object
> +|ld: final link failed: bad value
> +...
> +
> +Covert global variable to static and assign it only in one C source file,
> +provide get function for other C source files
> +
> +Upstream-Status: Submitted [virglrenderer-devel@lists.freedesktop.org]

I do not actually see the submission here:
https://lists.freedesktop.org/archives/virglrenderer-devel/2019-May/date.html

I think the patch should be submitted as a merge request here:
https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests

and I would rather wait for upstream to accept it, and then take it in
oe-core as a backport.

Alex

