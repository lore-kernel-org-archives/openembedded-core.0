Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05B3F6BA1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:56:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBDFu7NN022535
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:56:07 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Dec 2013 07:56:07 -0800
Message-ID: <52AB2E16.5070905@windriver.com>
Date: Fri, 13 Dec 2013 09:56:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
In-Reply-To: <6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 15:56:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/13, 8:56 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This is needed by systemd, among other useful applications. All fields are
> metadata driven, and initial values come from our DISTRO variables.

I thought there was a part of the lsb-release recipe that did this same thing.

It doesn't set the 'os-release' file, but the 'lsb-release' file.  Maybe it 
would make sense to consolidate this stuff into a base-file-...

--Mark

> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>   meta/recipes-core/os-release/os-release.bb | 42 ++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 meta/recipes-core/os-release/os-release.bb
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> new file mode 100644
> index 0000000..0f67597
> --- /dev/null
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -0,0 +1,42 @@
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
> +# Other valid fields: BUILD_ID ANSI_COLOR CPE_NAME HOME_URL SUPPORT_URL BUG_REPORT_URL
> +OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
> +
> +export ID = "${DISTRO}"
> +export NAME = "${DISTRO_NAME}"
> +export VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
> +export VERSION_ID = "${DISTRO_VERSION}"
> +export PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
> +
> +export BUILD_ID ?= "${DATETIME}"
> +export ID_LIKE
> +export ANSI_COLOR
> +export CPE_NAME
> +export HOME_URL
> +export SUPPORT_URL
> +export BUG_REPORT_URL
> +
> +do_compile () {
> +    for field in ${OS_RELEASE_FIELDS}; do
> +        if eval "test -n \"\$$field\""; then
> +            eval "printf \"%s=%s\n\" \"\$field\" \"\$$field\""
> +        fi
> +    done >os-release
> +}
> +do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> +
> +do_install () {
> +    install -d ${D}${sysconfdir}
> +    install -m 0644 os-release ${D}${sysconfdir}/
> +}
>


