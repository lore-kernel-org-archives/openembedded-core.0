Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRtg-0008M2-Jy for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:15:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBxphX023821;
	Wed, 16 Jan 2013 11:59:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23524-02; Wed, 16 Jan 2013 11:59:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBxgxk023815
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 11:59:43 GMT
Message-ID: <1358337581.8129.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Wed, 16 Jan 2013 11:59:41 +0000
In-Reply-To: <1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
	<1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: remove dependency on coreutils-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 12:15:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-15 at 15:16 +0800, Jesse Zhang wrote:
> If coreutils-native is built, it will replace the host commands and will
> in parallel builds cause such errors:
> 
>      make[6]: execvp: rm: Text file busy
> 
>      libtool: ...tmp/sysroots/x86_64-linux//bin/mv: Text file busy
> 
> Remove the dependency and always use the host version.
> 
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_6.9.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
> index 37d8dc9..c0778ba 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -8,8 +8,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
> -PR = "r4"
> -DEPENDS = "coreutils-native-${PV}"
> +PR = "r5"
>  DEPENDS_class-native = "gettext-native"
>  
>  inherit autotools gettext

Two questions:

1) Why do we have this dependency here at all? Are we sure we don't need
it for some reasons?

2) Isn't the build of coreutils-native still broken? We should probably
hack it so it installs into some path prefix like
{python/perl/gzip/tar}-native or doesn't install the utils at all.

I've not taken the patch until we have some plans for the above issues.

Cheers,

Richard



