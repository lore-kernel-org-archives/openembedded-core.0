Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A07AC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 22:43:16 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web11.24272.1681857789946406715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 15:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=j1nFovHr;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 78d87d90-de3a-11ed-a07e-f8bc12f6d67f;
	Wed, 19 Apr 2023 06:43:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GXFBbCxmMaNDGqBDzQV2XpHbHGr2CdP60B4n+D2aBmA=; b=j1nFovHrvWCnBaNdKaEs5kLtdZ
	BBPEtj53RpypG1ycDPnWhhH3FPnmPjABxNKumWSTAzPJGnQV6s9dbk78WKuqwVesv75am2H2dtIml
	Aaw5nx1pKkH6+N4fBWNw7DnhCd1+Qt53/k18YLNIRzTBS2FXl+X3JyQFjnVVIrb/CeqP5FYsf+vBG
	s0lSBKYW9LskipOnDkb1SR3/IsCu3yiN3J19zWUieHdJjDchuCjln6UEbswkhOxn9BU1SSdj9IG5P
	3cH+4oTaZkke6Grj/4iAFaHRvhFEgoUR/cfMR2zawq/GGY93J3OJ0kpwl6v0bVd3w8pEoUHVhLV/y
	pvf+1hLg==;
Received: from [161.29.131.251] (port=44799 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1pou2T-009CU3-OD;
	Wed, 19 Apr 2023 10:43:05 +1200
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 09/14] image-artifact-names: add IMAGE_MACHINE_SUFFIX variable
Date: Wed, 19 Apr 2023 10:43:05 +1200
Message-ID: <45473015.fMDQidcC6G@linc>
In-Reply-To: <06c7db2b170b9cf47c803ea12c83b58f886074b2.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com> <06c7db2b170b9cf47c803ea12c83b58f886074b2.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id: paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 22:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180204

Hi Martin

On Tuesday, 14 March 2023 01:15:36 NZST Martin Jansa wrote:
> * to make it easier for projects to avoid default -${MACHINE} suffix if
>   the ${MACHINE} named DEPLOY_DIR_IMAGE works better for them
> 
> * also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear
>   that IMAGE_NAME is the same as IMAGE_LINK_NAME but with version
>   suffix
> 
> * adding it as separate variable helps us to catch the cases
>   where we didn't respect ${IMAGE_LINK_NAME} variable and just used
>   the common default ${IMAGE_BASENAME}-${MACHINE}.
> 
> [YOCTO #12937]
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes-recipe/image-artifact-names.bbclass  | 15 ++++++++++++---
>  meta/classes-recipe/kernel-artifact-names.bbclass |  2 +-
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/image-artifact-names.bbclass
> b/meta/classes-recipe/image-artifact-names.bbclass index
> 9dc25b6dde..ac2376d59a 100644
> --- a/meta/classes-recipe/image-artifact-names.bbclass
> +++ b/meta/classes-recipe/image-artifact-names.bbclass
> @@ -11,11 +11,20 @@
>  IMAGE_BASENAME ?= "${PN}"
>  IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
>  IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
> -IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> -IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
> +IMAGE_NAME ?= "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> +IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"

So there's a minor unfortunate side-effect of this in that you can no longer 
just set IMAGE_LINK_NAME = "" to drop the symlinks - a minority use case, but 
something I have used. Of course you can just re-set the value of IMAGE_NAME. 
I am making a note in the manual and migration guide.

Cheers
Paul





