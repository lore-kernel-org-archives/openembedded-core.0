Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42A9360420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:20:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4M0KkAY023937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 17:20:46 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 21 May 2013 17:20:46 -0700
Message-ID: <519C0F5E.8050807@windriver.com>
Date: Tue, 21 May 2013 19:20:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369180475-31178-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1369180475-31178-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] patch: diable xattr as default
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
X-List-Received-Date: Wed, 22 May 2013 00:20:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/13 6:54 PM, Saul Wold wrote:
> There is a optional dependency on xattr (and thus the attr package),
> disable it by default, to ensure it builds correctly.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-devtools/patch/patch_2.7.1.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
> index 38df034..b131204 100644
> --- a/meta/recipes-devtools/patch/patch_2.7.1.bb
> +++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
> @@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d6
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   acpaths = "-I ${S}/m4 "
> +
> +EXTRA_OECONF += "--disable-xattr"

There is an xattr distro feature.  It would be better to use:

ENABLE_XATTR = "${@base_contains('DISTRO_FEATURES', 'xattr', '--enable-xattr', 
'--disable-xattr', d)}"

EXTRA_OECONF += "${ENABLE_XATTR}"

(Might need a -native/-nativesdk version?)

>



