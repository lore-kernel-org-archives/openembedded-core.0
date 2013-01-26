Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Tz24c-0006dh-A6
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 10:29:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0Q9DfvQ019139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 26 Jan 2013 01:13:41 -0800 (PST)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Sat, 26 Jan 2013 01:13:40 -0800
Message-ID: <51039E47.8090701@windriver.com>
Date: Sat, 26 Jan 2013 17:13:43 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Xin Ouyang <Xin.Ouyang@windriver.com>
References: <1359026733-1392-1-git-send-email-Xin.Ouyang@windriver.com>
In-Reply-To: <1359026733-1392-1-git-send-email-Xin.Ouyang@windriver.com>
X-TagToolbar-Keys: D20130126171343850
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r0Q9DfvQ019139
Cc: openembedded-core@www.linuxtogo.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [V2 PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Sat, 26 Jan 2013 09:29:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8824=E6=97=A5 19:25, Xin Ouyang =E5=86=99=
=E9=81=93:
> PAM modules in ${base_libdir}/security/ should be binary .so files,
> not symlinks, so fix this. Since pam_cgroup.so is installed into
> ${base_libdir}/security, move libcgroup.so.* to ${base_libdir} to
> avoid "unsafe-references-in-binaries" QA issue.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   15 +++++++++++++-=
-
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/rec=
ipes-core/libcgroup/libcgroup_0.37.1.bb
> index e74f831..d217f7b 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> @@ -23,5 +23,16 @@ FILES_cgroups-pam-plugin =3D "${base_libdir}/securit=
y/pam_cgroup.so*"
>   FILES_${PN}-dbg +=3D "${base_libdir}/security/.debug"
>   FILES_${PN}-dev +=3D "${base_libdir}/security/*.la"
>
> -# We really need the symlink so :(
> -INSANE_SKIP_cgroups-pam-plugin =3D "dev-so"
> +do_install_append() {
> +	# Moving libcgroup to base_libdir
> +	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +		mkdir -p ${D}/${base_libdir}/
> +		mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
> +		ln -sf ${D}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so

I should not use absolute path for this symlink here.

rel_lib_prefix=3D`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
ln -sf ${rel_lib_prefix}${base_libdir}/libcgroup.so.1 \
        ${D}${libdir}/libcgroup.so

V3 will be sent. Thanks.

- Pascal

> +	fi
> +	# pam modules in ${base_libdir}/security/ should be binary .so files,=
 not symlinks.
> +	if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
> +		mv -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ${D}${base_lib=
dir}/security/pam_cgroup.so
> +		rm -f ${D}${base_libdir}/security/pam_cgroup.so.*
> +	fi
> +}
>




