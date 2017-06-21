Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA8977E7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 15:24:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5LFOW8P023722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Jun 2017 08:24:33 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Jun 2017 08:24:31 -0700
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1498067242-2882-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <35467727-fa4f-f9b6-af40-9f67c09ba98a@windriver.com>
Date: Wed, 21 Jun 2017 10:24:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1498067242-2882-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [PATCH v2] [morty] rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Wed, 21 Jun 2017 15:24:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/21/17 12:47 PM, zhengrq wrote:
> Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug

I've done a bit more looking into this.  RPM doesn't really support I18N
(localized) for the main packaging strings.  This is the reason for the code
that maps I18N to 'STRING'.  It is expected that all of the main entries are
stored in the 'C' locale.  (not i18n).

This likely explains the problem that Armin reported:

warning: tag Name(1000) type(0x4) != expected type(0x10006)


I suspect the real bug is either:

1) When the spec file is written the format is written out as i18n.  If so, this
needs to be normalized to regular ASCII text.

or

2) When RPM is called to build the RPMs (SRPM or otherwise) that the system
needs to be switched into a C locale -first-, then the package is generated.


There are specific ways to localize the summary and description of the package
-- but the other fields should be simple strings.

--Mark

> When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
> For example:
> $ rpm -qpi zlib-1.2.8-r0.src.rpm
> warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
> Name        : zlib
> Version     : 1.2.8
> Release     : r0
> Architecture: i586
> Install Date: (not installed)
> Group       : ﺩ
> Size        : 633007
> License     : Zlib
> Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
> Source RPM  : (none)
> Build Date  : 2017年04月22日 00時38分03秒
> Build Host  : force
> Relocations : (not relocatable)
> Packager    : Poky <poky@yoctoproject.org>
> URL         : http://zlib.net/
> Summary     : ¨¯
> Description :
> ﺩ
> 
> Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 48 ++++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
> new file mode 100644
> index 0000000..b962617
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
> @@ -0,0 +1,48 @@
> +Subject: [PATCH] Fix the Bug of SRPM String error
> +
> +Upstream-Status: Pending
> +$ rpm -qpi zlib-1.2.8-r0.src.rpm
> +warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
> +Name        : zlib
> +Version     : 1.2.8
> +Release     : r0
> +Architecture: i586
> +Install Date: (not installed)
> +Group       : ﺩ
> +Size        : 633007
> +License     : Zlib
> +Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
> +Source RPM  : (none)
> +Build Date  : 2017年04月22日 00時38分03秒
> +Build Host  : force
> +Relocations : (not relocatable)
> +Packager    : Poky <poky@yoctoproject.org>
> +URL         : http://zlib.net/
> +Summary     : ¨¯
> +Description :
> +ﺩ
> +
> +Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
> +---
> + rpmdb/tagname.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c
> +index cfd1459..dbcafd1 100644
> +--- a/rpmdb/tagname.c
> ++++ b/rpmdb/tagname.c
> +@@ -518,9 +518,9 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, size_t dbiNTags)
> + void tagTypeValidate(HE_t he);
> + void tagTypeValidate(HE_t he)
> + {
> +-    /* XXX Re-map RPM_I18NSTRING_TYPE -> RPM_STRING_TYPE */
> ++    /* XXX RPM_I18NSTRING_TYPE is treated as strings. */
> +     if (he->t == RPM_I18NSTRING_TYPE)
> +-	he->t = RPM_STRING_TYPE;
> ++	return;
> + 
> +     /* XXX Arbitrary tags are always strings. */
> +     if ((he->tag & 0x40000000)
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> index 497af8e..ae5e0c4 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -120,6 +120,7 @@ SRC_URI += " \
>  	   file://0001-system.h-query.c-support-nosignature.patch \
>  	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
>  	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
> +	   file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
>  "
>  
>  # OE specific changes
> 
> 
> 


