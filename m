Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5553FCCA462
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 22:28:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9656.1792103318239594571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 15:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GBQxo+d6;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so36168575e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792103316; x=1792708116; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF+7taWCpsC2S9m/s5L/irM2X7Ft7l/dUfXeJulnoiQ=;
        b=GBQxo+d60df0R4yuDTJAhLVgx/kwpj5ySQHB9GnuMidTCb4ZyQ9rG/pV9Xlpi1NDLX
         NWXZOM4U3FYWBXylNUdaTduNJ1Cfvm6HGLEtN+RHabZxhXTRJCLKyCjyt6k8W1SQ7hzF
         daygFE7x0MxeCh5kE64bhn3zXR9PEr8rM814g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103316; x=1792708116;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF+7taWCpsC2S9m/s5L/irM2X7Ft7l/dUfXeJulnoiQ=;
        b=OMQCFySH9H0kc/09xSYk4vGzaP2fmpMN0aFQNT87A6nDi/HW2eScYOI3N4n6cjQ4ox
         /x7evz6J5iCQkSSufybtJOoFUPNGGtXG8OVbFaDodvd/zkVhfNtnOlS94GgsuBsO6nGz
         YySILUgu30lSag/J0Thp53ibq3lz8RSD9ad11DN/+VfVbh5bKIY8UT7+qblzyQ7w4FH9
         8W+kr4WnOezGmMUmOvv0kHlPbUxr1f6HI/HaHfIB5WlMnnRFfC3n+7UjdCCbcpyVupGU
         J2cbDoMGKq42fCU5mLWEkmiQgG1/fo6CoGg0+FeZBC7+DW9GscTcmixrtnCELRgQdbVI
         bODQ==
X-Forwarded-Encrypted: i=1; AKwUvByuE3lpa9T8U8hJrq9FST/WERzDVPO+RL0LA2w+hq5y8/nz6qtmPyFSv10p475xRD0MVUrQi+gYd+a6KkjDwwoQ1A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKXN4UCWRT3+/hDqs9aUvgvkTlxbc9KWimlY52rtKm+ntUgVGac
	NWAiNjhl1aCoOTICM/XJk7C97/Es+Vss/Q8UQ4AqdhKwupP0sJpRRYfWLKZ8l8KVX4U=
X-Gm-Gg: AYBFou19DATk4Zn0MfzHzaUIc9hZs5nGzxV8+lwkyJI4LbGe6xGRS2bHn7/rmRyPbyS
	wpAlHn7LfSJJrd4JStStKscmE3sY3h84qnRyzc/deW+a3eTQXi3vIO9Bn/RobKkoegqhRYn6opm
	RCz3fT/9mETVEXceRHa+YWkAVSDfwg8ZAWYpI8mI0p40pn2lCcesv933dqKefFzuwSGPfBxLpnR
	dITzSYy0zsNM/NQQ/VOefzX/uX0Ih6WtSW7iHC6YlwehqN6MztWl2AltCQSV7YYmioSdGkrJPss
	zEJ/4+3cMnz7t/8MJunGuGxAarqEmR3MzZ9P0s7PuRENYvmr01LxXpnC1eANcEAiKt+n4YdEhZt
	yp/LGv04unYu3DkT/DQVF+90lVR9HSrja76z4SG4KdSWppyxQnUiSd87G5IdnAaWGMOEEaTYo8W
	7XiidFor0oldiWMmOkOshAYfbqOPuSai6ih0dR8Cfaysh/QZXSxLP8VHVtTgC3wWdq9yRwYAPSp
	vu8G0Vq1xstL0rqH1edl7tQJ9w/T68kj2Q1c2XN97Tgow5iXajCqBZojXIYrL+xFbRU4bPF
X-Received: by 2002:a05:600c:3f18:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a18e4cedfcmr387994465e9.33.1792103316231;
        Thu, 15 Oct 2026 15:28:36 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c0894sm798635f8f.12.2026.10.15.15.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 15:28:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:28:32 +0200
Message-Id: <DM5RLSG71QPZ.P6T1LH6RPAI9@smile.fr>
Cc: "Akash Hadke" <Akash.Hadke@bmwtechworks.in>
To: <UpStream_IP-AH@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv2] systemd: backport networkd route
 readiness fix from upstream
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261009102805.83893-1-UpStream_IP-AH@bmwtechworks.in>
In-Reply-To: <20261009102805.83893-1-UpStream_IP-AH@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 22:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247902

