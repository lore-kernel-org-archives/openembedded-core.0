Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id EA65665FFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 11:44:52 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 23 Jun 2014 13:44:49 +0200
Date: Mon, 23 Jun 2014 13:44:36 +0200
From: Anders Darander <anders@chargestorm.se>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20140623114436.GA16414@ad.chargestorm.se>
Mail-Followup-To: Kai Kang <kai.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<89ff3aaad229d018851347dcda7d8c0e7cea6429.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <89ff3aaad229d018851347dcda7d8c0e7cea6429.1403490121.git.kai.kang@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] iptables: update init script and bb file
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
X-List-Received-Date: Mon, 23 Jun 2014 11:45:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Kai Kang <kai.kang@windriver.com> [140623 04:34]:
> Update path of command iptables in init script that we put it in
> /usr/sbin rather than /sbin. Then update bb file to install init script,
> configure and rules files.

These new files aren't that big, but could you anyway package at least
the rules files into a separate package? Using an RRECOMMENDS would be
fine, as I can easily add a BAD_RECOMMENDATION for that package.

It might be that I don't need/want both of iptables and ip6tables
installed; or even that I don't want either of those installed by
default.

Cheers,
Anders

> +do_install_append() {
> +	install -d -m 755 ${D}${sysconfdir}/init.d
> +	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/iptables
> +	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/ip6tables
> +	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/init.d/ip6tables
> +
> +	install -d -m 755 ${D}${sysconfdir}/sysconfig
> +	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig
> +	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig/ip6tables-config
> +	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/sysconfig/ip6tables-config
> +
> +	install -m 755 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/sysconfig/iptables
> +	install -m 755 ${WORKDIR}/ip6tables.rules ${D}${sysconfdir}/sysconfig/ip6tables
> +}
-- 
Anders Darander
ChargeStorm AB / eStorm AB

