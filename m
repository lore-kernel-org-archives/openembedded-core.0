Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UD3lR-0002no-Tm
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 03:07:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r261oxV4000730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 17:50:59 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 5 Mar 2013 17:50:58 -0800
Message-ID: <5136A166.4010501@windriver.com>
Date: Wed, 6 Mar 2013 09:52:38 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
	<0e45eb2f773f3985d6cc47e78775a26271806b30.1361866257.git.kai.kang@windriver.com>
In-Reply-To: <0e45eb2f773f3985d6cc47e78775a26271806b30.1361866257.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r261oxV4000730
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rpm: save output of postinstall scripts when image first boot
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
X-List-Received-Date: Wed, 06 Mar 2013 02:07:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B402=E6=9C=8826=E6=97=A5 16:14, Kang Kai wrote:
> When image feature "debug-tweaks" is enabled, save output of post
> install script to log file which can be configured when image first
> boot.
>
> [YOCTO #3223]
>
> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devt=
ools/rpm/rpm_5.4.9.bb
> index 0b014b6..cdfb5ff 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -223,6 +223,7 @@ FILES_${PN} =3D  "${bindir}/rpm \
>   		${libdir}/rpm/bin/wget \
>   		/var/lib/rpm \
>   		/var/cache/rpm \
> +		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \

Previous(4/5) patch has been merged to master but this one not, the=20
bitbake complains:

WARNING: QA Issue: rpm: Files/directories were installed but not shipped
/etc
/etc/rcS.d
/etc/rcS.d/S98run-postinsts

This line should be split to the previous(4/5) patch. When this patch=20
merged, the warning will disappear.

Sorry for this trouble,
Kai

>   		"
>
>   FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
> @@ -374,6 +375,9 @@ do_configure() {
>   #
>   POSTINSTALL_INITPOSITION ?=3D "98"
>
> +POSTLOG ?=3D "/var/log/postinstall.log"
> +REDIRECT_CMD =3D "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '=
>>${POSTLOG} 2>&1', '', d)}"
> +
>   do_install_append() {
>   	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/ma=
cros
>   	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${=
libdir}/rpm/macros
> @@ -459,7 +463,7 @@ do_install_append() {
>   for i in \`ls /etc/rpm-postinsts/\`; do
>   	i=3D/etc/rpm-postinsts/$i
>   	echo "Running postinst $i..."
> -	if [ -f $i ]&&  $i; then
> +	if [ -f $i ]&&  $i ${REDIRECT_CMD}; then
>   		rm $i
>   	else
>   		echo "ERROR: postinst $i failed."



