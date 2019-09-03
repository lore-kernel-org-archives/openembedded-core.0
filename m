Return-Path: <henning.schild@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id CB32F7F35F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:24:28 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x83COTNN031162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 14:24:29 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83COTL8014075;
	Tue, 3 Sep 2019 14:24:29 +0200
Date: Tue, 3 Sep 2019 14:24:27 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20190903142427.5080fc71@md1za8fc.ad001.siemens.net>
In-Reply-To: <20190903122224.18634-1-henning.schild@siemens.com>
References: <20190903122224.18634-1-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH 1/6] oe-git-proxy: allow setting SOCAT from outside
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
X-List-Received-Date: Tue, 03 Sep 2019 12:24:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This series fixes several issues in oe-git-proxy, mostly related to
matching NO_PROXY entries.

Patch 2 introduces a test that will actually fail until all other
patches are applied. If that is a problem and every commit should be
testable, Patch2 needs to be moved to then end.

Let me know what you think

Henning

Am Tue, 3 Sep 2019 14:22:19 +0200
schrieb Henning Schild <henning.schild@siemens.com>:

> From: Henning Schild <henning.schild@siemens.com>
> 
> This allows to write selftests where we can mock the real socat.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  scripts/oe-git-proxy | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
> index bb2ed2a46e..8499a99a71 100755
> --- a/scripts/oe-git-proxy
> +++ b/scripts/oe-git-proxy
> @@ -41,10 +41,12 @@ if [ $# -lt 2 -o "$1" = '--help' -o "$1" =
> '-h' ] ; then fi
>  
>  # Locate the netcat binary
> -SOCAT=$(which socat 2>/dev/null)
> -if [ $? -ne 0 ]; then
> -	echo "ERROR: socat binary not in PATH" 1>&2
> -	exit 1
> +if [ -z "$SOCAT" ]; then
> +	SOCAT=$(which socat 2>/dev/null)
> +	if [ $? -ne 0 ]; then
> +		echo "ERROR: socat binary not in PATH" 1>&2
> +		exit 1
> +	fi
>  fi
>  METHOD=""
>  


