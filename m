Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E97EC77122
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:06:18 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so78329239qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 02:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ktniMpw31FOjxpr5ETau9HA9i116rc5JbNE8c9Pp86A=;
	b=GgG11pUdWCSuD/NeCDj/3fHWlsRF1zzVNBMMYVUbDb9bvvmueeJXsCWhT/sj5JukiD
	2G6cSdWUujCy4RGhcIQpctkXd7NCLnUPZ1qOxenCNg5D/wXy74P6hG8Pup1rsqn5WqYp
	iGvVYT61m9YTmNamY6y2DvXQYZW0tK7iN9mkhOnFN8iwBuKenMKFNuVRDLINc1ZZThUU
	Y9JWMMhAMLYUMkeciadcer7H1xOap6lJWTRrXj6CjHrFbTm/gJA8C3Aaz7yCt3jdgrsE
	P2D4EmVWZD+aHtG2jsv0W+zxFqysAztpxFoiiZbu1hZBj4g0BX9By0JpgoVA8gBBG2hl
	LTGA==
X-Gm-Message-State: ALoCoQnIPVASvV9TD6EXUBeNqGuyeBjAK6L2zDzVM3JX4mQxqB5ibVpAJmKNQetjht7reTln8UC3
X-Received: by 10.55.31.232 with SMTP id n101mr34268452qkh.107.1445245578213; 
	Mon, 19 Oct 2015 02:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Mon, 19 Oct 2015 02:05:58 -0700 (PDT)
In-Reply-To: <20151019090300.GC3869@lws-christ>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
	<20151019090300.GC3869@lws-christ>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2015 11:05:58 +0200
Message-ID: <CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
To: Stefan Christ <s.christ@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 19 Oct 2015 09:06:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 11:03 AM, Stefan Christ <s.christ@phytec.de> wrote:
> Hmm, the meaning of the code seems to be non obvious. I just looked at sed
> replacement and concluded that it's about the file name ending.
>
> Using the full path to the dtb file is not supported by the code anyway, e.g.
>
>    DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
>
> would be wrong.
>
> So the correct solution would check both cases
>
>    - full path or only filename and
>    - ending is dts or dtb
>
> Correct?


If you look at the commit that introduced this code, e.g. 72980d5b,
you can see that this code was added to support the 'legacy' case
which was the absolute path of the .dts file, or the new case which is
the .dtb file name. e.g.:

==
    ,----[ Original definition ]
    | KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
    `----

    Becomes:

    ,----[ New definition ]
    | KERNEL_DEVICETREE = "imx6q-sabresd.dtb"
    `----
==

so the '/dts/' was used to detect the legacy case, and print a warning
in that condition.

cheers
nicolas

