Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNBpE-0007ln-Ka for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 00:36:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMXH1c014192
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:33:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13426-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:33:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMX82S014186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:33:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8305336c6b1eb0789af195f28230ecfca178538a.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
	<8305336c6b1eb0789af195f28230ecfca178538a.1305756950.git.sgw@linux.intel.com>
Date: Thu, 19 May 2011 23:33:04 +0100
Message-ID: <1305844384.3424.566.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 08/30] package-index.bb: add support for deb and rpm.
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
X-List-Received-Date: Thu, 19 May 2011 22:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

We're nearly there with this, I'd like just one other tweak please:

On Thu, 2011-05-19 at 12:19 -0700, Saul Wold wrote:
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 4faeb4a..f9ef32c 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -431,3 +431,12 @@ python do_package_write_deb () {
>  do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
>  addtask package_write_deb before do_package_write after do_package
>  
> +
> +PACKAGEINDEXES += "package_index_deb;"
> +PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> +PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> +
> +package_index_deb() {
> +    package_update_index_deb
> +}

Can't we just do +PACKAGEINDEXES += "package_update_index_deb;"

instead of adding the function?

> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 3c2472b..97de17a 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -386,3 +386,12 @@ python do_package_write_ipk () {
>  }
>  do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
>  addtask package_write_ipk before do_package_write after do_package
> +
> +PACKAGEINDEXES += "package_index_ipk;"
> +PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> +PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> +
> +package_index_ipk() {
> +    package_update_index_ipk
> +}

ditto?

Cheers,

Richard



