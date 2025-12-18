Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1E8D68BD9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 04:21:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33854.1766031695932848385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 20:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fZHdloHU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WqEvv8cC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1ZjUE2016404
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12Jla0pU+ukQ+eDxdEzPskkuaIpyyVpK1o7t7CK5egQ=; b=fZHdloHUatl74no2
	7qAeAYtjwZoL2L0g3jdhgaQ0Y2suVL/ooVlqHK9rm2AkTQLD8fDxv5UYLRNG4YrB
	j+BctxrP8x2yi2i7dzecU9c119g1+6PRIX3bs5DRdHqVXvVyvsou1f71RvxKHNBS
	x+1QJeJAcZV/mHKeVCBQxai//RZ0PdOu/nCCzb6TamT5jsCRWvcb8nElQ/dAy8D1
	SRBgmZufwJdUyc+Xk7u+65NB537yjK9KIHUb9VB6KqTvWh88s/2lb7MtIseSEBym
	d9iOEfiec5OTfzYxXtUElOaOPjLPuH98SNeOQxen7G9XvOSIrswMJun/iEvf4Qco
	Cd1NBA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e31r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:21:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888397482so6088946d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766031694; x=1766636494; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12Jla0pU+ukQ+eDxdEzPskkuaIpyyVpK1o7t7CK5egQ=;
        b=WqEvv8cC9PUXLEI8buzvlM2jgREGlDZuQlTqVGmbRW8hiuqF1DcTNMtBXlcuGx2GXC
         bObDMy8ieiCrXbQSXmwytyx9/j9kLpHMEqVEvJlJ0SQ6qkNQ6ztgSIWfTevDO/jli/2H
         JQLlQZ8lxICi0QUuH60xkKOzRwvumjYGpL8MwokuY1QaH/pMXnaWT/CUTZobeKoDRZk6
         uwUxbl++r/sK7GVUfevF7nSTvPLYhu4O5vyMKh1gF1sZRavkKVK3QgFycRHJOrQsGXg/
         eClWS9XnW+fOR/ycqtSOzOkPfukowv9jKekLj6maCAHOIiZcH4XH1nwLJIelw99SF7yY
         JOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766031694; x=1766636494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12Jla0pU+ukQ+eDxdEzPskkuaIpyyVpK1o7t7CK5egQ=;
        b=ghreRLcBK9ag51dL7017FDBgJmxt56Vo5Bf8Z3hWSrWOwy6lCNg17ZbzJCgLTaSx9X
         2sZ2/hnCRMS6Fh1ETAkFQTZH7lFXZbznzhyuzyfn5yZtdXRhPh/GTckY/rKW0IhbbalZ
         bbIzw1mGLpKvaVO5VUF5XnR4q1uOs3aP1b3G8JM2fUS9kZ+tZ+GsCaDg123eJwTwdQha
         qzDm1dNDRkAHxejux9XzkhY8t8muBJ2CZPd36i5kxLSJhxRe9Z+dPsxQQyFMjNDdUEBs
         gd0GPzZGFKWY36Ih90nGtXC2LFLY0lJQ8nQ40a+Se1/YICJGXPmPI1ZqkpUply/BPIJ/
         VorA==
X-Gm-Message-State: AOJu0YyMRjDalzhekN8VmRAWPl2eRg7k6rRx0najyLIpQ/KQMYkdjnSu
	2pftQjPV8yklmvNEXyGH4G9akQSsv0MpZuMPNuFrUEKqVzXLSXkkb0arYFWhepwLhL3MKjnkRwx
	oVterHlHb8p0SejnpzGJ26wFj1SN9tsW5Q6fMyo4CzKdoXUzoW4q/xyF/vqy6Jw2YKfSo87glth
	G9A3PFnVIGwRisLgExUFzfwB7gIRtZuQWKxw7Gt0BO68isTHCq2BXSFmnYp3Hbl+z1HmbnUTc=
