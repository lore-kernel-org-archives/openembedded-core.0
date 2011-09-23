Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R77U8-0000nj-Jp for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 17:16:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R77Oz-0004zn-M7 for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 17:10:57 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 17:10:57 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 17:10:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 23 Sep 2011 19:09:59 +0400
Message-ID: <4E7CA147.4060000@gmail.com>
References: <20110922120430.GE3477@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <20110922120430.GE3477@jama.jama.net>
Cc: Martin Jansa <public-martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@lo.gmane.org>
Subject: Re: [PATCH 11/17] eglibc: fix packaging of some of nativesdk packages
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
X-List-Received-Date: Fri, 23 Sep 2011 15:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2011 04:04 PM, Martin Jansa wrote:
> Hi,
>
> after this patch PKGSUFFIX is probably evaluated too late and this:
>
> # PREFERRED_PROVIDER_glibc-thread-db=eglibc-thread-db
> PREFERRED_PROVIDER_glibc-thread-db="eglibc-thread-db"
> # RPROVIDES_eglibc-thread-db${PKGSUFFIX}=glibc-thread-db${PKGSUFFIX}
> RPROVIDES_eglibc-thread-db="glibc-thread-db"

The strange thing is that if I remove the PKGSUFFIX lines for 
eglibc-thread-db/eglibc-extra-nss, and put the following lines in, 
everyghing is working for me.

RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
RPROVIDES_eglibc-thread-db = "glibc-thread-db"
RPROVIDES_eglibc-extra-nss-nativesdk = "glibc-extra-nss-nativesdk"
RPROVIDES_eglibc-thread-db-nativesdk = "glibc-thread-db-nativesdk"

Also the following lines seem to work:

RPROVIDES_${PN}-extra-nss = "glibc${PKGSUFFIX}-extra-nss"
RPROVIDES_${PN}-thread-db = "glibc${PKGSUFFIX}-thread-db"


Could you please test that it works for you?

> doesn't seem to work as expected and gdb pulls whole
> external-csl-toolchain as glibc-thread-db provider for
>
> RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
>
> and btw:
> ERROR: external-poky-toolchain: Recipe file does not have license file information (LIC_FILES_CHKSUM)
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
>
> and sign of this behavior is also qemu-native pulled to build and
> warnings like this also for virtual/libc virtual/linux-libc-headers
>
> ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv
> (/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.13.bb
>   /OE/shr-core/openembedded-core/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb).
>
> Regards,
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




