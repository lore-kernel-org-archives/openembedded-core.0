Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C35DC77B61
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 23:53:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9476.1680998003221916008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Apr 2023 16:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jd05uuBq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 796EE20002;
	Sat,  8 Apr 2023 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680998000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eESERLBXokWL11XUcSq+89YYu+VTR6Jl5BWmrfK+mAU=;
	b=Jd05uuBqz6GZMyizQWtvM2IOLGsUsP6ujxMWYWUH28Cf2CY9Xv8Sui5+3uwkah5A51ox1w
	KmwK4PK1mqTfJo7buDARy6Dv1BoYiIchET/Vme8nh1eJp215FMXSvo9Z5B5WQbcN//XkkS
	Z4P8/1irUTe/fnhtH59Jg5QsYlj3BuXlUA8LMwfh7r4ziLLdyZUuMC/hP3IKwikMIHIXov
	oiD7Jj0S0SOajouuwdqqgfyX7GEYkvK4AkXDgm0NmA+A+ZWJbR3ZG2Ef9JNhGBX591ZQ8P
	uHYigd0Fm7DDCcZo6IMMflcX0EtV5vebMCc47d5lXuOUfKKkFJMMD4TH1wHH6A==
Date: Sun, 9 Apr 2023 01:53:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org,
	Fabian =?iso-8859-1?Q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
Subject: Re: [OE-core] [PATCH] tar: extend numeric-owner to ACL entries
Message-ID: <2023040823532071419a57@mail.local>
References: <20230407125846.3983045-1-p.lobacz@welotec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407125846.3983045-1-p.lobacz@welotec.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 23:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179833

Hello,