X-Gm-Gg: AY/fxX4QP0mFyAFfFr2q03nDs+ohgh4ZUNTz5clqOW6QZO9kIyPsNSSQh6Cr1i7k6Qx
	68udfzTW67ATjBr6HLz0JgxclXPrErKNJZA3UyyJLkbbDGU2ASDw1VKb8OrU+hYR3nL0dG9KIo2
	j64X3EXpXMKTQAH6gRKZXcRRgiWlEhTsavJNSXvebb63mzzF1LJNX6VUxu0z3LlbiZ
X-Received: by 2002:a05:6214:3d8a:b0:880:523c:a57e with SMTP id 6a1803df08f44-8887e1e9bcbmr318909496d6.10.1766031694175;
        Wed, 17 Dec 2025 20:21:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHKz7ogmGHK/PL5D2HyWDD7znAxXmgSShhwNecZkamigBYiGWFUK4Poz63gzcwFZ1Q62+YKOd/v58ml2I2eXw=
X-Received: by 2002:a05:6214:3d8a:b0:880:523c:a57e with SMTP id
 6a1803df08f44-8887e1e9bcbmr318909316d6.10.1766031693632; Wed, 17 Dec 2025
 20:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20251218033846.107161-1-yi.zhao@windriver.com>
In-Reply-To: <20251218033846.107161-1-yi.zhao@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:21:22 +0800
X-Gm-Features: AQt7F2peN3yYu35wti5Jp6-ax9Tu4byqQTqezqsW8vMKCjQKhsYaADTqFITeCgs
Message-ID: <CA+s=J=wnzeuiW3eNvKv4ADvp6-zg1+rhVxjrc_XQqYxxQ1Re3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kea: add volatile files to create runtime directory
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAzMyBTYWx0ZWRfX0A+Kb1dE12d8
 rhPReSzDD+eC5/Sr5gHDcO9A+B27csUhAyMIvS3Q577rXbHEjpycaNblReJh5+cNE2OTMC/H0W7
 qBcLOjmipTtON2ys7KtpUpXzx5izmEUGNXm15bQgUxDUL6sdoi5RRny827oCx/Wt9WjPulvBa8y
 5upURmXnTj0p4oAPyxgNdO6bJ4350RNSCNm6cai4Tll4NYCtjM8nCDjQFBxEQA0ZXkUmESlIXB6
 4Q1vzA5tRkagjNcIzYv2V7WqCJAVXOrsOHdgtauXePwJ/WnH4OycuK+ibZqMTBfYK4oLlopquce
 S7NaJU/iYRUfh1YJ9d4UNwXmU6Cpc/WwpzSXvuUtiiFiJclXZgjaHA/zoZWH+H2L32DNe9h1Acc
 ev5o1wafTHQfG6yMyxJ+L6uMab/PYQ==
X-Proofpoint-GUID: LthoGMXA2eRqUC-DaZaezvt69zdtbMng
X-Proofpoint-ORIG-GUID: LthoGMXA2eRqUC-DaZaezvt69zdtbMng
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6943814f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=SCo1hh1FAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=eHwtvcO2EJJ8rCrwoWQA:9
 a=pJAmF1FKerIFfj4g:21 a=QEXdDO2ut3YA:10 a=yG98XkLpjRIA:10 a=-pDjxN4xWycA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=nwb-CePKZZm3gL-ai9HY:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228088

