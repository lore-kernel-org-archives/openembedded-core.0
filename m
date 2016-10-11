Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 91767719B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9175831A58A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:41:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Hh6LdFyL8yE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:41:24 +0200 (CEST)
Received: from [172.22.22.61] (55d44b53.access.ecotel.net [85.212.75.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DB18631A582E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:41:23 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
Date: Tue, 11 Oct 2016 09:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Tue, 11 Oct 2016 07:41:29 -0000
X-Groupsio-MsgNum: 88046
Content-Type: multipart/mixed; boundary="------------D7769513CF7A67AEB31FA5B0"

--------------D7769513CF7A67AEB31FA5B0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Dear Jagadeesh,

On 10.10.2016 19:35, Jagadeesh Krishnanjanappa wrote:
> Following are the drawbacks with the current logic:
> 1. If ip=dhcp in the boot command line, then the
> current code makes connman to ignore "eth0" network interface
> from managing internet connections. This can cause NFS boot
> failure, if the network interface used for NFS booting 
> is other than "eth0".
> 
> 2. If ip=bootp in the boot command line, then none of the
> network interfaces are ignored. This makes connman to manage
> internet connections on every active network interfaces
> (including the network interface used for NFS booting), resulting
> hang during NFS boot.
> 
> This patch finds the network interface used for NFS booting via dmesg.
> It searches for "device=" string from dmesg output and finds
> name of network interface used for NFS. The "device=" string
> is printed from dmesg, if IPCONFIG_SILENT macro is disabled
> in the kernel, and this macro is disabled by default.
> 
> If "device=" string is not found, then falls back to earlier logic.
> The earlier logic of detecting NFS network interface is retained, as
> we cannot determine the exact network interface name used during
> NFS bootup.

I think this is too fragile to land in OE-Core. What happens if a
network driver prints "device=eth0"? Or if other kernel messages make
the string disappear from dmesg and connman gets restarted later?

FWIW, I'm attaching my current wrapper script for connmand. I don't
think it's perfect, but at least it doesn't depend on any init manager
and works across restarts.

Add these lines to connman's do_install, in case you'd like to test
and/or submit it:

mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
install -m 755 ${WORKDIR}/connmand-nfsroot.in ${D}${sbindir}/connmand
sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand

Regards,
Andreas

> 
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  meta/recipes-connectivity/connman/connman/connman | 35 +++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
> index c64fa0d..aae2ca6 100644
> --- a/meta/recipes-connectivity/connman/connman/connman
> +++ b/meta/recipes-connectivity/connman/connman/connman
> @@ -29,23 +29,28 @@ done
>  do_start() {
>  	EXTRA_PARAM=""
>  	if test $nfsroot -eq 1 ; then
> -	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
> -	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
> +	    ethn_from_dmesg=`dmesg | grep "device="| sed "s|\(.*\)device=\(.*\), hwaddr=\(.*\)|\2|g"`
> +	    if [ ! -z "$ethn_from_dmesg" ]; then
> +		EXTRA_PARAM="-I $ethn_from_dmesg"
> +	    else
> +		NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
> +		NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
>  
> -	    if [ ! -z "$NET_ADDR" ]; then
> -		if [ "$NET_ADDR" = dhcp ]; then
> -		    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
> -		    if [ ! -z "$ethn" ]; then
> -			EXTRA_PARAM="-I $ethn"
> -		    fi
> -		else
> -		    for i in $NET_DEVS; do
> -			ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> -			if [ "$NET_ADDR" = "$ADDR" ]; then
> -			    EXTRA_PARAM="-I $i"
> -			    break
> +		if [ ! -z "$NET_ADDR" ]; then
> +		    if [ "$NET_ADDR" = dhcp ]; then
> +			ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
> +			if [ ! -z "$ethn" ]; then
> +			    EXTRA_PARAM="-I $ethn"
>  			fi
> -		    done
> +		    else
> +			for i in $NET_DEVS; do
> +			    ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> +			    if [ "$NET_ADDR" = "$ADDR" ]; then
> +				EXTRA_PARAM="-I $i"
> +				break
> +			    fi
> +			done
> +		    fi
>  		fi
>  	    fi
>  	fi
> 


--------------D7769513CF7A67AEB31FA5B0
Content-Type: text/plain; charset=UTF-8;
 name="connmand-nfsroot.in"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="connmand-nfsroot.in"

#!/bin/sh
#
# Copyright (c) 2016 Dream Property GmbH, Germany
#                    http://www.dream-multimedia-tv.de/
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

parse_cmdline() {
	local ip=
	local nfsroot=
	local root=
	local options=

	set -- $(cat /proc/cmdline)
	for arg do
		key=${arg%%=*}
		if [ "$arg" = "$key" ]; then
			val=
		else
			val=${arg#*=}
		fi
		case "$key" in
			ip)
				ip=${val%%:*}
				;;
			nfsroot)
				nfsroot=$val
				;;
			root)
				root=$val
				;;
		esac
	done

	if [ "$root" = "/dev/nfs" -o -n "$nfsroot" -a -n "$ip" ]; then
		set -- $(ip -4 -o addr show | awk '{print $2}')
		for dev do
			if ip -o link show $dev | awk '{print $3}' | grep -qvw -e 'LOOPBACK' -e 'NO-CARRIER'; then
				case "$ip" in
					any|bootp|both|dhcp|on|rarp)
						options="-I $dev $options"
						;;
					*)
						for dev_addr in $(ip -4 -o addr show dev $dev | awk '{print $4}' | grep -o '^[0-9.]\+'); do
							if [ "$ip" = "$dev_addr" ]; then
								options="-I $dev"
								break
							fi
						done
						;;
				esac
			fi
		done
	fi

	echo "$options"
}

nfsroot_options() {
	if [ ! -f /run/connman/nfsroot.env ]; then
		mkdir -p /run/connman
		parse_cmdline >/run/connman/nfsroot.env
	fi

	cat /run/connman/nfsroot.env
}

exec "@sbindir@/connmand.real" "$@" $(nfsroot_options)

--------------D7769513CF7A67AEB31FA5B0--