On 07/04/2023 14:58:46+0200, Piotr Łobacz wrote:
> ACL entries store references to numeric uids/gids. on platforms that
> have libacl, use `acl_to_any_text` to generate ACL strings that preserve
> those numeric identifiers if `numeric-owner` is set (instead of doing a
> conversion to user/group name, like the acl_to_text function does).
> 
> this fixes the following broken scenario (and similar ones, where a
> user/group of the stored name exists, but has a different numeric
> identifier).
> 
> system A with user foo with uid 1001
> system B with no user foo
> file with ACL referencing uid 1001 on system A
> 
> on A:
> $ echo 'bar' > file
> $ setfacl -m u:foo:r file
> $ tar --acls --xattrs --numeric-owner -cf test.tar file
> $ tar -vv --acls --xattrs -tf test.tar
> 
> expected output:
> -rw-r--r--+ 0/0         4 2022-01-26 14:32 file
>   a: user::rw-,user:1001:r--,group::r--,mask::r--,other::r--
> 
> actual output:
> -rw-r--r--+ 0/0         4 2022-01-26 14:32 file
>   a: user::rw-,user:fakeuser:r--,group::r--,mask::r--,other::r--
> 
> on B:
> $ tar --acls --xattrs -xf test.tar
> $ getfacl -n file
> 
> expected output (extraction) - none
> expected output (getfacl):
>  # file: file
>  # owner: 0
>  # group: 0
>  user::rw-
>  user:1001:r--
>  group::r--
>  other::r--
> 
> actual output (extraction):
> tar: file: Warning: Cannot acl_from_text: Invalid argument
> 
> actual output (getfacl) - note the missing user entry:
>  # file: file
>  # owner: 0
>  # group: 0
>  user::rw-
>  group::r--
>  other::r--
> 
> Fixes: [YOCTO #15099]
> 
> Signed-off-by: Fabian Grünbichler <f.gruenbichler@proxmox.com>
> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> ---
>  ...-extend-numeric-owner-to-ACL-entries.patch | 113 ++++++++++++++++++
>  meta/recipes-extended/tar/tar_1.34.bb         |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL-entries.patch
> 
> diff --git a/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL-entries.patch b/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL-entries.patch
> new file mode 100644
> index 0000000000..9acce2e90a
> --- /dev/null
> +++ b/meta/recipes-extended/tar/tar/0001-extend-numeric-owner-to-ACL-entries.patch
> @@ -0,0 +1,113 @@
> +From e95db1b5315957181c0255f6ca9607959abac4c3 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
> +Date: Wed, 26 Jan 2022 14:54:58 +0100
> +Subject: [PATCH] extend numeric-owner to ACL entries
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +ACL entries store references to numeric uids/gids. on platforms that
> +have libacl, use `acl_to_any_text` to generate ACL strings that preserve
> +those numeric identifiers if `numeric-owner` is set (instead of doing a
> +conversion to user/group name, like the acl_to_text function does).
> +
> +this fixes the following broken scenario (and similar ones, where a
> +user/group of the stored name exists, but has a different numeric
> +identifier).
> +
> +system A with user foo with uid 1001
> +system B with no user foo
> +file with ACL referencing uid 1001 on system A
> +
> +on A:
> +$ echo 'bar' > file
> +$ setfacl -m u:foo:r file
> +$ tar --acls --xattrs --numeric-owner -cf test.tar file
> +$ tar -vv --acls --xattrs -tf test.tar
> +
> +expected output:
> +-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
> +  a: user::rw-,user:1001:r--,group::r--,mask::r--,other::r--
> +
> +actual output:
> +-rw-r--r--+ 0/0         4 2022-01-26 14:32 file
> +  a: user::rw-,user:fakeuser:r--,group::r--,mask::r--,other::r--
> +
> +on B:
> +$ tar --acls --xattrs -xf test.tar
> +$ getfacl -n file
> +
> +expected output (extraction) - none
> +expected output (getfacl):
> + # file: file
> + # owner: 0
> + # group: 0
> + user::rw-
> + user:1001:r--
> + group::r--
> + other::r--
> +
> +actual output (extraction):
> +tar: file: Warning: Cannot acl_from_text: Invalid argument
> +
> +actual output (getfacl) - note the missing user entry:
> + # file: file
> + # owner: 0
> + # group: 0
> + user::rw-
> + group::r--
> + other::r--
> +

This patch is missing the Upstream-Status tag here

> +Signed-off-by: Fabian Grünbichler <f.gruenbichler@proxmox.com>
> +---
> + src/xattrs.c | 20 ++++++++++++++++++--
> + 1 file changed, 18 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/xattrs.c b/src/xattrs.c
> +index 7c00527c..b319dc68 100644
> +--- a/src/xattrs.c
> ++++ b/src/xattrs.c
> +@@ -130,6 +130,10 @@ static struct
> + #ifdef HAVE_POSIX_ACLS
> + # include "acl.h"
> + # include <sys/acl.h>
> ++#ifdef HAVE_ACL_LIBACL_H
> ++/* needed for numeric-owner support */
> ++# include <acl/libacl.h>
> ++#endif
> + #endif
> + 
> + #ifdef HAVE_POSIX_ACLS
> +@@ -362,7 +366,13 @@ xattrs__acls_get_a (int parentfd, const char *file_name,
> +       return;
> +     }
> + 
> +-  val = acl_to_text (acl, NULL);
> ++#ifdef HAVE_ACL_LIBACL_H
> ++  if (numeric_owner_option)
> ++    val = acl_to_any_text(acl, NULL, '\n', TEXT_SOME_EFFECTIVE | TEXT_NUMERIC_IDS);
> ++  else
> ++#endif
> ++    val = acl_to_text (acl, NULL);
> ++
> +   acl_free (acl);
> + 
> +   if (!val)
> +@@ -392,7 +402,13 @@ xattrs__acls_get_d (int parentfd, char const *file_name,
> +       return;
> +     }
> + 
> +-  val = acl_to_text (acl, NULL);
> ++#ifdef HAVE_ACL_LIBACL_H
> ++  if (numeric_owner_option)
> ++    val = acl_to_any_text(acl, NULL, '\n', TEXT_SOME_EFFECTIVE | TEXT_NUMERIC_IDS);
> ++  else
> ++    val = acl_to_text (acl, NULL);
> ++#endif
> ++
> +   acl_free (acl);
> + 
> +   if (!val)
> +-- 
> +2.30.2
> +
> diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
> index 1ef5fe221e..bf117f600a 100644
> --- a/meta/recipes-extended/tar/tar_1.34.bb
> +++ b/meta/recipes-extended/tar/tar_1.34.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
>             file://CVE-2022-48303.patch \
> +           file://0001-extend-numeric-owner-to-ACL-entries.patch \
>  "
>  
>  SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179818): https://lists.openembedded.org/g/openembedded-core/message/179818
> Mute This Topic: https://lists.openembedded.org/mt/98123758/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

