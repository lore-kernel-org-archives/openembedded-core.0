Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9F3773AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 15:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u52FubYG016616; Thu, 2 Jun 2016 16:56:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IBtu2JzOugU8; Thu,  2 Jun 2016 16:56:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u52FuXFN016612
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 16:56:34 +0100
Message-ID: <1464882993.13979.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Bradford <andrew@bradfordembedded.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2016 16:56:33 +0100
In-Reply-To: <1464205571-26293-3-git-send-email-andrew@bradfordembedded.com>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
	<1464205571-26293-3-git-send-email-andrew@bradfordembedded.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: Re: [PATCH 2/3] bitbake.conf: Add P4DIR and FETCHCMD_p4
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
X-List-Received-Date: Thu, 02 Jun 2016 15:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 15:46 -0400, Andrew Bradford wrote:
> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> So that perforce fetching can work more like the other source control
> system fetchers.
> 
> Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
> ---
>  meta/conf/bitbake.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index acef30b..1aa1d37 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -339,6 +339,7 @@ SVNDIR = "${CO_DIR}/svn"
>  GITDIR = "${CO_DIR}/git2"
>  BZRDIR = "${CO_DIR}/bzr"
>  HGDIR = "${CO_DIR}/hg"
> +P4DIR = "${CO_DIR}/p4"
>  
>  STAMPS_DIR ?= "${TMPDIR}/stamps"
>  STAMP =
> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> @@ -618,6 +619,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
>  FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no
> -check-certificate"
>  FETCHCMD_bzr = "/usr/bin/env bzr"
>  FETCHCMD_hg = "/usr/bin/env hg"
> +FETCHCMD_p4 = "/usr/bin/env p4"

I've kind of been hoping we could move to a model where the fetcher has
sane defaults and we don't need to change anything in bitbake.conf
unless the user has some need to customise.

The FETCHCMD is easy to do that for, the P4DIR is slightly harder since
it means teaching the fetcher about CO_DIR which bitbake currently
knows nothing about. It may be worth dropping the notion of CO_DIR and
making the default ${DL_DIR}/p4 which bitbake does know about and
making the other fetchers match which such defaults?

Cheers,

Richard

