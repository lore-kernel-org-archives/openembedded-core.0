Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 039BD7952E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:58:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8JBwerb003691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 04:58:40 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Sep 2018 04:58:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <b4e6e29c-4fac-072e-9f6c-285fe4641a30@windriver.com>
Date: Wed, 19 Sep 2018 19:58:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 11:58:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The ptest steps:

[local.conf]
MACHINE = "qemux86-64"
IMAGE_INSTALL_append = " openssh"
DISTRO_FEATURES_append = " ptest"
EXTRA_IMAGE_FEATURES += "ptest-pkgs"
[local.conf]

$ bitbake core-image-minimal

$ runqemu qemux86-64 core-image-minimal nographic slirp

Here is the ptest result:
root@qemux86-64:~#: cd /usr/lib/openssh/ptest
root@qemux86-64:/usr/lib/openssh/ptest# ./run-ptest 2>&1 | tee log
root@qemux86-64:/usr/lib/openssh/ptest# grep PASS log | wc -l
66
root@qemux86-64:/usr/lib/openssh/ptest# grep FAIL log | wc -l
0
root@qemux86-64:/usr/lib/openssh/ptest# grep SKIP log | wc -l
7
root@qemux86-64:/usr/lib/openssh/ptest# grep SKIP log
SKIP:  (not supported on this platform)
SKIP:  for no openpty(3)
SKIP:  for no openpty(3)
SKIP:  for no openpty(3)
SKIP:  for no openpty(3)
SKIP:  (no suitable ProxyCommand found)
SKIP: agent-ptrace

//Hongxu

On 2018年09月19日 19:59, Hongxu Jia wrote:
> - Convert from tarball to git repository which support
>    openssl 1.1.x
>
> - There is no specific minor version that contains the
>    openssl fix (it was merged to master a few days agao),
>    rename recipe version to `7.8p1+git'
>
> - Fix regression test binaries missing
>    In commit `1f7aaf7 openssh: build regression test binaries', it build
>    regression test binaries, since upstream add two binaries in commits
>    `c59aca8 Create control sockets in clean temp directories' and
>    `1acc058 Disable tests where fs perms are incorrect', we should update
>    do_compile_ptest.
>
>    [ptest log]
>    |/usr/lib/openssh/ptest/regress/test-exec.sh: line 330: /usr/lib/openssh/
>    ptest/regress/mkdtemp: No such file or directory
>    [ptest log]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../openssh/{openssh_7.8p1.bb => openssh_7.8p1+git.bb}      | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>   rename meta/recipes-connectivity/openssh/{openssh_7.8p1.bb => openssh_7.8p1+git.bb} (94%)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
> similarity index 94%
> rename from meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
> index f4b295f..f54dfb5 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
> @@ -8,11 +8,10 @@ SECTION = "console/network"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
>   
> -# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
> -DEPENDS = "zlib openssl10"
> +DEPENDS = "zlib openssl"
>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   
> -SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
> +SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
>              file://sshd_config \
>              file://ssh_config \
>              file://init \
> @@ -29,8 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>   
>   PAM_SRC_URI = "file://sshd"
>   
> -SRC_URI[md5sum] = "ce1d090fa6239fd38eb989d5e983b074"
> -SRC_URI[sha256sum] = "1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca"
> +SRCREV = "cce8cbe0ed7d1ba3a575310e0b63c193326ae616"
> +
> +S = "${WORKDIR}/git"
>   
>   inherit useradd update-rc.d update-alternatives systemd
>   
> @@ -80,7 +80,8 @@ do_configure_prepend () {
>   do_compile_ptest() {
>           # skip regress/unittests/ binaries: this will silently skip
>           # unittests in run-ptests which is good because they are so slow.
> -        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat
> +        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat \
> +                   regress/check-perm regress/mkdtemp
>   }
>   
>   do_install_append () {



