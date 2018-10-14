Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD502745EF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 08:49:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9E8nXtb028389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Oct 2018 09:49:35 +0100
Message-ID: <deb7ad54c2b95773e123d2185639c6e5ae89b9ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Oct 2018 09:49:33 +0100
In-Reply-To: <20181012115502.14205-1-ross.burton@intel.com>
References: <20181012115502.14205-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] python: don't wipe RDEPENDS when parsing manifest
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
X-List-Received-Date: Sun, 14 Oct 2018 08:49:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 12:55 +0100, Ross Burton wrote:
> We want to allow the main recipe to extend RDEPENDS directly, so
> don't wipe
> RDEPENDS when reading the manifest.
> 
> This fixes the missing python-misc dependency from python-modules.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.6.bb | 1 -
>  meta/recipes-devtools/python/python_2.7.15.bb | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> index e1796581342..489baa294fd 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -285,7 +285,6 @@ python(){
>              for value in python_manifest[key]['cached']:
>                      d.appendVar('FILES_' + pypackage, ' ' + value)
>  
> -        d.setVar('RDEPENDS_' + pypackage, '')
>          for value in python_manifest[key]['rdepends']:
>              # Make it work with or without $PN
>              if '${PN}' in value:
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb
> b/meta/recipes-devtools/python/python_2.7.15.bb
> index 472c1da4bf7..f30d3f4d25c 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -240,7 +240,6 @@ python(){
>                  if value.endswith('.py'):
>                      d.appendVar('FILES_' + pypackage, ' ' + value +
> 'c')
>  
> -        d.setVar('RDEPENDS_' + pypackage, '')
>          for value in python_manifest[key]['rdepends']:
>              # Make it work with or without $PN
>              if '${PN}' in value:

FWIW its actually this patch which is causing the build failures...

I did remember that rpm may detect python scripts and add a python
dependency which may be confusing things...

Cheers,

Richard