Hello,

On Fri Oct 9, 2026 at 12:28 PM CEST, Akash Hadke via lists.openembedded.org=
 wrote:
> From: Akash Hadke <Akash.Hadke@bmwtechworks.in>
>
> Backport upstream systemd PR #41000 to v255.22 to fix route handling
> in systemd-networkd when routes are configured on links that are not
> yet up.
>
> In 255.21, networkd only checks link readiness when configuring
> explicit nexthops. Routes using an implicit nexthop can therefore
> be processed while the bound link is still down, which breaks setups
> using ConfigureWithoutCarrier=3D and BindCarrier=3D. One visible symptom
> is that static multicast routes are not installed until much later,
> or are missed entirely, even though the address configuration succeeds.
>
> The upstream fix makes the readiness checks consistent by introducing
> a common link_is_up() helper, limiting gateway readiness checks to
> nexthops that are actually bound to a link, and moving the
> "link must be up" check into the shared gateway readiness path so both
> explicit and implicit nexthops follow the same logic. Upstream also
> adds a regression test for issue #40106.
>
> This backport is needed to keep route configuration reliable on
> carrier-dependent interfaces in our 255.22-based systemd.
>
> Ref: https://github.com/systemd/systemd/pull/41000
> https://github.com/systemd/systemd/issues/40106
>
> Tested:
> - Built core-image-minimal with INIT_MANAGER =3D "systemd" on qemux86-64.
> - Verified functional test case in QEMU:
>   * Setup dummy parent (carrier off) and VLAN child with BindCarrier=3D.
>   * Verified multicast route remains deferred while carrier is down.
>   * Verified multicast route installs immediately upon carrier up.
>   * Verified clean route recovery across carrier toggles.
>
> Signed-off-by: Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
> Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
> ---
>  ...introduce-link_is_up-helper-function.patch | 167 ++++++++++++++++++
>  ...-gateway-is-ready-only-when-the-next.patch |  74 ++++++++
>  ...und-to-a-link-requires-the-link-is-u.patch |  59 +++++++
>  ...etwork-add-test-case-for-issue-40106.patch | 120 +++++++++++++
>  meta/recipes-core/systemd/systemd_255.22.bb   |   4 +
>  5 files changed, 424 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-network-introd=
uce-link_is_up-helper-function.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0024-network-check-=
if-gateway-is-ready-only-when-the-next.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-network-route-=
bound-to-a-link-requires-the-link-is-u.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-test-network-a=
dd-test-case-for-issue-40106.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-network-introduce-lin=
k_is_up-helper-function.patch b/meta/recipes-core/systemd/systemd/0023-netw=
ork-introduce-link_is_up-helper-function.patch
> new file mode 100644
> index 0000000000..45f2733b50
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-network-introduce-link_is_up=
-helper-function.patch
> @@ -0,0 +1,167 @@
> +From ec4f646759d6625bbafcd4ce67224fb63b99a96c Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 9 Mar 2026 10:57:06 +0900
> +Subject: [PATCH] network: introduce link_is_up() helper function
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41000=
/commits/ec4f646759d6625bbafcd4ce67224fb63b99a96c]
> +Comment: Patch is refreshed based on the 255.22 codebase
> +Did not pick changes from the below files as it is not matches to our co=
de base.
> +src/network/netdev/bond.c
> +src/network/networkd-route.c
> +
> +Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
> +---
> + src/network/networkd-link.c    | 21 +++++++++++----------
> + src/network/networkd-link.h    |  1 +
> + src/network/networkd-nexthop.c |  2 +-
> + src/network/networkd-setlink.c |  9 ++++-----
> + 4 files changed, 17 insertions(+), 16 deletions(-)

After some thoughts, this patch looks too intrusive "just" to add the
link_is_up() function that is just a flag check.
I know I usually ask to use upstream as much as possible but here, I
think it make sense to port the relevant code without the link_is_up()
function addition (and keep the inlined flag check).

Note: it matters less now but I prefer plain /commit/ URLs instead of the
one from the pull request:
https://github.com/systemd/systemd/commit/ec4f646759d6625bbafcd4ce67224fb63=
b99a96c

Thanks!
--=20
Yoann Congal
Smile ECS


