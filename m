Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJ6LF-0007ZF-Sx
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:33:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q92HKArp000873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 10:20:10 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 2 Oct 2012 10:20:09 -0700
Message-ID: <506B224B.3090509@windriver.com>
Date: Tue, 2 Oct 2012 12:20:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349136658.15753.126.camel@ted>
In-Reply-To: <1349136658.15753.126.camel@ted>
Subject: Re: [PATCH] classes: Update to use corrected bb.utils.explode_dep_versions2 API
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
X-List-Received-Date: Tue, 02 Oct 2012 17:33:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/12 7:10 PM, Richard Purdie wrote:
> The bb.utils.explode_dep_versions function has issues where dependency information
> can be lost. The API doesn't support maintaining the correct information so this
> changes to use a new function which correctly handles the data.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
> index dc32c81..0f49936 100644
> --- a/meta/classes/libc-common.bbclass
> +++ b/meta/classes/libc-common.bbclass
> @@ -29,14 +29,7 @@ python populate_packages_prepend () {
>           d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
>           d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
>           # For backward compatibility with old -dbg package
> -
> -        def add_dep(var, dep):
> -            deps = bb.utils.explode_dep_versions(d.getVar(var + '_' + bpn, True) or "")
> -            if not dep in deps:
> -                deps[dep] = ""
> -                d.setVar(var + '_' + bpn, bb.utils.join_deps(deps, commasep=False))
> -
> -        add_dep('RPROVIDES', 'libc-dbg')
> -        add_dep('RCONFLICTS', 'libc-dbg')
> -        add_dep('RREPLACES', 'libc-dbg')
> +        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
> +        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
> +        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
>   }

The above is almost the same as the original code.  The problem with appendVar 
is that then you get duplicate entries.  With the new code, I know we won't get 
exceptions, but do we really want the duplicates?

Everything else looks good.

--Mark


