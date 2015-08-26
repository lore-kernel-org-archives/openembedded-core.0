Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B935734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:52:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2015 14:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="756078910"
Received: from besquive-mobl2.zpn.intel.com ([10.219.17.159])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2015 14:52:58 -0700
Message-ID: <1440625980.15187.59.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
References: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel Corporation
Date: Wed, 26 Aug 2015 16:53:00 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Subject: Re: [PATCH] runqemu-internal: Fixes unary operator expected in new TCPSERIAL_PORTNUM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 21:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-08-26 at 09:48 -0500, Aníbal Limón wrote:
> If $TCPSERIAL_PORTNUM is empty string causes an error because
> expands the expresion to,
> 
> $TCPSERIAL_PORTNUM == "" -> == ""
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  scripts/runqemu-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index b317358..1b1bc9e 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -620,7 +620,7 @@ if [ "x$QEMUOPTIONS" = "x" ]; then
>      return 1
>  fi
>  
> -if [ $TCPSERIAL_PORTNUM != "" ]; then
> +if [ "$TCPSERIAL_PORTNUM" != "" ]; then
I believe this would work but if you want to make it bulletproof you'd:
if [ X"$TCPSERIAL_PORTNUM" != X"" ]; then
>      if [ "$MACHINE" = "qemuarm64" ]; then
>          QEMUOPTIONS="$QEMUOPTIONS -device virtio-serial-device 
> -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 
> -device virtconsole,chardev=virtcon"
>      else
> -- 
> 1.9.1
> 

