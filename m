Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9E3465D33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 02:00:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E20JPQ019016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 19:00:19 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 13 Apr 2014 19:00:19 -0700
Message-ID: <534B4130.3030901@windriver.com>
Date: Mon, 14 Apr 2014 10:00:16 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1397036620.git.Chong.Lu@windriver.com>
	<2e5aded6bd991ada5810d99cb6bfdc9bfe79c39b.1397036620.git.Chong.Lu@windriver.com>
In-Reply-To: <2e5aded6bd991ada5810d99cb6bfdc9bfe79c39b.1397036620.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] tar: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Mon, 14 Apr 2014 02:00:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 04/09/2014 05:44 PM, Chong Lu wrote:
> There would be an error when the TMPDIR is long/deep, for example when
> len(TMPDIR) = 410 while our supported longest value is 410:
>
>      aclocal: error: cannot open xxx
>      autoreconf: aclocal failed with exit status: 1
>      ERROR: autoreconf execution failed.
>
> Let aclocal use the relative path for the m4 file rather than the
> absolute would fix the problem.
>
> [YOCTO #6138]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-extended/tar/tar.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
> index 30a1373..75c3518 100644
> --- a/meta/recipes-extended/tar/tar.inc
> +++ b/meta/recipes-extended/tar/tar.inc
> @@ -10,6 +10,12 @@ inherit autotools gettext
>   
>   EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
>   
> +# Let aclocal use the relative path for the m4 file rather than the
> +# absolute since tar has a lot of m4 files, otherwise there might
> +# be an "Argument list too long" error when it is built in a long/deep
> +# directory.
> +acpaths = "-I ./m4"
> +
>   EXTRAINSTALL = "do_install_extra"
>   EXTRAINSTALL_class-nativesdk = ""
>   


