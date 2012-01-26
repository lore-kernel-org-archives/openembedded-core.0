Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqVtq-0003uJ-1l for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:26:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKIavr027841;
	Thu, 26 Jan 2012 20:18:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25528-10; Thu, 26 Jan 2012 20:18:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKISvA027835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2012 20:18:29 GMT
Message-ID: <1327609110.19643.400.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:18:30 +0000
In-Reply-To: <1327593042-1252-1-git-send-email-andrei@gherzan.ro>
References: <1327593042-1252-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] bzip2-full-native: Remove PROVIDES_append_virtclass-native and modify python-native DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 20:26:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-26 at 17:50 +0200, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> 
> There are no more -full-native virtclass-native in yocto. The only dependency for this is in
> python where DEPENDS was changed accordingly.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    1 -
>  2 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
> index 8bf0af0..5e99a42 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
> @@ -1,5 +1,5 @@
>  require python.inc
> -DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> +DEPENDS = "openssl-native bzip2-native zlib-native readline-native sqlite3-native"
>  PR = "${INC_PR}.3"
>  
>  SRC_URI += "file://04-default-is-optimized.patch \
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index 14cd240..23b2bdb 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -28,5 +28,4 @@ do_configure_prepend () {
>  	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
>  }
>  
> -PROVIDES_append_virtclass-native = " bzip2-full-native"
>  BBCLASSEXTEND = "native"

There is a reason for this. 

It was due to the bzip2 host dependencies on some systems being broken
and requiring that we build our own to ensure we don't hit issues with
bzip2 when unpacking certain recipes. If I recall correctly, its near
impossible to trigger bzip2-native to build without that PROVIDES since
bzip2-native is in ASSUME_PROVIDED.

What was your reason for changing this?

Cheers,

Richard




