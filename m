Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TDvFN-0006kj-5B for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:41:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8IAT1pF026558;
	Tue, 18 Sep 2012 11:29:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25988-04; Tue, 18 Sep 2012 11:28:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8IASsZw026552
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Sep 2012 11:28:55 +0100
Message-ID: <1347964133.13596.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 18 Sep 2012 11:28:53 +0100
In-Reply-To: <0c67727e1f680f450680af0cad3dca4b8a295998.1347950270.git.liezhi.yang@windriver.com>
References: <cover.1347950270.git.liezhi.yang@windriver.com>
	<0c67727e1f680f450680af0cad3dca4b8a295998.1347950270.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpm 5.4.9: DEPENDS on bison-native
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
X-List-Received-Date: Tue, 18 Sep 2012 10:41:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-18 at 18:18 +0800, Robert Yang wrote:
> The rpm should depend on bison-native, otherwise errors when "bitbake
> rpm-native" in a fresh build:
> 
> | make[4]: Entering directory `/path/to/rpm-native-5.4.9-r46/rpm-5.4.9/syck/lib'
> | bison -d -t -v -p syck -o gram.c gram.y
> | make[4]: bison: Command not found
> 
> Basically, both the rpm-native and rpm should depend on bison-native,
> but don't need depend on bison, but it seems that it isn't necessary
> to add another depend line:
> 
> DEPENDS_virtclass-native = "libpcre-native ... bison-native"
> 
> So just add it to the DEPENDS.
> 
> [YOCTO #3123]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index e276cc3..ee0e86f 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -42,8 +42,8 @@ HOMEPAGE = "http://rpm5.org/"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
> -DEPENDS = "libpcre attr acl popt ossp-uuid file"
> -PR = "r46"
> +DEPENDS = "libpcre attr acl popt ossp-uuid file bison"
> +PR = "r47"

According to what you wrote above ("but don't need depend on bison"),
this should be:

DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"

?

Cheers,

Richard




