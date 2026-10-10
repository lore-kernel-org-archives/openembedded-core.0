Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A345DCA6017
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 21:40:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16985.1791668411450533592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 14:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XTyY4Faw;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16c399641so7888965e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791668409; x=1792273209; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c7J97JHEg6y7lgP1IFdeAgDPpaeHxRFSKi4N9baEjE=;
        b=XTyY4Faw/RtWMrt7JQ9qQW6SL5VwilXLdD0Hs2/V42avSOpKbMK0sgx/KpPyd6mXfh
         7wdgZaeHppe9ppDhPUJS6FpdQX63GP4O02qMsVqQbGEHn7q+XtVelpw8lB8Wjm0ve5Bg
         Hz+7jeWS8j6q9NtSC/ae25xhudvgwyI9M4T7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668409; x=1792273209;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c7J97JHEg6y7lgP1IFdeAgDPpaeHxRFSKi4N9baEjE=;
        b=GTvKRg4MuAT5hYzZjqvOlqzEn7vKVXTu8fgHKpJLR+MM+usehOV0LwFvxB3utu5pWx
         FEFU9A8AqpZPNZ4CeM+cuPp0dVjgbK1MZhlUdRWcvECpLd9D4HhjVaYXB5kYWFemNZi7
         BfZOglq+UV9H5O7/Q9g0hn68m6O5ouThScIPyYVgIKzaiONqWxCQXM1wwrrHx9YVVXnH
         HdsnMWhJTCSAEpR56V/xGjsA/c5bFt9k2RU3H7QiY7UYF8NIMmlNzqwmmdrwawCWpbbj
         UWnABrFIGzrxk2+RkChQQ9LxJ6pn/GwXCA/WIHuhGPRiwKfuQ7wQUpegEqoTc4cE98TI
         g7hA==
X-Forwarded-Encrypted: i=1; AKwUvBxpzXWtOwOZKplFBMvPDOf5qL7zlEH6VExdVeuG1UZSvvx1KjLQQAUj0d72wP6tp84RRQ5/cRRnK90zQoB3ENuBqg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJJ5WC4Mrb3WZDEOpDa3jyh4psMjzax5A6fv1K+cZ0EsxaoZGay
	Xdk0eQSUQJSgKWHH992cWsGwqG57HSxfvJZxRM1g6xsotWRUGTYneLEqqOS5Roy0qKE=
X-Gm-Gg: AYBFou2sYxDOjE5fQQutEyY0hpTls5qprS2d1u+Rq0vPxYjHc05aLo7cym7Ia4mhLMk
	njq8IHcOWhXgw50LLufbXrixO6f5KFD//L+DAYrD5BjMW8kvZC0gFLxyKOCPqICrC9dIlQldr/l
	6JrAM6Yu5tSnhlJ7ESfyDiHDczn2dfgdfrEgmkq2ZmCLGvYAfbJye8ZfdFiMrkZmqM20vLT5vrW
	XtQM/gdRo3qEK7KZzTM/v4WhZkf/FALFTfOgV/Jly17y6Mi/N8VjwKF/LbGPOlbVoZQucrFnq29
	WkF220o7Ihkx6dnJxgeyQYroAMDRxabzyCFNI8JIdivg6ZNdtoEG2rh5ROLD1dofFnl3bjh17hN
	+Wmqr7Cgge/dUDehKTy0w3WxAJw6G04cQh9LsTGjsBPDdodSdDDHEl/k2cXp8IQKOcuYHo08olH
	QOtb40sCjJ//sdY2GEx1BtLypAK3VTK4ydIVcow5jyK1nutk5qvZukMJNWimfE+StDTnYiJC7GA
	AJvC3jvHNk3mkE9TYD898kBQhcL7tT5g2t2OeQTCG9XZVx4gbVaExc/x6rhew==
X-Received: by 2002:a05:600c:8b28:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a18e499da4mr101265995e9.22.1791668409330;
        Sat, 10 Oct 2026 14:40:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm1104365e9.2.2026.10.10.14.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 14:40:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 23:40:07 +0200
Message-Id: <DM1HFZQZ467Q.2FDKVXY2TSZRK@smile.fr>
To: <Roopa.Kalmath@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
In-Reply-To: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 21:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247501

Hello,

I have a few format issues with your patch but the gist of it looks good
to me.

On Fri Oct 9, 2026 at 2:02 PM CEST, Roopa via lists.openembedded.org Kalmat=
h wrote:
> U-Boot before 2026.07-rc2 contains a buffer overflow vulnerability in
> nfs_readlink_reply() (net/nfs-common.c) when CONFIG_CMD_NFS is enabled,
> allowing a malicious or compromised NFS server to overflow the 2048-byte
> nfs_path_buff buffer by returning multiple relative symlink targets that
> are appended without cumulative length validation. Attackers can send
> two or more READLINK responses containing relative symlink targets of
> approximately 1100 bytes each to corrupt adjacent BSS variables
> including nfs_server_ip, nfs_server_mount_port, nfs_server_port,
> nfs_our_port, nfs_state, and rpc_id, potentially achieving memory
> corruption and control over the NFS client state machine.

All this paragraph is the CVE description which is not what reader of
these commit messages look for. We want to know what you did to fix the
CVE and why. In this case a simple
"Backport fix referenced by NVD: https://nvd.nist.gov/vuln/detail/cve-2026-=
29009"
is enough.

Look at https://git.openembedded.org/openembedded-core/log/?h=3Dwrynose&qt=
=3Dgrep&q=3DCVE
to get an idea of what a commit message usually look like.

> Reference:
> [https://www.cve.org/CVERecord?id=3DCVE-2026-29009]
>
> Backport the patch to fix CVE-2026-29009:
> [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6a=
ae974f9cec72fd6e58f1bc]
>
> Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> ---
>  .../u-boot/files/CVE-2026-29009.patch         | 34 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 ++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/re=
cipes-bsp/u-boot/files/CVE-2026-29009.patch
> new file mode 100644
> index 0000000000..1e04562ede
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
> @@ -0,0 +1,34 @@
> +From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
> +From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> +Date: Fri, 9 Oct 2026 08:38:23 +0000
> +Subject: [PATCH] u-boot:Fix CVE-2026-29009
> +
> +CVE: CVE-2026-29009
> +
> +Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/=
-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
> +
> +Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>

While backporting this patch you complely erased the existing commit
message and authorship information. Please keep those, they help
checking that we are indeed fixing the vulnerability, not introducing
regressions, ...

Can you send a v2 with the above fixed?

Thanks!
--=20
Yoann Congal
Smile ECS


