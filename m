Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98FA9771F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:26:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a6so14133632wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Pcnf12epIdlqEgKbvLIE1GO2sd58VpFAR5EZRszE79o=;
	b=Cllg+MsEhYJBXnRN1L2E52/uFXq1WOVCUbxsTB19KC862kMcG7awwMK/KFBLreSp1W
	cdNIf+TslBP7kagr16UJDxVceGnORz8C5paB/HMs8VAnW8CeJqRQXjv3iZtPIoHmGtz1
	EX1xQfssMi5Xp8t/88pW3pQvQdGFcyTvJgIr4JikYIzrh6tenUh7RGkoARg1xS6KRSKx
	yF5cFddhH/F6u+GZTZk0/Ejna8xYGI+5JU5yUd1pP5exX/u5652RnnIpkiN/IzjrOjh8
	6ANz6oGcfm+SUq/ZELp7NluVT7JyI6uRgMCwICeNH6GFWaTAmbH60p4c8zHZAZ2kmA3s
	vIqw==
X-Gm-Message-State: AE9vXwMbs9sSvb8yRRswDaoK5U2zDf9U+mRyq5ATgSiGlqFg9N1gDti9AMhSMMQI9l3Wuw==
X-Received: by 10.194.112.233 with SMTP id it9mr15165593wjb.176.1473693989772; 
	Mon, 12 Sep 2016 08:26:29 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a18sm764350wma.5.2016.09.12.08.26.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 08:26:29 -0700 (PDT)
Message-ID: <1473693988.22823.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 16:26:28 +0100
In-Reply-To: <20160905083442.27787-1-git@andred.net>
References: <20160905083442.27787-1-git@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] image.bbclass: do not check size of the debugfs image
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
X-List-Received-Date: Mon, 12 Sep 2016 15:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Mo, 2016-09-05 at 09:34 +0100, André Draszik wrote:
> The debugfs is supposed to be used in addition to the
> normal image for debugging purposes, it doesn't make
> sense to artificially limit its maximum size.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/image.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 07bd2d6..cb7d06d 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -538,6 +538,12 @@ def get_rootfs_size(d):
>      base_size += rootfs_alignment - 1
>      base_size -= base_size % rootfs_alignment
>  
> +    # Do not check image size of the debugfs image. This is not supposed
> +    # to be deployed, etc. so it doesn't make sense to limit the size
> +    # of the debug.
> +    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") == "true":
> +        return base_size
> +
>      # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
>      if rootfs_maxsize:
>          rootfs_maxsize_int = int(rootfs_maxsize)

