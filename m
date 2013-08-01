Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87A6361883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 23:21:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r71NLmgm000940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2013 16:21:48 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 16:21:48 -0700
Message-ID: <51FAED8B.6060802@windriver.com>
Date: Thu, 1 Aug 2013 18:21:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1375295590-1887-1-git-send-email-rich.tollerton@ni.com>
In-Reply-To: <1375295590-1887-1-git-send-email-rich.tollerton@ni.com>
Subject: Re: [master, dylan][PATCH v2] shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt
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
X-List-Received-Date: Thu, 01 Aug 2013 23:21:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/13 1:33 PM, Richard Tollerton wrote:
> shadow falsely assumes that if --enable-libpam is set, it doesn't need to link
> against libcrypt; this breaks chsh. (This same fix exists in Arch.)
>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>

This change is working for me.

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> index caf24c0..108e11e 100644
> --- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> @@ -37,6 +37,10 @@ EXTRA_OECONF += "--without-audit \
>                    --without-selinux"
>   EXTRA_OECONF_libc-uclibc += "--with-nscd=no"
>
> +# Build falsely assumes that if --enable-libpam is set, we don't need to link against
> +# libcrypt. This breaks chsh.
> +BUILD_LDFLAGS += "${@base_contains('DISTRO_FEATURES', 'pam', base_contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
> +
>   PAM_PLUGINS = "libpam-runtime \
>                  pam-plugin-faildelay \
>                  pam-plugin-securetty \
>


