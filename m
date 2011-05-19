Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QN8uh-00085P-7J
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 21:29:47 +0200
Received: by wwb17 with SMTP id 17so2711431wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:26:40 -0700 (PDT)
Received: by 10.216.82.68 with SMTP id n46mr3380676wee.57.1305833200285;
	Thu, 19 May 2011 12:26:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d54sm1469433wej.34.2011.05.19.12.26.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 12:26:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <542b82da52bc72f47b44ef0cd1b12019d59de457.1305756950.git.sgw@linux.intel.com>
Date: Thu, 19 May 2011 21:26:33 +0200
Message-Id: <3139507C-9A23-45DE-811A-151A1B46341C@dominion.thruhere.net>
References: <cover.1305756950.git.sgw@linux.intel.com>
	<542b82da52bc72f47b44ef0cd1b12019d59de457.1305756950.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 11/30] utils.bbclass: modify create_wrapper to correctly follow symlinks
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
X-List-Received-Date: Thu, 19 May 2011 19:29:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

RP already put this one in.

Op 19 mei 2011, om 21:19 heeft Saul Wold het volgende geschreven:

> This ensures you look up the symbolic link to get the full path
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/utils.bbclass |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 6bcaf86..1965d2f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -312,7 +312,8 @@ create_wrapper () {
>    cmdname=`basename $cmd`.real
>    cat <<END >$cmd
> #!/bin/sh
> -exec env $@ \`dirname \$0\`/$cmdname "\$@"
> +realpath=\`readlink -fn \$0\`
> +exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
> END
>    chmod +x $cmd
> }
> -- 
> 1.7.3.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



