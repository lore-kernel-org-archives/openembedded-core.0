Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UC1Bz-0000qS-Th
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 06:10:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r234s5Hv000308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 2 Mar 2013 20:54:05 -0800 (PST)
Received: from bruce-ashfields-macbook.local (128.224.21.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sat, 2 Mar 2013 20:54:03 -0800
Message-ID: <5132D76A.7080704@windriver.com>
Date: Sat, 2 Mar 2013 23:54:02 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1362263617.11004.17.camel@ted>
In-Reply-To: <1362263617.11004.17.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemuimage-tests/dmesg: Add exception for error message on qemuarm with 3.8 kernel
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
X-List-Received-Date: Sun, 03 Mar 2013 05:10:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-03-02 5:33 PM, Richard Purdie wrote:
> With 3.8 kernels we get a harmless error message during kernel boot.
> For now we can ignore. This allows the tests to pass and ensures we
> can merge the 3.8 kernel.

Thanks Richard.

Investigation into the versatile platform 3.8 kernel changes and the
clock probe are ongoing, we'll pull this exception once we understand
exactly what is happening.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/scripts/qemuimage-tests/tools/dmesg.sh b/scripts/qemuimage-tests/tools/dmesg.sh
> index 66c0223..f0c9318 100644
> --- a/scripts/qemuimage-tests/tools/dmesg.sh
> +++ b/scripts/qemuimage-tests/tools/dmesg.sh
> @@ -13,7 +13,9 @@ if [ $? -ne 0 ]; then
>   	exit 1
>   fi
>
> -dmesg | grep -iq "error"
> +# For now, ignore mmci-pl18x errors on qemuarm which appeared
> +# from the 3.8 kernel and are harmless
> +dmesg | grep -v mmci-pl18x | grep -iq "error"
>   if [ $? -eq 0 ]; then
>   	echo "QEMU: There is some error log in dmesg:"
>   	echo "QEMU: ##### Error Log ######"
>
>



