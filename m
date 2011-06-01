Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRodo-0002uT-4v
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:51:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51GmKRD025760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 09:48:20 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 09:48:19 -0700
Message-ID: <4DE66D53.30505@windriver.com>
Date: Wed, 1 Jun 2011 11:48:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1306944074.2529.107.camel@phil-desktop>	<1306944235.2529.109.camel@phil-desktop>	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
	<1306945014.2529.113.camel@phil-desktop>
In-Reply-To: <1306945014.2529.113.camel@phil-desktop>
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 16:51:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/1/11 11:16 AM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 18:11 +0200, Koen Kooi wrote:
>> Furthermore, rpm-native seems to get built even if you don't select rpm as package format!
> 
> Yeah, it's called in by package.bbclass:
> 
> # rpm is used for the per-file dependency identification
> PACKAGE_DEPENDS += "rpm-native"
> 
> As far as I can tell, the only part that actually gets used is rpmdeps
> and it does seem like there ought to be a more lightweight way of
> obtaining that one binary than building a full rpm and all its
> dependencies.

As you mentioned rpm-native is being used for two reasons.  1 if rpm target
package are selected, it's being used to build, manage and install (rootfs) the
packages.

The other place, where it's always used, is the rpmdeps calculations.

> "rpm-native" -> "bzip2-native"

Above is used as RPM needs bzip2 to compress components that end up in packages.

> "rpm-native" -> "db-native"

Back-end DB is well, Berkley DB.

> "rpm-native" -> "perl-native"

Perl could be disabled if we don't need the perl interfaces to RPM.

> "rpm-native" -> "openssl-native"

OpenSSL is used for signing if I remember correctly.

> "rpm-native" -> "expat-native"

expat is needed for some XML parsing.  (Currently only internally to RPM, but
eventually it's thought this will be used for other purposes.)

> "rpm-native" -> "autoconf-native"
> "rpm-native" -> "automake-native"
> "rpm-native" -> "libtool-native"
> "rpm-native" -> "gnu-config-native"
> "rpm-native" -> "gettext-native"

Above are needed because of configure...

> "rpm-native" -> "python-native"

If we disable python interfaces to RPM, then this can be disabled.

> "rpm-native" -> "acl-native"

ACL's are needed for some filesystem access on rootfs generation.

> "rpm-native" -> "elfutils-native"

elfutils is used for rpmdeps, among other things.

> "rpm-native" -> "libpcre-native"

this is needed for package installation and creation... it's the pattern
recognition.

> "rpm-native" -> "zlib-native"

zlib is needed, similarly to bzip2, in order to compress/extract specific items
that may end up in a package.

> "rpm-native" -> "popt-native"

popt is the command line argument processing used globally within RPM and it's
sub commands.

> "rpm-native" -> "attr-native"

attr is needed similar to the acl stuff, when constructing rootfs components.

--

So in the above, perl and python are really the only items that could be disabled.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



