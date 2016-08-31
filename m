Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDF760746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 08:54:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so6537747wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 01:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Oec80GvLGSI9btgOJFx8WDSezozLkYvjftbgx/GKAEo=;
	b=l1BDfbQyM5fBJ2IC8Kkc8483iKfsoKmu1gIlaEzrTz2JquNWpGdPoaRmbrSDKPFfbu
	mGAk5Cx+f/e1NL6uX5Jhs8Bbb+1qcgrrZTaFWgC1x6w8zfrTiqI+nkH8aXkkK+7zqAgM
	5IiVh6D73W96bbmcJ/e/y6ZBBqKyU/BYL6EGpH2AMVqVZyTKP/zpS6G5EvDXwJXFQ+h4
	k2jeQmRm2b6Ie56FgGBI3+CAegp4tKiU1P3GZcjkPYmvQr+qlRFdsxJhquRS5TIhCJPR
	ebtAwaSr6dwI96LOZYoDLj6L7ckfhg7/UskXforwdc8+YJyq7g6yKW92JlEwM0bD31sN
	Y3Xw==
X-Gm-Message-State: AE9vXwNG0/KZKwq57V9t3N83bdKuiWwApY9Nx0MGc7ADJtxCGANkcdmiwQrU/T9HAF0e9w==
X-Received: by 10.194.96.2 with SMTP id do2mr7915282wjb.174.1472633652725;
	Wed, 31 Aug 2016 01:54:12 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id d62sm7863927wmd.7.2016.08.31.01.54.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 01:54:11 -0700 (PDT)
Message-ID: <1472633650.12967.15.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 09:54:10 +0100
In-Reply-To: <78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
	<1472566766.8449.29.camel@andred.net>
	<78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
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
X-List-Received-Date: Wed, 31 Aug 2016 08:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Di, 2016-08-30 at 14:35 -0400, Bruce Ashfield wrote:
> Can you clarify for me if you are are using SRC_URI items tagged with
> 'kmeta', i.e. a directory of fragments, or are you just adding .cfg/.scc
> items directly to the SRC_URI ?

I do both:

in the 1st layer, my kernel recipe boils down to:

SRC_URI = "\
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;nocheckout=1;branch=${KBRANCH} \
    file://0001-a-patch.patch \
    file://kernel-meta;type=kmeta;destsuffix=${KMETA} \
"

KERNEL_FEATURES_append = " patches/some-patches.scc"
KERNEL_FEATURES_append = " patches/more-patches.scc"
KERNEL_FEATURES_append = " patches/even-more-patches.scc"

some of the above in turn include additional .scc items recursively.


In the 2nd layer, my .bbappend boils down to:

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-4.4:"

KERNEL_FEATURES_append_tgm = " patches/tgm.scc"

2nd-layer.scc is located in ${THISDIR}/kernel-meta/patches/ in the 2nd
layer. I don't specifically add another SRC_URI item tagged with 'kmeta' (or
any other explicit SRC_URI item for that matter).


Andre'