On Thu, Dec 18, 2025 at 11:39=E2=80=AFAM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Use volatile files to create runtime directories, instead of creating
> them in systemd unit/initscript files.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../kea/files/kea-dhcp-ddns.service           |  2 -
>  .../kea/files/kea-dhcp4.service               |  3 --
>  .../kea/files/kea-dhcp6.service               |  3 --
>  .../kea/files/kea.tmpfiles                    |  2 +
>  .../kea/files/kea.volatiles                   |  2 +
>  meta/recipes-connectivity/kea/kea_3.0.1.bb    | 43 +++++++++++++------
>  6 files changed, 34 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-connectivity/kea/files/kea.tmpfiles
>  create mode 100644 meta/recipes-connectivity/kea/files/kea.volatiles
>
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/=
meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> index aec6446f0e..fe09ef6437 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> @@ -5,8 +5,6 @@ After=3Dnetwork-online.target
>  After=3Dtime-sync.target
>
>  [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>  ExecStart=3D@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.co=
nf
>
>  [Install]
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta=
/recipes-connectivity/kea/files/kea-dhcp4.service
> index a2ed4edb59..a48a230654 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
> @@ -5,9 +5,6 @@ After=3Dnetwork-online.target
>  After=3Dtime-sync.target
>
>  [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>  ExecStart=3D@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
>
>  [Install]
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta=
/recipes-connectivity/kea/files/kea-dhcp6.service
> index ed6e017d0c..a441df9ad2 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
> @@ -5,9 +5,6 @@ After=3Dnetwork-online.target
>  After=3Dtime-sync.target
>
>  [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>  ExecStart=3D@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
>
>  [Install]
> diff --git a/meta/recipes-connectivity/kea/files/kea.tmpfiles b/meta/reci=
pes-connectivity/kea/files/kea.tmpfiles
> new file mode 100644
> index 0000000000..5da74be3a6
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/kea.tmpfiles
> @@ -0,0 +1,2 @@
> +d /run/kea 0750 root root -
> +d /var/lib/kea 0644 root root -

I think it'd be better if we add StateDirectory and RuntimeDirectory
to the service file if the lifetime of directory is tied to the unit:
https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#R=
untimeDirectory=3D

Debian also does something similar.

> diff --git a/meta/recipes-connectivity/kea/files/kea.volatiles b/meta/rec=
ipes-connectivity/kea/files/kea.volatiles
> new file mode 100644
> index 0000000000..d0350e38a6
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/kea.volatiles
> @@ -0,0 +1,2 @@
> +d root root 0750 /var/run/kea none
> +d root root 0644 /var/lib/kea none
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.1.bb
> index 8729b1162e..5c46498d5b 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> @@ -14,6 +14,8 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.xz \
>             file://kea-dhcp4-server \
>             file://kea-dhcp6-server \
>             file://kea-dhcp-ddns-server \
> +           file://kea.volatiles \
> +           file://kea.tmpfiles \
>             file://fix-multilib-conflict.patch \
>             file://fix_pid_keactrl.patch \
>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-wri=
te-.patch \
> @@ -61,26 +63,41 @@ do_compile:prepend:class-target() {
>  }
>
>  do_install:append() {
> -    install -d ${D}${sysconfdir}/init.d
> -    install -d ${D}${systemd_system_unitdir}
> -
> -    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_u=
nitdir}
> -    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
> -    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bind=
ir},g' \
> -           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,=
${sysconfdir},g' \
> -           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}=
/keactrl
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
> +        install -d ${D}${sysconfdir}/init.d
> +        install -d ${D}/${sysconfdir}/default/volatiles
> +
> +        install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init=
.d
> +        install -m 0644 ${UNPACKDIR}/kea.volatiles ${D}/${sysconfdir}/de=
fault/volatiles/99_kea
> +    fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +
> +        install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_syst=
em_unitdir}
> +        install -m 0644 ${UNPACKDIR}/kea.tmpfiles ${D}/${sysconfdir}/tmp=
files.d/kea.conf
> +
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_=
bindir},g' \
> +            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@=
,${sysconfdir},g' \
> +            ${D}${systemd_system_unitdir}/kea-dhcp*service
> +    fi
> +
>      sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
>             -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
>             ${D}${sbindir}/kea-admin
> +
>      rm -rf ${D}${datadir}/${BPN}/meson-info
>      rm -rf ${D}${runtimedir}
> +    rm -rf ${D}${localstatedir}
>  }
>
> -do_install:append() {
> -    rm -rf "${D}${localstatedir}"
> -}
> -
> -CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf"
> +CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf \
> +                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
> +                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
> +                   ${sysconfdir}/kea/kea-dhcp4.conf \
> +                   ${sysconfdir}/kea/kea-dhcp6.conf \
> +                  "
>
>  PACKAGES =3D+ "${PN}-python"
>  FILES:${PN}-python =3D "${nonarch_libdir}/python*/site-packages/*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228085): https://lists.openembedded.org/g/openembedde=
d-core/message/228085
> Mute This Topic: https://lists.openembedded.org/mt/116837599/3616702
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
uj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

