Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8EDCA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 08:56:24 +0000 (UTC)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6847.1790844976113934919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oHF7QkPS;
 spf=pass (domain: smile.fr, ip: 74.125.225.97, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so91883f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790844974; x=1791449774; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lH9rgFG4DQLyukPYYkgTYR3IjxQcqZnhC3De4VH1h58=;
        b=oHF7QkPSc4xHSCpp5/0e3y8Q9G54Q/YGo0ia2mhUTnVM/qcxSFF7gaLgxbMg4CICs7
         FLLDTyOjBhEsLNTnckRXYqRd7ytY7JNJR1W2EHx2FMfKuXcF9ATY6VWIJxh0efVAHcZx
         dUT4tLOgKlSYT+l5idoyHZTKrQHuSxw5X1qEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844974; x=1791449774;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lH9rgFG4DQLyukPYYkgTYR3IjxQcqZnhC3De4VH1h58=;
        b=B33V9OR15KoCW4U7Oy9vvwpbp7zHTaLXwiOa3y4towtvHzFjvB/1oSgRASGmqJHZUU
         6nMpy7DJIacCJ4qRRHdEf3jpr7k0b+qc+sFFbqUxrrAJD5s4mez7H9A6BeOp3UYquQHw
         NTqkbOTiG0Oqd4LTpVKuVCy1hn9TPXiKSzttf5AOnwVmcmgwmzgCxGw2M3F0OJi4QfT/
         cVfvuzZolhJs2HCePKq7TEfjGHWi/BBCZpi9Ki5L3eLn++AxU66H7suNkqNS2r5EyYeT
         1fMUAaPJbW7XB1211Tp03uhTQXEjlSQ8YLpf4PsOSqxdiius8QKmA2ZBE9joJkBqudyd
         vJIg==
X-Forwarded-Encrypted: i=1; AKwUvBzfWMqfFdJLhHkTvDz/EwBPMgKPxKX8j/3dphxMT2bJ9v/6q9ipxc/KKci+QiuaQTzsFvdAogaGf+Z3HwLq6oNdzg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL+KINBSaGIR3WRM1ksbumuHdITe7ROa7yLJn4Z/IhlkTZOwPIT
	HthYlsMY2CBLwgXlrBkpbcDWymn8uvoIit6gXabGfZeSxpTPRA6F90HZjI9tdhk//hQ=
X-Gm-Gg: AYBFou2BMPwxATD2XZnczihP8p3u+UR/lUd2zdwmF9DM0WZJQtRnyESIn194Bs5Ntpg
	KRlk3TN9JblxsXbLa33gzBX9pwJXwTxkpjN0Gty9oVteSoGnrJwnZHzZiTs4LdEP0F8YEvjd+VU
	fG2wLMYfKGr7KzhFPVpN4BuQX9HaYTCQolwMddNe9H1oTtr/9jTd9CqGDkI1EoPNcv/GLRo+C76
	9a+PNdmbKbWA31LWO6zKWJhSQNmVNN5BVBXGQg7+IFJNuIzSYXfsASSvFSm2K+DPQxqFsrfaH06
	lbjECryOTJEm3fkKDrbQyQnh094YGC3xbvRp4N6A/Hr21qK54l35Fc5e6JQ7a/KBtPT5R5pBpNL
	aTtYQpJQhYHXnTleqiddvMq/+DvJ1fnt94DW4+FOyYC+5AlDoVN+xhRIZic8TmZADw37tETsRGr
	lN5FYMLuRjuCLRXwS0cYtHPP3752i/SudgcLuJ8JchrVTe3KqNAq26y97YI0inDwY2ISqmSeGto
	jFlUMzvAWT/9Dp0gnGM2tD+iHIFoCT5WalLQ1W2E/9YEAhGyyAejOHNcUkXFQ==
X-Received: by 2002:a05:6000:2dc6:b0:487:40d:af33 with SMTP id ffacd0b85a97d-48b024d9344mr7586262f8f.13.1790844974188;
        Thu, 01 Oct 2026 01:56:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6ddfesm1679535f8f.42.2026.10.01.01.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:56:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 10:56:13 +0200
Message-Id: <DLTDK77A5H5I.3FK6SS623IM46@smile.fr>
Cc: "Akash Hadke" <Akash.Hadke@bmwtechworks.in>
To: <UpStream_IP-AH@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: backport networkd route
 readiness fix from upstream
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260923083914.712852-1-UpStream_IP-AH@bmwtechworks.in>
In-Reply-To: <20260923083914.712852-1-UpStream_IP-AH@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247017

Hello,

On Wed Sep 23, 2026 at 10:39 AM CEST, Akash Hadke via lists.openembedded.or=
g wrote:
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
>  ...introduce-link_is_up-helper-function.patch | 166 ++++++++++++++++++
>  ...ly-when-the-nexthop-is-bound-to-link.patch |  72 ++++++++
>  ...nd-to-a-link-requires-the-link-is-up.patch |  57 ++++++
>  ...etwork-add-test-case-for-issue-40106.patch | 117 ++++++++++++
>  meta/recipes-core/systemd/systemd_255.22.bb   |   4 +
>  5 files changed, 416 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-network-introd=
uce-link_is_up-helper-function.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0024-network-check-=
if-gateway-is-ready-only-when-the-nexthop-is-bound-to-link.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-network-route-=
bound-to-a-link-requires-the-link-is-up.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-test-network-a=
dd-test-case-for-issue-40106.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-network-introduce-lin=
k_is_up-helper-function.patch b/meta/recipes-core/systemd/systemd/0023-netw=
ork-introduce-link_is_up-helper-function.patch
> new file mode 100644
> index 0000000000..04f7963a8a
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-network-introduce-link_is_up=
-helper-function.patch
> @@ -0,0 +1,166 @@
> +From ec4f646759d6625bbafcd4ce67224fb63b99a96c Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 9 Mar 2026 10:57:06 +0900
> +Subject: [PATCH] network: introduce link_is_up() helper function
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41000=
/commits/ec4f646759d6625bbafcd4ce67224fb63b99a96c]

Can you check if this patch is needed for wrynose as well? If that is
the case, then, you will have to send it for wrynose.

> +Comment: Patch is refreshed based on the 255.22 codebase
> +Did not pick changes from the below files as it is not matches to our co=
de base.
> +src/network/netdev/bond.c
> +src/network/networkd-route.c
> +
> +Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>

This patch has formating issues (see below):
> +---
> + src/network/networkd-link.c    | 21 +++++++++++----------
> + src/network/networkd-link.h    |  1 +
> + src/network/networkd-nexthop.c |  4 ++--
> + src/network/networkd-route.c   |  2 +-
> + src/network/networkd-setlink.c | 11 +++++------
> + 6 files changed, 21 insertions(+), 20 deletions(-)
> +
> +diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
> +index e49d5946aa67d..c77b02b8e0192 100644
> +--- a/src/network/networkd-link.c
> ++++ b/src/network/networkd-link.c
> +@@ -726,7 +726,6 @@ int link_ipv6ll_gained(Link *link) {
> +
   ^ missing a space marking an emtpy context line here

Every other issues:

Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:26
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:31
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:36
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:45
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:52
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:66
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:78
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:82
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:85
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:92
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:99
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-core/systemd/systemd/0023-netwo=
rk-introduce-link_is_up-helper-function.patch:110
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.

Regards,
--=20
Yoann Congal
Smile ECS


