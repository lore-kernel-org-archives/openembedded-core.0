Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri2rR-0002Xq-1l
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 12:48:57 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri2kM-0000dm-Om
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 12:41:38 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 11:41:37 +0000
In-Reply-To: <8c603e5fe18d1bc4c10bf10662caaaa0ac5aa335.1325571069.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<8c603e5fe18d1bc4c10bf10662caaaa0ac5aa335.1325571069.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325590898.24417.329.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 053/113] eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
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
X-List-Received-Date: Tue, 03 Jan 2012 11:48:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-02 at 22:19 -0800, Saul Wold wrote:
> -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> +
> +# eglibc-utils rdepends on bash which depends on gettext which requires wchar
> +# support. Only include it in the PACKAGES list if we can build the RDEPENDS.
> +PACKAGES += ${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', '${PN}-utils', '', d)}

This doesn't seem like a very good fix to the problem at hand.

If I remember right, eglibc-utils includes a whole pile of binaries and
scripts and only one or two of them (mtrace?) require bash.  Knocking
eglibc-utils out of PACKAGES altogether will obviously break anything
which was depending on one of the other binaries in that package.  

Also, unless you take other steps which you don't appear to be, you'll
either get a bunch of extra "unshipped" warnings for the binaries that
no longer have any package, or (depending on how the FILES are
structured) they will soak into one of the other output packages.
Neither of those is particularly desirable.

In decreasing order of preference I think the best ways to deal with
this would be:

a) remove the bash-specific scripting constructs and change the
dependency to plain sh; or

b) fix gettext to not require wchar support; or

c) patch bash to be buildable without gettext; or

d) remove just the specific, troublesome scripts from eglibc-utils when
wchar is not available

Out of interest, how much do you actually gain by disabling
posix-clang-wchar?

p.




