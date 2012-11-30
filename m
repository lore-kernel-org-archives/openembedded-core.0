Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1Teaio-0004UN-N2
	for Openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 01:14:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAUKAt0F029287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 12:10:55 -0800 (PST)
Received: from [172.25.32.40] (172.25.32.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 30 Nov 2012 12:10:54 -0800
Message-ID: <50B912CD.8000802@windriver.com>
Date: Fri, 30 Nov 2012 14:10:53 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: <Openembedded-core@lists.openembedded.org>
References: <1354304048-17216-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1354304048-17216-1-git-send-email-jason.wessel@windriver.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] populate_sdk_base.bbclass: make failure to find ld-linux.so a hard error
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
X-List-Received-Date: Sat, 01 Dec 2012 00:14:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/30/2012 01:34 PM, Jason Wessel wrote:
> The shell archive that populates the external SDK should fail if it
> cannot find the ld-linux.so else it will corrupt all binaries because
> a random path will be used from the list of executables when dl_path
> is empty.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
> meta/classes/populate_sdk_base.bbclass | 4 ++++
> 1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index ac34c32..73bd44d 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -176,6 +176,10 @@ done
> # fix dynamic loader paths in all ELF SDK binaries
> native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
> dl_path=$(find $native_sysroot/lib -name "ld-linux*")
> +if [ "$dl_path" = "" ] ; then
> + echo "SDK could not be set up. Relocate script to find ld-linux.so. Abort!"

Ooops   Should be.

+    echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"



>
> + exit 1
> +fi
> executable_files=$(find $native_sysroot -type f -perm +111)
> ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
> if [ $? -ne 0 ]; then


Jason.



