Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UESoo-0001fi-AY for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 00:04:50 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r29MuIUZ029326; Sat, 9 Mar 2013 22:56:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b3CCZQHgIDyJ; Sat,  9 Mar 2013 22:56:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r29Mtuf5029301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 9 Mar 2013 22:56:22 GMT
Message-ID: <1362810871.9443.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
In-Reply-To: <1362748245.6076.748.camel@localhost>
References: <1362748245.6076.748.camel@localhost>
Date: Sat, 09 Mar 2013 06:34:31 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.6.3-1 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cracklib: Generate compiled dict using default dictionary
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
X-List-Received-Date: Sat, 09 Mar 2013 23:04:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-08 at 08:10 -0500, Colin Walters wrote:
> While cracklib compiles, the generated library's FascistCheck() API
> will look for the default compiled dictionary, fail to find it, and
> invoke exit(1), which then in turn breaks gnome-initial-setup that
> uses cracklib via libpwquality.  (Quality here obviously referring to
> the password, and not the libraries...)
> 
> What we do here is basically the same as what happens in the current
> Fedora spec file, except the latter uses a far larger dictionary.
> 
> To make this work, we need to build cracklib-native because the
> dictionary compiler is written in native code.
> 
> Signed-off-by: Colin Walters <walters@verbum.org>
> ---
>  meta/recipes-extended/cracklib/cracklib_2.8.22.bb | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

The patch doesn't quite do what you think it does. The _appends() stack,
not override and hence the native append is empty. You probably want to
do a:

do_install_append_class-target () {
....
}

(class not virtclass, virtclass is deprecated)

Cheers,

Richard



