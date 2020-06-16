Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.278.1592266567394574780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 17:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05G0FCiX009077
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Jun 2020 17:15:34 -0700
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 17:15:04 -0700
Subject: Re: [OE-core] [PATCH] iptables: fix invalid symbolic link for ip6tables-apply
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200615013448.16426-1-yi.zhao@windriver.com>
 <cdb0222a8a424d3f9f6a2e27a9dac270@XBOX03.axis.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <8d883061-1aec-221e-9db8-b91e9e413745@windriver.com>
Date: Tue, 16 Jun 2020 08:14:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cdb0222a8a424d3f9f6a2e27a9dac270@XBOX03.axis.com>
X-Originating-IP: [128.224.162.174]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05G0FCiX009077
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 6/15/20 9:30 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yi Zhao
>> Sent: den 15 juni 2020 03:35
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] iptables: fix invalid symbolic link for
>> ip6tables-apply
>>
>> The iptables-apply is not installed which makes ip6tables-apply as an
>> invalid symbolic link:
>>
>> $ ls -l /usr/sbin/ip6tables-apply
>> lrwxrwxrwx 1 root root 14 Jun 11 08:27 /usr/sbin/ip6tables-apply ->
>> iptables-apply
>> $ ls -l /usr/sbin/iptables-apply
>> ls: cannot access '/usr/sbin/iptables-apply': No such file or director=
y
>>
>> Backport a patch to fix the issue.
>> Also add bash as runtime dependency to fix QA error:
>>
>> ERROR: iptables-1.8.5-r0 do_package_qa: QA Issue:
>> /usr/sbin/iptables-apply contained in package iptables requires
>> /bin/bash, but no providers found in RDEPENDS_iptables? [file-rdeps]
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...iptables-apply-not-getting-installed.patch | 45 +++++++++++++++++=
++
>>   .../iptables/iptables_1.8.5.bb                |  3 +-
>>   2 files changed, 47 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-extended/iptables/iptables/0001-buil=
d-
>> resolve-iptables-apply-not-getting-installed.patch
>>
>> diff --git a/meta/recipes-extended/iptables/iptables/0001-build-resolv=
e-
>> iptables-apply-not-getting-installed.patch b/meta/recipes-
>> extended/iptables/iptables/0001-build-resolve-iptables-apply-not-getti=
ng-
>> installed.patch
>> new file mode 100644
>> index 0000000000..51ed66ed24
>> --- /dev/null
>> +++ b/meta/recipes-extended/iptables/iptables/0001-build-resolve-
>> iptables-apply-not-getting-installed.patch
>> @@ -0,0 +1,45 @@
>> +From d4ed0c741fc789bb09d977d74d30875fdd50d08b Mon Sep 17 00:00:00 200=
1
>> +From: Jan Engelhardt <jengelh@inai.de>
>> +Date: Wed, 3 Jun 2020 15:38:48 +0200
>> +Subject: [PATCH] build: resolve iptables-apply not getting installed
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +ip6tables-apply gets installed but iptables-apply does not.
>> +That is wrong.
>> +
>> +=C2=BB make install DESTDIR=3D$PWD/r
>> +=C2=BB find r -name "*app*"
>> +r/usr/local/sbin/ip6tables-apply
>> +r/usr/local/share/man/man8/iptables-apply.8
>> +r/usr/local/share/man/man8/ip6tables-apply.8
>> +
>> +Fixes: v1.8.5~87
>> +Signed-off-by: Jan Engelhardt <jengelh@inai.de>
>> +Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
>> +
>> +Upstream-Status: Backport
>> +[https://git.netfilter.org/iptables/commit/?id=3Dd4ed0c741fc789bb09d9=
77d74d30875fdd50d08b]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + iptables/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/iptables/Makefile.am b/iptables/Makefile.am
>> +index dc66b3cc..2024dbf5 100644
>> +--- a/iptables/Makefile.am
>> ++++ b/iptables/Makefile.am
>> +@@ -56,7 +56,7 @@ man_MANS         =3D iptables.8 iptables-restore.8 =
iptables-save.8 \
>> +                    ip6tables-save.8 iptables-extensions.8 \
>> +                    iptables-apply.8 ip6tables-apply.8
>> +
>> +-sbin_SCRIPT      =3D iptables-apply
>> ++sbin_SCRIPTS     =3D iptables-apply
>> +
>> + if ENABLE_NFTABLES
>> + man_MANS	+=3D xtables-nft.8 xtables-translate.8 xtables-legacy.8 \
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-extended/iptables/iptables_1.8.5.bb b/meta/r=
ecipes-extended/iptables/iptables_1.8.5.bb
>> index fa1e5c229d..4cb0acf960 100644
>> --- a/meta/recipes-extended/iptables/iptables_1.8.5.bb
>> +++ b/meta/recipes-extended/iptables/iptables_1.8.5.bb
>> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \
>>   SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-$=
{PV}.tar.bz2 \
>>              file://0001-configure-Add-option-to-enable-disable-libnfn=
etlink.patch \
>>              file://0002-configure.ac-only-check-conntrack-when-libnfn=
etlink-enabled.patch \
>> +           file://0001-build-resolve-iptables-apply-not-getting-insta=
lled.patch \
>>              file://iptables.service \
>>              file://iptables.rules \
>>              file://ip6tables.service \
>> @@ -77,7 +78,7 @@ python populate_packages_prepend() {
>>           d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
>>   }
>>
>> -RDEPENDS_${PN} =3D "${PN}-module-xt-standard"
>> +RDEPENDS_${PN} =3D "${PN}-module-xt-standard bash"
> We do not want iptables to depend on bash. Either modify the
> iptables-apply script so that it does not require bash, or move
> it (and the ip6tables-apply link) to a separate package (e.g.,
> iptables-apply), which can then depend on bash.


Thanks, Peter. I will send V2.


//Yi


>
>>   RRECOMMENDS_${PN} =3D " \
>>       ${PN}-modules \
>>       kernel-module-x-tables \
>> --
>> 2.17.1
> //Peter
>
