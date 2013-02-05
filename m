Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2sXi-0007NE-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:07:17 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so898109oag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 15:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zMa+KDYTLRjX8GrF4S6pEZExq9BF/pcn4TQH3NBgQvc=;
	b=NnJRJDyG+/lIS/A/GT9I88XhfJ8E9McGIajxImEA1s44232rSZ74eGvLpYl2HL8aOZ
	o6EmVXDgDPD6d7znkkEkEZnwkpgeS4afjPT8ud0Fs0YNdegtULU85xDFVLUkcx1oRuyJ
	fDDvoDOVJA5okR/M+26XfXDxlJA9vLgX3B8iyTEBC5r7C9SquyGGu/msEqXhvHtoXgeb
	JeS2EGPhN09RB6ebw2hclKbggLtdJ/CSauq6zR3OymD3h9L1RJShRnbyO0tcHkqYtUZ3
	NKPC9x7basSicLagDJ6zA+miz5TjEz4LFPxJwoMDVfg7rMGqym+4t/qXuMhCZaAsFPIU
	yUlQ==
MIME-Version: 1.0
X-Received: by 10.182.26.114 with SMTP id k18mr19831141obg.94.1360108283383;
	Tue, 05 Feb 2013 15:51:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 15:51:23 -0800 (PST)
In-Reply-To: <8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
Date: Tue, 5 Feb 2013 21:51:23 -0200
X-Google-Sender-Auth: gKCxPiSbAHYZc0GMpowYTu_vWag
Message-ID: <CAP9ODKqbiwpfwfFFXHKB7h0jsTgrtBgExYtydq=SdmyxjjBBMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] oe-git-proxy: Add a new comprehensive git proxy script
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
X-List-Received-Date: Wed, 06 Feb 2013 00:07:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
> ALL_PROXY to determine the proxy server, protocol, and port. It uses
> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
> known to work with both bash and dash shells.
>
> V2: Implement recommendations by Enrico Scholz:
>     o Use exec for the nc calls
>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
>     o Use bash explicitly and simplify some of the string manipulations
>     Also:
>     o Drop the .sh in the name per Otavio Salvador
>     o Remove a stray debug statement
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  scripts/oe-git-proxy |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 124 insertions(+), 0 deletions(-)
>  create mode 100755 scripts/oe-git-proxy
>
> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
> new file mode 100755
> index 0000000..4f1871a
> --- /dev/null
> +++ b/scripts/oe-git-proxy
> @@ -0,0 +1,124 @@
> +#!/bin/bash
> +
> +# oe-git-proxy.sh is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat

Please fix the script name.

> +# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
> +# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
> +# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR masks
> +# (192.168.1.0/24). It is known to work with both bash and dash shells.
> +#
> +# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
> +#
> +# Example ALL_PROXY values:
> +# ALL_PROXY=socks://socks.example.com:1080
> +# ALL_PROXY=https://proxy.example.com:8080
> +#
> +# Copyright (c) 2013, Intel Corporation.
> +# All rights reserved.

And please add a clear license here.

> +# AUTHORS
> +# Darren Hart <dvhart@linux.intel.com>
> +
> +# Locate the netcat binary
> +NC=$(which nc 2>/dev/null)
> +if [ $? -ne 0 ]; then
> +       echo "ERROR: nc binary not in PATH"
> +       exit 1
> +fi
> +METHOD=""
> +
> +# Test for a valid IPV4 quad with optional bitmask
> +valid_ipv4() {
> +       echo $1 | egrep -q "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}(/(3[0-2]|[1-2]?[0-9]))?$"
> +       return $?
> +}
> +
> +# Convert an IPV4 address into a 32bit integer
> +ipv4_val() {
> +       IP="$1"
> +       SHIFT=24
> +       VAL=0
> +       for B in ${IP//./ }; do
> +               VAL=$(($VAL+$(($B<<$SHIFT))))
> +               SHIFT=$(($SHIFT-8))
> +       done
> +       echo "$VAL"
> +}
> +
> +# Determine if two IPs are equivalent, or if the CIDR contains the IP
> +match_ipv4() {
> +       CIDR=$1
> +       IP=$2
> +
> +       if [ -z "${IP%%$CIDR}" ]; then
> +               return 0
> +       fi
> +
> +       # Determine the mask bitlength
> +       BITS=${CIDR##*/}
> +       if [ -z "$BITS" ]; then
> +               return 1
> +       fi
> +
> +       IPVAL=$(ipv4_val $IP)
> +       IP2VAL=$(ipv4_val ${CIDR%%/*})
> +
> +       # OR in the unmasked bits
> +       for i in $(seq 0 $((32-$BITS))); do
> +               IP2VAL=$(($IP2VAL|$((1<<$i))))
> +               IPVAL=$(($IPVAL|$((1<<$i))))
> +       done
> +
> +       if [ $IPVAL -eq $IP2VAL ]; then
> +               return 0
> +       fi
> +       return 1
> +}
> +
> +# Test to see if GLOB matches HOST
> +match_host() {
> +       HOST=$1
> +       GLOB=$2
> +
> +       if [ -z "${HOST%%$GLOB}" ]; then
> +               return 0
> +       fi
> +
> +       # Match by netmask
> +       if valid_ipv4 $GLOB; then
> +               HOST_IP=$(gethostip -d $HOST)
> +               if valid_ipv4 $HOST_IP; then
> +                       match_ipv4 $GLOB $HOST_IP
> +                       if [ $? -eq 0 ]; then
> +                               return 0
> +                       fi
> +               fi
> +       fi
> +
> +       return 1
> +}
> +
> +# If no proxy is set, just connect directly
> +if [ -z "$ALL_PROXY" ]; then
> +       exec $NC -X connect "$@"
> +fi
> +
> +# Connect directly to hosts in NO_PROXY
> +for H in ${NO_PROXY//,/ }; do
> +       if match_host $1 $H; then
> +               METHOD="-X connect"
> +               break
> +       fi
> +done
> +
> +if [ -z "$METHOD" ]; then
> +       # strip the protocol and the trailing slash
> +       PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
> +       PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*:[0-9]*\).*/\1/')
> +       if [ "$PROTO" = "socks" ]; then
> +               METHOD="-X 5 -x $PROXY"
> +       elif [ "$PROTO" = "https" ]; then
> +               METHOD="-X connect -x $PROXY"
> +       fi
> +fi
> +
> +exec $NC $METHOD "$@"
> --
> 1.7.5.4
>



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


