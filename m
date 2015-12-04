Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E72D60125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 23:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB4NuA2Y007707; Fri, 4 Dec 2015 23:56:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SSHSe0ncxGtQ; Fri,  4 Dec 2015 23:56:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB4Ntu0s007704
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Dec 2015 23:56:07 GMT
Message-ID: <1449273356.14864.232.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 04 Dec 2015 23:55:56 +0000
In-Reply-To: <1449262027-26919-1-git-send-email-Martin.Jansa@gmail.com>
References: <1449262027-26919-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Fri, 04 Dec 2015 23:56:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-12-04 at 21:47 +0100, Martin Jansa wrote:
> * we don't want the do_package signature depending on INHERIT variable
> * e.g. just adding the own-mirrors causes texinfo to rebuild:
>   # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
>   basehash changed from 015df2fd8e396cc1e15622dbac843301 to 9f1d06c4f238c70a99ccb6d8da348b6a
>   Variable INHERIT value changed from
>   ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
>   to
>   ' rm_work own-mirrors blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/texinfo/texinfo_6.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
> index 8fb715a..b0a6975 100644
> --- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
> @@ -9,8 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  PROVIDES_append_class-native = " texinfo-replacement-native"
>  
> +DOC_COMPRESS_ENABLED = "${@ '1' if 'compress_doc' in (d.getVar('INHERIT', True) or '').split() else '0' }"
> +DOC_COMPRESS_ENABLED[vardepvalue] = "${DOC_COMPRESS_ENABLED}"
> +
>  def compress_pkg(d):
> -    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
> +    if d.getVar("DOC_COMPRESS_ENABLED", True) == "1":

Could we use:

if bb.data.inherits_class("compress_doc", d):

?

Cheers,

Richard


