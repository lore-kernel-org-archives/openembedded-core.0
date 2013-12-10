Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A297060660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 04:41:32 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so6513748pde.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 20:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=oRrx41TnjrB5Royfv7Sn2JEQIHm0HQujUI3LKEdmnXU=;
	b=KelEIjOAPA+1c0KqvNQ+1g14CMt9Wlkd7C9kWV7mg6nyXEZ7yOK0Hp3IiSXI5UVasv
	FtZbIEC/kdY+K86o6WjBAxgsYTHQaSzqNSScjURlpZ0TWUTknJEUIDx+NQB7Ub/UkiYs
	oQeR1f1fF+xzfY6vvQ0aRYxIKTZXjQpIZ4AFvFRCwDFWfjL6f04M1wMt+eSXNRoM+p8I
	waBVmJwJE4oMWaOd8L0jNvdmLa530QmE7HuA7IuZhsRfsYumJozp9sLv6FT4GpKZH5JC
	FHiihAhOY3m6xLLdx4YQyAtAA06kovy/8CGO61Mz84MBzCXLILkR7KyKEZ5cWiSxk2vy
	cdAQ==
X-Gm-Message-State: ALoCoQlaKoOTBfHaW4wXvweOsCDXaVKf+9663gK+XBa4bKGgxcs0/AgB+L/otNECIm0W9OK4fySk
X-Received: by 10.68.198.97 with SMTP id jb1mr512511pbc.104.1386650492432;
	Mon, 09 Dec 2013 20:41:32 -0800 (PST)
Received: from [10.6.18.24] (c-50-186-0-160.hsd1.or.comcast.net.
	[50.186.0.160]) by mx.google.com with ESMTPSA id
	ka3sm22064703pbc.32.2013.12.09.20.41.31 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Dec 2013 20:41:31 -0800 (PST)
Message-ID: <52A69B7A.50409@intel.com>
Date: Mon, 09 Dec 2013 20:41:30 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1386078157.git.hongxu.jia@windriver.com>
	<ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
In-Reply-To: <ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/2] dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
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
X-List-Received-Date: Tue, 10 Dec 2013 04:41:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2013 05:46 AM, Hongxu Jia wrote:
> Even though '/etc' is on the readonly partition, it's possible that
> /etc/resolv.conf is on a separate writable partition.
>
> In this situation, we should make sure the temp file resolv.conf.dhclient
> on the same direcotry.
>
> [YOCTO #5624]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-connectivity/dhcp/dhcp.inc            |  1 +
>   ...ript-let-resolv.conf-and-resolv.conf.dhcl.patch | 74 ++++++++++++++++++++++

These new scripts are doing alot of out calling from the shell script, 
and can cause additional fork/execs during the critical path of system 
startup, is there any way to reduce this?

Sau!

>   2 files changed, 75 insertions(+)
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
> index ad82b57..d8376aa 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
>              file://site.h \
>   	   file://init-relay file://default-relay \
>   	   file://init-server file://default-server \
> +	   file://dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch \
>   	   file://dhclient.conf file://dhcpd.conf"
>
>   inherit autotools
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
> new file mode 100644
> index 0000000..db56f70
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
> @@ -0,0 +1,74 @@
> +dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
> +
> +Even though '/etc' is on the readonly partition, it's possible that
> +/etc/resolv.conf is on a separate writable partition.
> +
> +In this situation, we should make sure the temp file resolv.conf.dhclient
> +on the same direcotry.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + client/scripts/linux |   24 +++++++++++++-----------
> + 1 file changed, 13 insertions(+), 11 deletions(-)
> +
> +diff --git a/client/scripts/linux b/client/scripts/linux
> +index 6f8ea4b..fbc6324 100755
> +--- a/client/scripts/linux
> ++++ b/client/scripts/linux
> +@@ -27,27 +27,29 @@ ip=/sbin/ip
> +
> + make_resolv_conf() {
> +   if [ x"$new_domain_name_servers" != x ]; then
> +-    cat /dev/null > /etc/resolv.conf.dhclient
> +-    chmod 644 /etc/resolv.conf.dhclient
> ++    sysconfdir=`dirname $(readlink -f '/etc/resolv.conf')`
> ++    cat /dev/null > $sysconfdir/resolv.conf.dhclient
> ++    chmod 644 $sysconfdir/resolv.conf.dhclient
> +     if [ x"$new_domain_search" != x ]; then
> +-      echo search $new_domain_search >> /etc/resolv.conf.dhclient
> ++      echo search $new_domain_search >> $sysconfdir/esolv.conf.dhclient
> +     elif [ x"$new_domain_name" != x ]; then
> +       # Note that the DHCP 'Domain Name Option' is really just a domain
> +       # name, and that this practice of using the domain name option as
> +       # a search path is both nonstandard and deprecated.
> +-      echo search $new_domain_name >> /etc/resolv.conf.dhclient
> ++      echo search $new_domain_name >> $sysconfdir/resolv.conf.dhclient
> +     fi
> +     for nameserver in $new_domain_name_servers; do
> +-      echo nameserver $nameserver >>/etc/resolv.conf.dhclient
> ++      echo nameserver $nameserver >>$sysconfdir/resolv.conf.dhclient
> +     done
> +
> +-    mv /etc/resolv.conf.dhclient /etc/resolv.conf
> ++    mv $sysconfdir/resolv.conf.dhclient $sysconfdir/resolv.conf
> +   elif [ "x${new_dhcp6_name_servers}" != x ] ; then
> +-    cat /dev/null > /etc/resolv.conf.dhclient6
> +-    chmod 644 /etc/resolv.conf.dhclient6
> ++    sysconfdir=`dirname $(readlink -f '/etc/resolv.conf')`
> ++    cat /dev/null > $sysconfdir/resolv.conf.dhclient6
> ++    chmod 644 $sysconfdir/resolv.conf.dhclient6
> +
> +     if [ "x${new_dhcp6_domain_search}" != x ] ; then
> +-      echo search ${new_dhcp6_domain_search} >> /etc/resolv.conf.dhclient6
> ++      echo search ${new_dhcp6_domain_search} >> $sysconfdir/resolv.conf.dhclient6
> +     fi
> +     shopt -s nocasematch
> +     for nameserver in ${new_dhcp6_name_servers} ; do
> +@@ -59,11 +61,11 @@ make_resolv_conf() {
> +       else
> + 	zone_id=
> +       fi
> +-      echo nameserver ${nameserver}$zone_id >> /etc/resolv.conf.dhclient6
> ++      echo nameserver ${nameserver}$zone_id >> $sysconfdir/resolv.conf.dhclient6
> +     done
> +     shopt -u nocasematch
> +
> +-    mv /etc/resolv.conf.dhclient6 /etc/resolv.conf
> ++    mv $sysconfdir/resolv.conf.dhclient6 $sysconfdir/resolv.conf
> +   fi
> + }
> +
> +--
> +1.7.9.5
> +
>


