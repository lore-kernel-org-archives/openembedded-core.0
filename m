Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B90F17DE82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8NI7Ycq029492
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:07:35 -0700 (PDT)
Received: from [128.224.56.209] (128.224.56.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 23 Sep 2019 11:07:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <29d0f686-48a2-ef07-aa16-39375b6b6937@windriver.com>
Date: Mon, 23 Sep 2019 14:07:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Mon, 23 Sep 2019 18:07:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/23/19 2:01 PM, Trevor Gamblin wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> lighttpd builds fail if "fam" (and therefore gamin) is enabled.
>
> In conf/local.conf:
>
>      CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
>      PACKAGECONFIG_append_pn-lighttpd = " fam"
>
> bitbake error:
>
>      ERROR: Nothing PROVIDES 'gamin' (but /yow-lpggp31/tgamblin/oe-core.git/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
>      NOTE: Runtime target 'lighttpd' is unbuildable, removing...
>      Missing or unbuildable dependency chain was: ['lighttpd', 'gamin']
>      ERROR: Required build target 'core-image-minimal' has no buildable providers.
>      Missing or unbuildable dependency chain was: ['core-image-minimal', 'lighttpd', 'gamin']
>
> Since gamin doesn't appear to have a recipe and hasn't been
> maintained for several years, this should be removed from the
> list of lighttpd PACKAGECONFIG options.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> index 72990d02e5..3f9e4fec18 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> @@ -39,7 +39,6 @@ PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
>   PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
>   PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
>   PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> -PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
>   PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
>   PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
>   PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"

While troubleshooting I learned that gamin has not been maintained for 
several years. See:

https://bugzilla.gnome.org/show_bug.cgi?id=454124

https://gitlab.gnome.org/Archive/gamin

Is there a reason why we'd want to keep it in the PACKAGECONFIG options 
list?


