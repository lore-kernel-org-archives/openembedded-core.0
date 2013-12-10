Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D2AC261056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:40:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Dec 2013 11:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="441917251"
Received: from unknown (HELO [10.255.15.207]) ([10.255.15.207])
	by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2013 11:40:54 -0800
Message-ID: <52A76E46.2010008@linux.intel.com>
Date: Tue, 10 Dec 2013 11:40:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Kai Kang <kai.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1384331128.git.kai.kang@windriver.com>
	<bb068bc66bcdbf96dd84e5cd18e1765b9a32f2cc.1384331128.git.kai.kang@windriver.com>
In-Reply-To: <bb068bc66bcdbf96dd84e5cd18e1765b9a32f2cc.1384331128.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] lsb: update directory of install_initd and remove_initd
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
X-List-Received-Date: Tue, 10 Dec 2013 19:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 12:27 AM, Kai Kang wrote:
> According to LSB specification:
>
> http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/installinitd.html
> http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/removeinitd.html
>
> commands install_initd and remove_initd should under directory /usr/lib/lsb/.
>
> lsb recipe creates these commands under directory ${libdir} which may
> expand to /usr/lib64 when multilib is enabled on qemux86-64. That will
> cause LSB command check for install_initd and remove_initd fail. So
> correct it.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/lsb/lsb_4.1.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index c80ff59..8105e59 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -79,8 +79,8 @@ do_install_append(){
>
>          # creat links for LSB test
>          install -d ${D}/${libdir}/lsb
> -       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
> -       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
> +       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
> +       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
It's arguable that this should be ${prefix}/lib since there is a 
possibly case of libdir not being /usr/lib or /usr/lib64.  It also goes 
to LSB explictly requires /usr/lib/lsb so for an LSB machine /usr/lib 
will aways exist.

I will put this in the next C-Pull.

Sau!

>          ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
>
>          if [ "${TARGET_ARCH}" = "x86_64" ];then
>

