Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TxgiE-0004yG-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 17:28:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0MGD8uH026657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 08:13:08 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 08:13:06 -0800
Message-ID: <50FEBA91.7060804@windriver.com>
Date: Tue, 22 Jan 2013 10:13:05 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1358857085-16549-1-git-send-email-wd@denx.de>
In-Reply-To: <1358857085-16549-1-git-send-email-wd@denx.de>
Subject: Re: [PATCH] populate_sdk_base.bbclass: Allow installation of ix86 SDK on x86_64 host
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
X-List-Received-Date: Tue, 22 Jan 2013 16:28:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/13 6:18 AM, Wolfgang Denk wrote:
> Commit c04f5435 "populate_sdk_base.bbclass: use SDK_ARCH instead
> of SDKMACHINE" prevents not only the installation of 64 bit SDK
> configurations on 32 bit hosts (which indeed cannot work), but also
> the legitimate installation of a 32 bit SDK on a 64 bit host.
>
> Fix this.
>
> While there, also make sure we use the same patterns ("i[3-6]86" resp.
> "x86[-_]64" to get unified strings for both INST_ARCH and SDK_ARCH.

As far as I am aware, this is intentional.  For various SDK items 
pseudo/libpseudo may be used.  On a 32-bit SDK, only a 32-bit pseudo/libpseudo 
is available.  This will prevent it from working with any host system binaries 
that are x86_64.

If you don't care, the "workaround" is to use setarch and install it by telling 
the system you are an ix86 target.

--Mark

> Signed-off-by: Wolfgang Denk <wd@denx.de>
> ---
>   meta/classes/populate_sdk_base.bbclass | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index da846b4..c587af8 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -122,11 +122,14 @@ fakeroot create_shar() {
>   #!/bin/bash
>
>   INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
> -SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[5-6]86/ix86/")
> +SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>
>   if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
> -	echo "Error: Installation machine not supported!"
> -	exit 1
> +	# Allow for installation of ix86 SDK on x86_64 host
> +	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
> +		echo "Error: Installation machine not supported!"
> +		exit 1
> +	fi
>   fi
>
>   DEFAULT_INSTALL_DIR="${SDKPATH}"
>



