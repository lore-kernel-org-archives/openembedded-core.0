Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F07A65EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 14:19:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s71EJxKS022569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 07:19:59 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 07:19:59 -0700
Message-ID: <53DBA20E.8040709@windriver.com>
Date: Fri, 1 Aug 2014 09:19:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406899001-3870-1-git-send-email-sujith.h@gmail.com>
In-Reply-To: <1406899001-3870-1-git-send-email-sujith.h@gmail.com>
Subject: Re: [PATCH] os-release: Adding a new recipe for operating system identification
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
X-List-Received-Date: Fri, 01 Aug 2014 14:20:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

While not exactly the same thing, there is a similar file being generated when 
LSB is enabled.  It can be used outside of the LSB configuration as well.

The recipe is simply 'lsb'.  It provides some basic initscript functions 
(required by the lsb) as well as the /etc/lsb-release file which is pretty close 
to the output below.

I have wondered in the past if we should add a similar file to what the LSB or 
below is doing to 'base-files'.

--Mark

On 8/1/14, 8:16 AM, Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> The /etc/os-release will have the operating system identification data.
> Tested on target with systemd enabled. Here is the sample file looks
> in the file:
>
> ID=poky-ivi-systemd
> NAME=Yocto GENIVI Baseline (Poky/meta-ivi)
> VERSION=6.0+snapshot-20140721 (daisy)
> VERSION_ID=6.0+snapshot-20140721
> PRETTY_NAME=Yocto GENIVI Baseline (Poky/meta-ivi) 6.0+snapshot-20140721 (daisy)
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>   meta/recipes-core/os-release/os-release.bb | 36 ++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 meta/recipes-core/os-release/os-release.bb
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> new file mode 100644
> index 0000000..33e9581
> --- /dev/null
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -0,0 +1,36 @@
> +inherit allarch
> +
> +SUMMARY = "Operating system identification"
> +DESCRIPTION = "The /etc/os-release file contains operating system identification data."
> +LICENSE = "MIT"
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +
> +# Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
> +#                     HOME_URL SUPPORT_URL BUG_REPORT_URL
> +OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
> +
> +ID = "${DISTRO}"
> +NAME = "${DISTRO_NAME}"
> +VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
> +VERSION_ID = "${DISTRO_VERSION}"
> +PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
> +BUILD_ID ?= "${DATETIME}"
> +
> +python do_compile () {
> +    with open(d.expand('${B}/os-release'), 'w') as f:
> +        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
> +            value = d.getVar(field, True)
> +            if value:
> +                f.write('{0}={1}\n'.format(field, value))
> +}
> +do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> +
> +do_install () {
> +    install -d ${D}${sysconfdir}
> +    install -m 0644 os-release ${D}${sysconfdir}/
> +}
>


