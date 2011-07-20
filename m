Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QjNbj-0007So-PD
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 05:38:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6K3XqG4013093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 20:33:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 19 Jul 2011 20:33:52 -0700
Message-ID: <4E264C9F.7060502@windriver.com>
Date: Tue, 19 Jul 2011 22:33:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311119488.git.josh@linux.intel.com>
	<2c1b7876622089db0c47848a456d9d6b0b1d6234.1311119488.git.josh@linux.intel.com>
In-Reply-To: <2c1b7876622089db0c47848a456d9d6b0b1d6234.1311119488.git.josh@linux.intel.com>
Subject: Re: [PATCH 1/1] pseudo: fix uninitialised variable in realpath_fix.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 03:38:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/19/11 6:57 PM, Joshua Lock wrote:
> Several users reported issues with pseudo on CentOS 5.x hosts, Matthew
> McClintock tracked the issue to the realpath_fix.patch and Mark Hatle
> supplied the included fix.
> 
> CC: Matthew McClintock <msm@freescale.com>
> CC: Mark Hatle <mark.hatle@windriver.com>

Ack..  this has also already been included in the upstream pseudo.. when we move
to pseudo 1.1.2 we'll get this fix.

--Mark

> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../pseudo/pseudo/realpath_fix.patch               |    2 +-
>  meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
> index 7beea51..4a107e0 100644
> --- a/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
> +++ b/meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
> @@ -65,7 +65,7 @@ index 600a918..07a4429 100644
>   
>  +static void
>  +pseudo_init_one_wrapper(pseudo_function *func) {
> -+	int (*f)(void);
> ++	int (*f)(void) = (int (*)(void)) NULL;
>  +	char *e;
>  +	if (*func->real != NULL) {
>  +		/* already initialized */
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> index f1c8e63..0a61aec 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> @@ -1,6 +1,6 @@
>  require pseudo.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://oe-config.patch \



