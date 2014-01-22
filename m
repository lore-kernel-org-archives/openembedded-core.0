Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6EE6DBF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0M96c4q000089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Jan 2014 01:06:38 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 22 Jan 2014 01:06:37 -0800
Message-ID: <52DF8A1E.9050306@windriver.com>
Date: Wed, 22 Jan 2014 17:06:38 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1390360372-10947-1-git-send-email-kai.kang@windriver.com>
	<1390374490.24755.2.camel@e130.pbcl.net>
In-Reply-To: <1390374490.24755.2.camel@e130.pbcl.net>
X-Enigmail-Version: 1.6
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-dbg: provides libc6-dbg
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
X-List-Received-Date: Wed, 22 Jan 2014 09:06:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 2014年01月22日 15:08, Phil Blundell wrote:
> On Wed, 2014-01-22 at 11:12 +0800, Kai Kang wrote:
>> Update eglibc-package.inc to let eglibc-dbg provides libc6-dbg.
>>
>> The use case is that when libc6-dbg is needded to be installed into
>> image, we don't need change glibc-dbg to uclibc-dbg in recipe when we
>> change to use package uclibc as default C library.
>> -RPROVIDES_${PN}-dbg = "glibc-dbg"
>> +RPROVIDES_${PN}-dbg = "glibc-dbg libc6-dbg"
> Isn't PKG_${PN}-dbg set to libc6-dbg anyway (by libc-common.bbclass)?
> Can you explain the use case and justification for this change a bit
> more clearly?

In libc-common.bbclass, it set dependencies for the rpm packages. When
run 'rpm -qp --provides libc6-dbg-2.18-r2.0.x86_64.rpm', yes, it
provides 'eglibc-dbg  libc-dbg  glibc-dbg  libc6-dbg'.

But when bitbake parse the recipe and configure files, libc6-dbg is not
found and not package provides it. If you add one line such as:
IMAGE_INSTALL_append += "libc6-dbg"

bitbake complains:

ERROR: Nothing RPROVIDES 'libc6-dbg' (but
/mnt/sda8/poky-neil/meta/recipes-sato/images/core-image-sato.bb RDEPENDS
on or otherwise requires it)

Use glib-dbg does work. But if I use it in a recipe, when uclibc is
used, I have to edit the recipe.

So I update RPROVIDES_${PN}-dbg to let it provides libc6-dbg.

Regards,
Kai
>
> p.
>
>
>
>


-- 
Regards,
Neil | Kai Kang


