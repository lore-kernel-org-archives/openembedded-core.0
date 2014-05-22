Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 1847 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 May 2014 02:13:33 UTC
Received: from gatekeeper.tait.co.nz (unknown [202.37.96.11])
	by mail.openembedded.org (Postfix) with SMTP id DCBBD60E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 02:13:33 +0000 (UTC)
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 042F146753
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 13:42:47 +1200 (NZST)
Received: from [172.16.182.9] (unknown [172.16.182.9])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id E683D46752
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 13:42:26 +1200 (NZST)
Message-ID: <537D55FE.8090603@taitradio.com>
Date: Thu, 22 May 2014 13:42:22 +1200
From: Douglas Royds <douglas.royds@taitradio.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1400482838-7751-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1400482838-7751-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] openssl: fix for CVE-2010-5298
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
X-List-Received-Date: Thu, 22 May 2014 02:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/14 19:00, rongqing.li@windriver.com wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
> through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
> attackers to inject data across sessions or cause a denial of service
> (use-after-free and parsing error) via an SSL connection in a
> multithreaded environment.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |   24 ++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
> new file mode 100644
> index 0000000..417a774
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
> @@ -0,0 +1,24 @@
> +openssl fix for CVE-2010-5298
> +
> +Upstream-Status: Backport
> +
> +Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
> +through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
> +attackers to inject data across sessions or cause a denial of service
> +(use-after-free and parsing error) via an SSL connection in a
> +multithreaded environment.
> +
> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
> +
> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> +--- a/ssl/s3_pkt.c
> ++++ b/ssl/s3_pkt.c
> +@@ -1013,7 +1013,7 @@ start:
> + 				{
> + 				s->rstate=SSL_ST_READ_HEADER;
> + 				rr->off=0;
> +-				if (s->mode & SSL_MODE_RELEASE_BUFFERS)
> ++				if (s->mode & SSL_MODE_RELEASE_BUFFERS && s->s3->rbuf.left == 0)
> + 					ssl3_release_read_buffer(s);
> + 				}
> + 			}

This patch file appears to be orphaned in openssl-1.0.1e/, when the 
current version is 1.0.1g.

Also, there is no file://openssl-CVE-2010-5298.patch entry in the SRC_URI.

Was this deliberate? Am I missing something?

